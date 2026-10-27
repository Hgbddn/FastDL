// Femininomenon (commission)
// 2026-AM4|27125|148635
return{
	["fortnite_forestjeangrowl"] = {
		Config = { Anim = "amod_fortnite_forestjeangrowl",Name = "Femininomenon",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "2.3" } ,Camera = { Transition = 1.9 } ,Coop = { Sync = true,MaxDist = 280 }
		,Custom = { Anim = { Time2 = 15.33333 ,Cycle = 0.0315789473684211 } ,Sound = { Time1 = 23.43 ,Time2 = 23 } }
		,Movement = { Type = 3 ,Speed = 78 ,Motion = { Static = "amod_fortnite_forestjeangrowl",Walk = "amod_fortnite_forestjeangrowl_walk" } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_ForestJeanGrowl_1.ogg" ,Delay = 0.11 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_ForestJeanGrowl_2.ogg" ,Delay = 0.43 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_ForestJeanGrowl_2.ogg" }
		}
		,Scrpt = function()
			if SERVER then
				local function ClearDPl(pl,atXt)
					if not IsValid(pl) or not istable(pl.actmod_cl_TmpDtEf) or not pl.actmod_cl_TmpDtEf.CrFet then return end
					pl.actmod_cl_TmpDtEf = nil
				end
				hook.Add("ActMod_RunStopAct", "am_forestjeangrowl_RD", function(ply) ClearDPl(ply) end)
				hook.Add("ActMod_sv_StartAniAct", "am_forestjeangrowl_RD", function(ply,atXt,tst) ClearDPl(ply,atXt) end)
				local aaforestjeangrowl = CurTime()
				hook.Add("Think", "ActMd_forestjeangrowl_T", function() 
					if (aaforestjeangrowl or 0) < CurTime() then
						aaforestjeangrowl = CurTime() + 0.1
						for _, pl in player.Iterator() do if not IsValid(pl) then continue end
							local actmodstr = pl:GetNWString("A_ActMod.TmpDir","")
							if pl:A_ActMod_GetIsAct() and actmodstr == "amod_cumact_fortnite_forestjeangrowlfix" then
								if istable(pl.actmod_cl_TmpDtEf) and actmodstr == "amod_cumact_fortnite_forestjeangrowlfix" and pl.actmod_cl_TmpDtEf.CrFet and pl.actmod_cl_TmpDtEf.Astr == actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
									local cyc = pl:GetCycle()
									if cyc > 0.6 and pl.actmod_cl_TmpDtEf.CaFeet_rCyc then pl.actmod_cl_TmpDtEf.CaFeet_rCyc = false
									elseif cyc >= 0.5147 and cyc < 0.526 and actmodstr == "amod_cumact_fortnite_forestjeangrowlfix" and not pl.actmod_cl_TmpDtEf.CaFeet_rCyc then
										pl.actmod_cl_TmpDtEf.CaFeet_rCyc = true cyc = 0.0315789473684211 pl:SetCycle(0.0315789473684211)
									end
								elseif actmodstr == "amod_cumact_fortnite_forestjeangrowlfix" then
									pl.actmod_cl_TmpDtEf = { Astr = actmodstr,CurTRun = pl.ActMod_CurTRun ,CrFet = true }
									if pl.actmod_Coop_ok and IsValid(pl.actmod_Coop_Tply) then
										local pl2 = pl.actmod_Coop_Tply
										if pl2.ActMod_CurTRun then
											local ax,ab = "AA_RLoop"..pl:EntIndex(),"AA_RLoop"..pl2:EntIndex()
											if (CurTime()-pl2.ActMod_CurTRun)%23 >= 7.65 then pl.actmod_cl_TmpDtEf.CaFeet_rCyc = true end
											if timer.Exists( ax ) and timer.Exists( ab ) then timer.Adjust(ax,timer.TimeLeft(ab)) end
										end
									end
								end
							elseif (not pl:A_ActMod_GetIsAct() or actmodstr ~= "amod_cumact_fortnite_forestjeangrowlfix") and istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.CrFet then
								ClearDPl(pl)
							end
						end
					end
				end)
				return
			end
			local MAX_POOL_PER_PLAYER,ModelPool = 15,{}
			local function GetPlayerPool(pl)
				if not IsValid(pl) then return nil end
				pl._ActModPool = pl._ActModPool or {}
				return pl._ActModPool
			end
			local function GetPooledModel(pl, modelPath)
				local pool = GetPlayerPool(pl)
				if not istable(pool) then return nil end
				local csModel = nil
				for i = #pool, 1, -1 do
					local ent = pool[i]
					table.remove(pool, i)
					if IsValid(ent) then csModel = ent break end
				end
				if not IsValid(csModel) then
					csModel = ClientsideModel(modelPath)
					if not IsValid(csModel) then return nil end
				else
					if csModel:GetModel() ~= modelPath then csModel:SetModel(modelPath) end
				end
				csModel._inUse = true
				csModel:SetNoDraw(false)
				csModel:ManipulateBoneScale(0, Vector(1, 1, 1))
				return csModel
			end

			local function ReleasePooledModel(pl, csModel)
				if not IsValid(csModel) or not csModel._inUse then return end
				csModel._inUse = false
				csModel:SetNoDraw(true)
				csModel:SetPos(pl:GetPos()+Vector(0,0,2))
				csModel:ManipulateBoneScale(0, Vector(1, 1, 1))
				if IsValid(pl) then
					local pool = GetPlayerPool(pl)
					if pool and #pool < MAX_POOL_PER_PLAYER then
						table.insert(pool, csModel) return
					end
				end
				csModel:Remove()
			end

			local function ClearPlayerPool(pl)
				if not IsValid(pl) or not istable(pl._ActModPool) then return end
				for i = 1, #pl._ActModPool do if IsValid(pl._ActModPool[i]) then pl._ActModPool[i]:Remove() end end
				pl._ActModPool = {}
			end
			local function ClearAllModelPools() for _, pl in ipairs(player.GetAll()) do ClearPlayerPool(pl) end end
			hook.Add("ActMod_RunStopAct", "am_forestjeangrowl_RemovMdlS", function(ply) ClearPlayerPool(ply) end)
			hook.Add("ActMod_cl_RunaPlyEmot", "am_forestjeangrowl_RemovMdlS", function(ply,atXt,tst) ClearPlayerPool(ply) end)
			concommand.Add("actmod_clear_particle_pool", ClearAllModelPools)
			hook.Add("EntityRemoved", "ActMd_Cleforestjeangrowl_", function(ent) if IsValid(ent) and ent:IsPlayer() then ClearPlayerPool(ent) end end)
			local function aDist(pl,taa) if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then return true end return false end
			local tclo = {{255,50,150},{255,150,255},{50,100,255},{100,100,255},{50,255,255}}
			local function CrDynParticle(pl,pos,opts)
				if not IsValid(pl) then return end
				opts = opts or {}
				local model = opts.model or "models/balloons/balloon_star.mdl"
				local initialVel = opts.velocity or Vector(math.Rand(-50, 50), math.Rand(-50, 50), math.Rand(300, 500))
				local gravity = opts.gravity or Vector(0, 0, -600)
				local life,AScale,MScale,MZScale = opts.lifeTime or 3,opts.AScale or 1,opts.MScale or 1,opts.MZScale or {1,1,1}
				local enableStretch = opts.enableStretch != false
				local stretchFactor = opts.stretchFactor or 0.002
				local maxStretch = opts.maxStretch or 2.5
				local minSquash = opts.minSquash or 0.4
				local pMat = opts.particleMat or "sprites/glow04_noz"
				local pStartSize = opts.particleStartSize or 32
				local pEndSize = opts.particleEndSize or 0
				local pStartAlpha = opts.particleStartAlpha or 255
				local pEndAlpha = opts.particleEndAlpha or 0
				local angVel = opts.angVel or AngleRand(-100, 100)
				local startScale = opts.startScale or 1
				local holdScale = opts.holdScale or 1
				local endScale = opts.endScale or 0
				local scaleStartDur = opts.scaleStartDuration or (life * (opts.scaleStartRatio or 0.2))
				local scaleHoldDur = opts.scaleHoldDuration or (life * (opts.scaleHoldRatio or 0.5))
				local scaleEndDur = opts.scaleEndDuration or (life * (opts.scaleEndRatio or 0.3))
				local spawnTime,tol = CurTime(),math.random(1,5)
				local pColor = opts.particleColor or Color(tclo[tol][1],tclo[tol][2],tclo[tol][3], 255)
				local csModel = GetPooledModel(pl, model)
				if not IsValid(csModel) then return end
				csModel:SetPos(pos) csModel:SetAngles(angVel)
				csModel:SetColor(pColor)
				csModel:SetModelScale(0) csModel:SetMaterial("models/actmod/glow")
				timer.Simple(life + 0.1, function() ReleasePooledModel(pl,csModel) end)
				if opts.color then csModel:SetColor(opts.color) end
				if opts.material then csModel:SetMaterial(opts.material) end
				local emitter = ParticleEmitter(pos, false)
				if not emitter then ReleasePooledModel(pl,csModel) return end
				local e1 = emitter:Add(pMat, pos)
				if not e1 then emitter:Finish() ReleasePooledModel(pl,csModel) return end
				e1:SetDieTime(life) e1:SetColor(pColor.r, pColor.g, pColor.b)
				e1:SetStartAlpha(pStartAlpha) e1:SetEndAlpha(pEndAlpha)
				e1:SetStartSize(pStartSize*AScale) e1:SetEndSize(pEndSize*AScale)
				e1:SetRoll( math.Rand(-1,1) ) e1:SetRollDelta( math.random(2,-2) )
				e1.sTr = pl.actmodstr
				local currentPos,currentVel,currentAng,lastTime = Vector(pos),Vector(initialVel),Angle(0,0,0),CurTime()
				e1:SetThinkFunction(function(p)
					if not IsValid(csModel) or not csModel._inUse then e1:SetDieTime(0) e1:SetLifeTime(1.5) e1.sstop = true return end
					if not e1.sstop and (not IsValid(pl) or e1.sTr ~= pl.actmodstr) then e1:SetDieTime(0) e1:SetLifeTime(1.5) ReleasePooledModel(pl,csModel) e1.sstop = true end
					if e1.sstop then return end
					local now = CurTime()
					local dt = math.min(now - lastTime, 0.1)
					lastTime = now
					currentVel:Add(gravity * dt)
					currentPos:Add(currentVel * dt)
					currentAng:Add(angVel * dt)
					csModel:SetPos(currentPos)
					csModel:SetAngles(currentAng)
					p:SetPos(currentPos)
					local age = now - spawnTime
					local currentScale = holdScale
					if age < scaleStartDur then
						currentScale = Lerp(math.Clamp(scaleStartDur > 0 and (age / scaleStartDur) or 1, 0, 1), startScale, holdScale)
					elseif age < (scaleStartDur + scaleHoldDur) then
						currentScale = holdScale
					else
						currentScale = Lerp(math.Clamp(scaleEndDur > 0 and ((age - scaleStartDur - scaleHoldDur) / scaleEndDur) or 1, 0, 1), holdScale, endScale)
					end
					if currentVel:LengthSqr() > 40 then
						local speed = currentVel:Length()
						local moveDir = currentVel / speed
						local stretch = math.Clamp(1 + speed * stretchFactor, 1, maxStretch)
						local squash = math.Clamp(1 / math.sqrt(stretch), minSquash, 1)
						if enableStretch then
							local renderMatrix = Matrix()
							if renderMatrix then
								renderMatrix:Identity()
								renderMatrix:Translate(currentPos)
								renderMatrix:SetAngles(moveDir:Angle())
								renderMatrix:Scale(Vector(stretch, squash, squash))
								csModel:EnableMatrix("RenderMultiply", renderMatrix)
							end
						else
							csModel:GetManipulateBoneScale(0, Vector(stretch*MZScale[1], squash*MZScale[2], squash*MZScale[3]))
						end
					else
						if enableStretch then csModel:DisableMatrix("RenderMultiply") end
						csModel:SetPos(currentPos)
						csModel:SetAngles(currentAng)
						csModel:GetManipulateBoneScale(0, Vector(1*MZScale[1],1*MZScale[2],1*MZScale[3]))
					end
					csModel:SetModelScale(currentScale*MScale*AScale)
					p:SetNextThink(now)
				end)
				emitter:Finish()
			end
			local stbl = {
				m = {
					[1] = {"models/hunter/geometric/pent1x1.mdl",0.7,{1,1,1}}
					,[2] = {"models/hunter/geometric/hex1x1.mdl",0.5,{1,1,1}}
					,[3] = {"models/hunter/geometric/para1x1.mdl",0.8,{1,1,1}}
					,[4] = {"models/balloons/balloon_star.mdl",1,{0,1,1}}
				}
				,t = {
					[1] = "actmod/eff_particle/p_i_ligtstar_00"
					,[2] = "actmod/eff_particle/p_i_ligtstar_03"
					,[3] = "actmod/eff_particle/p_glow_01"
					,[4] = "actmod/eff_particle/p_glow_02"
					,[5] = "actmod/eff_particle/p_i_ligtstar_01"
				}
			}
			local function cafEf(pl,isR)
				if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")) then return end
				local Asz,QHt,bAng = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef"),pl:GetRenderAngles()
				local gf,pos = pl:GetVelocity():Length(),pl:GetPos() - bAng:Forward()*3*Asz + Vector(0,0,5)*Asz
				if isR then
					local b = ""
					if pl:LookupBone(isR == 1 and "ValveBiped.Bip01_R_Toe0" or "ValveBiped.Bip01_L_Toe0") then
						b = isR == 1 and "ValveBiped.Bip01_R_Toe0" or "ValveBiped.Bip01_L_Toe0"
					elseif pl:LookupBone(isR == 1 and "ValveBiped.Bip01_R_Foot" or "ValveBiped.Bip01_L_Foot") then
						b = isR == 1 and "ValveBiped.Bip01_R_Foot" or "ValveBiped.Bip01_L_Foot"
					end
					if b ~= "" then
						local apos,aang = A_AM.ActMod:GBonePosAng( pl,b )
						if apos then pos = apos end
					end
					pos = pos + bAng:Forward()*gf*0.1
					CrDynParticle(pl,pos, {
						AScale = math.Rand(0.4, 0.6)*Asz,
						model = stbl.m[4][1],
						MScale = math.Rand(0.4, 0.7)*stbl.m[4][2]*Asz,
						MZScale = stbl.m[4][3],
						velocity = Vector(math.random(-20, 20), math.random(-20, 20), math.random(80, 120))*Asz + bAng:Forward()*math.random(70, 90)*Asz + bAng:Right()*math.random(40,-40)*Asz,
						gravity = Vector(0, 0, -math.random(300,400)),
						lifeTime = math.Rand(0.4, 0.8),
						enableStretch = false,
						stretchFactor = 0.003,
						maxStretch = 4.0,minSquash = 0.7,
						particleMat = stbl.t[math.random(1,5)],
						particleStartSize = math.random(40,50)*Asz,particleEndSize = 0,
						particleStartAlpha = 255,particleEndAlpha = 0,
						angVel = AngleRand()
					})
					
					local emitter = ParticleEmitter(pos)
					if emitter then
						for i = 0,math.random(1,3) do
							local p = emitter:Add("actmod/eff_particle/p_i_star_0"..math.random(3,4), pos+VectorRand()*10*Asz)
							if p then
								p:SetVelocity(bAng:Forward()*gf*0.5 + bAng:Forward()*math.random(20,30)*Asz + Vector(0, 0, math.random(10,20)*Asz))
								p:SetDieTime(math.Rand(0.7,1.2)) p:SetGravity(Vector(0, 0, math.random(7,16)*Asz)) p:SetAirResistance(math.random(60,200))
								p:SetStartAlpha(200) p:SetEndAlpha(0) p:SetColor(math.random(200,255),math.random(200,255),math.random(200,255))
								p:SetStartSize(math.Rand(4.7,5.2)*Asz) p:SetEndSize(math.Rand(0.1,3)*Asz)
								if math.random(1,5) == 4 then
									p:SetStartLength(math.Rand(1,2)) p:SetEndLength(math.Rand(1,2))
								else
									p:SetRoll( math.Rand(-1,1) ) p:SetRollDelta( math.random(5,-5) )
								end
							end
						end
						for i = 1,math.random(3,7) do
							local p = emitter:Add(stbl.t[math.random(1,5)], pos+VectorRand()*10*Asz)
							if p then
								p:SetVelocity(bAng:Forward()*gf*0.5 +bAng:Forward()*math.random(20,30)*Asz + Vector(0, 0, math.random(10,20)*Asz) + VectorRand()*math.random(10,50)*Asz)
								p:SetDieTime(math.Rand(0.3,0.6)) p:SetGravity(Vector(0, 0, -math.random(50,100)*Asz)) p:SetAirResistance(math.random(60,200))
								p:SetStartAlpha(0) p:SetEndAlpha(255) p:SetColor(math.random(200,255),math.random(100,200),math.random(200,255))
								p:SetStartSize(math.Rand(3.7,4.5)*Asz) p:SetEndSize(0)
								if math.random(1,2) == 2 then
									p:SetStartLength(math.Rand(0.5,1)) p:SetEndLength(math.Rand(0.5,1))
								else
									p:SetRoll( math.Rand(-1,1) ) p:SetRollDelta( math.random(8,-8) )
								end
							end
						end
						local vel,die = bAng:Forward()*gf*0.7 + bAng:Forward()*math.random(5,10)*Asz + Vector(0, 0, math.random(5,20)*Asz) + VectorRand()*10*Asz,math.Rand(0.7,1)
						local SGr,Air,z1,z2 = bAng:Forward()*math.random(5,10)*Asz + Vector(0, 0, math.random(10,-10)*Asz),math.random(50,100)-gf*0.4,math.Rand(12.7,13.2)*Asz,math.Rand(10.7,11.2)*Asz
						local g = emitter:Add("actmod/eff_particle/p_glow_01", pos)
						if g then
							g:SetVelocity(vel)
							g:SetDieTime(die*0.5) g:SetGravity(SGr) g:SetAirResistance(Air)
							g:SetStartAlpha(155) g:SetEndAlpha(0) g:SetColor(255,math.random(100,200),255)
							g:SetStartSize(z1*2) g:SetEndSize(z2)
						end
						local s = emitter:Add("actmod/eff_particle/p_i_star_03", pos)
						if s then
							s:SetVelocity(vel)
							s:SetDieTime(die) s:SetGravity(SGr) s:SetAirResistance(Air)
							s:SetStartAlpha(255) s:SetEndAlpha(0) s:SetColor(255,math.random(220,255),255)
							s:SetStartSize(z1) s:SetEndSize(z2) s:SetRollDelta( math.random(1,-1) )
						end
						emitter:Finish()
					end
				else
					local emitter = ParticleEmitter(pos)
					if emitter then
						for i = 1,math.random(1,5) do
							local p = emitter:Add(stbl.t[math.random(1,5)], pos+Vector(math.random(30,-30),math.random(30,-30),math.random(1,3))*Asz)
							if p then
								p:SetVelocity(Vector(math.random(30,-30)*Asz,math.random(30,-30)*Asz, math.random(30,50)*Asz) + VectorRand()*math.random(10,50)*Asz)
								p:SetDieTime(math.Rand(0.3,0.6)) p:SetGravity(Vector(0, 0, -math.random(50,100)*Asz)) p:SetAirResistance(math.random(60,100))
								p:SetStartAlpha(255) p:SetEndAlpha(0) p:SetColor(math.random(200,255),math.random(100,150),math.random(200,255))
								p:SetStartSize(0) p:SetEndSize(math.Rand(5,7)*Asz)
								if math.random(1,2) == 2 then
									p:SetStartLength(math.Rand(0.5,1)) p:SetEndLength(math.Rand(0.5,1))
								else
									p:SetRoll( math.Rand(-1,1) ) p:SetRollDelta( math.random(8,-8) )
								end
							end
						end
						emitter:Finish()
					end
				end
				if not isR or math.random(1,4)==3 then
					if QHt > 2 then
						local stt = pl.actmodstr
						for i = 1,math.random(2,5) do
							timer.Simple((i-1)*0.01, function()
								if IsValid(pl) and isstring(pl.actmodstr) and stt == pl.actmodstr then
									local rt = math.random(1,3)
									CrDynParticle(pl,pos-bAng:Forward()*3*Asz, {
										AScale = math.Rand(0.1, 0.2)*Asz,
										model = stbl.m[rt][1],
										MScale = math.Rand(0.4, 0.6)*stbl.m[rt][2]*Asz,
										MZScale = stbl.m[rt][3],
										velocity = Vector(math.random(-40, 40), math.random(-40, 40), not isR and math.random(100, 150) or math.random(50, 150))*Asz -bAng:Forward()*math.random(20,30)*Asz,
										gravity = Vector(0, 0, not isR and -math.random(100,300) or -math.random(100,400)),
										lifeTime = math.Rand(0.3, 0.8),
										enableStretch = false,
										stretchFactor = 0.003,
										maxStretch = 4.0,minSquash = 0.7,
										particleMat = "sprites/glow04_noz",
										particleStartSize = math.random(50,70)*Asz,particleEndSize = 0,
										particleStartAlpha = 150,particleEndAlpha = 0,
										angVel = AngleRand()
									})
								end
							end)
						end
					end
				end
			end
			return {
				SCpt = function(pl,cyc,Fram)
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.CrFet and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.CaFtn then
						if cyc > 0.6 and isnumber(pl.actmod_cl_TmpDtEf.CaFeet_Z) and pl.actmod_cl_TmpDtEf.CaFeet_rCyc then pl.actmod_cl_TmpDtEf.CaFeet_rCyc = false end
						if cyc > 0.045 and cyc < 0.991 then
							if pl.actmod_cl_TmpDtEf.CaFtn ~= 1 then pl.actmod_cl_TmpDtEf.CaFtn = 1 end
							if cyc > 0.982 and cyc < 0.989 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 32 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 32 cafEf(pl) --R
							elseif cyc > 0.952 and cyc < 0.957 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 31 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 31 cafEf(pl) --L
							elseif cyc > 0.923 and cyc < 0.930 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 30 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 30 cafEf(pl) --R
							elseif cyc > 0.893 and cyc < 0.899 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 29 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 29 cafEf(pl) --L
							elseif cyc > 0.862 and cyc < 0.867 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 28 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 28 cafEf(pl) --R
							elseif cyc > 0.831 and cyc < 0.836 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 27 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 27 cafEf(pl) --L
							elseif cyc > 0.800 and cyc < 0.805 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 26 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 26 cafEf(pl) --R
							elseif cyc > 0.770 and cyc < 0.775 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 25 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 25 cafEf(pl) --L
							elseif cyc > 0.738 and cyc < 0.743 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 24 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 24 cafEf(pl) --R
							elseif cyc > 0.708 and cyc < 0.714 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 23 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 23 cafEf(pl) --L
							elseif cyc > 0.677 and cyc < 0.682 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 22 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 22 cafEf(pl) --R
							elseif cyc > 0.646 and cyc < 0.651 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 21 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 21 cafEf(pl) --L
							elseif cyc > 0.616 and cyc < 0.621 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 20 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 20 cafEf(pl) --R
							elseif cyc > 0.586 and cyc < 0.592 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 19 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 19 cafEf(pl) --L
							elseif cyc > 0.555 and cyc < 0.560 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 18 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 18 cafEf(pl) --R
							elseif cyc > 0.526 and cyc < 0.531 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 17 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 17 cafEf(pl) --L
							elseif cyc >= 0.5147 and cyc < 0.6 and pl.actmodstr == "amod_cumact_fortnite_forestjeangrowlfix" and not pl.actmod_cl_TmpDtEf.CaFeet_rCyc then
								pl.actmod_cl_TmpDtEf.CaFeet_rCyc = true cyc = 0.0315789473684211 pl:SetCycle(0.0315789473684211)
							elseif cyc > 0.501 and cyc < 0.508 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 16 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 16 cafEf(pl) --R
							elseif cyc > 0.473 and cyc < 0.481 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 15 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 15 cafEf(pl) --R
							elseif cyc > 0.439 and cyc < 0.445 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 14 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 14 cafEf(pl) --L
							elseif cyc > 0.411 and cyc < 0.418 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 13 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 13 cafEf(pl) --L
							elseif cyc > 0.379 and cyc < 0.384 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 12 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 12 cafEf(pl) --R
							elseif cyc > 0.351 and cyc < 0.359 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 11 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 11 cafEf(pl) --R
							elseif cyc > 0.318 and cyc < 0.324 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 10 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 10 cafEf(pl) --L
							elseif cyc > 0.288 and cyc < 0.296 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 9 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 9 cafEf(pl) --L
							elseif cyc > 0.257 and cyc < 0.262 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 8 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 8 cafEf(pl) --R
							elseif cyc > 0.231 and cyc < 0.237 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 7 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 7 cafEf(pl) --R
							elseif cyc > 0.196 and cyc < 0.201 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 6 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 6 cafEf(pl) --L
							elseif cyc > 0.170 and cyc < 0.176 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 5 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 5 cafEf(pl) --L
							elseif cyc > 0.135 and cyc < 0.140 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 4 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 4 cafEf(pl) --R
							elseif cyc > 0.109 and cyc < 0.115 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 3 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 3 cafEf(pl) --R
							elseif cyc > 0.074 and cyc < 0.079 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 2 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 2 cafEf(pl) --L
							elseif cyc > 0.046 and cyc < 0.054 and pl.actmod_cl_TmpDtEf.CaFeet_Z ~= 1 then pl.actmod_cl_TmpDtEf.CaFeet_Z = 1 cafEf(pl) --L
							end
							if cyc > 0.057 and cyc < 0.5 then
								local bL,bR = pl:LookupBone("ValveBiped.Bip01_L_Hand"),pl:LookupBone("ValveBiped.Bip01_R_Hand")
								if bL then
									if cyc > 0.487 and cyc < 0.496 and pl.actmod_cl_TmpDtEf.CaFeet_L ~= 4 then pl.actmod_cl_TmpDtEf.CaFeet_L = 4 cafEf(pl,2)
									elseif cyc > 0.367 and cyc < 0.371 and pl.actmod_cl_TmpDtEf.CaFeet_L ~= 3 then pl.actmod_cl_TmpDtEf.CaFeet_L = 3 cafEf(pl,2)
									elseif cyc > 0.242 and cyc < 0.251 and pl.actmod_cl_TmpDtEf.CaFeet_L ~= 2 then pl.actmod_cl_TmpDtEf.CaFeet_L = 2 cafEf(pl,2)
									elseif cyc > 0.117 and cyc < 0.126 and pl.actmod_cl_TmpDtEf.CaFeet_L ~= 1 then pl.actmod_cl_TmpDtEf.CaFeet_L = 1 cafEf(pl,2)
									end
								end
								if bR then
									if cyc > 0.423 and cyc < 0.432 and pl.actmod_cl_TmpDtEf.CaFeet_R ~= 4 then pl.actmod_cl_TmpDtEf.CaFeet_R = 4 cafEf(pl,1)
									elseif cyc > 0.302 and cyc < 0.313 and pl.actmod_cl_TmpDtEf.CaFeet_R ~= 3 then pl.actmod_cl_TmpDtEf.CaFeet_R = 3 cafEf(pl,1)
									elseif cyc > 0.181 and cyc < 0.189 and pl.actmod_cl_TmpDtEf.CaFeet_R ~= 2 then pl.actmod_cl_TmpDtEf.CaFeet_R = 2 cafEf(pl,1)
									elseif cyc > 0.058 and cyc < 0.067 and pl.actmod_cl_TmpDtEf.CaFeet_R ~= 1 then pl.actmod_cl_TmpDtEf.CaFeet_R = 1 cafEf(pl,1)
									end
								end
							end
						end
						if pl.actmod_cl_TmpDtEf.CaFtn == 1 and (cyc < 0.033 or cyc > 0.991) and GetConVarNumber("actmod_cl_q_ef") > 2 then
							local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
							local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
							if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
							pl.actmod_cl_TmpDtEf.A_SubMF = A_SubMF
							pl.actmod_cl_TmpDtEf.A_hupf = hupf
						end
					elseif pl.actmodstr == "amod_cumact_fortnite_forestjeangrowl" or pl.actmodstr == "amod_cumact_fortnite_forestjeangrowlfix" then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,CaFtn = 0 ,CaFeet_L = 0,CaFeet_R = 0,CaFeet_Z = 0 ,CrFet = true ,A_hupf = hupf,A_SubMF = A_SubMF }
						if pl.actmodstr == "amod_cumact_fortnite_forestjeangrowlfix" and pl.actmod_Coop_ok and IsValid(pl.actmod_Coop_Tply) then
							local pl2 = pl.actmod_Coop_Tply
							if pl2.ActMod_CurTRun then
								local ax,ab = "AA_RLoop"..pl:EntIndex(),"AA_RLoop"..pl2:EntIndex()
								if (CurTime()-pl2.ActMod_CurTRun)%23 >= 7.65 then pl.actmod_cl_TmpDtEf.CaFeet_rCyc = true end
								if timer.Exists( ax ) and timer.Exists( ab ) then timer.Adjust(ax,timer.TimeLeft(ab)) end
							end
						end
					end
				end
			}
		end
	}
	
	,["fortnite_forestjeangrowlfix"] = {
		Config = { Anim = "amod_fortnite_forestjeangrowl",Name = "Femininomenon",isNew = false,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "3.1" } ,Camera = { Transition = 1.9 } ,Coop = { Sync = true,MaxDist = 280 }
		,Custom = { Anim = { Time1 = 23.5 ,Time2 = 23 ,Cycle = 0.0315789473684211 } ,Sound = { Time1 = 23.42 ,Time2 = 23 } }
		,Movement = { Type = 3 ,Speed = 78 ,Motion = { Static = "amod_fortnite_forestjeangrowl",Walk = "amod_fortnite_forestjeangrowl_walk" } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_ForestJeanGrowl_1.ogg" ,Delay = 0.1 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_ForestJeanGrowl_2.ogg" ,Delay = 0.42 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_ForestJeanGrowl_2.ogg" }
		}
		,Scrpt = function() return {SCpt = "amod_cumact_fortnite_forestjeangrowl"} end
	}
}