// Woman (commission)
// 2026-AM4|15876|148635
return{
	["fortnite_tangyradishmagma"] = {
		Config = { Anim = "amod_fortnite_tangyradishmagma",Name = "Woman",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "3.0" } ,Camera = { Transition = 2.3 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 8.9 ,Cycle = 0.043010752688172 } ,Sound = { Time1 = 18.2,Time2 = 17.8 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_TangyRadishMagma_1.mp3" ,Delay = 0.06 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_TangyRadishMagma_2.mp3" ,Delay = 0.4 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_TangyRadishMagma_2.mp3" }
		}
		,Scrpt = function()
			local mat_w,mat_s,mat_r,mat_t,mat_h,mat_k = Material("actmod/eff_particle/fxtrmw01"),Material("actmod/sm_hover3.png","noclamp smooth"),Material("actmod/eff_particle/p_ring_wave","noclamp smooth")
			,Material("actmod/eff_particle/p_i_ligtstar_04","noclamp smooth"),Material("actmod/eff_particle/p_glow_01","noclamp smooth"),Material("actmod/eff_particle/light_02","noclamp smooth")
			local function CycG(c,a,b) return math.Remap(math.min(c-a,b),0,b-a,0,1) end
			local function CycGHS(c,a,b,h)
				h = h or 0
				local len = b - a
				local fade = (len - h) * 0.5
				local holdStart,holdEnd = a + fade,b - fade
				if c <= a or c >= b then return 0 end
				if c < holdStart then return math.Remap(c, a, holdStart, 0, 1) end
				if c <= holdEnd then return 1 end
				return math.Remap(c, holdEnd, b, 1, 0)
			end
			local function aDist(pl,taa) if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then return true end return false end
			local function A(aa,k) return 1+(aa-1)*k end
			local function AM_namT(ply,Ent)
				if not IsValid(ply) then return "__NULL_" end
				Ent = Ent or ply
				local aID = "__mdl_".. tostring(Ent:EntIndex{})
				if ply:IsPlayer() then aID = tostring(ply:SteamID64{} .. ply:Nick{}) end
				return aID
			end
			local AMeshSystem = A_AM.ActMod.AM_AMeshLUp
			local function ataTr(aID,n,QHt,a)
				for i = n,n+5 do AMeshSystem.Active[aID .. i] = nil end
				if a then a(QHt == 2 and math.random(n,n+1) or math.random(n,n+5),n) end
			end
			local function arDSpte(e,b,c,z,t,v)
				if not e:LookupBone(b) then return end
				local a = 1-math.ease.OutCirc(CycG(c,t,v))
				render.SetMaterial(mat_h)
				render.DrawSprite(A_AM.ActMod:GBonePosAng(e,b),z-20*a,z-20*a, Color(255, 200, 100,150*a))
			end
			local function CreateCSmokeArc(ent,config)
				if not IsValid(ent) then return end
				local count,arcDegrees,arcOffset = config.count or 15,config.arc or 120,config.arcOffset or 0
				local Astr,radius,heightOffset = config.Astr,config.radius or 40,config.height or 10
				local smokeSizeStart,smokeSize,smokeSizeEnd = config.smokeSizeStart or 10,config.size or 25,config.smokeSizeEnd or 0
				local mat,smokeColor = config.mat or "particles/smokey",config.color or Color(240, 240, 240, 255)
				local growthTime,holdTime,fadeTime = config.growthTime or 0.3,config.holdTime or 0.5,config.fadeTime or 0.8
				local totalLife = growthTime + holdTime + fadeTime
				local startAlpha,endAlpha = config.startAlpha or 240,config.endAlpha or 0
				local wind,buoyancy = config.wind or Vector(0, 0, 0),config.buoyancy or Vector(0, 0, 15)
				local airResistance = config.airResistance or 3
				local waveSpeed,waveStrength = config.waveSpeed or 6,config.waveStrength or 12
				local followEntity = config.followEntity or false
				local emitter = ParticleEmitter(ent:GetPos())
				if not emitter then return end
				for i = 1, count do
					local rad = math.rad(math.random(-arcDegrees / 2, arcDegrees / 2) + arcOffset)
					local localPos = Vector( math.cos(rad) * radius, math.sin(rad) * radius, math.random(-heightOffset*0.1, heightOffset) )
					local localVelocity = localPos:GetNormalized() * math.random(10, 40)
					local spawnPos = ent:LocalToWorld(localPos)
					local p = emitter:Add(mat,spawnPos)
					if p then
						p:SetDieTime(totalLife) p:SetColor(smokeColor.r, smokeColor.g, smokeColor.b)
						p:SetRoll(math.Rand(-180, 180)) p:SetRollDelta(math.Rand(-2, 2)) p.sTr = Astr or ent.actmodstr
						if not followEntity then
							p:SetAirResistance(airResistance)
							local pushDir = (spawnPos - ent:GetPos()):GetNormalized()
							p:SetVelocity(ent:GetVelocity() + pushDir * math.random(30, 60))
						end
						local spawnTime,waveSeed = CurTime(),math.Rand(0,10)
						p:SetThinkFunction(function(prt)
							if not prt.sstop and (not IsValid(ent) or not ent.actmodstr or prt.sTr ~= ent.actmodstr) then prt:SetDieTime(0) prt:SetLifeTime(1.5) prt.sstop = true end
							if prt.sstop then return end
							local age,currentSize,currentAlpha = CurTime() - spawnTime,smokeSize,startAlpha
							if age < growthTime then
								local progress = age / growthTime
								currentSize = Lerp(progress, smokeSizeStart, smokeSize)
								currentAlpha = Lerp(progress, 0, startAlpha)
							elseif age < (growthTime + holdTime) then
								currentSize = smokeSize
							else
								local progress = math.Clamp((age - (growthTime + holdTime)) / fadeTime, 0, 1)
								currentSize = Lerp(progress, smokeSize, smokeSizeEnd)
								currentAlpha = Lerp(progress, startAlpha, endAlpha)
							end
							prt:SetStartSize(currentSize) prt:SetEndSize(currentSize)
							prt:SetStartAlpha(currentAlpha) prt:SetEndAlpha(currentAlpha)
							local waveX = math.sin(CurTime() * waveSpeed + waveSeed) * waveStrength
							local waveY = math.cos(CurTime() * (waveSpeed - 1) + waveSeed) * waveStrength
							if followEntity and IsValid(ent) then
								local dt = 0.03
								local localWind = ent:WorldToLocal(ent:GetPos() + wind)
								local localBuoyancy = ent:WorldToLocal(ent:GetPos() + buoyancy)
								local totalAccel = (localBuoyancy + localWind + Vector(waveX, waveY, 0)) * 0.1
								localVelocity = localVelocity + totalAccel
								localVelocity = localVelocity * (1 - (airResistance * dt)) -- تطبيق مقاومة الهواء يدوياً
								localPos = localPos + (localVelocity * dt)
								prt:SetPos(ent:LocalToWorld(localPos))
								prt:SetVelocity(Vector(0,0,0)) 
							else
								local currentVel = prt:GetVelocity()
								local waveVec = Vector(waveX, waveY, 0)
								prt:SetVelocity(currentVel + (buoyancy + wind + waveVec) * 0.1)
							end
							prt:SetNextThink(CurTime() + 0.00)
						end)
						p:SetNextThink(CurTime() + 0.01)
					end
				end
				emitter:Finish()
			end
			return {
				SCpt = function(pl,cyc)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")/2) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.trmw and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.ttimr then
						if not pl.actmod_cl_TmpDtEf.trmh and (cyc > 0.01 and cyc < 0.05 or cyc > 0.3) then pl.actmod_cl_TmpDtEf.trmh = CurTime()+0.1 end
						if pl.actmod_cl_TmpDtEf.smko and (cyc < 0.842 or cyc > 0.8952) then pl.actmod_cl_TmpDtEf.smko = false end
						local Asz,QHt,aID = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef"),AM_namT(pl) .. "_PBeam_"
						if (pl.actmod_cl_TmpDtEf.NeSmTime or 0) < CurTime() then
							pl.actmod_cl_TmpDtEf.NeSmTime = CurTime() + math.Rand(0.1,0.5) 
							for i = 1, QHt > 2 and math.random(5,10) or math.random(1,5) do
								CreateCSmokeArc(pl,{
									Astr = pl.actmod_cl_TmpDtEf.Astr,
									mat = "particle/particle_noisesphere",
									count = math.random(1,2),
									arc = 120*A(Asz,0.5),arcOffset = 180,
									radius = 22*Asz,height = 45*Asz,
									smokeSizeStart = math.Rand(10,20)*Asz,size = math.Rand(15,18)*Asz,smokeSizeEnd = math.Rand(20,5)*Asz,
									color = Color(255, 150, 40),
									startAlpha = math.random(40,50),
									followEntity = true,
									growthTime = math.Rand(0.1,0.3),holdTime = math.Rand(0.5,2),fadeTime = math.Rand(0.2,0.8),
									wind = Vector(0,0,math.random(2,-5))*Asz,buoyancy = Vector(0, 0, math.random(0,2))*Asz,airResistance = math.random(5,10)*Asz,
									waveSpeed = 1,waveStrength = 1
								})
							end
						end
						if QHt > 1 and pl.actmod_cl_TmpDtEf.ttimr < CurTime() and cyc > 0.02 then
							pl.actmod_cl_TmpDtEf.ttimr = CurTime() + math.Rand(0.3,0.8)
							local basePos,baseAng,anum,bnum = pl:GetPos(),pl:GetRenderAngles(),1,1
							if pl.actmod_cl_TmpDtEf.rnum == 1 then
								pl.actmod_cl_TmpDtEf.rnum = 2 ataTr(aID,10,QHt,function(a,n) anum = a bnum = n end)
							elseif pl.actmod_cl_TmpDtEf.rnum == 2 then
								pl.actmod_cl_TmpDtEf.rnum = 3 ataTr(aID,20,QHt,function(a,n) anum = a bnum = n end)
							elseif pl.actmod_cl_TmpDtEf.rnum == 3 then
								pl.actmod_cl_TmpDtEf.rnum = 4 ataTr(aID,30,QHt,function(a,n) anum = a bnum = n end)
							elseif pl.actmod_cl_TmpDtEf.rnum == 4 then
								pl.actmod_cl_TmpDtEf.rnum = 5 ataTr(aID,40,QHt,function(a,n) anum = a bnum = n end)
							elseif pl.actmod_cl_TmpDtEf.rnum == 5 then
								pl.actmod_cl_TmpDtEf.rnum = 6 ataTr(aID,50,QHt,function(a,n) anum = a bnum = n end)
							elseif pl.actmod_cl_TmpDtEf.rnum == 6 then
								pl.actmod_cl_TmpDtEf.rnum = 7 ataTr(aID,60,QHt,function(a,n) anum = a bnum = n end)
							elseif pl.actmod_cl_TmpDtEf.rnum == 7 then
								pl.actmod_cl_TmpDtEf.rnum = 8 ataTr(aID,70,QHt,function(a,n) anum = a bnum = n end)
							else
								pl.actmod_cl_TmpDtEf.rnum = 1 ataTr(aID,1,QHt,function(a,n) anum = a bnum = n end)
							end
							for i = bnum,anum do
								local tpos,tang,aF,aR,ad = Vector(0,0,-3*Asz),Angle(-90,0,0),math.random(10,15)*Asz,math.random(10,-10)*Asz,math.random(3,4)
								local tt = AMeshSystem.Add(aID .. i, {
									pos = basePos + tpos - baseAng:Forward()*aF + baseAng:Right()*aR,
									ang = baseAng + tang,delay = (i%5) * math.Rand(0,0.3),
									mat = Material("actmod/eff_particle/fxtrmw0"..ad),
									width = (ad == 4 and math.random(3,15) or math.random(15,50))*Asz,widthBottom = 0,height = math.random(40,80)*Asz,
									strup = math.random(1,2) == 2 and true,strwi = math.random(1,2) == 2 and true,
									growthTime = math.Rand(0.3,1),sustainTime = math.Rand(0.3,0.7),shrinkTime = math.Rand(0.2,0.7),
									color = Color(255, 200, 150, 150),mode = "pingpong",faceCamera = true,
									amplitude = math.random(10,40),moveSpeed = math.Rand(0,3)
								})
								tt.tpos = tpos tt.tang = tang tt.taF = aF tt.taR = aR tt.Asz = Asz
							end
						end
						if QHt > 3 then
							local aID,rPos,rAng = AM_namT(pl) .. "_PBeam_",pl:GetPos(),pl:GetRenderAngles()
							for i = 1,75 do
								local AMSA = AMeshSystem.Active[aID .. i]
								if AMSA then
									AMSA.pos = rPos + AMSA.tpos - rAng:Forward()*AMSA.taF + rAng:Right()*AMSA.taR
									AMSA.ang = rAng + AMSA.tang
								end
							end
						end
					else
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,rnum = 0 ,trmw = true ,NeSmTime = CurTime()+0.3 ,ttimr = CurTime()+0.6,tkimr = CurTime()+0.51 ,A_hupf = hupf,A_SubMF = A_SubMF }
					end
				end
				,SDrw = function(pl,cyc)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")/2) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.trmw and pl.actmod_cl_TmpDtEf.tkimr and pl.actmod_cl_TmpDtEf.trmh and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.ttimr then
						local pos,Asz,QHt = pl:GetPos(),pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
						local q1,q2,qh = 100*Asz,0.555,pl.actmod_cl_TmpDtEf.trms or math.Clamp(CurTime()-pl.actmod_cl_TmpDtEf.trmh,0,1)
						if not pl.actmod_cl_TmpDtEf.trms and qh >= 1 then pl.actmod_cl_TmpDtEf.trms = 1 end
						local q3 = math.Clamp(qh - ((CurTime()-pl.actmod_cl_TmpDtEf.tkimr) % q2 / q2),0,1)
						render.SetMaterial(mat_s)
						render.DrawQuadEasy(pos + Vector(0,0,0.2*Asz ), Vector(0,0,1*Asz), q1+5*q2,q1+5*q2, Color( 255, 150, 80, 100*q3 ), 0)
						render.SetMaterial(mat_w)
						render.DrawQuadEasy(pos + Vector(0,0,0.2*Asz ), Vector(0,0,1*Asz), q1,q1, Color( 255, 150, 80, math.max(240*q3,50)*qh ), 0)
						if cyc > 0.04591 and cyc < 0.067292 then
							local z,a = 30*Asz,CycGHS(cyc,0.04591,0.067)
							local ang = pl:GetRenderAngles()
							local forward,right,up = ang:Forward(),ang:Right(),ang:Up()
							local nb = "ValveBiped.Bip01_Pelvis" if not pl:LookupBone(nb) then nb = 0 end
							local Bpos = A_AM.ActMod:GBonePosAng(pl,nb) - forward*8*Asz + up*16*Asz
							render.SetMaterial(mat_r)
							render.DrawQuadEasy(Bpos, forward, z+20*a,z+20*a, Color( 255, 230, 120, 200*a ), 0)
							render.SetMaterial(mat_k)
							render.DrawQuadEasy(Bpos, forward, z*2.2-25*a,z*2.2-25*a, Color( 255, 250, 150, 255*a ), CurTime()*120)
						end
						if cyc > 0.5681 and cyc < 0.8 and math.random(1,2) == 2 then
							local ang = pl:GetRenderAngles()
							local forward,right,up = ang:Forward(),ang:Right(),ang:Up()
							local emitter = ParticleEmitter(pos)
							if emitter then
								local p = emitter:Add("actmod/eff_particle/laser_tracer01", pos + Vector(0,0,math.Rand(70, 100))*Asz + VectorRand() *0.3*Asz + forward*math.random(-20,20)*Asz + right*math.random(-40,40)*Asz)
								if p then
									p:SetVelocity(Vector(0,0,-math.random(20,50))*Asz + VectorRand() * math.random(0,2) + right*math.random(-20,20)*Asz)
									p:SetDieTime(math.Rand(0.2,0.8)) p:SetStartAlpha(255) p:SetEndAlpha(0) p:SetColor(255, 180, 80)
									p:SetStartSize(math.Rand(1.5,2)*Asz) p:SetEndSize(math.Rand(1,2)*Asz)
									p:SetAirResistance(math.Rand(0,2)*Asz) p:SetGravity(Vector(0,0,-math.random(200,300)))
									p:SetStartLength(math.Rand(2,6)*Asz) p:SetEndLength(math.Rand(0.9,2.5)*Asz)
								end
								emitter:Finish()
							end
						end
						if QHt > 2 and cyc > 0.6513 and cyc < 0.6954 then
							local z,a,b = 40*Asz,0.6513,0.69538
							arDSpte(pl,"ValveBiped.Bip01_Pelvis",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_Spine",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_Spine1",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_Spine2",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_Spine4",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_Neck1",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_Head1",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_R_Clavicle",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_R_UpperArm",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_R_Forearm",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_R_Hand",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_L_Clavicle",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_L_UpperArm",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_L_Forearm",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_L_Hand",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_R_Thigh",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_R_Calf",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_R_Foot",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_L_Thigh",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_L_Calf",cyc,z,a,b)
							arDSpte(pl,"ValveBiped.Bip01_L_Foot",cyc,z,a,b)
						end
					end
				end
			}
		end
	}
}