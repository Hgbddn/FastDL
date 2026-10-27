// Mine (commission)
// 2026-AM4|12342|148635
return{
	["fortnite_melody"] = {
		Config = { Anim = "amod_fortnite_melody" ,Name = "Mine" ,class = 1,isNew = true,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "3.1" } ,Camera = { Follow = false,Transition = 1.6 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.76667 ,Cycle = 0.2579617834394904 } ,Sound = { Time1 = 18.23334 ,Time2 = 15.53334 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Melody_1.mp3" ,Delay = 0.01 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Melody_2.mp3" ,Delay = 2.7 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Melody_2.mp3" }
		}
		,Scrpt = function()
			A_AM.ActMod.AM_ActTEfts_KissFX = A_AM.ActMod.AM_ActTEfts_KissFX or {}
			local function aDist(pl,taa)
				if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then return true end
				return false
			end
			local KissFX = A_AM.ActMod.AM_ActTEfts_KissFX
			KissFX.Active = KissFX.Active or {}
			local KISS_MAT,KISSG_MAT,vector_origin = Material("actmod/eff_particle/fx_kiss01", "smooth mips"),Material("actmod/eff_particle/fx_kissglow01", "smooth mips"),Vector(0,0,0)
			local function clamp01(x) return math.Clamp(x, 0, 1) end
			local function easeInOutQuad(t) t = clamp01(t) if t < 0.5 then return 2 * t * t end return 1 - math.pow(-2 * t + 2, 2) / 2 end
			local function lerp(a, b, t) return a + (b - a) * t end
			local function makeColor(col, a) return Color(col.r, col.g, col.b, a) end
			local FX_MT = {} FX_MT.__index = FX_MT
			function FX_MT:SetEntity(ent) self.ent = ent self.pos = nil end
			function FX_MT:SetPosition(vec) self.pos = vec self.ent = nil end
			function FX_MT:SetOffset(vec) self.offset = vec or vector_origin end
			function FX_MT:SetLoop(state) self.loop = tobool(state) end
			function FX_MT:SetVisible(state) self.visible = tobool(state) end
			function FX_MT:SetColor(col) self.color = col or Color(255, 80, 120, 255) end
			function FX_MT:SetScale(scale) self.scale = math.max(0.01, tonumber(scale) or 1) end
			function FX_MT:Stop() self.dead = true end
			local function getBasePos(fx,ps)
				if IsValid(fx.ent) then return LerpVector(math.ease.OutQuart(ps),fx.offset,fx.Vfow) end
				return fx.pos or vector_origin
			end
			local function drawEffect(pl,fx)
				if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")/1.5) or not fx.visible then return end
				local now = CurTime()
				local elapsed,total = now - fx.startTime,fx.fadeIn + fx.hold + fx.fadeOut
				if total <= 0 then total = 0.001 end
				local localTime = elapsed
				if fx.loop then localTime = elapsed % total elseif elapsed > total then fx.dead = true return end
				local alpha = 1
				if localTime < fx.fadeIn then
					alpha = localTime / math.max(fx.fadeIn, 0.001)
				elseif localTime > fx.fadeIn + fx.hold then
					alpha = 1 - ((localTime - fx.fadeIn - fx.hold) / math.max(fx.fadeOut, 0.001))
				end
				alpha = math.Clamp(alpha, 0, 1)
				local progress = localTime / total
				progress = clamp01(progress)
				local basePos = getBasePos(fx,progress)
				local e = easeInOutQuad(progress)
				local w,h = lerp(fx.minWidth, fx.maxWidth, e) * fx.scale,lerp(fx.minHeight, fx.maxHeight, e) * fx.scale
				local col,width,height = makeColor(fx.color, math.floor(fx.color.a * alpha)),w,h * 0.6 + math.sin(progress * math.pi) * 40 * fx.scale
				local glow = math.floor(col.a * 0.20)
				if glow > 0 then
					render.SetMaterial(KISSG_MAT)
					render.DrawSprite(basePos, width * 1.15 +7*progress, height * 1.05 +7*progress, Color(col.r, col.g, col.b, math.max(glow*(1-progress*1.3),0)))
				end
				if progress > 0.3 and not fx.Seff then
					fx.Seff = true
					local Asz = (0.8+fx.scale)*fx.Asz
					local emitter = ParticleEmitter(basePos)
					if emitter then
						for i = 0, math.random(1,2) do
							local p = emitter:Add("actmod/eff_particle/p_glow_01", basePos + VectorRand() * 0.5*Asz)
							if not p then break end
							p:SetVelocity(VectorRand() * math.random(50,90))
							p:SetDieTime(math.Rand(0.1,0.8)) p:SetStartAlpha(255) p:SetEndAlpha(0) p:SetColor(255, 150, 40)
							p:SetStartSize(math.Rand(0.5,2)*Asz) p:SetEndSize(math.Rand(0,2)*Asz)
							p:SetAirResistance(math.Rand(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,math.Rand(60, 80)))
							p:SetStartLength(math.Rand(0.5,3)*Asz) p:SetEndLength(math.Rand(0.1,2)*Asz)
						end
						for i = 0, math.random(1,2) do
							local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_01", basePos + VectorRand() * 0.5*Asz)
							if not p then break end
							p:SetVelocity(VectorRand() * math.random(30,60)*Asz)
							p:SetDieTime(math.Rand(0.4,0.8)) p:SetStartAlpha(255) p:SetEndAlpha(0) p:SetColor(255, 60, 20)
							p:SetStartSize(math.Rand(0.5,1)*Asz) p:SetEndSize(math.Rand(0,1)*Asz)
							p:SetAirResistance(math.Rand(50,150)*(1+(Asz*1.2))) p:SetRoll( math.Rand(-1,1) ) p:SetRollDelta( math.random(10,-10) )
						end
						emitter:Finish()
					end
				end
				render.SetMaterial(KISS_MAT)
				render.DrawSprite(basePos, width, height, col)
			end
			hook.Add("Think", "ActMdKissFX.Render", function()
				if not KissFX.Active then return end
				for i = #KissFX.Active, 1, -1 do
					local fx = KissFX.Active[i]
					if not fx or fx.dead then table.remove(KissFX.Active, i) end
				end
			end)
			function KissFX.Start(opts)
				opts = opts or {}
				local fx = setmetatable({}, FX_MT)
				fx.startTime = CurTime()
				fx.ent = opts.ent
				fx.pos = opts.pos or opts.vector
				fx.offset = opts.offset or vector_origin
				fx.Vfow = opts.Vfow or opts.offset or vector_origin
				fx.follow = opts.follow ~= false
				fx.loop = opts.loop or false
				fx.visible = opts.visible ~= false
				fx.dead = false fx.melody = true fx.Asz = opts.Asz or 1
				fx.fadeIn = tonumber(opts.fadeIn) or 0.12
				fx.hold = tonumber(opts.hold) or 0.55
				fx.fadeOut = tonumber(opts.fadeOut) or 0.35
				fx.minWidth = tonumber(opts.minWidth) or 6
				fx.maxWidth = tonumber(opts.maxWidth) or 46
				fx.minHeight = tonumber(opts.minHeight) or 5
				fx.maxHeight = tonumber(opts.maxHeight) or 38
				fx.scale = tonumber(opts.scale) or 1
				fx.posJitter = tonumber(opts.posJitter) or 0
				fx.seed = math.Rand(0, 1000)
				fx.color = opts.color or Color(255, 255, 255, 255)
				table.insert(KissFX.Active, fx)
				return fx
			end
			function KissFX.StopAll() for i = #KissFX.Active, 1, -1 do KissFX.Active[i].dead = true end end
			return {
				SCpt = function(pl,cyc)
					if istable(pl.actmod_cl_TmpDtEf) and isstring(pl.actmod_cl_TmpDtEf.strr) and pl.actmod_cl_TmpDtEf.strr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
						if not pl.actmod_cl_TmpDtEf.cSSnd and cyc > 0.11 and cyc < 0.2 then
							pl.actmod_cl_TmpDtEf.cSSnd = true
							A_AM.ActMod:C_StopSond(pl,"3") A_AM.ActMod:A_aSond(pl,"actmod/i_act/am4/fortnite/Emote_Melody_3.mp3","3",71,"0")
						end
						if pl.actmod_cl_TmpDtEf.cEfF == 0 and cyc > 0.14 then
							pl.actmod_cl_TmpDtEf.cEfF = 1
							local Asz,Asf,pos,gos,ang = pl:GetModelScale()*pl.actmod_cl_TmpDtEf.A_hupf,pl.actmod_cl_TmpDtEf.A_hfov,Vector(),Vector(),Angle()
							local boneID = pl:LookupBone("ValveBiped.Bip01_Head1")
							if boneID then
								local bonePos = pl:GetBonePosition(boneID)
								if bonePos then
									local PAng = pl:GetRenderAngles()
									pos = bonePos + PAng:Forward()*5*Asf + pl:GetUp()*1*Asf
									gos = pos + PAng:Forward()*20*Asf + pl:GetUp() * 2*Asf
								end
							end
							pl.actmod_cl_TmpDtEf.Tfx[1] = KissFX.Start({ ent = pl,offset = pos,Asz = Asz,Vfow = gos,follow = true,scale = 0.3*Asz,fadeIn = 0.3,hold = 0.4,fadeOut = 0.01 ,minWidth = 0,maxWidth = 50,minHeight = 22,maxHeight = 6 })
						end
						if pl.actmod_cl_TmpDtEf.cEfF ~= 1 and cyc > 0.2 and cyc < 0.24 then pl.actmod_cl_TmpDtEf.cEfF = 1 pl.actmod_cl_TmpDtEf.nEfF = 0 end
						if cyc > 0.37 and pl.actmod_cl_TmpDtEf.Tfx[1] and pl.actmod_cl_TmpDtEf.Tfx[1].melody then
							pl.actmod_cl_TmpDtEf.Tfx[1]:Stop() -- pl.actmod_cl_TmpDtEf.Tfx[1].dead = true
							pl.actmod_cl_TmpDtEf.Tfx[1] = nil
						end
						if cyc > 0.257 and cyc < 0.34 then
							if pl.actmod_cl_TmpDtEf.cEfF == 1 then pl.actmod_cl_TmpDtEf.cEfF = 2 pl.actmod_cl_TmpDtEf.nEfF = 0 end
							for i = 2,20 do if pl.actmod_cl_TmpDtEf.Tfx[i] and pl.actmod_cl_TmpDtEf.Tfx[i].melody then
								pl.actmod_cl_TmpDtEf.Tfx[i]:Stop() pl.actmod_cl_TmpDtEf.Tfx[i] = nil
							end end
						end
						if pl.actmod_cl_TmpDtEf.cEfF >= 2 and pl.actmod_cl_TmpDtEf.cEfF < 4 and cyc > 0.807 and cyc < 0.92 then
							if cyc > 0.901 then pl.actmod_cl_TmpDtEf.cEfF = 4 end
							if pl.actmod_cl_TmpDtEf.cEfF == 2 then
								pl.actmod_cl_TmpDtEf.cEfF = 3 pl.actmod_cl_TmpDtEf.stCurT = CurTime() + 0.2 pl.actmod_cl_TmpDtEf.nEfF = 0
								A_AM.ActMod:C_StopSond(pl,"3") A_AM.ActMod:A_aSond(pl,"actmod/i_act/am4/fortnite/Emote_Melody_4.mp3","3",70,"0")
							end
							if pl.actmod_cl_TmpDtEf.stCurT < CurTime() then
								pl.actmod_cl_TmpDtEf.nEfF = pl.actmod_cl_TmpDtEf.nEfF + 1
								pl.actmod_cl_TmpDtEf.stCurT = CurTime() + 0.14
								local Asz,Asf,pos,gos,ang = pl:GetModelScale()*pl.actmod_cl_TmpDtEf.A_hupf,pl.actmod_cl_TmpDtEf.A_hfov,Vector(),Vector(),Angle()
								local boneID,bonID = pl:LookupBone("ValveBiped.Bip01_Head1"),pl:LookupBone("ValveBiped.Bip01_R_Hand")
								local PAng = pl:GetRenderAngles()
								if boneID and bonID then
									local bonePos = pl:GetBonePosition(boneID)
									local bonPos = pl:GetBonePosition(bonID)
									if bonePos and bonPos then
										local boneAng = (bonPos - bonePos):Angle()
										boneAng.p = boneAng.p*0.2
										boneAng = boneAng + Angle(0,-30+(pl.actmod_cl_TmpDtEf.nEfF == 1 and 20 or 0),0)
										pos = bonePos - boneAng:Forward()*1.5*Asf + boneAng:Up()*4*Asf
										gos = pos + boneAng:Forward()*(20+pl.actmod_cl_TmpDtEf.nEfF)*Asf + boneAng:Up()*math.Round(8,-3) + PAng:Forward() * 2*Asf
									end
								elseif boneID then
									local bonePos, boneAng = pl:GetBonePosition(boneID)
									if bonePos then
										boneAng = boneAng + Angle(0,-30-pl.actmod_cl_TmpDtEf.nEfF*3,0)
										pos = bonePos + boneAng:Right()*3*Asf + boneAng:Forward()
										gos = pos + boneAng:Right()*(20+pl.actmod_cl_TmpDtEf.nEfF)*Asf + PAng:Forward() * 2*Asf
									end
								end
								pl.actmod_cl_TmpDtEf.Tfx[1+pl.actmod_cl_TmpDtEf.nEfF] = KissFX.Start({ ent = pl,offset = pos,Asz = Asz,Vfow = gos,follow = true,scale = math.Rand(0.11,0.16)*Asz,fadeIn = 0.3,hold = math.Rand(0.2,0.4),fadeOut = 0.01 ,minWidth = 2,maxWidth = 50,minHeight = 22,maxHeight = 2 })
							end
						end
						if pl.actmod_cl_TmpDtEf.cEfF > 1 and cyc > 0.92 then pl.actmod_cl_TmpDtEf.cEfF = 1 pl.actmod_cl_TmpDtEf.nEfF = 0 end
					elseif pl.actmodstr == "amod_cumact_fortnite_melody" then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hfo,hupf,hfov = A_AM.ActMod:GetSizUpEnt(pl,true,true),A_AM.ActMod:CBoneAniDistance( pl ,"amod_fortnite_melody",0.852 ,"ValveBiped.Bip01_R_Hand","ValveBiped.Bip01_Head1" ),1,1
						if A_SubMF then
							if hup then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 end
							hfov = 1+math.Round(hfo- 12.981068611145,3)*0.05
						else
							if hup then hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end
							hfov = 1+math.Round(hfo- 14.015196800232,3)*0.05
						end
						pl.actmod_cl_TmpDtEf = { strr = pl.actmodstr ,cEfF = 0 ,nEfF = 0 ,CurTRun = pl.ActMod_CurTRun ,A_hupf = hupf ,A_hfov = hfov ,A_SubMF = A_SubMF ,Tfx = {} }
					end
				end
				,SDrw = function(pl,cyc,Fram)
					if KissFX.Active and istable(pl.actmod_cl_TmpDtEf) and isstring(pl.actmod_cl_TmpDtEf.strr) and pl.actmod_cl_TmpDtEf.strr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
						for i = #KissFX.Active, 1, -1 do
							local fx = KissFX.Active[i]
							if not fx or fx.dead then table.remove(KissFX.Active, i) else drawEffect(pl,fx) end
						end
					end
				end
			}
		end
	}
}