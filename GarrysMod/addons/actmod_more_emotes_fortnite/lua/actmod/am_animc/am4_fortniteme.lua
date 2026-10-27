// Emotes Fortnite
// 2026-AM4|59596|10101|Il|AM4
return{
// v1.0
	["fortnite_tangle"] = {
		Config = {
			Anim = "amod_fortnite_tangle",Name = "Dreamy Keys",class = 1
			,CList = { Title = "More Emotes Fortnite",Icon = "actmod/imenu/is_fortnite.png",Background = "actmod/b/fortnite_b.jpg",BColor = Color(255, 255, 255, 20) }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 8.3,Cycle = 0.08602150529623 },Sound = { Time1 = 34,Time2 = 33.2 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Tangle_Music_Intro.mp3",Delay = 0.03 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Tangle_Music_Loop.mp3",Delay = 0.8 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Tangle_Music_Loop.mp3" }
		}
	}
	
	,["fortnite_fresh"] = {
		Config = { Anim = "amod_fortnite_fresh",Name = "Fresh",class = 1,Repeat = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Coop = { Sync = true } ,Camera = { Transition = 1.5 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/emote_fresh_music01.mp3" } }
	}

	,["fortnite_bbd"] = {
		Config = { Anim = "amod_fortnite_bbd",Name = "Billy Bounce",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.5" }
		,Camera = { Transition = 1.5 } ,Coop = { Sync = true,MaxDist = 200 }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 11.23333*2 } }
		,Movement = { Type = 3 ,Speed = 57 ,Motion = { Static = "amod_fortnite_bbd",Walk = "amod_fortnite_bbd_walk" } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_BillyBounce_01.mp3" } }
	}
	
	,["fortnite_outburst"] = {
		Config = { Anim = "amod_fortnite_outburst",Name = "Lo-fi Headbang",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 6.23333,Cycle = 0.24596774578094 },Sound = { Time1 = 8.26666,Time2 = 6.23333 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Outburst_Music_1.mp3",Delay = 0 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Outburst_Music_2.mp3",Delay = 2.03333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Outburst_Music_2.mp3" }
		}
	}
	
	,["fortnite_hi_five"] = {
		Config = { Anim = "amod_fortnite_hi_five_1",Name = "High Five",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.7" } ,Camera = { Transition = 1 }
		,Custom = { Anim = { Time2 = 0.66667,Cycle = 0.6 } }
		,Coop = {
			Sync = true,Reverse = true,ReplaySelf = true
			,YourAnim = "fortnite_hi_five_s1",OtherAnim = "fortnite_hi_five_s2"
			,NoRepetition = true,MaxPlayers = 1,SoundOther = true
			,AddAngY_You = 20,AddAngY_Other = 20
			,TryFixPos = {
				["+Forward"] = true,["*add"] = 1.05
				,["Ani1"] = "amod_fortnite_hi_five_2" ,["Ani2"] = "amod_fortnite_hi_five_2" ,["Cycl"] = 0.4
				,["Bip1"] = "ValveBiped.Bip01_R_Hand" ,["Bip2"] = "ValveBiped.Bip01_R_Hand"
			}
		}
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_High_Five_0.mp3",Delay = 0.1 } }
	}
	,["fortnite_hi_five_s1"] = {
		Config = { Anim = "amod_fortnite_hi_five_2",Name = "High Five",class = -1,Repeat = false,DontAllowAng=true }
		,Camera = { Transition = 2 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_High_Five_2.mp3" ,Delay = 0 } }
	}
	,["fortnite_hi_five_s2"] = {
		Config = { Anim = "amod_fortnite_hi_five_2",Name = "High Five",class = -1 ,Repeat = false,DontAllowAng=true }
		,Camera = { Transition = 2 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_High_Five_1.mp3" ,Delay = 0 } }
	}
	
	,["fortnite_asteroid"] = {
		Config = { Anim = "amod_fortnite_asteroid",Name = "Deep Explorer",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 12.8,Cycle = 0.03274559 },Sound = { Time1 = 13.23333,Time2 = 12.8 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Asteroid_I.mp3",Delay = 0.05 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Asteroid_L.mp3",Delay = 0.45 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Asteroid_L.mp3" }
		}
	}
	
	,["fortnite_zippy"] = {
		Config = { Anim = "amod_fortnite_zippy" ,Name = "Rambunctious",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true,MaxDist = 200 }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 3.66667*2 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/emote_zippy_01.mp3" } }
	}
	
	,["fortnite_happywave"] = {
		Config = { Anim = "amod_fortnite_happywave",Name = "Hello Friend",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 2.33333,Cycle = 0.22222 },Sound = { Time1 = 2.33333 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_HappyWave_L.mp3",Delay = 0.66667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_HappyWave_L.mp3" }
		}
	}



// v2.0
	,["fortnite_kelplinen_c"] = {
		Config = { Anim = "amod_fortnite_kelplinen_c",Name = "Empty Out Your Pockets",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 10.43333,Cycle = 0.0339506172839506 },Sound = { Time1 = 21.23333,Time2 = 20.86666 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_KelpLinen_C_Intro.mp3",Delay = 0 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_KelpLinen_C_Loop.mp3",Delay = 0.36667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_KelpLinen_C_Loop.mp3" }
		}
	}
	
	,["fortnite_electroswing"] = {
		Config = { Anim = "amod_fortnite_electroswing",Name = "Electro Swing",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 16 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emotes_ElectroSwing.mp3" } }
	}
	
	,["fortnite_halftime"] = {
		Config = { Anim = "amod_fortnite_halftime",Name = "Oblivion",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 6.16667,Cycle = 0.07960199004975 },Sound = { Time1 = 24.66667 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_HalfTime_L.mp3" } }
	}
	
	,["fortnite_telenovela"] = {
		Config = { Anim = "amod_fortnite_telenovela",Name = "Havana",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "2.1" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true,MaxDist = 300 }
		,Custom = { Anim = { Time2 = 9.13333,Cycle = 0.06164383561643 },Sound = { Time1 = 19.26,Time2 = 18.66 } }
		,Movement = { Type = 3 ,Speed = 40 ,Motion = { Static = "amod_fortnite_telenovela",Walk = "amod_fortnite_telenovela_walk" } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Telenovela_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Telenovela_2.mp3" ,Delay = 0.6 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Telenovela_2.mp3" }
		}
	}
	
	,["fortnite_ogrunningman"] = {
		Config = { Anim = "amod_fortnite_ogrunningman",Name = "Old School",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.2" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 31.19 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_OGRunningMan_01.mp3" } }
	}
	
	,["fortnite_dancediscot3"] = {
		Config = { Anim = "amod_fortnite_dancediscot3",Name = "Disco Fever",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.3" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 8.76667 ,Cycle = 0.02230483271375 },Sound = { Time1 = 8.54 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Disco.mp3" ,Delay = 0.4 } }
	}
	
	,["fortnite_tinytremors"] = {
		Config = { Anim = "amod_fortnite_tinytremors",Name = "Tiniest Violin",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 11.53333,Cycle = 0.13715710723192 },Sound = { Time1 = 24.90,Time2 = 23.27 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_TinyTremor_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_TinyTremor_2.mp3" ,Delay = 1.63 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_TinyTremor_2.mp3" }
		}
	}

	,["fortnite_kpopdance_03"] = {
		Config = { Anim = "amod_fortnite_kpopdance_03",Name = "Scenario",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.2" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 32.54 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_KPopDance03.mp3" } }
	}



// v3.0
	,["fortnite_intensity"] = {
		Config = { Anim = "amod_fortnite_intensity",Name = "Intensity",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.1 }
		,Custom = { Anim = { Time2 = 5.33333,Cycle = 0.50920245398773 },Sound = { Time1 = 35.26333,Time2 = 28.23 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/emote_Intensity_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/emote_Intensity_2.mp3" ,Delay = 7.03333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/emote_Intensity_2.mp3" }
		}
	}
	
	,["fortnite_fancyfeet"] = {
		Config = { Anim = "amod_fortnite_fancyfeet",Name = "Fancy Feet",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 16.83 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emotes_LankyLegs_02.mp3" } }
	}
	
	,["fortnite_chirpingcrickets"] = {
		Config = { Anim = "amod_fortnite_chirpingcrickets",Name = "Buddy Holly",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.1 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 15.86666,Cycle = 0.03643724696356 },Sound = { Time1 = 16.46666,Time2 = 15.86666 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_ChirpingCrickets_1.mp3" ,Delay = 0.05 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_ChirpingCrickets_2.mp3" ,Delay = 0.6 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_ChirpingCrickets_2.mp3" }
		}
	}
	
	,["fortnite_dimeblanketgrace"] = {
		Config = { Anim = "amod_fortnite_dimeblanketgrace",Name = "Please Please Please",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.2" } ,Camera = { Transition = 1.1 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 8.96667,Cycle = 0.08191126279863 },Sound = { Time1 = 36.66668,Time2 = 35.86668 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_DimeBlanketGrace_1.mp3" ,Delay = 0.05 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_DimeBlanketGrace_2.mp3" ,Delay = 0.8 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_DimeBlanketGrace_2.mp3" }
		}
	}
	
	,["fortnite_repetition"] = {
		Config = { Anim = "amod_fortnite_repetition",Name = "Social Climber",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.1 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.4,Cycle = 0.07883817427385 },Sound = { Time1 = 30.23333,Time2 = 29.6 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Repetition_1.mp3" ,Delay = 0.05 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Repetition_2.mp3" ,Delay = 0.63333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Repetition_2.mp3" }
		}
	}
	
	,["fortnite_essayviewmyth"] = {
		Config = { Anim = "amod_fortnite_essayviewmyth",Name = "The Tylil Dance",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.1 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 13.33333,Cycle = 0.04306220095693 },Sound = { Time1 = 35.35,Time2 = 34.85 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_EssayViewMyth.mp3" ,Delay = 0.5 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_EssayViewMyth.mp3" }
		}
	}
	
	,["fortnite_tampatwostep"] = {
		Config = { Anim = "amod_fortnite_tampatwostep",Name = "two",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.53333,Cycle = 0.069958850741386 },Sound = { Time1 = 15.6367,Time2 = 15.07 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_TampaTwoStep_1.mp3" ,Delay = 0.2 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_TampaTwoStep_2.mp3" ,Delay = 0.56667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_TampaTwoStep_2.mp3" }
		}
	}
	
	,["fortnite_artgiant"] = {
		Config = { Anim = "amod_fortnite_artgiant",Name = "Toosie Slide",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 35.2 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Art_Giant01.mp3" } }
	}



// v4.0
	,["fortnite_livinglarge"] = {
		Config = { Anim = "amod_fortnite_livinglarge",Name = "Living Large",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 16.53333 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/emote_LivingLarge_A.mp3" } }
	}
	
	,["fortnite_wiggle"] = {
		Config = { Anim = "amod_fortnite_wiggle",Name = "Wiggle",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 2 }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 5.16 } }
		,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Wiggle_Music_Loop.mp3" } }
	}
	
	,["fortnite_afterparty"] = {
		Config = { Anim = "amod_fortnite_afterparty_1",Name = "Disco (Surf Curse)",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "2.1" } ,Camera = { Transition = 1 }
		,Custom = { Anim = { Time2 = 11.06667,Cycle = 0.034883720930232 },Sound = { Time1 = 22.533,Time2 = 22.133 } }
		,Coop = {
			Sync = true,Reverse = true,MaxPlayers = 1
			,YourAnim = "fortnite_afterparty" ,OtherAnim = "fortnite_afterparty_follw"
			,TryFixPos = {
				["+Forward"] = true,["*add"] = 1.3,["+add"] = 8,["Cycl"] = 0
				,["Ani1"] = "amod_fortnite_afterparty_1" ,["Ani2"] = "amod_fortnite_afterparty_2"
				,["Bip1"] = "ValveBiped.Bip01_L_Foot" ,["Bip2"] = "ValveBiped.Bip01_L_Foot"
			}
		}
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Afterparty_1.mp3" ,Delay = 0.03 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Afterparty_2.mp3" ,Delay = 0.4 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Afterparty_2.mp3" }
		}
	}
	,["fortnite_afterparty_follw"] = {
		Config = { Anim = "amod_fortnite_afterparty_2" ,Name = "Disco (Surf Curse) <Follow>" ,class = -1 }
		,Camera = { Transition = 2 } ,Custom = { Anim = { Time2 = 11.06667 ,Cycle = 0.034883720930232 } }
	}
	
	,["fortnite_oilpaint"] = {
		Config = { Anim = "amod_fortnite_oilpaint",Name = "Pay it Off",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 12.4,Cycle = 0.041237113402061 },Sound = { Time1 = 50.13333,Time2 = 49.6 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_OilPaint_1.mp3" ,Delay = 0.03 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_OilPaint_2.mp3" ,Delay = 0.53333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_OilPaint_2.mp3" }
		}
	}
	
	,["fortnite_teenspirit"] = {
		Config = { Anim = "amod_fortnite_teenspirit",Name = "Song 2",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.4,Cycle = 0.059322033898305 },Sound = { Time1 = 18.87667,Time2 = 18.41 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_TeenSpirit_1.mp3" ,Delay = 0.03 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_TeenSpirit_2.mp3" ,Delay = 0.46667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_TeenSpirit_2.mp3" }
		}
	}
	
	,["fortnite_clerks"] = {
		Config = { Anim = "amod_fortnite_clerks",Name = "Keep Me Satisfied",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 8,Cycle = 0.055118110236220 },Sound = { Time1 = 16.46667,Time2 = 16} }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Clerks_1.mp3" ,Delay = 0.03 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Clerks_2.mp3" ,Delay = 0.46667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Clerks_2.mp3" }
		}
	}
	
	,["fortnite_timberstakesoul"] = {
		Config = { Anim = "amod_fortnite_timberstakesoul",Name = "Mingle Game Dance",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 12.23333,Cycle = 0.215811965811965 },Sound = { Time1 = 27.83333,Time2 = 24.46666} }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_TimberStakeSoul_1.mp3" ,Delay = 0.17 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_TimberStakeSoul_2.mp3" ,Delay = 3.36667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_TimberStakeSoul_2.mp3" }
		}
	}
	
	,["fortnite_bygone"] = {
		Config = { Anim = "amod_fortnite_bygone",Name = "Take On Me",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 11.4,Cycle = 0.044692737430167 },Sound = { Time1 = 11.93333,Time2 = 11.4} }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Bygone_1.mp3"  }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Bygone_2.mp3" ,Delay = 0.53333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Bygone_2.mp3" }
		}
	}



