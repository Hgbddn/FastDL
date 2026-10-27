// Emotes/Dances other (commissions)
// 2026-AM4|4497|148635
return{
	["tde_dbullymaguire"] = {
		Config = {
			Anim = "amod_am4_bullymaguiredance",Name = "Bully Maguire Dance",class = 1,isNew = true,Repeat = true
			,CList = { Title = "AM4 Expansion Pack",Icon = "actmod/imgl/ic.png",Background = "actmod/imgl/b1.jpg",BColor = Color(0,0,0,100) }
		}
		,About = { Author = "AhmedMake_400",Version = "2.3" } ,Camera = { Follow = false,Transition = 1.1 } ,Coop = { Sync = true }
		,Custom = { Anim = { Cycle = 0 },Sound = { Time1 = 19.6 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/tde/BullyMaguireDance.mp3" } }
	}
	
	,["tde_dicwit"] = {
		Config = { Anim = "Amod_AM4_DICWit",Name = "I Cant Wait Feat GUMI",CList = { Title = "AM4 Expansion Pack" },class = 1,isNew = true }
		,About = { Author = "AhmedMake400" ,Version = "4.3" } ,Camera = { Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.375,Cycle = 0.2745901639344262 },Sound = { Time1 = 47.68366,Time2 = 44.892 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/tde/DICWit_1.mp3" }
			,StartExtra = { Sound = "actmod/i_act/am4/tde/DICWit_2.mp3" ,Delay = 2.791 }
			,Repeat = { Sound = "actmod/i_act/am4/tde/DICWit_2.mp3" }
		}
	}
	
	,["tde_thomman"] = {
		Config = { Anim = "amod_am4_thomman",Name = "Thicc Omni Man",class = 3,isNew = true,Repeat = true,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "3.5" } ,Camera = { Follow = false,Transition = 1.8 } ,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/tde/ThiccOmniMan01.mp3" } }
	}
	
	,["tdem_fightidle"] = {
		Config = { Anim = "amod_mixamo_fightidle",Name = "Fight Idle",isNew = true,Repeat = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "1.1" } ,Camera = { Transition = 1.5 }
	}
	,["tdem_fistfighta"] = {
		Config = { Anim = "amod_mixamo_fistfighta",Name = "Fist Fight A",isNew = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "1.8" } ,Camera = { Transition = 1.5 }
	}
	,["tdem_fistfightb"] = {
		Config = { Anim = "amod_mixamo_fistfightb",Name = "Fist Fight B",isNew = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "1.8" } ,Camera = { Transition = 1.5 }
	}
	,["tdem_hurricanekick"] = {
		Config = { Anim = "amod_mixamo_hurricanekick",Name = "Hurricane Kick",isNew = true,Repeat = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "1.0" } ,Camera = { Transition = 1.5 } ,Movement = { Type = 3 ,Speed = 120 }
	}
	,["tdem_standingarguing"] = {
		Config = { Anim = "amod_mixamo_standingarguing",Name = "Standing Arguing",isNew = true,Repeat = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "2.1" } ,Camera = { Transition = 1.5 }
	}
	,["tdem_talking02"] = {
		Config = { Anim = "amod_mixamo_talking02",Name = "Talking",isNew = true,Repeat = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "1.5" } ,Camera = { Transition = 1.5 }
	}
	,["tdem_thrillerpart1"] = {
		Config = { Anim = "amod_mixamo_thriller_part_1",Name = "Thriller Part 1",isNew = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "1.9" } ,Camera = { Follow = true,Transition = 1.8 }
	}
	,["tdem_thrillerpart2"] = {
		Config = { Anim = "amod_mixamo_thriller_part_2",Name = "Thriller Part 2",isNew = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "1.6" } ,Camera = { Follow = true,Transition = 1.8 }
	}
	,["tdem_thrillerpart3"] = {
		Config = { Anim = "amod_mixamo_thriller_part_3",Name = "Thriller Part 3",isNew = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "2.1" } ,Camera = { Follow = true,Transition = 1.8 }
	}
	,["tdem_thrillerpart4"] = {
		Config = { Anim = "amod_mixamo_thriller_part_4",Name = "Thriller Part 4",isNew = true,class = 3,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "2.0" } ,Camera = { Follow = true,Transition = 1.8 }
	}
}
