// Stateside (commission)
// 2026-AM4|4437|148635
return{
	["fortnite_goldenglory"] = {
		Config = { Anim = "amod_fortnite_goldenglory_s",Name = "Stateside",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "3.0" }
		,Camera = { Transition = 1.7 } ,Coop = { Sync = true,MaxDist = 320 }
		,Custom = { Anim = { Time2 = 7.8 ,Cycle = 0.0823529411764706 } ,Sound = { Time1 = 16.3,Time2 = 15.6 } }
		,Movement = { Type = 3 ,Speed = 90 ,Motion = { Static = "amod_fortnite_goldenglory_s" ,Walk = "amod_fortnite_goldenglory_w" } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_GoldenGlory_1.mp3" ,Delay = 0.06 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_GoldenGlory_2.mp3" ,Delay = 0.7 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_GoldenGlory_2.mp3" }
		}
		,Models = {
			[1] = { Model = "models/actmod/prop/QuatroAir_Gadget.mdl",Bone = "ValveBiped.Bip01_R_Foot" }
			,[2] = { Model = "models/actmod/prop/QuatroAir_Gadget.mdl",Bone = "ValveBiped.Bip01_L_Foot" }
		}
		,Scrpt = function()
			local function CycG(c,a,b) return math.Remap(math.min(c-a,b),0,b-a,0,1) end
			local function A(aa,k) return 1+(aa-1)*k end
			return {
				SCpt = function(pl,cyc)
					local model1,model2
					if pl.AAct_mdl1 then model1 = pl.AAct_mdl1 end
					if pl.AAct_mdl2 then model2 = pl.AAct_mdl2 end
					if model1 then
						if model1.tr_1 and model1.satp and cyc > 0.001 then
							if model1.tHide and model1.satp == 0 then model1.tHide = nil end
							if model1.satp == 0 then
								if cyc > 0.027 then
									model1:ManipulateBoneScale( 0, model1.GMBScle )
									model1.satp = 1
								elseif cyc > 0.011 then
									model1:ManipulateBoneScale( 0, model1.GMBScle*CycG(cyc,0.009,0.027) )
								end
							end
						end
						if not model1.tr_1 then model1.tr_1 = true model1.tHide = true model1.satp = 0
							model1.GMBScle = Vector(1,1,1)
							model1:ManipulateBoneScale(0,Vector(0,0,0))
							local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
							local hup,h = A_AM.ActMod:GetSizUpEnt(pl,true,true),1,0
							if hup then
								if A_SubMF then
									h = 1+math.Round(hup-58.49235534668,3)*0.011
								else
									h = 1+math.Round(hup-60.565292358398,3)*0.011
								end
							end
							model1.Ghupf = h model1.A_SubMF = A_SubMF
							pl.AAct_Tmdl1["size"] = 1*h
							model1.GMBScle = Vector(1,1,1*A(h,1.3))
							if A_SubMF then
								pl.AAct_Tmdl1.pos_fo = 2.6*A(h,2.4) pl.AAct_Tmdl1.pos_ri = -0.1*h pl.AAct_Tmdl1.pos_up = -4.2*h
								pl.AAct_Tmdl1.ang_p = 90 pl.AAct_Tmdl1.ang_y = 29 pl.AAct_Tmdl1.ang_r = 0
							else
								pl.AAct_Tmdl1.pos_fo = 2.6*h pl.AAct_Tmdl1.pos_ri = -0.3*h pl.AAct_Tmdl1.pos_up = -4.1*h
								pl.AAct_Tmdl1.ang_p = 90 pl.AAct_Tmdl1.ang_y = 33 pl.AAct_Tmdl1.ang_r = 0
							end
						end
					end
					if model2 then
						if model2.tr_1 and model2.satp and cyc > 0.001 then
							if model2.tHide and model2.satp == 0 then model2.tHide = nil end
							if model2.satp == 0 then
								if cyc > 0.027 then
									model2:ManipulateBoneScale( 0, model2.GMBScle )
									model2.satp = 1
								elseif cyc > 0.011 then
									model2:ManipulateBoneScale( 0, model2.GMBScle*CycG(cyc,0.009,0.027) )
								end
							end
						end
						if not model2.tr_1 then model2.tr_1 = true model2.tHide = true model2.satp = 0
							model2:ManipulateBoneScale(0,Vector(0,0,0))
							local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
							local hup,h = A_AM.ActMod:GetSizUpEnt(pl,true,true),1,0
							if hup then
								if A_SubMF then
									h = 1+math.Round(hup-58.49235534668,3)*0.011
								else
									h = 1+math.Round(hup-60.565292358398,3)*0.011
								end
							end
							model2.Ghupf = h model2.A_SubMF = A_SubMF
							pl.AAct_Tmdl2["size"] = 1*h
							model2.GMBScle = Vector(1,1,1*A(h,1.3))
							if A_SubMF then
								pl.AAct_Tmdl2.pos_fo = 2.6*A(h,2.4) pl.AAct_Tmdl2.pos_ri = 0.1*h pl.AAct_Tmdl2.pos_up = -4.2*h
								pl.AAct_Tmdl2.ang_p = 90 pl.AAct_Tmdl2.ang_y = 29 pl.AAct_Tmdl2.ang_r = 0
							else
								pl.AAct_Tmdl2.pos_fo = 2.6*h pl.AAct_Tmdl2.pos_ri = 0.3*h pl.AAct_Tmdl2.pos_up = -4.1*h
								pl.AAct_Tmdl2.ang_p = 90 pl.AAct_Tmdl2.ang_y = 33 pl.AAct_Tmdl2.ang_r = 0
							end
						end
					end
				end
			}
		end
	}
}