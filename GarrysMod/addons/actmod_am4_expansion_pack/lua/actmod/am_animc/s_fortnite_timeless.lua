// Timeless (Commission)
// 2026-AM4|14618|148635
return{
	["fortnite_timesticking"] = {
		Config = {
			Anim = "amod_fortnite_timesticking"
			,Name = "Timeless" ,isNew = true ,class = 1
			,CList = {Title="ActMod Commission Hub",OFtn=true}
		}
		,About = {Author = "AhmedMake400",Version = "2.4"}
		,Camera = { Transition = 1.1 }
		,Custom = {
			Anim = { Time2 = 4,Cycle = 0.32960893854748 }
			,Sound = { Time1 = 17.96667,Time2 = 16 }
		}
		,Movement = {
			Type = 3,Speed = 50
			,Motion = { Static = "amod_fortnite_timesticking",Walk = "amod_fortnite_timesticking_walk" }
		}
		,Coop = { Sync = true ,MaxDist = 130 }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_TimesTicking_1.mp3" ,Delay = 0.03 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_TimesTicking_2.mp3" ,Delay = 1.96667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_TimesTicking_2.mp3" }
		}
		,Models = {
			[1] = { Model = "models/actmod/prop/TimeTicking_Gadget.mdl",Size = 3.7 }
		}
		
		,Scrpt = function()
			local aSetSubMat = A_AM.ActMod.aTabDa_RunCyc["aSetSubMat"]
			local AMesh = A_AM.ActMod.aTabFncs.AMesh
			-- local avidis = GetConVarNumber("actmod_cl_viewdis")
			-- local function aDist(pl,taa)
				-- if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then return true end
				-- return false
			-- end
			local matar = Material("actmod/eff_particle/effs01")
			local atwg = Material("actmod/eff_particle/p_glow_01")
			local atww = Material("actmod/sm_hover3.png")
			local function BoneScaleAverage(ent, bone) local v = ent:GetManipulateBoneScale(bone) return (v.x + v.y + v.z) / 3 end
			local function aa_affTr(model1,bne,Tpos)
				local AA_pos,AA_ang = model1:GetBonePosition(bne)
				local ok, bm = pcall(function() return model1:GetBoneMatrix(bne) end)
				if ok and bm then
					AA_pos = bm:GetTranslation()
					AA_ang = bm:GetAngles()
				end
				local P_ang = Tpos[3] or AA_ang
				local emitter = ParticleEmitter(AA_pos)
				if not emitter then return end
				local Asz = model1:GetModelScale()
				for i = 1, math.Rand(2,3) do
					local p = emitter:Add("actmod/eff_particle/laser_tracer01", AA_pos + VectorRand() * 0.3*Asz)
					if not p then break end
					p:SetVelocity(P_ang:Forward() * Tpos[1]*Asz + P_ang:Right() * Tpos[2]*Asz + VectorRand()*1.3 + Vector(0,0,1))
					p:SetDieTime(math.Rand(0.1,0.4)) p:SetColor(255, 255, 100)
					p:SetStartAlpha(255) p:SetEndAlpha(0)
					p:SetStartSize((0.3 + math.Rand(0.5,1))*Asz)
					p:SetEndSize((0.1 + math.Rand(0,1.5))*Asz)
					p:SetRoll(math.Rand(0,360)) p:SetRollDelta(math.Rand(-6,6))
					p:SetAirResistance(math.Rand(10,-20)*(1+(Asz*1.2)))
					p:SetStartLength(2*Asz) p:SetEndLength(math.Rand(0.1,1.5)*Asz)
					p:SetGravity(P_ang:Forward() *-100*Asz + Vector(0,0,150))
				end
				emitter:Finish()
			end
			local function shlwi(entt,bne,Tb)
				if IsValid(entt) then
					local ok, bm = pcall(function() return entt:GetBoneMatrix(bne) end)
					if ok and bm then
						local pos,ang = bm:GetTranslation(),bm:GetAngles()
						local Asz,asiz,alp,atww,clo_r,clo_g,clo_b = entt:GetModelScale(),6,0.7,atww,255,230,100
						pos = bm:GetTranslation()
						ang = bm:GetAngles()
						if istable(Tb) then
							if Tb[1] then atww = Tb[1] end
							if Tb[2] then pos = pos + ang:Forward()*Tb[2][1] + ang:Right()*Tb[2][2] + ang:Up()*Tb[2][3] end
							if Tb[3] then asiz = Tb[3] end
							if Tb[4] then clo_r = Tb[4][1] clo_g = Tb[4][2] clo_b = Tb[4][3] end
							if Tb[5] then alp = Tb[5] end
						end
						render.SetMaterial(atww)
						render.DrawSprite(pos, asiz*Asz, asiz*Asz, Color(clo_r,clo_g,clo_b,math.Clamp(255*alp*BoneScaleAverage(entt, bne),0,255)))
					end
				end
			end
			return {
				SCpt = function(pl,cyc,Fram)
					local model1
					if pl.AAct_mdl1 then model1 = pl.AAct_mdl1 end
					if model1 then
						model1:SetCycle( cyc )
						if model1.tr_1 and model1.stp and model1.Tsize then
							if not model1.FtDone and cyc > 0.01 then
								if model1.tHide and model1.stp == 0 then model1.tHide = nil end
								if cyc > 0.051 then
									local aa = math.Remap(math.min(cyc-0.051,0.05),0,0.05,0,1)
									pl.AAct_Tmdl1["size"] = model1.Tsize*math.ease.OutQuad(aa)
									pl.AAct_Tmdl1["Blend"] = 1*math.ease.InExpo(aa)
									if cyc > 0.051+0.05 then
										pl.AAct_Tmdl1["size"] = model1.Tsize
										pl.AAct_Tmdl1["Blend"] = 1
										model1.FtDone = true
										model1.stp = 1
									end
								end
							elseif model1.FtDone and model1.stp > 0 then
								if model1.stp == 1 and cyc >= 0.096 then
									model1:ManipulateBoneScale(10,Vector( 1,0.65,1 )*math.Remap(math.min(cyc-0.096,0.04),0,0.04,0,1) )
									if cyc > 0.096+0.04 then
										model1:ManipulateBoneScale(10,Vector( 1, 0.65, 1) )
										model1.stp = 2
									end
								elseif model1.stp == 2 and cyc >= 0.17 then
									model1:SetBodygroup( 1, 1 )
									model1:SetBodygroup( 2, 1 )
									model1:SetBodygroup( 3, 1 )
									local aa = math.Remap(math.min(cyc-0.17,0.04),0,0.04,0,1)
									model1:ManipulateBonePosition(2,Vector( 5,-4.8,-0.6 )*aa)
									model1:ManipulateBonePosition(3,Vector( 0,0.5,0.7 )*aa)
									model1:ManipulateBonePosition(4,Vector( -1,0,0.5 )*aa)
									model1:ManipulateBoneScale(2,Vector( 1,1,0.3 )*1.5*aa)
									model1:ManipulateBoneScale(3,Vector( 1,1,0.3 )*1.5*aa)
									model1:ManipulateBoneScale(4,Vector( 1,1,0.3 )*1.5*aa)
									if cyc > 0.17+0.04 then
										aa = Vector( 1,1,0.3 )*1.5
										model1:ManipulateBonePosition( 2, Vector( 5,-4.8,-0.6 ) )
										model1:ManipulateBonePosition( 3, Vector( 0,0.5,0.7 ) )
										model1:ManipulateBonePosition( 4, Vector( -1,0,0.5 ) )
										model1:ManipulateBoneScale(2,aa)
										model1:ManipulateBoneScale(3,aa)
										model1:ManipulateBoneScale(4,aa)
										model1:SetBodygroup( 4, 1 )
										model1:SetBodygroup( 5, 1 )
										model1:SetBodygroup( 6, 1 )
										model1:SetBodygroup( 7, 1 )
										model1.stp = 3
									end
								end
								if model1.stp > 1 then
									local aa = (CurTime()*60)%360
									model1:ManipulateBoneAngles( 2, Angle( 0,aa,0 ) )
									model1:ManipulateBoneAngles( 3, Angle( 0,-aa,0 ) )
									model1:ManipulateBoneAngles( 4, Angle( 0,aa,0 ) )
								end
								if model1.stp == 3 then
									if (cyc >= 0.268 and cyc <= 0.279) or (cyc >= 0.423 and cyc <= 0.429) or (cyc >= 0.59 and cyc <= 0.599) or (cyc >= 0.758 and cyc <= 0.764) or (cyc >= 0.926 and cyc <= 0.934) then
										if not model1.ClK_3_ing then model1.ClK_3_t = CurTime() end
										model1.ClK_3_ing = true
									elseif model1.ClK_3_ing then
										model1.ClK_3_ing = nil
									end
									if (cyc >= 0.22 and cyc <= 0.235) or (cyc >= 0.393 and cyc <= 0.399) or (cyc >= 0.561 and cyc <= 0.567) or (cyc >= 0.729 and cyc <= 0.735) or (cyc >= 0.897 and cyc <= 0.902) then
										if not model1.ClK_6_ing then model1.ClK_6_t = CurTime() end
										model1.ClK_6_ing = true
									elseif model1.ClK_6_ing then
										model1.ClK_6_ing = nil
									end
									if (cyc >= 0.349 and cyc <= 0.36) or (cyc >= 0.519 and cyc <= 0.527) or (cyc >= 0.687 and cyc <= 0.695) or (cyc >= 0.854 and cyc <= 0.863) then
										if not model1.ClK_9_ing then model1.ClK_9_t = CurTime() end
										model1.ClK_9_ing = true
									elseif model1.ClK_9_ing then
										model1.ClK_9_ing = nil
									end
									if (cyc >= 0.302 and cyc <= 0.314) or (cyc >= 0.468 and cyc <= 0.479) or (cyc >= 0.636 and cyc <= 0.648) or (cyc >= 0.804 and cyc <= 0.817) or (cyc >= 0.968 and cyc <= 0.977) then
										if not model1.ClK_12_ing then model1.ClK_12_t = CurTime() end
										model1.ClK_12_ing = true
									elseif model1.ClK_12_ing then
										model1.ClK_12_ing = nil
									end
									if model1.ClK_3_t then model1:ManipulateBoneScale(6,Vector( 1,1,1 )*2.7*math.Clamp((model1.ClK_3_t+0.5-CurTime())/0.5,0,1) ) end
									if model1.ClK_6_t then model1:ManipulateBoneScale(7,Vector( 1,1,1 )*2.7*math.Clamp((model1.ClK_6_t+0.5-CurTime())/0.5,0,1) ) end
									if model1.ClK_9_t then model1:ManipulateBoneScale(8,Vector( 1,1,1 )*2.7*math.Clamp((model1.ClK_9_t+0.5-CurTime())/0.5,0,1) ) end
									if model1.ClK_12_t then model1:ManipulateBoneScale(5,Vector( 1,1,1 )*2.7*math.Clamp((model1.ClK_12_t+0.5-CurTime())/0.5,0,1) ) end
								end
							end
						end
						if not model1.tr_1 then
							model1.tr_1 = true model1.tHide = true model1.FtDone = false model1.stp = 0
							pl.AAct_Tmdl1["attm"] = ""
							pl.AAct_Tmdl1["TypAtta"] = -1
							model1.maT_1 = Material("models/actmod/prop/timeticking_gadget/mt_f001")
							model1.maT_2 = Material("models/actmod/prop/timeticking_gadget/mt_f002")
							model1.maT_3 = Material("models/actmod/prop/timeticking_gadget/mt_f02")
							model1.A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
							local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
							if hup then
								if model1.A_SubMF then
									hupf = 1+math.Round(hup- 58.49235534668,3)*0.018
								else
									hupf = 1+math.Round(hup- 60.565292358398,3)*0.018
								end
							else hup = 60
							end
							model1.Tsize = pl.AAct_Tmdl1["size"]*hupf
							model1.hup = hup
							local TGop,GMSc = pl:GetPos(),hupf*pl:GetModelScale()
							model1.GMSc = GMSc
							if model1.A_SubMF then
								model1.PFix = Vector( -1.8*hupf,-3.5*hupf,-1.4 )
								model1.AFix = Angle(-14+(-1+hupf)*20,107-(-1+hupf)*4,0 )
							else
								model1.PFix = Vector( -2.5,-3.3,-1.0 )
								model1.AFix = Angle(-16,103,0 )
							end
							model1:ResetSequence( "clkr" )
							model1:SetBodygroup( 0, 1 )
							pl.AAct_Tmdl1["size"] = 0
							pl.AAct_Tmdl1["Blend"] = 1
							pl.AAct_Tmdl1["pos_fo"] = 0
							pl.AAct_Tmdl1["pos_ri"] = -(5+hup*0.2)
							pl.AAct_Tmdl1["pos_up"] = hup*0.9
							pl.AAct_Tmdl1["ang"] = Angle(0,-90,0 )
							aSetSubMat(model1,0,"models/actmod/prop/timeticking_gadget/mt_f01")
							aSetSubMat(model1,1,"models/actmod/prop/timeticking_gadget/mt_f03")
							aSetSubMat(model1,2,"models/actmod/prop/timeticking_gadget/mt_f04")
							aSetSubMat(model1,3,"models/actmod/prop/timeticking_gadget/mt_f05")
							model1:ManipulateBonePosition( 9, Vector( 0,0,0.3 ) )
							model1:ManipulateBonePosition( 10, Vector( 0,5,0 ) )
							model1:ManipulateBoneScale(10,Vector(0,0,0) )
							model1:ManipulateBonePosition( 2, Vector( 7,-5.5,-2 ) )
							model1:ManipulateBonePosition( 3, Vector( 2,1,-2 ) )
							model1:ManipulateBonePosition( 4, Vector( -1,1,-2 ) )
							model1:ManipulateBonePosition( 5, Vector( 0,7.05,0.1 ) )
							model1:ManipulateBonePosition( 6, Vector( 7.05,0.45,0.1 ) )
							model1:ManipulateBonePosition( 7, Vector( 0,-7.05,0.1 ) )
							model1:ManipulateBonePosition( 8, Vector( -7.05,0.45,0.1 ) )
							model1:ManipulateBoneScale(2,Vector(0,0,0) )
							model1:ManipulateBoneScale(3,Vector(0,0,0) )
							model1:ManipulateBoneScale(4,Vector(0,0,0) )
							model1:ManipulateBoneScale(5,Vector(0,0,0) )
							model1:ManipulateBoneScale(6,Vector(0,0,0) )
							model1:ManipulateBoneScale(7,Vector(0,0,0) )
							model1:ManipulateBoneScale(8,Vector(0,0,0) )
							model1:ManipulateBoneAngles( 6, Angle(0,-90,0 ) )
							model1:ManipulateBoneAngles( 7, Angle(180,-180,0 ) )
							model1:ManipulateBoneAngles( 8, Angle(0,-270,0 ) )
							model1:ManipulateBoneAngles( 9, Angle(0,0,0 ) )
						end
					end
				end
				
				,SDrwO = function(pl,cyc,model1)
					if not IsValid(model1) then return end
					local Asz,QEffects = model1:GetModelScale(),pl:ActMod_QEffects()
					if model1.stp then
						if not model1.DAlf then model1.DAlf = 0 model1.DAlf2 = 0 end
						if not model1.tShw then model1.tShw = CurTime() end
						local timov = math.Clamp( (CurTime() - model1.tShw)/1.1 ,0,1 )
						if timov >= 1 then model1.DAlf = 1 else model1.DAlf = timov end
						if model1.DAlf >= 1 then
							if not model1.tShw2 then model1.tShw2 = CurTime() end
							local timov = math.Clamp( (CurTime() - model1.tShw2)/0.7 ,0,1 )
							if timov >= 1 then model1.DAlf2 = 1 else model1.DAlf2 = timov end
						end
						local PP_pos,PP_ang = model1:GetBonePosition(1)
						local a_pos = PP_pos + PP_ang:Forward()*0.1
						cam.Start3D2D(a_pos, PP_ang + Angle(90, 0, 0), 0.2)
							surface.SetDrawColor(255, 255, 255, 255*model1.DAlf)
							surface.SetMaterial(model1.maT_1)
							surface.DrawTexturedRectRotated(0, 0, 130*Asz, 130*Asz, 90)
							surface.SetDrawColor(240, 200, 150, 255*model1.DAlf2)
							surface.SetMaterial(model1.maT_3)
							surface.DrawTexturedRectRotated(0, 0, 95*Asz, 95*Asz, 90)
						cam.End3D2D()
						cam.Start3D2D(a_pos + PP_ang:Forward()*0.8, PP_ang + Angle(90, 0, 0), 0.2)
							surface.SetDrawColor(255, 230, 210, 255*model1.DAlf)
							surface.SetMaterial(model1.maT_2)
							surface.DrawTexturedRectRotated(0, 0, 130*Asz, 130*Asz, 90)
						cam.End3D2D()
						if QEffects > 1 and AMesh then
							AMesh(
								model1, "pont_2", Vector(0, 5.2*Asz, -0.25*Asz),
								"arc",
								{
									radius = 10.6*Asz,
									innerRadius = 6.5*Asz,
									arcAngle = 150,
									startAngle = -90,
									segments = 15,
									fadeOut = true
									,fadeInner = true
								},
								"xy",
								{
									offsetX = 0, offsetY = 0, rotation = 90,
									scaleX = 0.8, scaleY = 1,
									scrollSpeedX = 0, scrollSpeedY = -1.2,
									centerX = 0.5, centerY = 0.5
								},
								matar,Color(255, 255, 255, 255*model1.DAlf)
							)
						end
						if QEffects > 2 and model1.DAlf2 >= 1 then
							shlwi(model1,5) shlwi(model1,6) shlwi(model1,7) shlwi(model1,8)
							shlwi(model1,10,{nil,{0,-3.1*Asz,0},4*Asz,nil,0.2})
						end
						shlwi(model1,10,{atwg,{0,-3.2*Asz,0},1.7*Asz,{255,255,140},1*model1.DAlf})
						if QEffects > 2 and model1.stp > 2 and model1.DAlf2 > 0 and (model1.DEffTim_1 or 0) < CurTime() then
							model1.DEffTim_1 = CurTime() + math.Rand(0.01,0.1)
							if math.random(0,2) > 0 then aa_affTr(model1,5,{20,22,PP_ang}) end
							if math.random(0,2) > 0 then aa_affTr(model1,6,{10,10,PP_ang+Angle(0,0,-50)}) end
							if math.random(0,2) > 0 then aa_affTr(model1,7,{20,22,PP_ang}) end 
							if math.random(0,2) > 0 then aa_affTr(model1,8,{20,22,PP_ang}) end
						end
					end
				end
			}
		end
	}
	
}