// v5.0
	,["fortnite_ashtonboardwalk"] = {
		Config = {
			Anim = "amod_fortnite_ashtonboardwalk"
			,Name = "Widow’s Pirouette" ,class = 1 ,Repeat = false
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 3 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_AshtonBoardwalk.mp3" ,Delay = 0.06 } }
	}
	
	,["fortnite_bangthepan"] = {
		Config = {
			Anim = "amod_fortnite_bangthepan"
			,Name = "Pandemonium" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.8" }
		,Camera = { Transition = 3 }
		,Custom = { Anim = { Time1 = 3.2 ,Cycle = 0 },Sound = { Time1 = 3.2 } }
		,Movement = { Type = 3 ,Speed = 126 ,Motion = { Static = "amod_fortnite_bangthepan",Walk = "amod_fortnite_bangthepan_walk" } }
		,Sounds = { Start = { Sound = {"actmod/i_act/am4/fortnite/Emote_BangThePan_1.mp3","actmod/i_act/am4/fortnite/Emote_BangThePan_2.mp3","actmod/i_act/am4/fortnite/Emote_BangThePan_3.mp3"} } }
		,Models = {
			[1] = { Model = "models/actmod/prop/potAndspoon_spoon.mdl",Bone = "ValveBiped.Bip01_R_Hand",Vector = {-4,-0.3,-2.5},Angle = {50,140,40},Size = 1 }
			,[2] = { Model = "models/actmod/prop/potAndspoon_pot.mdl",Bone = "ValveBiped.Bip01_L_Hand",Vector = {-1.8,2.9,-1.3},Angle = {-90,0,95},Size = 1 }
		}
	}
	
	,["fortnite_icedout"] = {
		Config = {
			Anim = "amod_fortnite_icedout"
			,Name = "all red" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 6.73333,Cycle = 0.060465116279069 },Sound = { Time1 = 13.9,Time2 = 13.46667} }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_IcedOut_1.mp3" ,Delay = 0.001 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_IcedOut_2.mp3" ,Delay = 0.43333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_IcedOut_2.mp3" }
		}
	}
	
	,["fortnite_duckteacher"] = {
		Config = {
			Anim = "amod_fortnite_duckteacher"
			,Name = "Everybody Loves Me" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 2.1 }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 22.66667 } }
		,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_DuckTeacher.mp3" } }
	}
	
	,["fortnite_lineage"] = {
		Config = {
			Anim = "amod_fortnite_lineage"
			,Name = "Dancery" ,class = 1 ,Repeat = true
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400" ,Version = "1.0" }
		,Camera = { Transition = 2.5 }
		,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Lineage.mp3" } }
	}
	
	,["fortnite_statuepose"] = {
		Config = {
			Anim = "amod_fortnite_statuepose"
			,Name = "Statuesque" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.1 }
		,Custom = { Anim = { Time2 = 7.93333,Cycle = 0.206666666666666 },Sound = { Time1 = 39.05,Time2 = 37.05} }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_StatuePose_1.mp3" ,Delay = 0.001 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_StatuePose_2.mp3" ,Delay = 2 }  --2.06667
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_StatuePose_2.mp3" }
		}
	}
	
	,["fortnite_marat"] = {
		Config = {
			Anim = "amod_fortnite_marat"
			,Name = "Hot Marat" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 3.73333,Cycle = 0.164179104477611 },Sound = { Time1 = 15.73,Time2 = 15 } }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_WIR_1.mp3" ,Delay = 0.001 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_WIR_2.mp3" ,Delay = 0.73333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_WIR_2.mp3" }
		}
	}
	
	,["fortnite_trex"] = {
		Config = {
			Anim = "amod_fortnite_trex"
			,Name = "Rawr" ,class = 1 ,Repeat = false
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 3 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Dino_Complete.mp3" ,Delay = 0.03 } }
	}



// v6.0
	,["fortnite_caffeine"] = {
		Config = { Anim="amod_fortnite_caffeine",Name="Caffeinated",class=1,CList={Title="More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.2" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 9.2,Cycle = 0.061224489795918 } ,Sound = { Time1 = 18.97,Time2 = 18.40 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Caffeine_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Caffeine_2.mp3" ,Delay = 0.57 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Caffeine_2.mp3" }
		}
	}
	
	,["fortnite_camelgram"] = {
		Config = { Anim = "amod_fortnite_camelgram",Name = "Peaceful Hips",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 13.73333,Cycle = 0.067873303167420 } ,Sound = { Time1 = 7.07,Time2 = 6.87 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CamelGram_1.mp3" ,Delay = 0.05 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CamelGram_2.mp3" ,Delay = 0.2 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CamelGram_2.mp3" }
		}
	}
	
	,["fortnite_coronation"] = {
		Config = { Anim = "amod_fortnite_coronation",Name = "Firework" ,class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.73333,Cycle = 0.114503816793893 } ,Sound = { Time1 = 16.45,Time2 = 15.45 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Coronation_1.mp3" ,Delay = 0.02 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Coronation_2.mp3" ,Delay = 1.0 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Coronation_2.mp3" }
		}
	}
	
	,["fortnite_highlife"] = {
		Config = { Anim = "amod_fortnite_highlife" ,Name = "Sucker" ,class = 1 ,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.3" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 6.96667,Cycle = 0.11063829787234 } ,Sound = { Time1 = 28.73335,Time2 = 27.86668 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_HighLife_1.mp3" ,Delay = 0.01 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_HighLife_2.mp3" ,Delay = 0.86667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_HighLife_2.mp3" }
		}
	}
	
	,["fortnite_crabdance"] = {
		Config = { Anim = "amod_fortnite_crabdance",Name = "Crabby" ,class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.8 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 30.4 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CrabDance_01.mp3" } }
	}
	
	,["fortnite_polkaskate"] = {
		Config = { Anim = "amod_fortnite_polkaskate",Name = "Wednesday's Dance" ,class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.2" } ,Camera = { Transition = 1.8 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 6.73333,Cycle = 0.090090090090090 } ,Sound = { Time1 = 20.86669,Time2 = 20.19999 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_PolkaSkate_1.mp3" ,Delay = 0.31 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_PolkaSkate_2.mp3" ,Delay = 0.66667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_PolkaSkate_2.mp3" }
		}
	}
	
	,["fortnite_socks"] = {
		Config = { Anim = "amod_fortnite_socks",Name = "Socks" ,class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 1.8 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.4,Cycle = 0.231833910034602 } ,Sound = { Time1 = 9.63333,Time2 = 7.4 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Socks_1.mp3" ,Delay = 0.362 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Socks_2.mp3" ,Delay = 2.23333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Socks_2.mp3" }
		}
	}
	
	,["fortnite_flamingpants"] = {
		Config = { Anim = "amod_fortnite_flamingpants" ,Name = "Liar" ,class = 1 ,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.6 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 8.4,Cycle = 0.112676056338028 } ,Sound = { Time1 = 34.66667,Time2 = 33.6 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_FlamingPants_1.mp3" ,Delay = 0.05 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_FlamingPants_2.mp3" ,Delay = 1.06667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_FlamingPants_2.mp3" }
		}
	}



