if SERVER then return end

local EFFECT = {}
local matRefraction = Material("actmod/eff_particle/ccmix_01")
local matRefraction2 = Material("particles/smokey")
function EFFECT:Init(data)
	local normal = Vector( 0, 0, 1 ):GetNormal()
	local pos = data:GetOrigin()
	local GScale = data:GetScale()
	self.GScale = GScale
	self.DieTime = CurTime() + 1.2
	pos = pos + Vector( 0, 0, 0.2 )*GScale
	self.Pos = pos
	self.Norm = normal
	self.Entity:SetRenderBoundsWS(pos + Vector(-200, -200, -200)*GScale, pos + Vector(200, 200, 200)*GScale)

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(24*GScale, 64*GScale)

	local radius = 20*GScale
	local count = 30
	for i = 1, count do
		local angle = (i / count) * math.pi * 2
		local tpos = Vector(pos.x + math.cos(angle) * radius ,pos.y + math.sin(angle) * radius ,pos.z) --print(pos)
		local particle = emitter:Add("particles/smokey", tpos + Vector(0,0,10))
		particle:SetVelocity(Vector(math.Rand(1,-1),math.Rand(1,-1),math.Rand(0.6,1)) * 100 * GScale)
		particle:SetDieTime(math.Rand(0.4, 0.7))
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(math.Rand(50,0)*GScale)
		particle:SetEndSize(math.Rand(0, 40)*GScale)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-3, 3))
		particle:SetColor(70, 170, 70)
		particle:SetAirResistance(math.Rand(180, 300))
		particle:SetGravity(Vector(0,0,-math.Rand(60, 100)))
	end

	for i=1, math.random(5, 10) do
		local dir = (Vector(math.Rand(1, -1),math.Rand(1, -1),0)*1.5*GScale + normal):GetNormalized()
		local particle = emitter:Add("particles/smokey", pos + dir * 2)
		particle:SetVelocity(dir * math.Rand(60, 150)*GScale)
		particle:SetDieTime(math.Rand(0.6, 1))
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(math.Rand(100,0)*GScale)
		particle:SetEndSize(math.Rand(0, 100)*GScale)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-3, 3))
		particle:SetColor(70, 170, 70)
		particle:SetAirResistance(math.Rand(100,250))
		particle:SetStartLength((math.Rand(25,40)*3)*GScale)
		particle:SetEndLength((math.Rand(10,20)*3)*GScale)
	end

	for i=1, math.random(20, 50) do
		local dir = (Vector(math.Rand(1, -1),math.Rand(1, -1),0.7)*2.5*GScale + normal):GetNormalized()
		local particle = emitter:Add("particles/smokey", pos + dir * 2)
		particle:SetVelocity(dir * math.Rand(80, 200)*GScale)
		particle:SetDieTime(math.Rand(0.6, 1))
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(math.Rand(20,0)*GScale)
		particle:SetEndSize(math.Rand(10, 50)*GScale)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-3, 3))
		particle:SetColor(70, 170, 70)
		particle:SetAirResistance(math.Rand(100,250))
		particle:SetGravity(Vector(0,0,-math.Rand(5, 50))*GScale)
	end

	emitter:Finish()
end
function EFFECT:Think() return CurTime() < self.DieTime end
function EFFECT:Render()
	local ct = CurTime()
	if ct < self.DieTime then
		local delta = math.Clamp(self.DieTime - ct ,0,1)
		local q1 = (100+(delta - 1.2)*20)*self.GScale --150+(1.2 - delta)*5 --(1.1 - (delta*1)) * 200
		local q2 = math.Clamp(-1.5 + delta*3 ,0,1)
		render.SetMaterial(matRefraction2)
		render.DrawQuadEasy(self.Pos + Vector( 0, 0, 0.1 ), Vector( 0, 0, 1 ), q1, q1, Color( 100, 210, 100, 255*q2 ), 0)
		render.SetMaterial(matRefraction)
		render.DrawQuadEasy(self.Pos + Vector( 0, 0, 0.2 ), Vector( 0, 0, 1 ), (q1*1.3)*q2, (q1*1.3)*q2, Color( 70, 170, 70, 255*q2 ), 0)
	end
