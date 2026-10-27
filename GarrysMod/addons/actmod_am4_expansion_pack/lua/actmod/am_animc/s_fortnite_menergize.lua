// Goku's Charging Up (commission)
// 2026-AM4|23778|148635
return{
	["fortnite_maxenergize"] = {
		Config = { Anim = "amod_fortnite_maxenergize",Name = "Goku's Charging Up",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "6.2" } ,Camera = { Transition = 3.5 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_MaxEnergize_01.mp3" ,Delay = 0.00 } }
		,Scrpt = function()
			if SERVER then return end
			local function CycG(c,a,b) return math.Clamp(math.TimeFraction(a, b, c), 0, 1) end
			local function CycGHS(c,a,b,h)
				h = h or 0
				local len = b - a
				local f = (len - h) * 0.5
				local hs,he = a + f,b - f
				if c <= a or c >= b then return 0 end
				if c < hs then return math.Remap(c, a, hs, 0, 1) end
				if c <= he then return 1 end
				return math.Remap(c, he, b, 1, 0)
			end
			local mat_rr,mat_nn,mat_xb = Material("actmod/eff_particle/p_ring_wave","noclamp smooth"),Material("sprites/heatwave"),Material("particle/particle_glow_03")
			local m_eh_1,m_eh_2,m_eh_3 = Material("models/actmod/prop/smenergize/e_1","noclamp smooth"),Material("models/actmod/prop/smenergize/e_2","noclamp smooth"),Material("models/actmod/prop/smenergize/e_3","noclamp smooth")
			local function aDist(pl,taa) if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then return true end return false end
			-- local function A(aa,k) return 1+(aa-1)*k end
			local function AM_namT(ply,Ent)
				if not IsValid(ply) then return "__NULL_" end
				Ent = Ent or ply
				local aID = "__mdl_".. tostring(Ent:EntIndex{})
				if ply:IsPlayer() then aID = tostring(ply:SteamID64{} .. ply:Nick{}) end
				return aID
			end
			local function atuTr(pl,aID,n,QHt,cuu)
				if pl.actmod_cl_TmpDtEf and istable(pl.actmod_cl_TmpDtEf.Tctive) then
					local tMdl = pl.actmod_cl_TmpDtEf.Tctive[aID .. n]
					if IsValid(tMdl) then
						local z = math.Rand(0,0.4)
						tMdl.adszz = math.Rand(0,7) tMdl.adszs = Vector(0.5+z*0.7,0.5+z,0.5+z)
						if math.random(0, 1) == 0 then tMdl.adang = math.random(2, 5) else tMdl.adang = -math.random(2, 5) end
						tMdl.adszi = cuu or 0
						tMdl.adtim = CurTime() tMdl.adhti = math.Rand(0.4,0.6)
					end
				end
			end
			local function ataTr(pl,aID,n,QHt)
				if pl.actmod_cl_TmpDtEf and istable(pl.actmod_cl_TmpDtEf.Tctive) then
					local tMdl = pl.actmod_cl_TmpDtEf.Tctive[aID .. n]
					if IsValid(tMdl) then
						tMdl.adang = Angle(-20+math.Rand(10,-10),0,0) tMdl.adszi = Vector(1.6,0.3+math.Rand(0,0.2),2.8+math.Rand(0,0.1))*(tMdl.mr==3 and 1.05 or 1)
						tMdl.adtim = CurTime() tMdl.adhti = math.Rand(0.2,0.4)
					end
				end
			end
			local function ataTw(pl,aID,n,QHt)
				if pl.actmod_cl_TmpDtEf and istable(pl.actmod_cl_TmpDtEf.Tctive) then
					local tMdl = pl.actmod_cl_TmpDtEf.Tctive[aID .. n]
					if IsValid(tMdl) then
						local z = math.Rand(0,0.2)
						tMdl.adang = Angle(math.random(0,360),0,0) tMdl.adszi = Vector(1+z,0.6,1+z)
						tMdl.adtim = CurTime() tMdl.adhti = math.Rand(0.1,0.2)
					end
				end
			end
			local function ateff_1(pl,bAng,Asz,QHt,tclr)
				if (pl.actmod_cl_TmpDtEf.teff_1 or 0) > CurTime() then return end
				pl.actmod_cl_TmpDtEf.teff_1 = CurTime() + (tclr and math.Rand(0,0.1) or math.Rand(0.1,0.2))
				if not IsValid(pl) then return end
				local pos = pl:GetPos() - bAng:Forward()*6*Asz + Vector(0, 0, 2*Asz)
				local emitter = ParticleEmitter(pos)
				if not emitter then return end
				local pCount, sRadius, eRadius = tclr and math.random(1,3) or 1,math.random(20,30)*Asz,math.random(10,50)*Asz
				local arcAngle,rotOffset = math.random(90,160),math.random(30,-30)
				local baseAngle = pl:GetAngles().y + rotOffset - (pCount > 1 and (arcAngle / 2) or 0)
				for i = 1, pCount do
					local fraction = (pCount > 1) and ((i - 1) / (pCount - 1)) or 0
					local currentAngle = baseAngle + (fraction * arcAngle)
					local dir = Angle(0, currentAngle, 0):Forward()
					local localPos = pos + dir * sRadius
					local targetPos = pos + dir * eRadius + Vector(0, 0, 150)
					local p = emitter:Add("actmod/eff_particle/tema1", localPos)
					if p then
						p:SetVelocity((targetPos - localPos):GetNormalized() * (tclr and 400 or 300)*Asz)
						p:SetAirResistance(tclr and math.random(200,300) or math.random(100,150))
						p:SetDieTime(tclr and math.Rand(0.1,0.3) or math.Rand(0.2,0.3))
						p:SetColor(tclr and 255 or 0, tclr and 255 or 0, 0)
						p:SetStartLength(40*Asz) p:SetEndLength(10*Asz)
						p:SetStartAlpha(255) p:SetEndAlpha(255)
						p:SetStartSize(math.Rand(12,30)*Asz) p:SetEndSize(15*Asz)
					end
				end
				emitter:Finish()
			end
			local function ateff_4(pl,Asz,QHt)
				if not IsValid(pl) then return end
				local pos = pl:GetPos()
				local beamCount,radius,speed,maxHeight = 10,math.random(10,24)*Asz,1.8,math.random(10,40)*Asz
				local arcAngle,rotOffset = 360,math.random(30,-30)
				local baseAngle = pl:GetAngles().y + rotOffset - (arcAngle / 2)
				render.SetMaterial(mat_nn)
				for i = 1, beamCount do
					local time = (CurTime() * speed + (i * 0.28)) % 1
					local fraction = (beamCount > 1) and ((i - 1) / (beamCount - 1)) or 0
					local sway = math.sin(CurTime() * 10 + (i * 2)) * 3
					local dir = Angle(0, baseAngle + (fraction * arcAngle) + sway, 0):Forward()
					local circlePoint = pos + dir * radius
					local startPos = circlePoint + Vector(0,0,0.6*Asz)
					local endPos = startPos + Vector(0, 0, time * maxHeight)
					local alpha = math.sin(time * math.pi) * 100
					local uvScroll = -CurTime() * 5 + (i * 0.5)
					render.StartBeam(2)
						render.AddBeam(startPos, 20*Asz, uvScroll, Color(255, 160, 0, alpha))
						render.AddBeam(endPos, 2*Asz, uvScroll + (time * 2), Color(255, 30, 0, alpha))
					render.EndBeam()
				end
			end
			local function ateff_5(pl,Asz,QHt,tclr)
				if (pl.actmod_cl_TmpDtEf.teff_5 or 0) > CurTime() then return end
				pl.actmod_cl_TmpDtEf.teff_5 = CurTime() + math.Rand(0.0,0.1)
				local pos = pl:GetPos()
				local emitter = ParticleEmitter(pos)
				if emitter then
					for i = 0, math.random(2,6) do
						if math.random(1,2) ~= 1 then continue end
						local p = emitter:Add("particles/smokey", pos + VectorRand() * 0.3*Asz + Vector(math.random(10,-10),math.random(10,-10),math.random(0,2))*Asz)
						if not p then break end
						p:SetVelocity(VectorRand() * math.random(10,60)*Asz + Vector(math.random(90,-90),math.random(90,-90),math.random(5,15))*Asz)
						p:SetDieTime(math.Rand(0.2,tclr and 0.3 or 0.6)) p:SetStartAlpha(math.random(50,100)) p:SetEndAlpha(0)
						if tclr then p:SetColor(255, 255, 60) else p:SetColor(150, 150, 150) end
						p:SetStartSize(math.Rand(7,20)*Asz) p:SetEndSize(math.Rand(10,47)*Asz)
						p:SetAirResistance(math.Rand(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,tclr and math.Rand(350, 440) or math.Rand(90, 200)))
						p:SetStartLength(math.Rand(5,3)*Asz) p:SetEndLength(math.Rand(40,80)*Asz)
					end
					if not tclr then
						for i = 0, math.random(1,3) do
							if math.random(1,2) ~= 1 then continue end
							local p = emitter:Add("particle/smokesprites_00".. string.format("%02d",math.random(1,16)), pos + VectorRand() * 0.3*Asz + Vector(math.random(30,-30),math.random(30,-30),math.random(1,8))*Asz)
							if not p then break end
							p:SetVelocity(VectorRand() * math.random(10,60)*Asz + Vector(math.random(70,-70),math.random(70,-70),math.random(9,30))*Asz)
							p:SetDieTime(math.Rand(0.3,0.7)) p:SetStartAlpha(math.random(100,255)) p:SetEndAlpha(0) p:SetColor(math.random(0,10),math.random(0,10),math.random(0,10))
							p:SetStartSize(math.Rand(1,4)*Asz) p:SetEndSize(math.Rand(0,2)*Asz)
							p:SetAirResistance(math.Rand(30,100)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,math.Rand(300, 450)))
							p:SetRoll( math.Rand(-1,1) ) p:SetRollDelta( math.random(10,-10) )
						end
					end
					emitter:Finish()
				end
			end
			local function aRemoveBMdlS(ply)
				if IsValid(ply) then
					if ply.actmod_cl_TmpDtEf and istable(ply.actmod_cl_TmpDtEf.Tctive) then
						for i = 1,13 do
							local nid = AM_namT(ply) .. "_menerg_" .. i
							if IsValid(ply.actmod_cl_TmpDtEf.Tctive[nid]) then ply.actmod_cl_TmpDtEf.Tctive[nid]:Remove() end
							ply.actmod_cl_TmpDtEf.Tctive[nid] = nil
						end
						ply.actmod_cl_TmpDtEf.Tctive = nil
					end
				end
			end
			hook.Add("ActMod_RunStopAct", "am_maxenergize_RemovMdlS", function(ply) aRemoveBMdlS(ply) end)
			hook.Add("ActMod_cl_RunaPlyEmot", "am_maxenergize_RemovMdlS", function(ply,atXt,tst) aRemoveBMdlS(ply) end)
			hook.Add("Think", "am_maxenergize_RemovMdlS", function()
				local p = LocalPlayer()
				if not IsValid(p) then return end
				if (p.amtim_maxenergize_RemovMdlS or 0) < CurTime() then
					p.amtim_maxenergize_RemovMdlS = CurTime() + 0.1
					for _ ,pl in player.Iterator() do
						if pl.actmod_cl_TmpDtEf and pl.actmod_cl_TmpDtEf.trMEnrg and (not pl:A_ActMod_GetIsAct() or pl:A_ActMod_GetActDir() ~= "amod_fortnite_maxenergize") and istable(pl.actmod_cl_TmpDtEf.Tctive) then
							aRemoveBMdlS(pl)
						end
					end
				end
			end)
			local AnimSpeed = 10
			local HeightStretch = 30
			local BaseSize = 70
			local halos = {
				{ mat = m_eh_1, size_mult = 1.0, offset = 0.0, max_alpha = 1.0 },
				{ mat = m_eh_2, size_mult = 1.1, offset = 0.15, max_alpha = 0.6 },
				{ mat = m_eh_3, size_mult = 1.2, offset = 0.3, max_alpha = 0.3 }
			}
			return {
				SCpt = function(pl,cyc)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.trMEnrg and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.ttimr then
						local aID,basePos,bAng = AM_namT(pl) .. "_menerg_",pl:GetPos(),pl:GetRenderAngles()
						if cyc > 0.82 then aRemoveBMdlS(pl) pl.actmod_cl_TmpDtEf = nil return end
						if not pl.actmod_cl_TmpDtEf.twwh then
							pl.actmod_cl_TmpDtEf.twwh = true
							local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
							for i = 1,13 do
								local tMdl = ClientsideModel(i > 9 and "models/actmod/prop/am_cylinder.mdl" or "models/actmod/prop/SM_EnergizeWME.mdl",RENDERGROUP_TRANSLUCENT)
								if IsValid(tMdl) then
									SafeRemoveEntityDelayed(tMdl,3.2)
									local nid,pid = aID .. i,"AMTmp_".. pl:SteamID64() .."|".. pl:EntIndex() .."|".. i
									tMdl:SetNoDraw(true)
									tMdl:SetPos(basePos) tMdl:SetAngles( i < 10 and bAng+Angle(0,-90,0) or bAng)
									tMdl:SetColor( Color(0,0,0,0) ) tMdl:SetRenderMode( 5 ) -- RENDERMODE_TRANSCOLOR 1
									if i > 9 then
										tMdl:SetModelScale(1*Asz)
										tMdl:SetMaterial("actmod/eff_particle/tsmokefhm_".. 1+(i%4))
									elseif i > 6 then
										if i == 9 then
											tMdl:SetBodygroup(0,2)
											tMdl:SetModelScale(10*Asz) tMdl:SetMaterial("models/actmod/prop/smenergize/m_4")
										else
											tMdl:SetModelScale(13*Asz) tMdl:SetMaterial("models/actmod/prop/smenergize/mk")
										end
									else
										local r = i < 4 and i or math.random(1,3)
										tMdl.mr = r
										tMdl:SetMaterial("models/actmod/prop/smenergize/m_"..r )
										tMdl:ManipulateBonePosition( 0, Vector(0,-0.09,-(r==3 and 1.05 or 0.85)) )
										tMdl:SetModelScale((r==3 and 9.5 or 9)*Asz) tMdl:SetBodygroup(0,1)
									end
									tMdl.tply = pl
									tMdl.Astr = pl.actmod_cl_TmpDtEf.Astr
									tMdl.CurTRun = pl.ActMod_CurTRun
									pl.actmod_cl_TmpDtEf.Tctive[nid] = tMdl
									pl:CallOnRemove( pid, function( ent )
										if timer.Exists(pid) then timer.Remove(pid) end
										if ent.actmod_cl_TmpDtEf and ent.actmod_cl_TmpDtEf.Tctive then
											local e = ent.actmod_cl_TmpDtEf.Tctive[nid]
											if IsValid(e) then e:Remove() end
										end
									end )
									tMdl:CallOnRemove( "AMTep_".. pl:SteamID64() .."|".. tMdl:EntIndex() .."|".. i, function( ent )
										if IsValid(ent.tply) then ent.tply:RemoveCallOnRemove(pid) end
									end )
									timer.Create(pid,0.1,0,function()
										if IsValid(tMdl) and (not tMdl.Astr or not tMdl.CurTRun or not pl.actmod_cl_TmpDtEf or not pl.actmod_cl_TmpDtEf.Astr or tMdl.Astr ~= pl.actmod_cl_TmpDtEf.Astr or tMdl.Astr ~= pl.actmod_cl_TmpDtEf.Astr or tMdl.CurTRun ~= pl.ActMod_CurTRun) then
											if timer.Exists(pid) then timer.Remove(pid) end
											tMdl:Remove()
										end
									end)
									tMdl.RenderOverride = function(self)
										render.SuppressEngineLighting(true)
										render.SetLightingMode(1)
										self:DrawModel(STUDIO_RENDER + STUDIO_STATIC_LIGHTING)
										render.SetLightingMode(0)
										render.SuppressEngineLighting(false)
										if IsValid(self) and (not self.Astr or not self.CurTRun or not pl.actmod_cl_TmpDtEf or not pl.actmod_cl_TmpDtEf.Astr or self.Astr ~= pl.actmod_cl_TmpDtEf.Astr or self.Astr ~= pl.actmod_cl_TmpDtEf.Astr or self.CurTRun ~= pl.ActMod_CurTRun) then
											if timer.Exists(pid) then timer.Remove(pid) end
											self:Remove()
										end
									end
								end
							end
						end
						local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
						if not pl.actmod_cl_TmpDtEf.EsMko and cyc > 0.149 and cyc < 0.175 then
							pl.actmod_cl_TmpDtEf.EsMko = true
							local pos = pl:GetPos()
							local emitter = ParticleEmitter(pos)
							if emitter then
								local radius = 22 * Asz
								local pCount = math.random(5, 8)
								local speedMultiplier = 28 * Asz
								local SRad,ERad,entYaw = 0,90,0
								if IsValid(pl) then entYaw = pl:GetRenderAngles().y end
								local offset = (ERad - SRad) / 2
								for i = 1, pCount do
									local finalRad = math.rad(Lerp(i / pCount,SRad,ERad) + entYaw - 140 - offset)
									local moveDir = Vector(math.cos(finalRad),math.sin(finalRad),0):GetNormalized()
									local p = emitter:Add("actmod/eff_particle/e_smok2", pos + (moveDir * radius) + Vector(0, 0, math.Rand(3, 9)))
									if not p then break end
									local velocity = moveDir * speedMultiplier + VectorRand() * 5
									velocity.z = velocity.z + math.random(5, 15)
									p:SetVelocity(velocity) p:SetGravity(Vector(0, 0, math.Rand(-20, 50)))
									p:SetDieTime(math.Rand(0.2, 0.6)) p:SetColor(70, 70, 70)
									p:SetStartAlpha(255) p:SetEndAlpha(0)
									p:SetStartSize(math.Rand(5, 10) * Asz) p:SetEndSize(math.Rand(20, 15) * Asz)
									p:SetAirResistance(math.Rand(30, 70) * (1 + (Asz * 0.5)))
								end
								emitter:Finish()
							end
						end
						if cyc > 0.2027 and cyc < 0.233 and not pl.actmod_cl_TmpDtEf.unum then
							pl.actmod_cl_TmpDtEf.unum = 0 atuTr(pl,aID,10,QHt) ateff_5(pl,Asz,QHt)
						end
						if cyc > 0.2336 and cyc < 0.4180 then
							if pl.actmod_cl_TmpDtEf.tuimr < CurTime() then
								pl.actmod_cl_TmpDtEf.tuimr = CurTime() + math.Rand(0.06,0.15)
								if not pl.actmod_cl_TmpDtEf.unum then pl.actmod_cl_TmpDtEf.unum = 0 end
								pl.actmod_cl_TmpDtEf.unum = (pl.actmod_cl_TmpDtEf.unum + 1)%4
								atuTr(pl,aID,pl.actmod_cl_TmpDtEf.unum+10,QHt,CycG(cyc,0.2336,0.417))
							end
							ateff_1(pl,bAng,Asz,QHt)
							ateff_5(pl,Asz,QHt)
						end
						if cyc > 0.4 and cyc < 0.7 then
							if pl.actmod_cl_TmpDtEf.ttimr < CurTime() then
								if not pl.actmod_cl_TmpDtEf.tuimu then pl.actmod_cl_TmpDtEf.tuimu = CurTime() + 0.7 end
								pl.actmod_cl_TmpDtEf.ttimr = CurTime() + math.Rand(0.001,0.05)
								if pl.actmod_cl_TmpDtEf.rnum == 1 then
									pl.actmod_cl_TmpDtEf.rnum = 2 ataTr(pl,aID,2,QHt) ataTw(pl,aID,7,QHt)
								elseif pl.actmod_cl_TmpDtEf.rnum == 2 then
									pl.actmod_cl_TmpDtEf.rnum = 3 ataTr(pl,aID,3,QHt) ataTw(pl,aID,8,QHt)
								elseif pl.actmod_cl_TmpDtEf.rnum == 3 then
									pl.actmod_cl_TmpDtEf.rnum = 4 ataTr(pl,aID,4,QHt) ataTw(pl,aID,9,QHt)
								elseif pl.actmod_cl_TmpDtEf.rnum == 4 then
									pl.actmod_cl_TmpDtEf.rnum = 5 ataTr(pl,aID,5,QHt) ataTw(pl,aID,8,QHt)
								elseif pl.actmod_cl_TmpDtEf.rnum == 5 then
									pl.actmod_cl_TmpDtEf.rnum = 6 ataTr(pl,aID,6,QHt) ataTw(pl,aID,9,QHt)
								else
									pl.actmod_cl_TmpDtEf.rnum = 1 ataTr(pl,aID,1,QHt) ataTw(pl,aID,8,QHt)
									if not pl.actmod_cl_TmpDtEf.tffxBm then
										pl.actmod_cl_TmpDtEf.nffxBm = 0
										pl.actmod_cl_TmpDtEf.tffxBm = CurTime() + 1
									end
								end
								if not pl.actmod_cl_TmpDtEf.nffxBm then pl.actmod_cl_TmpDtEf.nffxBm = 1 end
								ateff_5(pl,Asz,QHt,true)
							end
							ateff_1(pl,bAng,Asz,QHt,true)
						end
						if istable(pl.actmod_cl_TmpDtEf.Tctive) then
							local ka,ku = 1-math.Clamp(CycG(cyc,0.66,0.73),0,1),1-math.Clamp(CycG(cyc,0.38,0.405),0,1)
							local ub = pl.actmod_cl_TmpDtEf.tuimu and math.Clamp((pl.actmod_cl_TmpDtEf.tuimu-CurTime()),0,1) or 0
							local Asz,uc = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),CycGHS(ub,0,1,0.2)
							for i = 1,13 do
								local tMdl = pl.actmod_cl_TmpDtEf.Tctive[aID .. i]
								if IsValid(tMdl) and tMdl.adtim then
									local ti = math.Clamp( (tMdl.adtim+tMdl.adhti-CurTime()) ,0,1)
									if ti > 0 then
										local ua = 1-ti
										tMdl:SetNoDraw(false)
										if i > 9 then
											local aaVtr = LerpVector(1-ua,Vector(),(bAng:Up()*5+bAng:Up()*60*tMdl.adszi)*Asz)
											tMdl:SetPos(basePos+bAng:Up()*tMdl.adszz*Asz+aaVtr) tMdl:SetAngles(bAng)
											local aang = tMdl:GetManipulateBoneAngles(0)
											aang.p = aang.p + tMdl.adang
											tMdl:ManipulateBoneAngles( 0, aang )
											tMdl:SetColor( Color( 180, 180, 180, 255*ti*ku ) )
											tMdl:ManipulateBoneScale( 0, (tMdl.adszs+Vector(1*ua/2,1*ua,1*ua))*(1+1-ku) )
										elseif i > 6 then
											tMdl:SetPos(basePos) tMdl:SetAngles(bAng)
											tMdl:SetColor( Color( 255, 255, 100, 255*CycGHS(ua,0,1)*ka ) )
											tMdl:ManipulateBoneAngles( 0, tMdl.adang )
											tMdl:ManipulateBoneScale( 0, tMdl.adszi*(1+ua/2)+Vector(3.5*ua,0,3.5*ua) )
										else
											tMdl:SetPos(basePos) tMdl:SetAngles(bAng+Angle(0,-90,0))
											tMdl:SetColor( Color( 255, 255, 100, 255*ti*ka ) )
											tMdl:ManipulateBoneScale( 0, tMdl.adszi+Vector(0,(2.9*ua+0.8*uc)*(tMdl.mr==3 and 1.1 or 1),-0.5*ub+0.5*ua+math.sin(CurTime()*9)*math.Rand(0,0.2)) )
										end
									else
										tMdl:SetNoDraw(true)
										tMdl:SetColor( Color( 0, 0, 0, 0 ) )
									end
								end
							end
						end
					elseif pl.actmodstr == "amod_cumact_fortnite_maxenergize" and (not pl.actmod_cl_TmpDtEf or isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun < CurTime()-0.2) and cyc > 0.14 and cyc < 0.3 then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,rnum = 0 ,trMEnrg = true ,Tctive = {} ,tuimr = CurTime()+0.2,ttimr = CurTime()+0.6,tkimr = CurTime()+0.51 ,A_hupf = hupf,A_SubMF = A_SubMF }
					elseif pl.actmod_cl_TmpDtEf then aRemoveBMdlS(pl) pl.actmod_cl_TmpDtEf = nil
					end
				end
				,SDrw = function(pl,cyc)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")/2) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.trMEnrg and pl.actmod_cl_TmpDtEf.Tctive and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
						local pos,Asz,QHt,BAng = pl:GetPos(),pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef"),pl:GetRenderAngles()
						if cyc > 0.24 and cyc < 0.68 then ateff_4(pl,Asz,QHt) end
						if cyc > 0.39 and cyc < 0.41 then
							local a = CycG(cyc,0.39,0.41)
							if a > 0 then
								local q1 = (40+50*a)*Asz
								render.SetMaterial(mat_rr)
								render.DrawQuadEasy(pos + Vector(0,0,0.2*Asz ), BAng:Up(), q1,q1, Color( 255, 255, 50, 255*(1-a) ), 0)
							end
						end
						if cyc > 0.4 and cyc < 0.7 and pl.actmod_cl_TmpDtEf.tuimu then
							local a = CycG(cyc,0.4,0.7)
							if a > 0 then
								for i, halo in ipairs(halos) do
									local local_a = (a * AnimSpeed + halo.offset) % 1
									local alpha_fade = (1 - local_a) * halo.max_alpha
									if alpha_fade > 0 then
										local ua = math.ease.OutElastic(1 - local_a)
										local q1 = (BaseSize * Asz) * halo.size_mult
										local width = q1 + (ua / 7 + math.random(1, -1) * ua) * Asz
										local extra_height = (local_a * HeightStretch + math.random(2, -1) * ua) * Asz
										local height = q1 + ((ua + math.random(1, -1) * ua) * Asz + 20) * halo.size_mult + extra_height
										local pivot_offset = (extra_height / 2)
										local vtr = Vector(0, 0, q1 / 2 + ((ua * Asz + 20) * halo.size_mult) / 2 - 5.5 * Asz + pivot_offset)
										render.SetMaterial(halo.mat)
										render.DrawQuadEasy( pos-BAng:Forward()*7*Asz + vtr, BAng:Forward(), width, height, Color(255, 255, 50, 255 *alpha_fade*(1-a)), 180 )
									end
								end
							end
						end
						if cyc > 0.38 and cyc < 0.46 then
							local a = math.ease.OutExpo( CycG(cyc,0.38,0.46) )
							if a > 0 then
								local b = pl:LookupBone("ValveBiped.Bip01_Spine") and "ValveBiped.Bip01_Spine" or pl:LookupBone("ValveBiped.Bip01_Pelvis") and "ValveBiped.Bip01_Pelvis"
								if b then
									local pos = A_AM.ActMod:GBonePosAng(pl,b)
									local q1 = (70+90*a)*Asz
									render.SetMaterial(mat_xb)
									render.DrawQuadEasy(pos, BAng:Up(), q1,q1, Color( 255, 255, 50, 255*(1-a) ), 0)
									render.DrawQuadEasy(pos, BAng:Forward(), q1,q1, Color( 255, 255, 50, 255*(1-a) ), 0)
									render.DrawQuadEasy(pos, BAng:Forward()*-1, q1,q1, Color( 255, 255, 50, 255*(1-a) ), 0)
									render.DrawQuadEasy(pos, BAng:Right(), q1,q1, Color( 255, 255, 50, 255*(1-a) ), 0)
									render.DrawQuadEasy(pos, BAng:Right()*-1, q1,q1, Color( 255, 255, 50, 255*(1-a) ), 0)
									render.DrawSprite(pos,q1,q1, Color(255, 255, 50,255*(1-a)))
									if not pl.actmod_cl_TmpDtEf.rffxbone then
										pl.actmod_cl_TmpDtEf.rffxbone = true
										local emitter = ParticleEmitter(pos)
										if emitter then
											for i = 0, math.random(40,50) do
												local p = emitter:Add("particle/smokesprites_00".. string.format("%02d",math.random(1,16)), pos + VectorRand()*4*Asz + Vector(math.random(20,-20),math.random(20,-20),math.random(-5,20))*Asz)
												if not p then break end
												p:SetVelocity(VectorRand() * math.random(350,380)*Asz + Vector(math.random(10,-10),math.random(10,-10),math.random(5,-5))*Asz)
												p:SetDieTime(math.Rand(0.15,0.3)) p:SetStartAlpha(255) p:SetEndAlpha(math.random(0,100)) p:SetColor(255,255,0)
												p:SetStartSize(math.Rand(1,4)*Asz) p:SetEndSize(math.Rand(20,30)*Asz)
												p:SetAirResistance(math.Rand(300,350)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,math.Rand(600, 700)))
												p:SetRoll( math.Rand(-1,1) ) p:SetRollDelta( math.random(200,-200) )
											end
											emitter:Finish()
										end
									end
								end
							end
						end
					end
				end
			}
		end
	}
}