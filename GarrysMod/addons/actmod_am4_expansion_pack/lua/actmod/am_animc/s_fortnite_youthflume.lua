// Young Black & Rich (commission)
// 2026-AM4|12777|148635
return{
	["fortnite_youthflume"] = {
		Config = {
			Anim = "amod_fortnite_youthflume"
			,Name = "Young Black & Rich" ,isNew = true ,class = 1
			,CList = {Title="ActMod Commission Hub",OFtn=true}
		}
		,About = { Author = "AhmedMake400",Version = "4.7" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 7.36667 ,Cycle = 0.071428571428571 } ,Sound = { Time1 = 15.13,Time2 = 14.73 } }
		,Coop = { Sync = true ,MaxDist = 300 }
		,Movement = { Type = 3 ,Speed = 80 }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_YouthFlume_Music_1.mp3" }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_YouthFlume_Music_2.mp3" }
		}
		,Models = { [1] = { Model = "models/actmod/prop/YouthFlume_Gadget.mdl" } }
		,Scrpt = function()
			local AAEffect = A_AM.ActMod.aTabDa_RunCyc["AAEffect"]
			return {
				SCpt = function(pl,cyc,Fram)
					local model1
					if pl.AAct_mdl1 then model1 = pl.AAct_mdl1 end
					if model1 then
						model1:SetCycle( cyc )
						if model1.tr_1 and model1.step then
							if not model1.FtDone and cyc > 0.02 then
								if model1.tHide and model1.step == 0 then model1.tHide = nil end
								if model1.step == 0 and cyc > 0.03 then
									model1.step = 1
									local emitter = ParticleEmitter(model1:GetPos())
									if emitter then
										local Asz,QHt = pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
										local a_pos = model1:GetPos()+model1:GetForward()*-15*Asz+model1:GetUp()*2*Asz
										for i = 0, math.Rand(20,30) do
											local p = emitter:Add("particles/smokey", a_pos + model1:GetForward()*math.random(-24,24)*Asz + model1:GetRight()*math.random(-12,12)*Asz + model1:GetUp()*math.random(1,5)*Asz)
											if not p then break end
											p:SetVelocity(model1:GetRight()*math.random(-12,12)*Asz + Vector(0,0,math.random(50,140)*Asz))
											p:SetDieTime(math.Rand(0.5,0.7)) p:SetColor(210,240,255)
											p:SetStartAlpha(255) p:SetEndAlpha(0)
											p:SetStartSize(math.Rand(20,25)*Asz) p:SetEndSize(math.Rand(0,7)*Asz)
											p:SetAirResistance(math.random(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,-150))
										end
										for i = 0, math.Rand(10,20) do
											local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", a_pos + model1:GetForward()*math.random(-20,20)*Asz + model1:GetRight()*math.random(-10,10)*Asz + model1:GetUp()*math.random(1,3)*Asz)
											if not p then break end
											p:SetVelocity(model1:GetRight()*math.random(-150,150)*Asz + Vector(0,0,math.random(220,300)*Asz))
											p:SetDieTime(math.Rand(0.2,0.4)) p:SetColor(200,230,250)
											p:SetStartAlpha(230) p:SetEndAlpha(0)
											p:SetStartSize(math.Rand(3,6)*Asz) p:SetEndSize(math.Rand(0,6)*Asz)
											p:SetAirResistance(math.random(20,100)) p:SetGravity(Vector(0,0,-math.random(850,970)))
										end
										if QHt > 2 then
											for i = 0, math.random(10,25) do
												local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", a_pos + model1:GetForward()*math.random(-7,7)*Asz + model1:GetRight()*8*Asz + model1:GetUp()*math.random(4,6)*Asz)
												if not p then break end
												p:SetVelocity(model1:GetForward()*math.random(-90,90)*Asz + model1:GetRight()*math.random(-90,90)*Asz + Vector(0,0,math.random(130,250)*Asz))
												p:SetDieTime(math.Rand(0.3,0.7)) p:SetColor(200,230,250)
												p:SetStartAlpha(255) p:SetEndAlpha(0)
												p:SetStartSize(math.Rand(1,2)*Asz) p:SetEndSize(math.Rand(1,2)*Asz)
												p:SetStartLength(math.random(2,3)*Asz) p:SetEndLength(math.Rand(0.1,1.5)*Asz)
												p:SetAirResistance(math.random(10,50)) p:SetGravity(Vector(0,0,-650))
											end
										end
										emitter:Finish()
									end
								end
								if cyc > 0.03 then
									model1:ManipulateBoneScale( 3, Vector(1,1,1)*math.Remap(math.min(cyc-0.03,0.025),0,0.025,0,1) )
								end
								if cyc > 0.025+0.03 then
									model1:ManipulateBoneScale( 3, Vector(1,1,1) )
									model1.FtDone = true model1.step = 2
								end
							end
						end
						if not model1.tr_1 then model1.tr_1 = true model1.ra_1 = true model1.tHide = true model1.step = 0
							model1:ResetSequence( "emote_youthflumet" )
							-- local hmax2 = A_AM.ActMod:HMd( pl,"models/actmod/prop/YouthFlume_Gadget.mdl" ,pl.actmodstr,"emote_youthflumet",0 ,"ValveBiped.Bip01_R_Hand","JNT_global_guitar" )
							-- model1:ManipulateBonePosition( 3, Vector( 0, 0, (29.818155288696-hmax2[1])*0.01) )
							model1:ManipulateBoneScale( 3, Vector(0,0,0) )
						end
					end
				end
				,SDrw = function(pl,cyc,model1)
					if model1 and model1.ra_1 and (pl == LocalPlayer() or LocalPlayer():trueShowMld(pl)) then
						if model1.FtDone then
							local emitter = ParticleEmitter(model1:GetPos())
							if emitter then
								local Asz,QHt = pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
								local a_pos = model1:GetPos()+model1:GetForward()*-20*Asz+model1:GetUp()*2*Asz
								for i = 0, QHt==1 and math.random(1,2) or QHt==2 and math.random(3,5) or QHt==3 and math.random(5,8) or QHt>3 and math.random(7,15) do
									local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", a_pos + model1:GetForward()*math.random(-10,10)*Asz + model1:GetRight()*math.random(-5,5)*Asz + model1:GetUp()*math.random(1,2)*Asz)
									if not p then break end
									p:SetVelocity(model1:GetRight()*math.random(-10,10)*Asz + Vector(0,0,1))
									p:SetDieTime(math.Rand(0.05,0.2)) p:SetColor(180,200,230) --80,110,110
									p:SetStartAlpha(255) p:SetEndAlpha(0)
									p:SetStartSize(math.Rand(0.5,2)*Asz) p:SetEndSize(math.Rand(0,3)*Asz)
									p:SetAirResistance(math.random(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,-150))
								end
								for i = 0, QHt==1 and math.random(1,2) or QHt==2 and math.random(1,3) or QHt==3 and math.random(2,4) or QHt>3 and math.random(4,6) do
									local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", a_pos + model1:GetForward()*math.random(-7,7)*Asz + model1:GetRight()*8*Asz + model1:GetUp()*math.random(4,6)*Asz)
									if not p then break end
									p:SetVelocity(model1:GetRight()*math.random(50,80)*Asz + Vector(0,0,1))
									p:SetDieTime(math.Rand(0.05,0.2)) p:SetColor(180,200,230)
									p:SetStartAlpha(255) p:SetEndAlpha(0)
									p:SetStartSize(math.Rand(0.5,4)*Asz) p:SetEndSize(math.Rand(0,3)*Asz)
									p:SetAirResistance(math.random(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,-200))
								end
								for i = 0, QHt==1 and math.random(1,2) or QHt==2 and math.random(1,3) or QHt==3 and math.random(2,4) or QHt>3 and math.random(4,6) do
									local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", a_pos + model1:GetForward()*math.random(-7,7)*Asz - model1:GetRight()*8*Asz + model1:GetUp()*math.random(4,6)*Asz)
									if not p then break end
									p:SetVelocity(model1:GetRight()*-math.random(50,80)*Asz + Vector(0,0,1))
									p:SetDieTime(math.Rand(0.05,0.2)) p:SetColor(180,200,230)
									p:SetStartAlpha(255) p:SetEndAlpha(0)
									p:SetStartSize(math.Rand(0.5,4)*Asz) p:SetEndSize(math.Rand(0,3)*Asz)
									p:SetAirResistance(math.random(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,-200))
								end
								for i = 0, QHt==1 and 0 or QHt==2 and 1 or QHt==3 and math.random(1,2) or QHt>3 and math.random(1,3) do
									local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", a_pos + model1:GetForward()*math.random(-1,-8)*Asz + model1:GetRight()*6*Asz + model1:GetUp()*math.random(1,2)*Asz)
									if not p then break end
									p:SetVelocity(model1:GetRight()*math.random(20,30)*Asz + Vector(0,0,1))
									p:SetDieTime(math.Rand(0.05,0.2)) p:SetColor(180,200,230)
									p:SetStartAlpha(255) p:SetEndAlpha(0)
									p:SetStartSize(math.Rand(0.8,5)*Asz) p:SetEndSize(math.Rand(0,4)*Asz)
									p:SetAirResistance(math.random(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,-110))
								end
								for i = 0, QHt==1 and 0 or QHt==2 and 1 or QHt==3 and math.random(1,2) or QHt>3 and math.random(1,3) do
									local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", a_pos + model1:GetForward()*math.random(-1,-8)*Asz - model1:GetRight()*6*Asz + model1:GetUp()*math.random(1,2)*Asz)
									if not p then break end
									p:SetVelocity(model1:GetRight()*-math.random(20,30)*Asz + Vector(0,0,1))
									p:SetDieTime(math.Rand(0.05,0.2)) p:SetColor(180,200,230)
									p:SetStartAlpha(255) p:SetEndAlpha(0)
									p:SetStartSize(math.Rand(0.8,5)*Asz) p:SetEndSize(math.Rand(0,4)*Asz)
									p:SetAirResistance(math.random(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,-110))
								end
								if QHt > 1 then
									if (model1.eff_timr or 0) < CurTime() then
										model1.eff_timr = CurTime() + (QHt==2 and math.Rand(0.01,0.1) or QHt==3 and math.Rand(0.001,0.05) or QHt>3 and 0.001)
										local vel = pl:GetVelocity()
										local speed = math.Round(math.Clamp(vel:Length2D()*0.6,20,70)*0.05,2)
										local sz = math.max(speed*0.6,1)
										for i = 0, math.random(1,3)*speed do
											if math.random(0,1)==1 then continue end
											local p = emitter:Add("particles/smokey", a_pos + model1:GetForward()*math.random(-8,8)*Asz + model1:GetRight()*9*math.max(speed*0.6,1)*Asz + model1:GetUp()*math.random(4,6)*Asz)
											if not p then break end
											p:SetVelocity(model1:GetRight()*math.random(5,40)*sz*Asz + Vector(0,0,math.random(20,40)*sz*Asz))
											p:SetDieTime(math.Rand(0.4,0.7)) p:SetColor(230,250,255)
											p:SetStartAlpha(230) p:SetEndAlpha(0)
											p:SetStartSize(math.Rand(2,8)*sz*Asz) p:SetEndSize(math.Rand(2,8)*sz*Asz)
											p:SetAirResistance(math.random(10,50)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,-110))
										end
										for i = 0, math.random(1,3)*speed do
											if math.random(0,1)==1 then continue end
											local p = emitter:Add("particles/smokey", a_pos + model1:GetForward()*math.random(-8,8)*Asz - model1:GetRight()*9*math.max(speed*0.6,1)*Asz + model1:GetUp()*math.random(4,6)*Asz)
											if not p then break end
											p:SetVelocity(model1:GetRight()*-math.random(5,40)*sz*Asz + Vector(0,0,math.random(20,40)*sz*Asz))
											p:SetDieTime(math.Rand(0.4,0.7)) p:SetColor(230,250,255)
											p:SetStartAlpha(230) p:SetEndAlpha(0)
											p:SetStartSize(math.Rand(2,8)*sz*Asz) p:SetEndSize(math.Rand(2,8)*sz*Asz)
											p:SetAirResistance(math.random(10,50)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,-110))
										end
										if QHt > 2 then
											for i = 0, math.random(1,3)*speed do
												if math.random(0,1)==1 then continue end
												local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", a_pos + model1:GetForward()*math.random(-7,7)*Asz + model1:GetRight()*8*math.max(speed*0.6,1)*Asz + model1:GetUp()*math.random(4,6)*Asz)
												if not p then break end
												p:SetVelocity(model1:GetForward()*-math.random(15,30)*sz*Asz + model1:GetRight()*math.random(5,40)*sz*Asz + Vector(0,0,math.random(60,80)*sz*Asz))
												p:SetDieTime(math.Rand(0.2,0.5)) p:SetColor(200,230,250)
												p:SetStartAlpha(255) p:SetEndAlpha(0)
												p:SetStartSize(math.Rand(1,2)*sz*Asz) p:SetEndSize(math.Rand(1,2)*sz*Asz)
												p:SetStartLength(math.random(7,9)*sz*Asz) p:SetEndLength(math.Rand(0.1,5.5)*sz*Asz)
												p:SetAirResistance(math.random(10,50)) p:SetGravity(Vector(0,0,-260))
											end
											for i = 0, QHt == 3 and math.random(1,4)*speed or QHt > 3 and math.random(6,9)*speed do
												if math.random(0,1)==1 then continue end
												local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", a_pos + model1:GetForward()*math.random(-7,7)*Asz - model1:GetRight()*8*math.max(speed*0.6,1)*Asz + model1:GetUp()*math.random(4,6)*Asz)
												if not p then break end
												p:SetVelocity(model1:GetForward()*-math.random(15,30)*sz*Asz + model1:GetRight()*-math.random(5,40)*sz*Asz + Vector(0,0,math.random(60,80)*sz*Asz))
												p:SetDieTime(math.Rand(0.2,0.5)) p:SetColor(200,230,250)
												p:SetStartAlpha(255) p:SetEndAlpha(0)
												p:SetStartSize(math.Rand(1,2)*sz*Asz) p:SetEndSize(math.Rand(1,2)*sz*Asz)
												p:SetStartLength(math.random(7,9)*sz*Asz) p:SetEndLength(math.Rand(0.1,5.5)*sz*Asz)
												p:SetAirResistance(math.random(10,50)) p:SetGravity(Vector(0,0,-260))
											end
										end
									end
								end
								emitter:Finish()
							end
						end
					end
				end
			}
		end
	}
	
}