// Fusion! Hah!! (commission)
// 2026-AM4|11197|148635
return{
	["fortnite_meticulous"] = {
		Config = { Anim = "amod_fortnite_meticulous_1",Name = "Fusion! Hah!!",Duration = 3.16667,isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "2.1" } ,Camera = { Transition = 1 }
		,Custom = { Anim = { Time2 = 3.16667,Cycle = 0.0871934604904632 } }
		,Coop = {
			Sync = true,ReplaySelf = true,Ang_OToY = true,MaxPlayers = 1,NoRepetition = true,SoundOther = true
			,YourAnim = "fortnite_meticulous_1" ,OtherAnim = "fortnite_meticulous_2"
			,TryFixPos = {
				["+Right"] = true,["*add"] = -1.18,["+add"] = 1,["Cycl"] = 0.7493188010899183
				,["Ani1"] = "fortnite_meticulous_1" ,["Ani2"] = "fortnite_meticulous_2"
				,["Bip1"] = "ValveBiped.Bip01_L_Hand" ,["Bip2"] = "ValveBiped.Bip01_R_Hand"
			}
		}
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Meticulous_1.mp3" ,Delay = 0.02 } }
	}
	,["fortnite_meticulous_1"] = {
		Config = { Anim = "amod_fortnite_meticulous_1" ,Name = "Fusion! Hah!! <Follow>" ,class = -1,CList = {Title="ActMod Commission Hub",OFtn=true},Duration = 7.2,Cycle = 0.3487738419618529,DontAllowAng=true }
		,Camera = { Transition = 2 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Meticulous_2.mp3" ,Delay = 1.15 } }
		,Scrpt = function()
			if SERVER then return end
			local function CycG(c,a,b) return math.Clamp(math.TimeFraction(a, b, c), 0, 1) end
			local function aDist(pl,taa) if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then return true end return false end
			local m_e1,m_e2,m_e3,m_e3t,m_e4 = Material("actmod/eff_particle/eFlare01","noclamp smooth"),Material("actmod/eff_particle/eFlare02"),Material("actmod/eff_particle/eFlare04"),Material("actmod/eff_particle/eFlare04t"),Material("actmod/eff_particle/eFlare03")
			local m_e5,m_e6,m_e7,m_e8 = Material("actmod/eff_particle/eray01","noclamp smooth"),Material("actmod/eff_particle/eray02"),Material("actmod/eff_particle/eray03"),Material("actmod/eff_particle/eray04")
			local SavedAngles = {}
			local function DrawSingleHalo(mat,a, offset, baseSize, pos, pl, Asz ,aColor)
				local animSpeed = 6
				local globalTime = CurTime() * animSpeed - offset
				local imageTime  = globalTime % 1
				if imageTime < 0 then imageTime = imageTime + 1 end -- ضمان بقاء الوقت موجباً
				local currentCycle = math.floor(globalTime)
				if not SavedAngles[offset] or SavedAngles[offset].cycle != currentCycle then
					SavedAngles[offset] = { angle = math.random(0, 360),cycle = currentCycle }
				end
				local alpha = 0
				local sizeMult = 1.0
				local midPoint = 0.4 
				if imageTime < midPoint then
					local progress = imageTime / midPoint
					alpha = progress * 255
					sizeMult = 0.4 + (0.6 * progress)
				else
					local progress = (imageTime - midPoint) / (1 - midPoint)
					alpha = (1 - progress) * 255
					sizeMult = 1.0 + (0.6 * progress)
				end
				if alpha > 0 and mat and not mat:IsError() then
					local finalSize = (baseSize * Asz) * sizeMult
					local normal = pl:GetForward()
					local vtr = Vector(0,0,30*Asz)
					local renderPos = pos - pl:GetForward() * 6 * Asz + vtr
					local renderAngle = 180 + SavedAngles[offset].angle
					render.SetMaterial(mat)
					render.DrawQuadEasy(renderPos, normal, finalSize, finalSize, aColor or Color(255, 255, 255, alpha*(1-a)), renderAngle)
				end
			end
			
			local halos = {
				{ mat = m_e1, offset = 0.0 },
				{ mat = m_e2, offset = 0.2 },
				{ mat = m_e3t, offset = 0.4, color = Color(0,0,0) },
				{ mat = m_e1, offset = 0.6 },
				{ mat = m_e2, offset = 0.8 },
				{ mat = m_e3, offset = 0.8 }
			}
			local BeamConfig = {
				AnimSpeed = 6,
				BaseWidth = 30,
				BaseHeight = 50,
				StartWidthPct = 0.9,
				EndWidthPct = 0.3,
				StartHeightPct = 0.2,
				EndHeightPct = 2.1,
			}
			local beams = {
				{ mat = m_e5, offset = 0.0 },
				{ mat = m_e6, offset = 0.1 },
				{ mat = m_e7, offset = 0.4 },
				{ mat = m_e8, offset = 0.5 }
			}
			return {
				SDrw = function(pl,cyc)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")/2) then return end
					-- if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.trMEnrg and pl.actmod_cl_TmpDtEf.Tctive and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.reffToPP and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.ttimr then
						if cyc > 0.691 and cyc < 0.81 then
							local pos,rng,Asz,QHt = pl:GetPos(),pl:GetRenderAngles(),pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
							local a = CycG(cyc,0.691,0.81)
							if a > 0 then
								pos = pos - (rng:Forward()*20*Asz) - (rng:Right()*26*Asz) + Vector(0, 0, 40 * Asz)
								-- DrawSingleHalo(m_e1,a, 0.0, 70, pos, pl, Asz)
								-- DrawSingleHalo(m_e2,a, 0.2, 70, pos, pl, Asz)
								-- DrawSingleHalo(m_e3,a, 0.4, 70, pos, pl, Asz)
								-- DrawSingleHalo(m_e1,a, 0.6, 70, pos, pl, Asz)
								-- DrawSingleHalo(m_e2,a, 0.8, 70, pos, pl, Asz)
								-- DrawSingleHalo(m_e3,a, 0.8, 70, pos, pl, Asz)

								local q1 = (120-30*a)*Asz
								-- local vtr = Vector(0, 0, 40 * Asz)
								render.SetMaterial(m_e1)
								render.DrawQuadEasy(pos, rng:Forward(), q1,q1, Color( 255, 200, 100, 150*(1-a) ), math.random(360))
								-- render.DrawSprite(pos,q1-20*a,q1-20*a, Color(255, 200, 100,150*a))
								-- if true then return end
								
								for i, hlo in ipairs(halos) do
									local globalTime = CurTime() * 6 - hlo.offset
									local imageTime = globalTime % 1
									if imageTime < 0 then imageTime = imageTime + 1 end
									local currentCycle = math.floor(globalTime)
									if hlo.savedCycle != currentCycle then
										hlo.savedAngle = math.random(0, 360)
										hlo.savedCycle = currentCycle
									end
									local alpha = 0
									local sizeMult = 1.0
									local midPoint = 0.4 
									if imageTime < midPoint then
										local progress = imageTime / midPoint
										alpha = progress * 255
										sizeMult = 0.4 + (0.6 * progress)
									else
										local progress = (imageTime - midPoint) / (1 - midPoint)
										alpha = (1 - progress) * 255
										sizeMult = 1.0 + (0.6 * progress)
									end
									if alpha > 0 and hlo.mat and not hlo.mat:IsError() then
										local finalSize = (80 * Asz) * sizeMult
										local renderAngle = 180 + (hlo.savedAngle or 0)
										local bColor = hlo.color or Color(255, 255, 255)
										local fColor = Color(bColor.r, bColor.g, bColor.b, alpha * (1 - a))
										render.SetMaterial(hlo.mat)
										render.DrawQuadEasy( pos, rng:Forward(), finalSize, finalSize, fColor, renderAngle )
									end
								end
								
								local animSpeed  = BeamConfig.AnimSpeed
								local baseWidth  = BeamConfig.BaseWidth
								local baseHeight = BeamConfig.BaseHeight
								for i, beam in ipairs(beams) do
									local globalTime = CurTime() * animSpeed - beam.offset
									local imageTime  = globalTime % 1
									if imageTime < 0 then imageTime = imageTime + 1 end
									local currentCycle = math.floor(globalTime)
									if beam.savedCycle != currentCycle then
										beam.savedAngle = math.random(0, 360)
										beam.savedCycle = currentCycle
									end
									local alpha = 0
									local widthMult = 1.0
									local heightMult = 1.0
									local midPoint = 0.4 
									if imageTime < midPoint then
										local progress = imageTime / midPoint
										alpha = progress * 255
										widthMult  = BeamConfig.StartWidthPct  + ((1.0 - BeamConfig.StartWidthPct) * progress)
										heightMult = BeamConfig.StartHeightPct + ((1.0 - BeamConfig.StartHeightPct) * progress)
									else
										local progress = (imageTime - midPoint) / (1 - midPoint)
										alpha = (1 - progress) * 255
										widthMult  = 1.0 + ((BeamConfig.EndWidthPct - 1.0) * progress)
										heightMult = 1.0 + ((BeamConfig.EndHeightPct - 1.0) * progress)
									end
									
									if alpha > 0 and beam.mat and not beam.mat:IsError() then
										local finalWidth  = (baseWidth * Asz) * widthMult
										local finalHeight = (baseHeight * Asz) * heightMult
										local randAngle = beam.savedAngle or 0
										local rad = math.rad(randAngle)
										local upVector = rng:Up() * math.cos(rad) + rng:Right() * math.sin(rad)
										local offsetLength = (finalHeight / 2) + (10 * Asz)
										local bColor = beam.color or Color(255, 255, 255)
										local fColor = Color(bColor.r, bColor.g, bColor.b, alpha * (1 - a))
										render.SetMaterial(beam.mat)
										render.DrawQuadEasy( pos + upVector * offsetLength, rng:Forward(), finalWidth, finalHeight,  fColor, 180 + randAngle )
									end
								end
								
								local q1 = (50-40*a)*Asz
								local br = pl:LookupBone("ValveBiped.Bip01_R_Hand") and "ValveBiped.Bip01_R_Hand" or false
								if br then
									local poS,ang = A_AM.ActMod:GBonePosAng(pl,br)
									poS = poS+ang:Forward()*7*Asz-ang:Right()*1*Asz-ang:Up()*2*Asz
									render.SetMaterial(m_e4)
									-- render.DrawQuadEasy(pos + Vector(0,0,0.2*Asz ), pl:GetUp(), q1,q1, Color( 255, 255, 50, 255*(1-a) ), 0)
									render.DrawSprite(poS,q1,q1, Color(255, 240, 140,255*(1-a)))
								end
								local bl = pl:LookupBone("ValveBiped.Bip01_L_Hand") and "ValveBiped.Bip01_L_Hand" or false
								if bl then
									local poS,ang = A_AM.ActMod:GBonePosAng(pl,bl)
									poS = poS+ang:Forward()*7*Asz-ang:Right()*1*Asz+ang:Up()*1*Asz
									render.SetMaterial(m_e4)
									render.DrawSprite(poS,q1,q1, Color(255, 240, 140,255*(1-a)))
								end
							end
						end
					elseif pl.actmodstr == "amod_cumact_fortnite_meticulous_1" and (not pl.actmod_cl_TmpDtEf or isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun < CurTime()-0.2) and cyc > 0.65 and cyc < 0.85 then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,rnum = 0 ,reffToPP = true ,TTbl = {} ,ttimr = CurTime()+0.6 ,A_hupf = hupf,A_SubMF = A_SubMF }
					end
				end
			}
		end
	}
	,["fortnite_meticulous_2"] = {
		Config = { Anim = "amod_fortnite_meticulous_2" ,Name = "Fusion! Hah!! <Follow>" ,class = -1,Duration = 7.2,Cycle = 0.3487738419618529,DontAllowAng=true }
		,Camera = { Transition = 2 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Meticulous_2.mp3" ,Delay = 1.15 } }
	}
	
}