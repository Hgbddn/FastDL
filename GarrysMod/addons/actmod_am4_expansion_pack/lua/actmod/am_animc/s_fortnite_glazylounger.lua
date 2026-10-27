// Lazy Lounger (commission)
// 2026-AM4|22936|148635
return{
	["fortnite_cherryknot_a1"] = {
		Config = { Anim = "amod_fortnite_cherryknot_2",Name = "Lazy Lounger (A+P)",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "7.1" } ,Coop = { Sync = true,MaxDist = 350,YourAnim = "fortnite_cherryknot_a1" ,OtherAnim = "fortnite_cherryknot_a2" }
		,Camera = { Transition = 1.4 } ,Custom = { Anim = { Time2 = 12.46667,Cycle = 0.1688888888888889 },Sound = { Time1 = 50.53667,Time2 = 49.86667 } }
		,Movement = { Type = 3 ,Speed = 56 } ,Models = { [1] = { Model = "models/actmod/prop/CherryKnot_Gadget.mdl" } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_1.ogg" ,Delay = 0.03 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" ,Delay = 0.67 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" }
		}
		,Scrpt = function()
			local math_Clamp,math_TimeFraction = math.Clamp,math.TimeFraction
			local mat_ppr,mat_ppk = Material("actmod/eff_particle/p_i_ligtstar_05"),Material("actmod/eff_particle/p_ring_wave")
			local function aDist(pl,taa) if pl == LocalPlayer() or EyePos():Distance(pl:GetPos()) < taa then return true end return false end
			local function A(aa,k) return 1+(aa-1)*k end
			local function CycG(c,a,b) return math_Clamp(math_TimeFraction(a,b,c),0,1) end
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
			local function cfEff(pl,isR)
				local Asz,QHt,tol = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef"),math.random(1,4)
				local b = pl:LookupBone(isR and "ValveBiped.Bip01_R_Toe0" or "ValveBiped.Bip01_L_Toe0")
				local apos,aang = A_AM.ActMod:GBonePosAng( pl,isR and (b and "ValveBiped.Bip01_R_Toe0" or "ValveBiped.Bip01_R_Foot") or (b and "ValveBiped.Bip01_L_Toe0" or "ValveBiped.Bip01_L_Foot") )
				local pos = Vector(apos.x,apos.y,pl:GetPos().z+2*Asz)
				if not b then pos = pos + pl:GetForward()*4*Asz end
			end
			local RippleMeta = {}
			RippleMeta.__index = RippleMeta
			function AM_CL_CreateWaterRipple(config)
				config = config or {}
				local effect = setmetatable({}, RippleMeta)
				effect.pos = config.pos or Vector(0, 0, 0)
				effect.targetPos = effect.pos
				effect.normal = config.normal or Vector(0, 0, 1)
				effect.startSize = config.startSize or 0
				effect.maxSize = config.maxSize or 64
				effect.fadeInTime = config.fadeInTime or 0.3
				effect.holdTime = config.holdTime or 0.5
				effect.fadeOutTime = config.fadeOutTime or 0.3
				local matInput = config.material or "effects/select_ring"
				effect.material = type(matInput) == "string" and Material(matInput) or matInput
				effect.color = config.color or Color(255, 255, 255)
				effect.enableDistanceLimit = config.enableDistanceLimit or false
				effect.maxDistance = config.maxDistance or 100
				effect.tetherSpeed = config.tetherSpeed or 8
				effect.startTime = CurTime()
				effect.rotation = config.rotation or math.random(0, 360)
				effect.rotationSpeed = config.rotationSpeed or 0
				effect.randomRotation = config.randomRotation or false
				effect.randomRotationSpeed = config.randomRotationSpeed or false
				effect.rotationSpeedMin = config.rotationSpeedMin or -50
				effect.rotationSpeedMax = config.rotationSpeedMax or 50
				effect.clockwiseOnly = config.clockwiseOnly or false
				effect.counterClockwiseOnly = config.counterClockwiseOnly or false
				effect.rotateWithLifetime = config.rotateWithLifetime ~= false
				if effect.randomRotation then effect.rotation = math.Rand(0, 360) end
				if effect.randomRotationSpeed then effect.rotationSpeed = math.Rand(effect.rotationSpeedMin, effect.rotationSpeedMax) end
				if effect.clockwiseOnly then
					effect.rotationSpeed = math.abs(effect.rotationSpeed)
				elseif effect.counterClockwiseOnly then
					effect.rotationSpeed = -math.abs(effect.rotationSpeed)
				end
				effect.rotationOverLife = config.rotationOverLife --or {0,180}
				effect.alive = true
				return effect
			end
			function RippleMeta:Render()
				if not self.alive then return end
				local timeAlive = CurTime() - self.startTime
				local totalLifetime = self.fadeInTime + self.holdTime + self.fadeOutTime
				if timeAlive >= totalLifetime then
					self.alive = false
					return
				end
				if self.enableDistanceLimit then
					local dist = self.pos:Distance(self.targetPos)
					if dist > self.maxDistance then
						local dir = (self.targetPos - self.pos):GetNormalized()
						local goalPos = self.targetPos - (dir * self.maxDistance)
						self.pos = LerpVector(FrameTime() * self.tetherSpeed, self.pos, goalPos)
					end
				else
					self.pos = self.targetPos
				end
				local alpha = 1
				local currentSize = self.maxSize
				if timeAlive < self.fadeInTime then
					local frac = timeAlive / self.fadeInTime
					alpha = frac
					currentSize = Lerp(frac, self.startSize, self.maxSize)
				elseif timeAlive > (self.fadeInTime + self.holdTime) then
					local fadeProgress = (timeAlive - self.fadeInTime - self.holdTime) / self.fadeOutTime
					alpha = (1 - fadeProgress)
					currentSize = self.maxSize
				else
					alpha = 1
					currentSize = self.maxSize
				end
				if self.rotateWithLifetime and self.rotationSpeed ~= 0 then
					self.rotation = self.rotation + self.rotationSpeed * FrameTime()
					if self.rotation >= 360 then
						self.rotation = self.rotation - 360
					elseif self.rotation < 0 then
						self.rotation = self.rotation + 360
					end
				end
				if self.rotationOverLife then self.rotation = Lerp(math.Clamp(timeAlive / totalLifetime, 0, 1), self.rotationOverLife[1], self.rotationOverLife[2]) end
				render.SetMaterial(self.material)
				render.DrawQuadEasy(self.pos, self.normal, currentSize, currentSize, Color(self.color.r, self.color.g, self.color.b, self.color.a*alpha), self.rotation)
			end
			function RippleMeta:SetPos(newPos) self.targetPos = newPos end
			function RippleMeta:Remove() self.alive = false end
			function RippleMeta:IsFinished() return not self.alive end
			local function AddRippleTEnt(ent,cfg)
				if not IsValid(ent) then return end
				local effect = AM_CL_CreateWaterRipple(cfg)
				ent.TRipples = ent.TRipples or {}
				if not ent._RippleHook then
					ent._RippleHook = true
					ent:CallOnRemove("WaterRippleCleanup",function(e)
						if not istable(e.TRipples) then return end
						for _,r in pairs(e.TRipples) do r:Remove() end
					end)
				end
				table.insert(ent.TRipples, effect)
				return effect
			end
			local awtr = {"effects/splash1","effects/splash2","effects/splash4"}
			local function LLSEfft01(pos,Asz,TA)
				local emitter = ParticleEmitter(pos)
				if not emitter then return end
				local e1 = emitter:Add(table.Random(awtr),pos)
				if e1 then
					e1:SetVelocity(VectorRand() *5*Asz + Vector(0, 0, math.random(20,30)*Asz))
					e1:SetDieTime(TA and math.Rand(0.2,0.3) or math.Rand(0.3,0.5)) e1:SetGravity(Vector(0, 0, -math.random(80,90)*Asz)) e1:SetRoll(math.Rand(-1,1))
					e1:SetStartAlpha(TA and 120 or 200) e1:SetEndAlpha(0) e1:SetColor(200,255,255)
					e1:SetStartSize(TA and math.random(5,11)*Asz or math.random(10,15)*Asz) e1:SetEndSize(math.random(1,5)*Asz)
				end
				emitter:Finish()
			end
			local atne,btne,bmtw = {
				"fortnite_cherryknot_a1","fortnite_cherryknot_b1","fortnite_cherryknot_c1","fortnite_cherryknot_d1",
				"fortnite_cherryknot_a2","fortnite_cherryknot_b2","fortnite_cherryknot_c2","fortnite_cherryknot_d2"
			},{ "fortnite_cherryknot_a1","fortnite_cherryknot_b1","fortnite_cherryknot_c1","fortnite_cherryknot_d1" }
			,{"actmod/eff_particle/wtr_01","actmod/eff_particle/wtr_02"}
			return {
				SCpt = function(pl,cyc,Fram)
					local model1
					if pl.AAct_mdl1 then model1 = pl.AAct_mdl1 end
					if model1 and isstring(pl.actmodstr) and table.HasValue(atne,string.sub(pl.actmodstr,13)) then
						if model1.tr_1 and model1.step and model1.LayLger and cyc > 0.008 and model1.CutTim == pl.ActMod_CurTRun then
							if model1.tHide and model1.step == 0 then model1.tHide = nil end
							model1:SetCycle( cyc )
							if model1.step == 0 then
								if cyc > 0.05 then
									model1:ManipulateBoneScale( 3, model1.MScleRg )
									if model1.havBx then model1:ManipulateBoneScale( 4, model1.MScleBx ) end
									model1.step = 1
								elseif cyc > 0.014 then
									local a = CycG(cyc,0.014,0.042)
									local aa = CycGHS(cyc,0.014,0.04)
									model1:ManipulateBoneScale( 3, model1.MScleRg*math.max(math.ease.InOutCubic(a)+math.ease.InOutBack(aa)/4,0) )
									if model1.havBx and cyc > 0.032 then
										model1:ManipulateBoneScale( 4, model1.MScleBx*CycG(cyc,0.032,0.05) )
									end
								end
							end
							if cyc > 0.035 then
								local mPos,mAng = A_AM.ActMod:GBonePosAng(model1,"CherryKnot_Ring_LOD0_JNT")
								local QHt = GetConVarNumber("actmod_cl_q_ef")
								if not model1.oneWtr then
									model1.oneWtr = true
									AddRippleTEnt(model1, {
										pos = mPos+Vector(0,0,-3*model1.hupf),
										startSize = math.random(50,60)*model1.hupf ,maxSize = math.random(70,80)*model1.hupf,
										enableDistanceLimit = true ,maxDistance = math.random(1,3)*model1.hupf,
										tetherSpeed = math.random(1,7),
										fadeInTime = math.Rand(0.1,0.2),holdTime = 0,fadeOutTime = math.Rand(0.5,0.7),
										material = table.Random(bmtw),color = Color(0, 100, 120)
									})
								end
								local GPos = mPos+Vector(0,0,-4*model1.hupf)
								if cyc > 0.05 then
									if QHt > 1 and (model1.tiAdrfI or 0) < CurTime() then
										model1.tiAdrfI = CurTime() + math.Rand(0.08,0.13)
										AddRippleTEnt(model1, {
											pos = GPos,
											startSize = math.random(80,90)*model1.hupf ,maxSize = math.random(100,110)*model1.hupf,
											enableDistanceLimit = true ,maxDistance = math.random(1,3)*model1.hupf,
											tetherSpeed = math.random(1,7), rotateWithLifetime = true,randomRotationSpeed = true,
											fadeInTime = math.Rand(0.1,0.3),holdTime = 0,fadeOutTime = math.Rand(0.2,0.5),
											material = "actmod/eff_particle/wtr_08",color = Color(0, 180, 200 ,100)
										})
									end
									if (model1.tiAddrfI or 0) < CurTime() then
										model1.tiAddrfI = CurTime() + (QHt > 2 and math.Rand(0.05,0.1) or math.Rand(0.1,0.2))
										AddRippleTEnt(model1, {
											pos = GPos,
											startSize = math.random(80,90)*model1.hupf ,maxSize = math.random(120,130)*model1.hupf,
											enableDistanceLimit = true ,maxDistance = math.random(1,3)*model1.hupf,
											tetherSpeed = math.random(1,7), rotateWithLifetime = true,randomRotationSpeed = true,
											fadeInTime = math.Rand(0.1,0.3),holdTime = 0,fadeOutTime = math.Rand(0.2,0.4),
											material = "actmod/eff_particle/wtr_07",color = Color(0, 180, 200 ,100)
										})
									end
								end
								local tERps = model1.TRipples
								if istable(tERps) then
									for k,rp in pairs(tERps) do
										if rp.alive then
											if CurTime() - rp.startTime >= rp.fadeInTime + rp.holdTime + rp.fadeOutTime then
												rp.alive = false table.remove(tERps,k) else rp:SetPos(GPos)
											end
										else
											table.remove(tERps,k)
										end
									end
								end
							end
							if cyc > 0.031 and pl:LookupBone("ValveBiped.Bip01_L_Hand") then
								local GLPos,GLAng = A_AM.ActMod:GBonePosAng(pl, "ValveBiped.Bip01_L_Hand")
								local gP,gA
								if model1.A_SubMF then
									gP,gA = LocalToWorld(Vector(3.4*A(model1.GMSc,1.2),-0.8,0.4)*model1.GMSc,Angle(100,-48,25),GLPos, GLAng)
								else
									gP,gA = LocalToWorld(Vector(3.1,-1,0.8)*model1.GMSc,Angle(100,6,84),GLPos, GLAng)
								end
								A_AM.ActMod:APBoneTT(model1, {pos = gP, ang = gA}, "CherryKnot_Boombox_LOD0_JNT")
								if pl:LookupBone("ValveBiped.Bip01_Pelvis") then
									local GLPos,GLAng = A_AM.ActMod:GBonePosAng(pl, "ValveBiped.Bip01_Pelvis")
									local gP
									if model1.A_SubMF then
										gP = LocalToWorld(Vector(0,0,-2-3*A(model1.hupf,2.5)),Angle(),GLPos, GLAng)
									else
										gP = LocalToWorld(Vector(0,0,-2-3*A(model1.hupf,1.5)),Angle(),GLPos, GLAng)
									end
									A_AM.ActMod:APBoneTT(model1, {pos = gP, ang = mAng}, "CherryKnot_Ring_LOD0_JNT",nil,nil,nil,{cyc > 0.046 and 1 or CycG(cyc,0.035,0.046),0})
								end
							end
							if cyc > 0.951 and cyc < 0.960 and model1.Hnmb ~= 2 then
								model1.Hnmb = 2
								if pl:LookupBone("ValveBiped.Bip01_R_Foot") then
									local pPos,pAng = A_AM.ActMod:GBonePosAng(pl, "ValveBiped.Bip01_R_Foot")
									LLSEfft01(pPos+pAng:Forward()*6*model1.GMSc,model1.GMSc)
								end
								if pl:LookupBone("ValveBiped.Bip01_L_Foot") then
									local pPos,pAng = A_AM.ActMod:GBonePosAng(pl, "ValveBiped.Bip01_L_Foot")
									LLSEfft01(pPos+pAng:Forward()*6*model1.GMSc,model1.GMSc)
								end
							elseif cyc > 0.672 and cyc < 0.696 then
								if (model1.taaAarI or 0) < CurTime() and pl:LookupBone("ValveBiped.Bip01_R_Hand") then
									model1.taaAarI = CurTime() + 0.01
									local pPos,pAng = A_AM.ActMod:GBonePosAng(pl, "ValveBiped.Bip01_R_Hand")
									LLSEfft01(pPos+pAng:Forward()*4*model1.GMSc+pAng:Right()*math.random(5,-5)*model1.GMSc,model1.GMSc,true)
								end
							elseif cyc > 0.651 and cyc < 0.66 and model1.Hnmb ~= 1 then
								model1.Hnmb = 1
								if pl:LookupBone("ValveBiped.Bip01_R_Hand") then
									local pPos,pAng = A_AM.ActMod:GBonePosAng(pl, "ValveBiped.Bip01_R_Hand")
									LLSEfft01(pPos+pAng:Forward()*6*model1.GMSc,model1.GMSc)
								end
							elseif cyc < 0.651 or cyc > 0.960 and model1.Hnmb ~= 0 then model1.Hnmb = 0
							end
						end
						if not model1.tr_1 and table.HasValue(atne,string.sub(pl.actmodstr,13)) then
							model1.tr_1 = true model1.tHide = true model1.LayLger = true model1.step = 0
							model1.CutTim = pl.ActMod_CurTRun model1.gstr = pl.actmodstr model1.Hnmb = 0
							local havBx = table.HasValue(btne,string.sub(pl.actmodstr,13))
							model1.havBx = havBx
							model1:ResetSequence( "cherryknot" )
							model1:ManipulateBoneScale( 3, Vector(0,0,0) )
							model1:ManipulateBoneScale( 4, Vector(0,0,0) )
							model1.A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
							local hup,hupf,hupz = A_AM.ActMod:GetSizUpEnt(pl,true,true),1,1
							if hup then
								if A_AM.ActMod:AA_SubMF( pl,"F" ) then
									hupf = 1+math.Round(hup- 58.49235534668,3)*0.018
								else
									hupf = 1+math.Round(hup- 60.565292358398,3)*0.018
								end
							end
							pl.AAct_Tmdl1["size"] = 0.88*hupf
							model1.Tsize = pl.AAct_Tmdl1["size"]*hupf
							model1.hupf = hupf model1.GMSc = hupf*pl:GetModelScale()
							model1.MScleRg = Vector(1,1,1)
							model1.MScleBx = havBx and Vector(1,1,1)*0.87*A(hupf,0.2) or Vector(0,0,0)
						end
					end
				end
				,SDrw = function(pl,cyc,model1)
					if model1 and model1.LayLger and cyc > 0.05 and table.HasValue(atne,string.sub(pl.actmodstr,13)) then
						local tERipples = model1.TRipples
						if istable(tERipples) then
							for k,rp in pairs(tERipples) do
								if rp:IsFinished() then table.remove(tERipples,k) else rp:Render() end
							end
						end
					end
				end
			}
		end
	}
	
	,["fortnite_cherryknot_a2"] = {
		Config = { Anim = "amod_fortnite_cherryknot_1",Name = "Lazy Lounger (A)",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "7.1" } ,Coop = { Sync = true,MaxDist = 350,YourAnim = "fortnite_cherryknot_a2" ,OtherAnim = "fortnite_cherryknot_a2" } ,Scrpt = function() return { SCpt = "amod_cumact_fortnite_cherryknot_a1",SDrw = "amod_cumact_fortnite_cherryknot_a1" } end
		,Camera = { Transition = 1.4 } ,Custom = { Anim = { Time2 = 12.46667,Cycle = 0.1688888888888889 },Sound = { Time1 = 50.53667,Time2 = 49.86667 } } ,Movement = { Type = 3 ,Speed = 56 } ,Models = { [1] = { Model = "models/actmod/prop/CherryKnot_Gadget.mdl" } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_1.ogg" ,Delay = 0.03 },StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" ,Delay = 0.67 },Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" } }
	}
	
	,["fortnite_cherryknot_b1"] = {
		Config = { Anim = "amod_fortnite_cherryknot_2",Name = "Lazy Lounger (B+P)",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "7.1" } ,Coop = { Sync = true,MaxDist = 350,YourAnim = "fortnite_cherryknot_b1" ,OtherAnim = "fortnite_cherryknot_b2" } ,Scrpt = function() return { SCpt = "amod_cumact_fortnite_cherryknot_a1",SDrw = "amod_cumact_fortnite_cherryknot_a1" } end
		,Camera = { Transition = 1.4 } ,Custom = { Anim = { Time2 = 12.46667,Cycle = 0.1688888888888889 },Sound = { Time1 = 50.53667,Time2 = 49.86667 } } ,Movement = { Type = 3 ,Speed = 56 } ,Models = { [1] = { Model = "models/actmod/prop/CherryKnot_Gadget.mdl" ,Skin = 1 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_1.ogg" ,Delay = 0.03 },StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" ,Delay = 0.67 },Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" } }
	}
	,["fortnite_cherryknot_b2"] = {
		Config = { Anim = "amod_fortnite_cherryknot_1",Name = "Lazy Lounger (B)",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "7.1" } ,Coop = { Sync = true,MaxDist = 350,YourAnim = "fortnite_cherryknot_b2" ,OtherAnim = "fortnite_cherryknot_b2" } ,Scrpt = function() return { SCpt = "amod_cumact_fortnite_cherryknot_a1",SDrw = "amod_cumact_fortnite_cherryknot_a1" } end
		,Camera = { Transition = 1.4 } ,Custom = { Anim = { Time2 = 12.46667,Cycle = 0.1688888888888889 },Sound = { Time1 = 50.53667,Time2 = 49.86667 } } ,Movement = { Type = 3 ,Speed = 56 } ,Models = { [1] = { Model = "models/actmod/prop/CherryKnot_Gadget.mdl" ,Skin = 1 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_1.ogg" ,Delay = 0.03 },StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" ,Delay = 0.67 },Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" } }
	}
	
	,["fortnite_cherryknot_c1"] = {
		Config = { Anim = "amod_fortnite_cherryknot_2",Name = "Lazy Lounger (C+P)",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "7.1" } ,Coop = { Sync = true,MaxDist = 350,YourAnim = "fortnite_cherryknot_c1" ,OtherAnim = "fortnite_cherryknot_c2" } ,Scrpt = function() return { SCpt = "amod_cumact_fortnite_cherryknot_a1",SDrw = "amod_cumact_fortnite_cherryknot_a1" } end
		,Camera = { Transition = 1.4 } ,Custom = { Anim = { Time2 = 12.46667,Cycle = 0.1688888888888889 },Sound = { Time1 = 50.53667,Time2 = 49.86667 } } ,Movement = { Type = 3 ,Speed = 56 } ,Models = { [1] = { Model = "models/actmod/prop/CherryKnot_Gadget.mdl" ,Skin = 2 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_1.ogg" ,Delay = 0.03 },StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" ,Delay = 0.67 },Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" } }
	}
	,["fortnite_cherryknot_c2"] = {
		Config = { Anim = "amod_fortnite_cherryknot_1",Name = "Lazy Lounger (C)",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "7.1" } ,Coop = { Sync = true,MaxDist = 350,YourAnim = "fortnite_cherryknot_c2" ,OtherAnim = "fortnite_cherryknot_c2" } ,Scrpt = function() return { SCpt = "amod_cumact_fortnite_cherryknot_a1",SDrw = "amod_cumact_fortnite_cherryknot_a1" } end
		,Camera = { Transition = 1.4 } ,Custom = { Anim = { Time2 = 12.46667,Cycle = 0.1688888888888889 },Sound = { Time1 = 50.53667,Time2 = 49.86667 } } ,Movement = { Type = 3 ,Speed = 56 } ,Models = { [1] = { Model = "models/actmod/prop/CherryKnot_Gadget.mdl" ,Skin = 2 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_1.ogg" ,Delay = 0.03 },StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" ,Delay = 0.67 },Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" } }
	}
	
	,["fortnite_cherryknot_d1"] = {
		Config = { Anim = "amod_fortnite_cherryknot_2",Name = "Lazy Lounger (D+P)",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "7.1" } ,Coop = { Sync = true,MaxDist = 350,YourAnim = "fortnite_cherryknot_d1" ,OtherAnim = "fortnite_cherryknot_d2" } ,Scrpt = function() return { SCpt = "amod_cumact_fortnite_cherryknot_a1",SDrw = "amod_cumact_fortnite_cherryknot_a1" } end
		,Camera = { Transition = 1.4 } ,Custom = { Anim = { Time2 = 12.46667,Cycle = 0.1688888888888889 },Sound = { Time1 = 50.53667,Time2 = 49.86667 } } ,Movement = { Type = 3 ,Speed = 56 } ,Models = { [1] = { Model = "models/actmod/prop/CherryKnot_Gadget.mdl" ,Skin = 3 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_1.ogg" ,Delay = 0.03 },StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" ,Delay = 0.67 },Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" } }
	}
	,["fortnite_cherryknot_d2"] = {
		Config = { Anim = "amod_fortnite_cherryknot_1",Name = "Lazy Lounger (D)",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "7.1" } ,Coop = { Sync = true,MaxDist = 350,YourAnim = "fortnite_cherryknot_d2" ,OtherAnim = "fortnite_cherryknot_d2" } ,Scrpt = function() return { SCpt = "amod_cumact_fortnite_cherryknot_a1",SDrw = "amod_cumact_fortnite_cherryknot_a1" } end
		,Camera = { Transition = 1.4 } ,Custom = { Anim = { Time2 = 12.46667,Cycle = 0.1688888888888889 },Sound = { Time1 = 50.53667,Time2 = 49.86667 } } ,Movement = { Type = 3 ,Speed = 56 } ,Models = { [1] = { Model = "models/actmod/prop/CherryKnot_Gadget.mdl" ,Skin = 3 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_1.ogg" ,Delay = 0.03 },StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" ,Delay = 0.67 },Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CherryKnot_2.ogg" } }
	}
	
}