// v7.0
	,["fortnite_vegas"] = {
		Config = {
			Anim = "amod_fortnite_vegas"
			,Name = "Let's Get It Started" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 9.13333,Cycle = 0.064846416382252 } ,Sound = { Time1 = 28.03332,Time2 = 27.39999 } }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Vegas_1.mp3" ,Delay = 0.05 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Vegas_2.mp3" ,Delay = 0.63333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Vegas_2.mp3" }
		}
	}
	
	,["fortnite_scrolls"] = {
		Config = {
			Anim = "amod_fortnite_scrolls"
			,Name = "Starting Prance" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 11.66667,Cycle = 0.074074074074074 } ,Sound = { Time1 = 24.2666,Time2 = 23.33334 } }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Scrolls_1.mp3" ,Delay = 0.221 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Scrolls_2.mp3" ,Delay = 0.93333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Scrolls_2.mp3" }
		}
	}
	
	,["fortnite_springbreak"] = {
		Config = {
			Anim = "amod_fortnite_springbreak"
			,Name = "Sparrow Run" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.7" }
		,Camera = { Transition = 2 }
		,Custom = { Anim = { Time1 = 4.16667 ,Cycle = 0 },Sound = { Time1 = 31.379 } }
		,Movement = { Type = 3 ,Speed = 164 ,Motion = { Static = "amod_fortnite_springbreak",Walk = "amod_fortnite_springbreak_walk" } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_SpringBreak_01.mp3" } }
	}
	
	,["fortnite_gracious"] = {
		Config = {
			Anim = "amod_fortnite_gracious"
			,Name = "HUMBLE" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 6.4,Cycle = 0.067961165048543 } ,Sound = { Time1 = 13.26667,Time2 = 12.8 } }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Gracious_1.mp3" ,Delay = 0.01 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Gracious_2.mp3" ,Delay = 0.46667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Gracious_2.mp3" }
		}
	}
	
	,["fortnite_brokenspot"] = {
		Config = {
			Anim = "amod_fortnite_brokenspot"
			,Name = "KEHLANI" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 11.96667,Cycle = 0.032345013477088 } ,Sound = { Time1 = 12.36667,Time2 = 11.96667 } }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_BrokenSpot_1.mp3" ,Delay = 0.03 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_BrokenSpot_2.mp3" ,Delay = 0.4 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_BrokenSpot_2.mp3" }
		}
	}
	
	,["fortnite_infinidab"] = {
		Config = {
			Anim = "amod_fortnite_infinidab"
			,Name = "Infinite Dab" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 1.06667,Cycle = 0.418181818181818 } ,Sound = { Time1 = 16.22667,Time2 = 15.46 } }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_infinidab_1.mp3" ,Delay = 0.3 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_infinidab_2.mp3" ,Delay = 0.76667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_infinidab_2.mp3" }
		}
	}
	
	,["fortnite_sunburst"] = {
		Config = {
			Anim = "amod_fortnite_sunburst"
			,Name = "Stay Afloat" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.6" }
		,Camera = { Transition = 1 }
		,Custom = { Anim = { Time2 = 11.26667,Cycle = 0.045197740112994 },Sound = { Time1 = 11.8,Time2 = 11.26667 } }
		,Movement = { Type = 3 ,Speed = 109 ,Motion = { Static = "amod_fortnite_sunburst",Walk = "amod_fortnite_sunburst_walk" } }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_SunBurst_01.mp3" ,Delay = 0.53333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_SunBurst_01.mp3" }
		}
	}
	
	,["fortnite_sundayspider"] = {
		Config = {
			Anim = "amod_fortnite_sundayspider"
			,Name = "Just a Girl" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 8.86667,Cycle = 0.056737588652482 },Sound = { Time1 = 18.13333,Time2 = 17.6 } }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_SundaySpider_1.mp3" ,Delay = 0.14 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_SundaySpider_2.mp3" ,Delay = 0.53333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_SundaySpider_2.mp3" }
		}
	}



