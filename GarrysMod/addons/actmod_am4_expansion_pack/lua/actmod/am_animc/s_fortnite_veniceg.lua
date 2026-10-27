// Balance Board (commission)
// 2026-AM4|8084|148635
return{
	["fortnite_venice"] = {
		Config = {
			Anim = "amod_fortnite_venice"
			,Name = "Balance Board" ,isNew = true ,class = 1
			,CList = {Title="ActMod Commission Hub",OFtn=true}
		}
		,About = { Author = "AhmedMake400",Version = "3.6" }
		,Camera = { Transition = 2.8 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 6.23333 ,Cycle = 0.2336065573770492 } ,Sound = { Time1 = 24.83,Time2 = 23.23 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Venice_Knight_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Venice_Knight_2.mp3" ,Delay = 1.6 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Venice_Knight_2.mp3" }
		}
		,Models = {
			[1] = { Model = "models/actmod/prop/Venice_Gadget.mdl" }
			,[2] = { Model = "models/actmod/prop/Venice_Gadget.mdl",Bone = "ValveBiped.Bip01_L_Hand",Bodygroup = {{0,1},{1,1}} }
		}
		,Scrpt = function()
			local function CycG(c,a,b) return math.Remap(math.min(c-a,b),0,b-a,0,1) end
			local function SePFrm(p,m,c,i,a,b)
				local TEA,t = m.TEdiAni[m.A_SubMF and 2 or 1][i],CycG(c,a,b)
				local TEB = m.TEdiAni[m.A_SubMF and 2 or 1][math.max(i-1,0)]
				p.AAct_Tmdl2.pos_fo = Lerp(t,TEB[1],TEA[1])
				p.AAct_Tmdl2.pos_ri = Lerp(t,TEB[2],TEA[2])
				p.AAct_Tmdl2.pos_up = Lerp(t,TEB[3],TEA[3])
				p.AAct_Tmdl2.ang_p = Lerp(t,TEB[4],TEA[4])
				p.AAct_Tmdl2.ang_y = Lerp(t,TEB[5],TEA[5])
				p.AAct_Tmdl2.ang_r = Lerp(t,TEB[6],TEA[6])
			end
			return {
				SCpt = function(pl,cyc,Fram)
					local model1,model2
					if pl.AAct_mdl1 then model1 = pl.AAct_mdl1 end
					if pl.AAct_mdl2 then model2 = pl.AAct_mdl2 end
					if model1 then
						model1:SetCycle( cyc )
						if model1.tr_1 and model1.step and model1.bfrm and cyc > 0.02 then
							if model1.tHide and model1.step == 0 then model1.tHide = nil end
							if model1.step == 0 then
								if cyc > 0.055 then
									model1:ManipulateBoneScale( 3, model1.GMBScle )
									model1:ManipulateBoneScale( 4, Vector(1,1,1) )
									model1.step = 1
								elseif cyc > 0.03 then
									model1:ManipulateBoneScale( 3, model1.GMBScle*math.Remap(math.min(cyc-0.03,0.025),0,0.025,0,1) )
									model1:ManipulateBoneScale( 4, Vector(1,1,1)*math.Remap(math.min(cyc-0.03,0.025),0,0.025,0,1) )
								end
							end
							if model1.step == 1 then
								if cyc > 0.51 then
									local bone = pl:LookupBone("ValveBiped.Bip01_Pelvis")
									if bone then
										if cyc > 0.7173 and cyc < 0.7552 then
											pl:ManipulateBonePosition(bone,Vector(0,0,0))
										elseif cyc >= 0.7043 and cyc < 0.7552 then
											pl:ManipulateBonePosition(bone,Vector(0,0,Lerp(CycG(cyc,0.7043,0.7173),model1.adzup*0.8,0)))
										elseif cyc > 0.6817 and cyc < 0.7043 then
											pl:ManipulateBonePosition(bone,Vector(0,0,Lerp(CycG(cyc,0.6817,0.7043),model1.adzup,model1.adzup*0.8)))
										elseif cyc >= 0.6038 and cyc < 0.6817 then
											pl:ManipulateBonePosition(bone,Vector(0,0,model1.adzup))
										elseif cyc >= 0.5768 and cyc < 0.6038 then
											pl:ManipulateBonePosition(bone,Vector(0,0,Lerp(CycG(cyc,0.5768,0.6038),model1.adzup*0.8,model1.adzup)))
										elseif cyc > 0.5465 and cyc < 0.5768 then
											pl:ManipulateBonePosition(bone,Vector(0,0,model1.adzup*0.8)*CycG(cyc,0.5465,0.5768))
										end
									end
								end
								if model2 and cyc > 0.4 then
									local bone = pl:LookupBone("ValveBiped.Bip01_L_Hand")
									if bone then
										if cyc < 0.48 or cyc > 0.941 and model1.nfrm == 1 then
											model1.nfrm = 0 model1.bfrm = 0
											model1:SetBodygroup(0,0) model2:SetBodygroup(0,1)
											SePFrm(pl,model1,0,0,0,1)
										elseif cyc > 0.9262 and cyc < 0.94 then model1.nfrm = 1
											if model1.bfrm == 0 then model1.bfrm = 1 model1:SetBodygroup(0,1) model2:SetBodygroup(0,0) end
											SePFrm(pl,model1,cyc,6,0.9262,0.94)
										elseif cyc > 0.9054 and cyc < 0.9262 then model1.nfrm = 1
											if model1.bfrm == 0 then model1.bfrm = 1 model1:SetBodygroup(0,1) model2:SetBodygroup(0,0) end
											SePFrm(pl,model1,cyc,5,0.9054,0.9262)
										elseif cyc > 0.7459 and cyc < 0.7571 then model1.nfrm = 1
											if model1.bfrm == 0 then model1.bfrm = 1 model1:SetBodygroup(0,1) model2:SetBodygroup(0,0) end
											SePFrm(pl,model1,cyc,4,0.7459,0.7571)
										elseif cyc > 0.7239 and cyc < 0.7459 then model1.nfrm = 1
											if model1.bfrm == 0 then model1.bfrm = 1 model1:SetBodygroup(0,1) model2:SetBodygroup(0,0) end
											SePFrm(pl,model1,cyc,3,0.7239,0.7459)
										elseif cyc > 0.6741 and cyc < 0.6981 then model1.nfrm = 1
											if model1.bfrm == 0 then model1.bfrm = 1 model1:SetBodygroup(0,1) model2:SetBodygroup(0,0) end
											SePFrm(pl,model1,cyc,2,0.6741,0.6981)
										elseif cyc > 0.525 and cyc < 0.548 then model1.nfrm = 1
											if model1.bfrm == 0 then model1.bfrm = 1 model1:SetBodygroup(0,1) model2:SetBodygroup(0,0) end
											SePFrm(pl,model1,cyc,1,0.525,0.548)
										elseif cyc > 0.48 and cyc < 0.5 then model1.nfrm = 1
											SePFrm(pl,model1,cyc,0,0.48,0.48)
										end
									end
								end
							end
							if model1.cSSnd > 0 and cyc > 0.8 then model1.cSSnd = 0
							elseif model1.cSSnd < 2 and cyc > 0.336 and cyc < 0.4 then model1.cSSnd = 2
								A_AM.ActMod:C_StopSond(pl,"3") A_AM.ActMod:A_aSond(pl,"actmod/i_act/am4/fortnite/Emote_Venice_Knight_4.mp3","3",74,"0")
							elseif model1.cSSnd < 3 and cyc > 0.66 and cyc < 0.7 then model1.cSSnd = 3
								A_AM.ActMod:C_StopSond(pl,"3") A_AM.ActMod:A_aSond(pl,"actmod/i_act/am4/fortnite/Emote_Venice_Knight_5.mp3","3",74,"0")
							elseif model1.cSSnd == 0 and cyc > 0.0369 and cyc < 0.1 then model1.cSSnd = 1
								A_AM.ActMod:C_StopSond(pl,"3") A_AM.ActMod:A_aSond(pl,"actmod/i_act/am4/fortnite/Emote_Venice_Knight_6.mp3","3",74,"0")
							end

						end
						if not model1.tr_1 then model1.tr_1 = true model1.ra_1 = true model1.tHide = true model1.step = 0
							model1:ResetSequence( "Venice" )
							model1.GMBScle = Vector(1,0.8,1)
							model1:ManipulateBoneScale( 3, Vector(0,0,0) )
							model1:ManipulateBoneScale( 4, Vector(0,0,0) )
							local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
							local hup,h,u = A_AM.ActMod:GetSizUpEnt(pl,true,true),1,0
							local HPe = A_AM.ActMod:CBoneAniDistance( pl,"amod_fortnite_venice",0.604,"ValveBiped.Bip01_R_Hand","Vector()",true)["VectorUp_1-0"] or 0
							if A_SubMF then
								if hup then h = 1+math.Round(hup- 58.49235534668,3)*0.009 end
								u = math.Round(HPe- 19.381914138794,3)*0.9
							else
								if hup then h = 1+math.Round(hup- 60.565292358398,3)*0.009 end
								u = math.Round(HPe- 19.349161148071,3)*0.9
							end
							model1.Ghupf = h model1.adzup = -u*1.1 model1.nfrm = 0 model1.bfrm = 0 model1.cSSnd = 0 model1.A_SubMF = A_SubMF
							pl.AAct_Tmdl1["size"] = pl.AAct_Tmdl1["size"]*h
							model1.TEdiAni = {
								[1] = {
									[0] = {-11.5*h,-1*h,-8.2*h,-50,115,25}
									,[1] = {-10.5*h,4*h,-1.2*h,-95,140,-20}
									,[2] = {-10.5*h,4*h,-1.2*h,-95,140,10}
									,[3] = {-6.5*h,0*h,-3.6*h,-70,50,30}
									,[4] = {-4*h,0*h,-2.5*h,-90,10,5}
									,[5] = {-9.5*h,0*h,-3.5*h,-90,100,5}
									,[6] = {-9.5*h,2*h,-8.5*h,-60,60,50}
								}
								,[2] = {
									[0] = {-11.5*h,-1*h,-8.2*h,-50,115,25}
									,[1] = {-10.5*h,4*h,-1.6*h,-95,140,-20}
									,[2] = {-10.5*h,4*h,-1.6*h,-95,140,10}
									,[3] = {-6.5*h,0*h,-3.9*h,-70,50,30}
									,[4] = {-4*h,0*h,-3*h,-90,23,5}
									,[5] = {-9.5*h,0*h,-3.5*h,-90,100,5}
									,[6] = {-9.5*h,2*h,-8.5*h,-60,60,50}
								}
							}
							model1:SetBodygroup(0,0)
						end
						if model2 and not model2.tr_1 then model2.tr_1 = true model2:SetBodygroup(0,1) model2:ManipulateBoneScale( 3, Vector(1,0.8,1) ) pl.AAct_Tmdl2["size"] = pl.AAct_Tmdl1["size"] end
					end
				end
			}
		end
	}
}