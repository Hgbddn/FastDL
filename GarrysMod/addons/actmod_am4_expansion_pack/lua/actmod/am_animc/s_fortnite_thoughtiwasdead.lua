// Thought I Was Dead (commission)
// 2026-AM4|6606|148635
return{
	["fortnite_caninecronutmix"] = {
		Config = {
			Anim = "amod_fortnite_caninecronutmix"
			,Name = "Thought I Was Dead" ,isNew = true ,class = 1
			,CList = {Title="ActMod Commission Hub",OFtn=true}
		}
		,About = {
			Author = "AhmedMake400"
			,Version = "1.6"
		}
		,Camera = { Transition = 1.1 }
		,Custom = {
			Anim = {
				Time2 = 14.8
				,Cycle = 0.223776223776223
			}
			,Sound = {
				Time1 = 19.06667
				,Time2 = 14.8
			}
		}
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CanineCronutMix_1.mp3" ,Delay = 0.201 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CanineCronutMix_2.mp3" ,Delay = 4.26667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CanineCronutMix_2.mp3" }
		}
		,Models = {
			[1] = {
				Model = "models/actmod/prop/CanineCronutMix.mdl"
				,Bone = "ValveBiped.Bip01_L_Hand"
				,Size = 1
			}
		}
		
		,Scrpt = function()
			local AAEffect = A_AM.ActMod.aTabDa_RunCyc["AAEffect"]
			return {
				SCpt = function(pl,cyc,Fram)
					local model1,model2
					if pl.AAct_mdl1 then model1 = pl.AAct_mdl1 end
					if model1 then
						model1:SetCycle( cyc )
						if model1.tr_1 and model1.step and model1.Tsize then
							if not model1.FtDone and cyc > 0.01 then
								if cyc >= 0.25 then
									pl.AAct_mdl1:Remove()
									pl.AAct_mdl1 = nil
									return
								end
								if model1.tHide and model1.step == 0 then model1.tHide = nil end
								if cyc > 0.012 then
									pl.AAct_Tmdl1["size"] = model1.Tsize*math.Remap(math.min(cyc-0.012,0.01),0,0.01,0,1)
									if cyc > 0.012+0.01 then
										pl.AAct_Tmdl1["size"] = model1.Tsize
										model1.FtDone = true
										model1.step = 1
										model1.sC = 0.18881118297577
									end
								end
							elseif model1.FtDone and model1.step > 0 and model1.sC then
								if model1.step == 1 and cyc >= 0.188009 and cyc > 0.18881118297577 then
									pl.AAct_Tmdl1["attm"] = ""
									pl.AAct_Tmdl1["TypAtta"] = -2
									model1.tTGetPos = model1:GetPos()
									model1.tTGetAng = model1:GetAngles()
									model1.step = 2
								elseif model1.step == 2 and cyc >= 0.2237762212753 then
									AAEffect( 1,0.01,pl,{[1] = {["nam"] = "am_eff_ccmix_01" ,["Bone"] = "root",["Scale"] = model1.GMSc,["PoS"] = {0,0,0,0.2} ,["Mdl"] = model1}} )
									model1.step = -1
									pl.AAct_mdl1:Remove()
									pl.AAct_mdl1 = nil
								end
								if IsValid(pl.AAct_mdl1) then
									if model1.tTGetPos and model1.tTGetAng and model1.TblAn then
										if not model1.afaf then
											model1.afaf = true
											local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
											if hup then
												if A_AM.ActMod:AA_SubMF( pl,"F" ) then
													hupf = 1+math.Round(hup- 58.49235534668,3)*0.01
												else
													hupf = 1+math.Round(hup- 60.565292358398,3)*0.01
												end
											else hup = 1
											end
											local TGop,GMSc = pl:GetPos(),hupf*pl:GetModelScale()
											model1.GMSc = GMSc
											model1.TblAn = {
												[1] = TGop+(pl:GetRenderAngles():Forward()*-(15+hup*0.5)+pl:GetRight()*-2+pl:GetUp()*(20+hup*2.4))*GMSc
												,[2] = TGop+(pl:GetRenderAngles():Forward()*-(10+hup*0.9)+Vector(0,0,0.2))*GMSc
											}
										end
										local attc = math.Clamp((cyc - 0.18881118297577)*28.7,0,1)  --print(attc)
										local Pont = math.QuadraticBezier( attc, model1.tTGetPos ,model1.TblAn[1],model1.TblAn[2] )
										local Aont = Lerp(attc,0,400)
										model1:SetPos( Pont )
										model1:SetAngles( model1.tTGetAng + Angle(-Aont,Aont*0.1,Aont*0.5))
										if attc >= 1 then model1.step = -1 end
									end
									if model1.step == -1 or cyc >= 0.22727273404598 then
										AAEffect( 1,0.01,pl,{[1] = {["nam"] = "am_eff_ccmix_01" ,["Bone"] = "root",["Scale"] = model1.GMSc,["PoS"] = {0,0,0,0.2} ,["Mdl"] = model1}} )
										model1.step = -1
										pl.AAct_mdl1:Remove()
										pl.AAct_mdl1 = nil
									end
								end
							end
						end
						if not model1.tr_1 then
							model1.tr_1 = true model1.tHide = true model1.FtDone = false model1.step = 0
							model1.A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
							local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
							if hup then
								if A_AM.ActMod:AA_SubMF( pl,"F" ) then
									hupf = 1+math.Round(hup- 58.49235534668,3)*0.01
								else
									hupf = 1+math.Round(hup- 60.565292358398,3)*0.01
								end
							else hup = 1
							end
							model1.Tsize = pl.AAct_Tmdl1["size"]*hupf
							local TGop,GMSc = pl:GetPos(),hupf*pl:GetModelScale()
							model1.GMSc = GMSc
							model1.TblAn = {
								[1] = TGop+(pl:GetRenderAngles():Forward()*-20+pl:GetRight()*-2+pl:GetUp()*(10+hup*2.4))*GMSc
								,[2] = TGop+(pl:GetRenderAngles():Forward()*-60+Vector(0,0,0.2))*GMSc
							}
							if model1.A_SubMF then
								model1.PFix = Vector( -1.8*hupf,-3.5*hupf,-1.4 )
								model1.AFix = Angle(-14+(-1+hupf)*20,107-(-1+hupf)*4,0 )
							else
								model1.PFix = Vector( -2.5,-3.3,-1.0 )
								model1.AFix = Angle(-16,103,0 )
							end
							model1:ResetSequence( "caninecronutmix_01" )
							model1:ManipulateBonePosition( 2, model1.PFix )
							model1:ManipulateBoneAngles( 2, model1.AFix )
							pl.AAct_Tmdl1["size"] = 0
						end
					end
				end
			}
		end
	}
	
	,["fortnite_caninecronutmix_2"] = {
		Config = {
			Anim = "amod_fortnite_caninecronutmix"
			,Name = "Thought I Was Dead"
			,isNew = true ,class = 1
			,CList = {Title="ActMod Commission Hub",OFtn=true}
		}
		,About = {
			Author = "AhmedMake400"
			,Version = "1.6"
		}
		,Camera = { Transition = 1.1 }
		,Custom = {
			Anim = {
				Time2 = 14.8
				,Cycle = 0.223776223776223
			}
			,Sound = {
				Time1 = 19.06667
				,Time2 = 14.8
			}
		}
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CanineCronutMix_3.mp3" ,Delay = 0.203 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CanineCronutMix_4.mp3" ,Delay = 4.26667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CanineCronutMix_4.mp3" }
		}
		,Models = {
			[1] = {
				Model = "models/actmod/prop/CanineCronutMix.mdl"
				,Bone = "ValveBiped.Bip01_L_Hand"
				,Size = 1
			}
		}
		,Scrpt = function() return { SCpt = "amod_cumact_fortnite_caninecronutmix" } end
	}
	
}