// v8.0
	,["fortnite_danceloser"] = {
		Config = {
			Anim = "amod_fortnite_danceloser"
			,Name = "Take The L" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 2 }
		,Custom = { Sound = { Time1 = 12.625 } }
		,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emotes_TakeTheL01.mp3" } }
	}
	
	,["fortnite_shoot"] = {
		Config = {
			Anim = "amod_fortnite_shoot"
			,Name = "Hype" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.4 }
		,Custom = { Sound = { Time1 = 13.43 } }
		,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emotes_Shoot_v7.mp3" } }
	}
	
	,["fortnite_ebony"] = {
		Config = {
			Anim = "amod_fortnite_ebony"
			,Name = "Standing Bow" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 2.5 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emot_Ebony_Start.mp3" } }
	}
	
	,["fortnite_baskisle"] = {
		Config = {
			Anim = "amod_fortnite_baskisle"
			,Name = "Search for Clues" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "2.6" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 7.7,Cycle = 0.115384615384615 } ,Sound = { Time1 = 16.36667,Time2 = 15.40 } }
		,Movement = { Type = 3 ,Speed = 50 ,Motion = { Static = "amod_fortnite_baskisle",Walk = "amod_fortnite_baskisle_w" } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_BaskIsle_1.mp3" ,Delay = 0.015 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_BaskIsle_2.mp3" ,Delay = 0.96667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_BaskIsle_2.mp3" }
		}
		,Models = { [1] = { Model = "models/actmod/prop/BaskIsle_Axe.mdl",Bone = "ValveBiped.Bip01_R_Hand",Vector = {2.5,-0.6,2},Angle = {170,-15,10} } }
	}
	
	,["fortnite_crackshot"] = {
		Config = {
			Anim = "amod_fortnite_crackshot"
			,Name = "Crackdown" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.5" }
		,Camera = { Transition = 1.6 }
		,Custom = { Anim = { Time1 = 6.66667 ,Cycle = 0 } ,Sound = { Time1 = 26.66667 } }
		,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CrackShot_03.mp3" } }
	}
	
	,["fortnite_afrohouse"] = {
		Config = {
			Anim = "amod_fortnite_afrohouse"
			,Name = "Bombastic" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1 }
		,Custom = { Sound = { Time1 = 14.8 } }
		,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/emote_afroHouse_A.mp3" } }
	}
	
	,["fortnite_salute"] = {
		Config = {
			Anim = "amod_fortnite_salute"
			,Name = "Salute" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/emote_salute_01.mp3" ,Delay = 0.6 } }
	}
	
	,["fortnite_deflated"] = {
		Config = {
			Anim = "amod_fortnite_deflated"
			,Name = "Pump up the Jam" ,class = 1
			,CList = { Title = "More Emotes Fortnite" }
		}
		,About = { Author = "AhmedMake400",Version = "1.0" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 15.26667 } }
		,Coop = { Sync = true }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Deflated_01.mp3" }
		}
	}