end
effects.Register( EFFECT, "am_eff_ccmix_01", true )


local EFFECT = {}
function EFFECT:Init(data)
	local pos = data:GetOrigin()
	local emitter = ParticleEmitter(pos)
	if not emitter then return end
	local QHt = ConVarExists("actmod_cl_q_ef") and GetConVarNumber("actmod_cl_q_ef") or 2
	if QHt > 3 then
		for i=1, math.random(15,30) do
			local bTime,hTime,fTime,SSSiz = CurTime(),math.Rand(0.2,0.8),math.Rand(0.3,0.5),math.Rand(0.7,1.4)
			local p = emitter:Add("actmod/eff_particle/efx_"..string.format("%02d", math.random(1,20)),pos + VectorRand() * 5)
			p:SetVelocity( Vector(math.Rand(1,-1),math.Rand(1,-1),math.Rand(0.3,-1)) * 200 )
			p:SetAirResistance( math.random(200,400) ) p:SetGravity( Vector( 0, 0, -math.random(150,250) ) )
			p:SetDieTime(hTime + fTime) p:SetStartAlpha(255) p:SetEndAlpha(255)						
			p:SetStartSize(SSSiz) p:SetEndSize(SSSiz)
			p:SetRoll( math.Rand(-1,1) ) p:SetRollDelta( math.Rand(15,-15) )
			p:SetLighting( true ) p:SetCollide( true )
			p:SetNextThink(bTime)
			p:SetThinkFunction(function(pa)
				local age = CurTime() - bTime
				if age >= hTime then
					local ati = 1 - math.Clamp((age - hTime) / fTime, 0, 1)
					local aph,sSz = 255*ati,SSSiz*ati
					pa:SetStartAlpha(aph) pa:SetEndAlpha(aph)
					p:SetStartSize(sSz) p:SetEndSize(sSz)
				end
				pa:SetNextThink(CurTime())
			end)
		end
	else
		for i=1, QHt == 1 and math.random(3,10) or QHt == 2 and math.random(10,20) or QHt == 3 and math.random(15,30) do
			local P_03 = emitter:Add("actmod/eff_particle/efx_"..string.format("%02d", math.random(1,20)),pos + VectorRand() * 5)
			P_03:SetVelocity( Vector(math.Rand(1,-1),math.Rand(1,-1),math.Rand(0.3,-1)) * 200 )
			P_03:SetAirResistance( math.random(200,400) )
			P_03:SetDieTime(math.Rand(0.4,1.3))
			P_03:SetStartAlpha(255)
			P_03:SetEndAlpha(0)
			P_03:SetStartSize(math.Rand(1,1.7))
			P_03:SetEndSize(math.Rand(1,0.1))
			P_03:SetRoll( math.Rand(-1,1) )
			P_03:SetRollDelta( math.Rand(6,-3) )
			P_03:SetGravity( Vector( 0, 0, -math.random(150,250) ) )
			P_03:SetLighting( true )
			P_03:SetCollide( true )
		end
	end
	if QHt > 2 then
		self.P_01 = emitter:Add("actmod/eff_particle/p_glow_01",pos)
		self.P_01:SetDieTime(math.Rand(0.03,0.12))
		self.P_01:SetStartAlpha(255) self.P_01:SetEndAlpha(0)
		self.P_01:SetStartSize(math.random(20,25)) self.P_01:SetEndSize(math.Rand(10,0.1))
		self.P_01:SetRoll( math.random(-90,90) )
	end
	self.P_02 = emitter:Add("actmod/eff_particle/ccmix_01",pos)
	self.P_02:SetDieTime(0.2)
	self.P_02:SetStartAlpha(255) self.P_02:SetEndAlpha(0)
	self.P_02:SetStartSize(math.random(24,28)) self.P_02:SetEndSize(math.Rand(1,0.1))
	self.P_02:SetRoll( math.random(-90,90) )
	emitter:Finish()
end function EFFECT:Think() end function EFFECT:Render() end
effects.Register( EFFECT, "am_f_celebdance", true )
