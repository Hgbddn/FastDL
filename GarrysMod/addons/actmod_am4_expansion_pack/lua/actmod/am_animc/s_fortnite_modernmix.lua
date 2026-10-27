// Chandelier (commission)
// 2026-AM4|16015|148635
return{
	["fortnite_modernmix"] = {
		Config = { Anim = "amod_fortnite_modernmix",Name = "Chandelier",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake_400",Version = "1.25" } ,Camera = { Transition = 1.3 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 11.03333,Cycle = 0.043352601156069},Sound = {Time1 = 44.63332,Time2 = 44.13332 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_ModernMix.mp3" ,Delay = 0.5 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_ModernMix.mp3" }
		}
		,Scrpt = function()
			return {
				SDrw = function(pl,cyc,Fram)
					if istable(pl.actmod_cl_TmpDtEf) and isnumber(pl.actmod_cl_TmpDtEf.amv) and isstring(pl.actmod_cl_TmpDtEf.Astr) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
						if pl.actmod_cl_TmpDtEf.amv > 0 then
							if pl.actmod_cl_TmpDtEf.mat_1 and pl.actmod_cl_TmpDtEf.mat_2 and (pl == LocalPlayer() or LocalPlayer():trueShowMld(pl)) then
								local Asz = pl:GetModelScale()
								if pl.actmod_cl_TmpDtEf.bone_r == nil or pl.actmod_cl_TmpDtEf.bone_l == nil or pl.actmod_cl_TmpDtEf.bone_s4 == nil then
									pl.actmod_cl_TmpDtEf.bone_r = pl:LookupBone("ValveBiped.Bip01_R_Hand")
									pl.actmod_cl_TmpDtEf.bone_l = pl:LookupBone("ValveBiped.Bip01_L_Hand")
									pl.actmod_cl_TmpDtEf.bone_s4 = pl:LookupBone("ValveBiped.Bip01_Spine4")
								end
								if pl.actmod_cl_TmpDtEf.Damv == 1 and pl.actmod_cl_TmpDtEf.DTim_1 then
									local timov = math.Clamp( (CurTime() - pl.actmod_cl_TmpDtEf.DTim_1)/0.6 ,0,1 )
									if timov >= 1 then
										pl.actmod_cl_TmpDtEf.Damv = 2
										pl.actmod_cl_TmpDtEf.Dalp_1 = 1
										pl.actmod_cl_TmpDtEf.DTim_1 = nil
									else
										pl.actmod_cl_TmpDtEf.Dalp_1 = timov
									end
								elseif pl.actmod_cl_TmpDtEf.Damv == 2 and pl.actmod_cl_TmpDtEf.DTim_2 then
									local timov = math.Clamp( (CurTime() - pl.actmod_cl_TmpDtEf.DTim_2)/0.2 ,0,1 )
									if timov >= 1 then
										pl.actmod_cl_TmpDtEf.Damv = 3
										pl.actmod_cl_TmpDtEf.Dalp_2 = 1
										pl.actmod_cl_TmpDtEf.Dalp_2_z = 1
										pl.actmod_cl_TmpDtEf.DTim_2 = CurTime() + (pl.actmod_cl_TmpDtEf.amv > 4 and 0.01 or 0.1)
									else
										pl.actmod_cl_TmpDtEf.Dalp_2 = timov
										pl.actmod_cl_TmpDtEf.Dalp_2_z = timov
									end
								elseif pl.actmod_cl_TmpDtEf.Damv == 3 and pl.actmod_cl_TmpDtEf.DTim_2 then
									local timov = math.Clamp( (CurTime() - pl.actmod_cl_TmpDtEf.DTim_2)/(pl.actmod_cl_TmpDtEf.amv > 4 and 0.1 or 0.2) ,0,1 )
									if timov >= 1 then
										pl.actmod_cl_TmpDtEf.Damv = 4
										pl.actmod_cl_TmpDtEf.Dalp_2 = 0
										pl.actmod_cl_TmpDtEf.Dalp_2_z = 2
									else
										pl.actmod_cl_TmpDtEf.Dalp_2 = 1-timov
										pl.actmod_cl_TmpDtEf.Dalp_2_z = 1+timov
									end
								elseif pl.actmod_cl_TmpDtEf.Damv == 5 and pl.actmod_cl_TmpDtEf.DTim_1 then
									local timov = math.Clamp( (CurTime() - pl.actmod_cl_TmpDtEf.DTim_1)/0.6 ,0,1 )
									if timov >= 1 then
										pl.actmod_cl_TmpDtEf.Damv = 6
										pl.actmod_cl_TmpDtEf.Dalp_1 = 0
									else
										pl.actmod_cl_TmpDtEf.Dalp_1 = 1-timov
									end
								end
								if pl.actmod_cl_TmpDtEf.bone_r and pl.actmod_cl_TmpDtEf.Dalp_1 > 0 then
									local PP_pos,PP_ang = pl:GetBonePosition(pl.actmod_cl_TmpDtEf.bone_r)
									local a_pos = PP_pos + PP_ang:Forward()*2*Asz
									render.SetMaterial(pl.actmod_cl_TmpDtEf.mat_1)
									render.DrawSprite(a_pos, 10*Asz, 10*Asz, Color(255, 255, 225,150*pl.actmod_cl_TmpDtEf.Dalp_1))
									if pl.actmod_cl_TmpDtEf.QHt > 1 then
										cam.Start3D2D(a_pos, EyeAngles() + Angle(-90, 0, 0), 0.2)
											surface.SetDrawColor(255, 255, 255, 255*pl.actmod_cl_TmpDtEf.Dalp_1)
											surface.SetMaterial(pl.actmod_cl_TmpDtEf.mat_lgt)
											surface.DrawTexturedRectRotated(0, 0, 64*Asz, 64*Asz, (CurTime() * 50)%360)
											if pl.actmod_cl_TmpDtEf.QHt > 2 then
												surface.DrawTexturedRectRotated(0, 0, 64*Asz, 64*Asz, -(CurTime() * 30)%360)
											end
										cam.End3D2D()
									end
									if pl.actmod_cl_TmpDtEf.Dalp_2 > 0 then
										local az = 5*pl.actmod_cl_TmpDtEf.Dalp_2_z
										render.SetMaterial(pl.actmod_cl_TmpDtEf.mat_2)
										render.DrawSprite(a_pos, (18+az)*Asz, (18+az)*Asz, Color(255, 255, 225,255*pl.actmod_cl_TmpDtEf.Dalp_2))
									end
								end
								if pl.actmod_cl_TmpDtEf.bone_l and pl.actmod_cl_TmpDtEf.Dalp_1 > 0 then
									local PP_pos,PP_ang = pl:GetBonePosition(pl.actmod_cl_TmpDtEf.bone_l)
									local a_pos = PP_pos + PP_ang:Forward()*2*Asz
									render.SetMaterial(pl.actmod_cl_TmpDtEf.mat_1)
									render.DrawSprite(a_pos, 10*Asz, 10*Asz, Color(255, 255, 225,150*pl.actmod_cl_TmpDtEf.Dalp_1))
									if pl.actmod_cl_TmpDtEf.QHt > 1 then
										cam.Start3D2D(a_pos, EyeAngles() + Angle(-90, 0, 0), 0.2)
											surface.SetDrawColor(255, 255, 255, 255*pl.actmod_cl_TmpDtEf.Dalp_1)
											surface.SetMaterial(pl.actmod_cl_TmpDtEf.mat_lgt)
											surface.DrawTexturedRectRotated(0, 0, 64*Asz, 64*Asz, (CurTime() * 50)%360)
											if pl.actmod_cl_TmpDtEf.QHt > 2 then
												surface.DrawTexturedRectRotated(0, 0, 64*Asz, 64*Asz, -(CurTime() * 30)%360)
											end
										cam.End3D2D()
									end
									if pl.actmod_cl_TmpDtEf.Dalp_2 > 0 then
										local az = 5*pl.actmod_cl_TmpDtEf.Dalp_2_z
										render.SetMaterial(pl.actmod_cl_TmpDtEf.mat_2)
										render.DrawSprite(a_pos, (18+az)*Asz, (18+az)*Asz, Color(255, 255, 225,255*pl.actmod_cl_TmpDtEf.Dalp_2))
									end
								end
								if pl.actmod_cl_TmpDtEf.bone_s4 and pl.actmod_cl_TmpDtEf.Dalp_2 > 0 then
									local PP_pos,PP_ang = pl:GetBonePosition(pl.actmod_cl_TmpDtEf.bone_s4)
									local az = 24*pl.actmod_cl_TmpDtEf.Dalp_2_z
									render.SetMaterial(pl.actmod_cl_TmpDtEf.mat_lgt)
									render.DrawSprite(PP_pos + PP_ang:Forward()*-2*Asz + PP_ang:Right()*5*Asz, (22+az)*Asz, (22+az)*Asz, Color(255, 255, 225,150*pl.actmod_cl_TmpDtEf.Dalp_2))
								end
								if pl.actmod_cl_TmpDtEf.QHt > 1 and pl.actmod_cl_TmpDtEf.DEffTim_1 and pl.actmod_cl_TmpDtEf.DEffs_1 and pl.actmod_cl_TmpDtEf.DEffTim_1-pl.actmod_cl_TmpDtEf.DEffs_1/1.5 < CurTime() and pl.actmod_cl_TmpDtEf.DEffTim_1 > CurTime() then
									local attmr = math.Clamp( (CurTime()+pl.actmod_cl_TmpDtEf.DEffs_1/1.5 - pl.actmod_cl_TmpDtEf.DEffTim_1) ,0,1) --print(attmr)
									local tornado_pos = pl:GetPos() +Vector(0, 0, 0)
									local tornado_height = 5+50*attmr*Asz
									local tornado_radius = 50*attmr*Asz
									local particles_per_tick = 2
									local speed = 3+10*attmr
									local emitter = ParticleEmitter(Vector(0,0,0), true)
									if emitter then
										for i = 1, particles_per_tick do
											local ang = CurTime() * speed + math.rad(i * 120)
											local z = math.random(0, tornado_height)
											local pos = tornado_pos + Vector( math.cos(ang) * tornado_radius * (z / tornado_height) ,math.sin(ang) * tornado_radius * (z / tornado_height) ,z )
											local p = emitter:Add("particle/smokesprites_000"..math.random(1,9), pos)
											if p then
												p:SetVelocity(Vector(math.Rand(-1, 1),math.Rand(-1, 1),1.1)*math.random(50,200))
												p:SetDieTime(math.Rand(0.1, 1.5)*attmr) p:SetColor(90, 85, 80)
												p:SetStartAlpha(180) p:SetEndAlpha(0) p:SetCollide(false)
												p:SetStartSize(math.random(2, 6)*attmr*Asz) p:SetEndSize(0)
												p:SetRoll(math.random(-180, 180)) p:SetRollDelta(math.Rand(-1, 1))
												p:SetAirResistance(math.random(40, 150))
												p:SetGravity(Vector(0, 0, math.random(40, 80)))
											end
										end
									end
								end
							end
						end
					end
				end
				,SCpt = function(pl,cyc,Fram)
					if istable(pl.actmod_cl_TmpDtEf) and isstring(pl.actmod_cl_TmpDtEf.Astr) and isnumber(pl.actmod_cl_TmpDtEf.amv) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
						local Asz = pl:GetModelScale()
						if pl.actmod_cl_TmpDtEf.amv == 0 then
							if cyc > 0.70 then
								pl.actmod_cl_TmpDtEf.amv = 7
							elseif cyc > 0.61351 then
								pl.actmod_cl_TmpDtEf.amv = 6
							elseif cyc > 0.517 then
								pl.actmod_cl_TmpDtEf.amv = 5
							elseif cyc > 0.3 then
								pl.actmod_cl_TmpDtEf.amv = 4
							elseif cyc > 0.12054 then
								pl.actmod_cl_TmpDtEf.amv = 3
							elseif cyc > 0.06 then
								pl.actmod_cl_TmpDtEf.amv = 2
							elseif cyc > 0.04 and cyc < 0.1 then
								pl.actmod_cl_TmpDtEf.amv = 1
							end
						elseif pl.actmod_cl_TmpDtEf.amv == 1 and cyc > 0.06 and cyc < 0.1 then
							pl.actmod_cl_TmpDtEf.amv = 2
							pl.actmod_cl_TmpDtEf.TEff.T_1 = nil
							pl.actmod_cl_TmpDtEf.TEff.T_2 = nil
							pl.actmod_cl_TmpDtEf.Damv = 1
							pl.actmod_cl_TmpDtEf.Dalp_1 = 0
							pl.actmod_cl_TmpDtEf.DTim_1 = CurTime()
							pl.actmod_cl_TmpDtEf.Dalp_2 = 0
							pl.actmod_cl_TmpDtEf.Dalp_2_z = 0
							pl.actmod_cl_TmpDtEf.DTim_2 = nil
						elseif pl.actmod_cl_TmpDtEf.amv == 2 and cyc > 0.12054 and cyc < 0.16 then
							pl.actmod_cl_TmpDtEf.amv = 3
							pl.actmod_cl_TmpDtEf.Damv = 2
							pl.actmod_cl_TmpDtEf.Dalp_1 = 1
							pl.actmod_cl_TmpDtEf.Dalp_2 = 0
							pl.actmod_cl_TmpDtEf.Dalp_2_z = 0
							pl.actmod_cl_TmpDtEf.DTim_2 = CurTime()
						elseif pl.actmod_cl_TmpDtEf.amv == 3 and cyc > 0.3 and cyc < 0.34 then
							pl.actmod_cl_TmpDtEf.amv = 4
							pl.actmod_cl_TmpDtEf.TEff.T_h1 = AM_CL_CreateTrail({
								ply = pl, ent = pl,
								Material = "trails/smoke",
								boneName = "ValveBiped.Bip01_R_Hand",
								color = Color(255, 255, 235, 100), width = 4*Asz,
								duration = 1.7 ,holdTime = 0 ,lifetime = 0.2
								,TrailPointInterval = 0.01
								,TrailMaxPoints = 4
							})
							pl.actmod_cl_TmpDtEf.TEff.T_h2 = AM_CL_CreateTrail({
								ply = pl, ent = pl,
								Material = "trails/smoke",
								boneName = "ValveBiped.Bip01_L_Hand",
								color = Color(255, 255, 235, 120), width = 3*Asz,
								duration = 1.74 ,holdTime = 0 ,lifetime = 0.2
								,TrailPointInterval = 0.01
								,TrailMaxPoints = 4
							})
							pl.actmod_cl_TmpDtEf.TEff.T_1 = AM_CL_CreateTornadoEffect({
								ply = pl, ent = pl,
								height = 40*Asz,
								topRadius = 80*Asz,
								middleRadius = 50*Asz,
								bottomRadius = 21*Asz,
								curveHeight = 0.4, turns = 2,
								color = Color(255, 255, 225, 60),
								material = "trails/smoke",
								lifetime = 1.4, fadeIn = 0.2, fadeOut = 0.3,
								width = 7*Asz, speed = 3.5, reverse = true,
								waveIntensity = 6, waveSpeed = 1,
								offset = Vector(0,0,5)*Asz,
								enableGrow = true,
								growSpeed = 0.35
							})
							if pl.actmod_cl_TmpDtEf.QHt > 2 then
								pl.actmod_cl_TmpDtEf.TEff.T_2 = AM_CL_CreateTornadoEffect({
									ply = pl, ent = pl,
									height = 40*Asz,
									topRadius = 70*Asz,
									middleRadius = 45*Asz,
									bottomRadius = 20*Asz,
									curveHeight = 0.6, turns = 1.2,
									color = Color(255, 255, 235, 50),
									material = "trails/smoke",
									lifetime = 1.4, fadeIn = 0.3, fadeOut = 0.4,
									width = 6*Asz, speed = -5.1, reverse = false,
									waveIntensity = 2, waveSpeed = 0.5,
									offset = Vector(0,0,4)*Asz,
									enableGrow = true,
									fadeInMode = "ease",
									growSpeed = 0.35
								})
							end
						elseif pl.actmod_cl_TmpDtEf.amv == 4 and cyc > 0.517 and cyc < 0.55 then
							pl.actmod_cl_TmpDtEf.amv = 5
							if pl.actmod_cl_TmpDtEf.TEff.T_1 then pl.actmod_cl_TmpDtEf.TEff.T_1.remove = true end
							if pl.actmod_cl_TmpDtEf.TEff.T_2 then pl.actmod_cl_TmpDtEf.TEff.T_2.remove = true end
							pl.actmod_cl_TmpDtEf.Damv = 2
							pl.actmod_cl_TmpDtEf.Dalp_1 = 1
							pl.actmod_cl_TmpDtEf.Dalp_2 = 0
							pl.actmod_cl_TmpDtEf.Dalp_2_z = 0
							pl.actmod_cl_TmpDtEf.DTim_2 = CurTime()
						elseif pl.actmod_cl_TmpDtEf.amv == 5 and cyc > 0.61351 and cyc < 0.65 then
							pl.actmod_cl_TmpDtEf.amv = 6
							pl.actmod_cl_TmpDtEf.TEff.TimeStart = CurTime() + 0.1
							pl.actmod_cl_TmpDtEf.TEff.T_1 = nil
							pl.actmod_cl_TmpDtEf.TEff.T_2 = nil
							pl.actmod_cl_TmpDtEf.DEffs_1 = 2.3
							pl.actmod_cl_TmpDtEf.DEffTim_1 = CurTime() + pl.actmod_cl_TmpDtEf.DEffs_1
							pl.actmod_cl_TmpDtEf.TEff.T_1 = AM_CL_CreateTornadoEffect({
								ply = pl, ent = pl,
								height = 70*Asz,
								topRadius = 50*Asz,
								middleRadius = 50*Asz,
								bottomRadius = 2*Asz,
								curveHeight = 0.4, turns = 2,
								color = Color(255, 255, 235, 140),
								material = "trails/smoke",
								lifetime = 2.6, fadeIn = 0.5, fadeOut = 0.7,
								width = 7*Asz, speed = 5.5, reverse = true,
								waveIntensity = 6, waveSpeed = 3,
								growThreshold = 0,
								offset = Vector(0,0,3)*Asz,
								enableGrow = true,
								growSpeed = 0.35
							})
							if pl.actmod_cl_TmpDtEf.QHt > 2 then
								pl.actmod_cl_TmpDtEf.TEff.T_2 = AM_CL_CreateTornadoEffect({
									ply = pl, ent = pl,lifetime = 2.5, fadeIn = 1.5, fadeOut = 0.4,
									height = 60*Asz,topRadius = 60*Asz,middleRadius = 45*Asz,bottomRadius = 10*Asz,
									curveHeight = 0.6, turns = 1.2,color = Color(255, 255, 225, 130),material = "trails/smoke",
									width = 6*Asz, speed = -5.1, reverse = false,
									waveIntensity = 2, waveSpeed = 2.5,
									enableGrow = true,
									fadeInMode = "ease",
									growSpeed = 0.35
								})
							end
							pl.actmod_cl_TmpDtEf.TEff.T_3 = AM_CL_CreateTrail({
								ply = pl, ent = pl,
								Material = "trails/smoke",
								boneName = "ValveBiped.Bip01_L_Hand",
								color = Color(255, 255, 235, 110), width = 4*Asz,
								duration = 3.1, holdTime = 0,lifetime = 0.2
								,TrailPointInterval = 0.01
								,TrailMaxPoints = 4
							})
						elseif pl.actmod_cl_TmpDtEf.amv == 6 and cyc > 0.70 and cyc < 0.74 then
							pl.actmod_cl_TmpDtEf.amv = 7
							pl.actmod_cl_TmpDtEf.TEff.T_4 = AM_CL_CreateTrail({
								ply = pl, ent = pl,
								Material = "trails/smoke",
								boneName = "ValveBiped.Bip01_R_Hand",
								color = Color(255, 255, 235, 100), width = 4*Asz,
								duration = 2.3, holdTime = 0,lifetime = 0.2
								,TrailPointInterval = 0.01
								,TrailMaxPoints = 6
							})
						elseif pl.actmod_cl_TmpDtEf.amv == 7 and cyc > 0.91 and cyc < 0.95 then
							pl.actmod_cl_TmpDtEf.amv = 8
							if pl.actmod_cl_TmpDtEf.TEff.T_1 then pl.actmod_cl_TmpDtEf.TEff.T_1.remove = true end
							if pl.actmod_cl_TmpDtEf.TEff.T_2 then pl.actmod_cl_TmpDtEf.TEff.T_2.remove = true end
							pl.actmod_cl_TmpDtEf.Damv = 5
							pl.actmod_cl_TmpDtEf.Dalp_1 = 1
							pl.actmod_cl_TmpDtEf.DTim_1 = CurTime()
							pl.actmod_cl_TmpDtEf.Dalp_2 = 0
							pl.actmod_cl_TmpDtEf.Dalp_2_z = 0
							pl.actmod_cl_TmpDtEf.DTim_2 = nil
						elseif pl.actmod_cl_TmpDtEf.amv == 8 and (cyc > 0.97 or cyc > 0.4 and cyc < 0.1) then
							pl.actmod_cl_TmpDtEf.amv = 1
						end
					elseif pl.actmodstr == "amod_cumact_fortnite_modernmix" then
						pl.actmod_cl_TmpDtEf = {
							Astr = pl.actmodstr ,amv = 0 ,Dalp_1 = 0 ,Dalp_2 = 0,Dalp_2_z = 0 ,Damv = 0 ,TEff = {} ,CurTRun = pl.ActMod_CurTRun
							,mat_1 = Material("actmod/eff_particle/p_glow_01") ,mat_2 = Material("actmod/eff_particle/p_glow_02")
							,mat_lgt = Material("actmod/eff_particle/light_02") ,QHt = ConVarExists("actmod_cl_q_ef") and GetConVarNumber("actmod_cl_q_ef") or 2
						}
					end
				end
			}
		end
	}
	
}