// v9.0
	,["fortnite_cuteness"] = {
		Config = { Anim = "amod_fortnite_cuteness",Name = "Neva Play",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 2 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 6 ,Cycle = 0.071794871794871 } ,Sound = { Time1 = 12.46667 ,Time2 = 12 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Cuteness_1.mp3" ,Delay = 0.05 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Cuteness_2.mp3" ,Delay = 0.46667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Cuteness_2.mp3" }
		}
	}
	
	,["fortnite_jaywalk"] = {
		Config = { Anim = "amod_fortnite_jaywalk",Name = "Jaywalking",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.9" }
		,Camera = { Transition = 1.3 } ,Custom = { Sound = { Time1 = 42.66 } } ,Coop = { Sync = true ,MaxDist = 200 }
		,Movement = { Type = 3 ,Speed = 79 ,Motion = { Static = "amod_fortnite_jaywalk" ,Walk = "amod_fortnite_jaywalk_walk" } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Jaywalking_01.mp3" } }
	}
	
	,["fortnite_linedance"] = {
		Config = { Anim = "amod_fortnite_linedance",Name = "Buckle Up",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.2" } ,Camera = { Transition = 1.7 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 23.6 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Linedance.mp3" } }
	}
	
	,["fortnite_technozombie"] = {
		Config = { Anim = "amod_fortnite_technozombie",Name = "Reanimated",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.4" } ,Camera = { Transition = 1.7 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 9.6 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/emote_tzfounders_01.mp3" } }
	}
	
	,["fortnite_hiphop01"] = {
		Config = { Anim = "amod_fortnite_hiphop_01",Name = "Freestylin'",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.7 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 18.92 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Hip_Hop_G01.mp3" } }
	}

	,["fortnite_chaostheory"] = {
		Config = { Anim = "amod_fortnite_chaostheory",Name = "Assumptions",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 2 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 2.43333 ,Cycle = 0.141176470588235 } ,Sound = { Time1 = 9.7 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_ChaosTheory.mp3" } }
	}
	
	,["fortnite_countyfrog"] = {
		Config = { Anim = "amod_fortnite_countyfrog",Name = "Jellyfish Jam",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 2 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.66667 ,Cycle = 0.111969111969112 } ,Sound = { Time2 = 7.66667 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CountyFrog_1.mp3" ,Delay = 0.29 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CountyFrog_2.mp3" ,Delay = 0.96667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CountyFrog_2.mp3" }
		}
	}

	,["fortnite_lottalove"] = {
		Config = { Anim = "amod_fortnite_lottalove",Name = "Maps",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.2" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 16,Cycle = 0.0342052313883 } ,Sound = { Time1 = 32.56667,Time2 = 32 } }
		
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_LottaLove_1.mp3" ,Delay = 0.1 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_LottaLove_2.mp3" ,Delay = 0.56667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_LottaLove_2.mp3" }
		}
	}



// v10
	,["fortnite_mellodance"] = {
		Config = { Anim = "amod_fortnite_mellodance",Name = "Marsh Walk",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 2 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time1 = 10.06667 ,Cycle = 0 } ,Sound = { Time1 = 10.06667 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_SquishyDance.mp3" } }
	}

	,["fortnite_tailor"] = {
		Config = { Anim = "amod_fortnite_tailor",Name = "Touching The Sky",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.4" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.46667,Cycle = 0.1824817518248175 } ,Sound = { Time1 = 16,Time2 = 14.93334 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Tailor_Music_1.mp3" ,Delay = 0.01 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Tailor_Music_2.mp3" ,Delay = 1.06667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Tailor_Music_2.mp3" }
		}
	}

	,["fortnite_martian"] = {
		Config = { Anim = "amod_fortnite_martian",Name = "Leave The Door Open",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 2 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 25.86667 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Martian_74BPM.mp3" } }
	}

	,["fortnite_cleancash"] = {
		Config = { Anim = "amod_fortnite_cleancash",Name = "PELIGROSA",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.8" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 9.6,Cycle = 0.0367892976588629 } ,Sound = { Time1 = 19.56667,Time2 = 19.2 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CleanCash_1.mp3" ,Delay = 0.13 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_CleanCash_2.mp3" ,Delay = 0.36667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_CleanCash_2.mp3" }
		}
	}

	,["fortnite_regalwave"] = {
		Config = { Anim = "amod_fortnite_regalwave",Name = "Regal Wave",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Time2 = 5.66667,Cycle = 0.1052631578947368 } ,Sound = { Time1 = 6.33334,Time2 = 5.66667 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_RegalWave.mp3" ,Delay = 0.66667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_RegalWave.mp3" }
		}
	}
	
	,["fortnite_dontsneeze"] = {
		Config = { Anim = "amod_fortnite_dontsneeze",Name = "Smeeze",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.4" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 4.53333,Cycle = 0.3398058252427184 } ,Sound = { Time1 = 11.28999,Time2 = 9.06666 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_DontSneeze_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_DontSneeze_2.mp3" ,Delay = 2.22333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_DontSneeze_2.mp3" }
		}
	}
	
	,["fortnite_paws"] = {
		Config = { Anim = "amod_fortnite_paws",Name = "Paws & Claws",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 1.2 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 60.5 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Paws.mp3" } }
	}
	
	,["fortnite_supersalty"] = {
		Config = { Anim = "amod_fortnite_supersalty",Name = "Too Sweet",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.4" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 8.16667,Cycle = 0.0648854961832061 } ,Sound = { Time1 = 16.90001,Time2 = 16.33334 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_SuperSalty_1.mp3" ,Delay = 0.19 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_SuperSalty_2.mp3" ,Delay = 0.56667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_SuperSalty_2.mp3" }
		}
	}



// v11
	,["fortnite_doublesnap"] = {
		Config = { Anim = "amod_fortnite_doublesnap",Name = "Revel",class = 1,Repeat = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 2 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 28.53333 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_DoubleSnap.mp3" } }
	}
	
	,["fortnite_bendy"] = {
		Config = { Anim = "amod_fortnite_bendy",Name = "Zany",class = 1,Repeat = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.3" } ,Coop = { Sync = true } ,Camera = { Transition = 2.3 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emotes_Bendy.mp3" } }
	}

	,["fortnite_twist"] = {
		Config = { Anim = "amod_fortnite_twist",Name = "Twist",class = 1,Repeat = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.3" } ,Coop = { Sync = true } ,Camera = { Transition = 2.3 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emotes_Twist.mp3" } }
	}

	,["fortnite_onearmfloss"] = {
		Config = { Anim = "amod_fortnite_onearmfloss",Name = "No Sweat",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.4" } ,Coop = { Sync = true } ,Camera = { Transition = 1.6 }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 9.60 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_OneArmFloss.mp3" } }
	}

	,["fortnite_lowrider"] = {
		Config = { Anim = "amod_fortnite_lowrider",Name = "Nuthin But A G Thang",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.4" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 10.13333,Cycle = 0.0617283950617284 } ,Sound = { Time1 = 20.93333,Time2 = 20.26666 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_LowRider_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_LowRider_2.mp3" ,Delay = 0.66667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_LowRider_2.mp3" }
		}
	}

	,["fortnite_pompous"] = {
		Config = { Anim = "amod_fortnite_pompous",Name = "Swagger Strut",class = 1,CList = { Title = "More Emotes Fortnite" } }
		,About = { Author = "AhmedMake400",Version = "1.9" } ,Camera = { Transition = 1.7 } ,Coop = { Sync = true ,MaxDist = 200 }
		,Custom = { Anim = { Time2 = 0.8,Cycle = 0.428571428571428 } ,Sound = { Time1 = 17.67 ,Time2 = 17.07 } }
		,Movement = { Type = 3 ,Speed = 83 ,Motion = { Static = "amod_fortnite_pompous" ,Walk = "amod_fortnite_pompous_walk" } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Pompous_01.mp3" ,Delay = 0.6 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Pompous_01.mp3" }
		}
	}

	,["fortnite_textile"] = {
		Config = { Anim = "amod_fortnite_textile",Name = "The Look",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.5" } ,Coop = { Sync = true } ,Camera = { Transition = 1.3 }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 24 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Textile.mp3" } }
	}

	,["fortnite_macaroons"] = {
		Config = { Anim = "amod_fortnite_macaroons",Name = "The Macarena",class = 1,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.8" } ,Coop = { Sync = true } ,Camera = { Transition = 1.6 }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 18.6 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Macaroon.mp3" } }
	}



// v12
	,["fortnite_reveal"] = {
		Config = { Anim = "amod_fortnite_reveal",Name = "Mask Off",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.8" } ,Camera = { Transition = 1.7 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 12.8,Cycle = 0.0565110565110565 } ,Sound = { Time1 = 7.1 ,Time2 = 6.4 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Reveal_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Reveal_2.mp3" ,Delay = 0.7 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Reveal_2.mp3" }
		}
	}
	
	,["fortnite_medicinal"] = {
		Config = { Anim = "amod_fortnite_medicinal",Name = "No Cure",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 8.26667,Cycle = 0.0498084291187739 } ,Sound = { Time1 = 8.7 ,Time2 = 8.19 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Medicinal_1.mp3" ,Delay = 0.05 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Medicinal_2.mp3" ,Delay = 0.43333 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Medicinal_2.mp3" }
		}
	}

	,["fortnite_mashedpotato"] = {
		Config = { Anim = "amod_fortnite_mashedpotato",Name = "Mashed Potato",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.2" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 60 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Mashed_Potato.mp3" } }
	}

	,["fortnite_galaxygirls"] = {
		Config = { Anim = "amod_fortnite_galaxygirls",Name = "Options",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.3" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 11.7,Cycle = 0.0303867403314917 } ,Sound = { Time1 = 12.06667 ,Time2 = 11.7 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_GalaxyGirls_1.mp3" ,Delay = 0.13 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_GalaxyGirls_2.mp3" ,Delay = 0.36667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_GalaxyGirls_2.mp3" }
		}
	}

	,["fortnite_taxiheel"] = {
		Config = { Anim = "amod_fortnite_taxiheel",Name = "Stan's Jam",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.8" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 12.8,Cycle = 0.0656934306569343 } ,Sound = { Time1 = 26.35 ,Time2 = 25.45 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_TaxiHeel_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_TaxiHeel_2.mp3" ,Delay = 0.75 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_TaxiHeel_2.mp3" }
		}
	}

	,["fortnite_banana"] = {
		Config = { Anim = "amod_fortnite_banana",Name = "Nana Nana",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 6.16667 } ,Sound = { Time1 = 12.33333 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Banana01.mp3" } }
	}

	,["fortnite_dancepump"] = {
		Config = { Anim = "amod_fortnite_dancepump",Name = "Pumpernickel",class = 1,isNew = true,Rate = 1.03226,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.3" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time1 = 3.3583325,Cycle = 0 } ,Sound = { Time1 = 13.66333 ,Time2 = 13.43333 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emotes_PumpDance.mp3" ,Delay = 0.23 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emotes_PumpDance.mp3" }
		}
	}

	,["fortnite_walkupapology"] = {
		Config = { Anim = "amod_fortnite_walkupapology",Name = "I Lied, I'm Sorry",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.6" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.5,Cycle = 0.085365853658536 } ,Sound = { Time1 = 30.7,Time2 = 30 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_WalkupApology_1.mp3" ,Delay = 0.15 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_WalkupApology_2.mp3" ,Delay = 0.7 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_WalkupApology_2.mp3" }
		}
	}



	// v13
	,["fortnite_aerobicchamp"] = {
		Config = { Anim = "amod_fortnite_aerobicchamp",Name = "Work It Out",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.7" } ,Camera = { Transition = 1.6 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time1 = 6.275,Cycle = 0 } ,Sound = { Time1 = 12.55 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Aerobics01.mp3" } }
	}
	
	,["fortnite_funktime"] = {
		Config = { Anim = "amod_fortnite_funktime",Name = "Get Funky",class = 1,Repeat = true,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.5" } ,Camera = { Transition = 1.9 } ,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Funktime01.mp3" } }
	}
	
	,["fortnite_happyskipping"] = {
		Config = { Anim = "amod_fortnite_happyskipping",Name = "Tra La La",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 2.5 } ,Coop = { Sync = true ,MaxDist = 200 }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 19.724 } }
		,Movement = { Type = 3 ,Speed = 109 ,Motion = { Static = "amod_fortnite_happyskipping",Walk = "amod_fortnite_happyskipping_walk" } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_HappySkipping01.mp3" } }
	}
	
	,["fortnite_vouchtrig"] = {
		Config = { Anim = "amod_fortnite_vouchtrig",Name = "Oooohhh",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.5" } ,Camera = { Transition = 2.2 } ,Coop = { Sync = true }
		,Sounds = { Start = { Sound = {"actmod/i_act/am4/fortnite/Emote_VouchTrig_Vocal01.mp3","actmod/i_act/am4/fortnite/Emote_VouchTrig_Vocal03.mp3"} ,Delay = 0.6 } }
	}
	
	,["fortnite_skeletondance"] = {
		Config = { Anim = "amod_fortnite_skeletondance",Name = "Fright Funk",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "2.1" } ,Camera = { Transition = 2.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.46667,Cycle = 0.0627615062761506 } ,Sound = { Time1 = 30.36667,Time2 = 29.86667 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Skeleton_1.mp3" ,Delay = 0.01 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Skeleton_2.mp3" ,Delay = 0.5 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Skeleton_2.mp3" }
		}
	}
	
	,["fortnite_blaster"] = {
		Config = { Anim = "amod_fortnite_blaster",Name = "Crossbounce",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 1.6 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.5,Cycle = 0 } ,Sound = { Time1 = 15 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Blaster.mp3" } }
	}
	
	,["fortnite_coolrobot"] = {
		Config = { Anim = "amod_fortnite_coolrobot",Name = "Overdrive",class = 1,isNew = true,CList = {Title = "More Emotes Fortnite"} }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 2.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 15,Cycle = 0 } ,Sound = { Time1 = 60 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CoolRobot01.mp3" } }
	}
	
}