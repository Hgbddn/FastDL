
-- // ===========================================================
-- //   <><><><><><><><>  INSTRUCTIONS & RULES  <><><><><><><><>
-- //  ----------------------------------------------------------
-- //   [] There are two things you should know:
-- //   
-- //     (1) <<Required>>
-- //         > This means that it is **essential** and must be added.
-- //         > If ignored, the script may not work correctly.
-- //   
-- //     (2) <<Optional>>
-- //         > This is **not mandatory**.
-- //         > You may choose to use it or leave it out.
-- // 		
-- //     (/) note!
-- //         > First of all, you must provide an image of the dance in ".png" format in the "materials/actmod/cumact" directory, and the dimensions of the image must be "250x250".
-- //         > The "Custom animation ID name" Must be in English, numbers (and underscores are allowed),  and must not already exist or it will be ignored/failed to be added to ActMod.
-- // 
-- //  ----------------------------------------------------------
-- //   [] Tips:
-- //     > Keep your formatting clean.
-- //     > Use comments like this for future reference.
-- // ===========================================================


return{
	-- ["test_01__c_c_s_m"] = {   --// <<Required>>  Custom animation ID name ( Custom animation ID = image name (excluding extension) for Emotes/Dances  ( like: "abcde_d12"-> Good  "abcde_d12.png"-> bad  "abcde d12"-> bad )  )
	-- 	Config = {   --// <<Required>>
	-- 		Anim = "Amod_Fortnite_A1Dance"   --// <<Required>>  Name of the (Emote/Dance) animation, It should already be included in the players' animations.
	-- 		,Name = "Template Emote"   --// <<Required>>  Must be in English, numbers and underscores are allowed.
	-- 		,class = 1   --// <<Optional>>  Select the category number you want it to appear in.  ( -1 means hidden for use in other things, and from 1 to 8 to display in the list )  < Default: 1 >
	-- 		-- ,Duration = 25.5   --// <<Optional>> Set the time to repeat  < Default: The duration is automatically determined by the animation. >
	-- 		-- ,Cycle = 0   --// <<Optional>>  Set Cycle when starting for the first time ( min: 0  / max: 1 )   < Default: 0 >
	-- 		-- ,Rate = 0.1   --// <<Optional>>  animation speed ( min: 0  / max: 1 )   < Default: 1 >
	-- 		,Repeat = false   --// <<Optional>>  Allow repetition after timeout **This function will be ignored if a table "Custom" is added.**  < Default: false >
	-- 		,isNew = true   --// <<Optional>>  It appears to be new.  < Default: true >
	-- 	}

	-- 	,About = {   --// <<Optional>>  Do not use any information about AhmedMake400 (if his name or address is used, it will be ignored, as he does not want to be held responsible for any misuse of ActMod).
	-- 		Author = ""   --// <<Required>>  Write your name or the name of the author of this dance (The name will be updated automatically if SteamID64 is verified.)  < Default: nothing >
	-- 		,S64 = ""   --// <<Optional>>  If you want, you can enter your SteamID64 so they can access your Steam page.  < Default: nothing >
	-- 		,Version = "1"   --// <<Optional>>  Write a version for this dance (must be numbers only)  < Default: nothing >
	-- 	}
		
	-- 	,Camera = {   --// <<Optional>>
	-- 		Follow = false   --// <<Optional>>  Enable the camera to track the body.  < Default: false >
	-- 		,Transition = 1.5   --// <<Optional>>  Time to move between the default location and the camera location  < Default: 5 >
	-- 	}
		
	-- 	,Custom = {   --// <<Optional>>  Customize to reset animation and sound
	-- 		Anim = {   --// <<Optional>>  Disable animation with VR   < Default: false >
	-- 			Time1 = 6.26667   --// <<Optional>>  Duration at first time   < Default: Will be used from Config>Duration >
	-- 			-- ,Time2 = 3.7   --// <<Optional>>  Duration when repeating   < Default: Will be used from Config>Duration >
	-- 			,Cycle = 0   --// <<Optional>>  Cycle is set on repeat ( min: 0  / max: 1 )  < Default: 0 >
	-- 		}
	-- 		,Sound = {   // <<Optional>>  Set the duration of the audio to repeat.
	-- 			Time1 = 40.87   // <<Optional>>  Duration at first time   < Default: Will be used from Config>Duration >
	-- 			-- ,Time2 = 61.02   // <<Optional>>  Duration when repeating   < Default: Will be used from Config>Duration >
	-- 		}
	-- 	}
		
	-- 	-- ,Movement = {   --// <<Optional>>  Allow walking (optional or mandatory)
	-- 		-- Type = 1   --// <<Required>>  Type of movement ( min: 1  / max: 3 ) ( 1- Forced forward walking  | 2- Forced backward walking  | 3- Controlled forward walking or standing )
	-- 		-- ,Speed = 50   --// <<Required>>  speed of movement
	-- 		-- ,Motion = {   --// <<Optional>>  Motion control  <<Movement type 3 required>> 
	-- 			-- Static = "idle_suitcase"    --// <<Required>>  Change to standing animation
	-- 			-- ,Walk = "walk_suitcase"    --// <<Required>>  Change to walking animation
	-- 		-- }
	-- 	-- }
		
	-- 	,Coop = {   --// <<Optional>>  Allow others to join your emote/dance
	-- 		Sync = true   --// <<Optional>>  Make other animations in sync with you.  < Default: false >
	-- 		-- YourAnim = "amod_fortnite_a1dance"    --// <<Optional>>  Replace your animation   < Default: Will not be replaced >
	-- 		-- ,OtherAnim = "amod_fortnite_a1dance"   --// <<Optional>>  Replace other player's animation   < Default: Uses basic(in Config>Anim) >
	-- 		-- ,ReplaySelf = true   --// <<Optional>>  Replay animation for you   < Default: false >
	-- 		-- ,MaxPlayers = 2   --// <<Optional>>  Allow a certain number ( 0 = Unlimited )  < Default: 0 >
	-- 		,MaxDist = 400   --// <<Optional>>  Adding extra space beyond the allowed space  < Default: nil >
	-- 	}
		
	-- 	,Sounds = {   --// <<Optional>>
	-- 		Start = {   --// <<Required>>  Sound on first start (used on repeat if "Repeat" is not set)
	-- 			Sound = "actmod/AB/loop_music02.mp3"   --// <<Required>>  Sound start delay time
	-- 			,Delay = 0   --// <<Optional>>  Sound start delay time  < Default: 0 >
	-- 		}
	-- 		-- ,StartExtra = {   --// <<Optional>>  Only used when starting for the first time.
	-- 			-- Sound = "music/hl2_song20_submix4.mp3"   --// <<Required>>  Sound start delay time
	-- 			-- ,Delay = 0.7   --// <<Optional>>  Sound start delay time  < Default: 0 >
	-- 		-- }
	-- 		,Repeat = {   --// <<Optional>>  Only used when repeated.
	-- 			Sound = "actmod/AB/loop_music02.mp3"   --// <<Required>>  Sound start delay time
	-- 			,Delay = 0   --// <<Optional>>  Sound start delay time  < Default: 0 >
	-- 		}
	-- 	}
		
	-- 	,Models = {   --// <<Optional>> Must be arranged in numbers, maximum 4 models allowed
	-- 		[1] = {   --// Start from 1 to 4 (depending on the number of models you want to add)
	-- 			Model = "models/props_interiors/pot02a.mdl"   --// <<Required>>  Model path
	-- 			,Bone = "ValveBiped.Bip01_Head1"  --// <<Required>>  Model will track it with the bone name of the player.
	-- 			,Vector = {0,7,-7}   --// <<Optional>>  "( number Forward , number Right , number Up )"  < Default: {0,0,0} >
	-- 			,Angle = {180,90,0}   --// <<Optional>>  "( number pitch , number yaw , number roll )"  < Default: {0,0,0} >
	-- 			,Material = "phoenix_storms/wood"   --// <<Optional>>  Add Material  < Default: "" >
	-- 			,Size = 1.2   --// <<Optional>>  Resize Model  < Default: 1 >
	-- 		}
	-- 	}
	-- },

	["invincible_wobble"] = {
        Config = {
            Anim = "amod_gatopack_invincible_wobble_animation",
            Name = "Invincible Wobble",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 11, Cycle = 0 },
            Sound = { Time1 = 66 }
        },
        Sounds = {
			Start = { Sound = "music/invincible_wobble.ogg", Delay = 0 },
			Repeat = { Sound = "music/invincible_wobble.ogg" }
        },
        Coop = { Sync = false, MaxDist = 500 },
    },

	["nightmail"] = {
        Config = {
            Anim = "amod_gatopack_nightmail",
            Name = "Nightmail",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 7.2, Cycle = 0 },
            Sound = { Time1 = 72 }
        },
        Sounds = {
			Start = { Sound = "music/nightmail.ogg", Delay = 0 },
			Repeat = { Sound = "music/nightmail.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

	["walkin"] = {
        Config = {
            Anim = "amod_gatopack_walkin",
            Name = "Walkin'",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.8, Cycle = 0 },
            Sound = { Time1 = 104.95 }
        },
        Movement = { Type = 3, Speed = 100, Motion = { Static = "amod_gatopack_walkin", Walk = "amod_gatopack_walkin" }	},
        Sounds = {
			Start = { Sound = "music/walkin.ogg", Delay = 0 },
			Repeat = { Sound = "music/walkin.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["trollface_groove"] = {
        Config = {
            Anim = "amod_gatopack_trollface_groove",
            Name = "Trollface Groove",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.7, Cycle = 0 },
            Sound = { Time1 = 46.5, Time2 = 45 }
        },
        Sounds = {
            Start = { Sound = "music/troll_start.ogg", Delay = 0 },
			StartExtra = { Sound = "music/troll_loop.ogg", Delay = 1.5 },
			Repeat = { Sound = "music/troll_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["stormtrooper_dance"] = {
        Config = {
            Anim = "amod_gatopack_stormtrooper_dance",
            Name = "Stormtrooper Dance",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.416, Cycle = 0 },
            Sound = { Time1 = 52 }
        },
        Sounds = {
			Start = { Sound = "music/stormtrooper.ogg", Delay = 0 },
			Repeat = { Sound = "music/stormtrooper.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["shoo_wop"] = {
        Config = {
            Anim = "amod_gatopack_shoo_wop",
            Name = "Ain't no lovin' my man",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "2" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 3.91, Cycle = 0 },
            Sound = { Time1 = 7.82 }
        },
        Sounds = {
			Start = { Sound = "music/shoo_wop.ogg", Delay = 0 },
			Repeat = { Sound = "music/shoo_wop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["shimmy_ay"] = {
        Config = {
            Anim = "amod_gatopack_shimmy_ay",
            Name = "Shimmy Shimmy ay",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 7.36, Cycle = 0 },
            Sound = { Time1 = 58.88 }
        },
        Sounds = {
			Start = { Sound = "music/shimmy_ay.ogg", Delay = 0 },
			Repeat = { Sound = "music/shimmy_ay.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["stuntin"] = {
        Config = {
            Anim = "amod_gatopack_stuntin",
            Name = "Stuntin'",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 7.18, Cycle = 0 },
            Sound = { Time1 = 21.54 }
        },
        Sounds = {
			Start = { Sound = "music/stuntin.ogg", Delay = 0 },
			Repeat = { Sound = "music/stuntin.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["kwik_flip"] = {
        Config = {
            Anim = "amod_gatopack_kwik_flip",
            Name = "Kwik Flip",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 1.58, Cycle = 0 },
            Sound = { Time1 = 75.38 }
        },
        Sounds = {
			Start = { Sound = "music/kwik_flip.ogg", Delay = 0 },
			Repeat = { Sound = "music/kwik_flip.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["kwik_flip_censored"] = {
        Config = {
            Anim = "amod_gatopack_kwik_flip",
            Name = "Kwik Flip (No swear words)",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 1.58, Cycle = 0 },
            Sound = { Time1 = 75.38 }
        },
        Sounds = {
			Start = { Sound = "music/kwik_flip_censored.ogg", Delay = 0 },
			Repeat = { Sound = "music/kwik_flip_censored.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["bang_bang"] = {
        Config = {
            Anim = "amod_gatopack_bang_bang",
            Name = "Bang Bang",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.9, Cycle = 0 },
            Sound = { Time1 = 14.44 }
        },
        Sounds = {
			Start = { Sound = "music/bang_bang.ogg", Delay = 0 },
			Repeat = { Sound = "music/bang_bang.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["superstar_l"] = {
        Config = {
            Anim = "amod_gatopack_superstar_l",
            Name = "Superstar L",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 1.76, Cycle = 0.33 },
            Sound = { Time1 = 42.1, Time2 = 38.5 }
        },
        Sounds = {
            Start = { Sound = "music/superstar_start.ogg", Delay = 0 },
			StartExtra = { Sound = "music/superstar_loop.ogg", Delay = 3.5 },
			Repeat = { Sound = "music/superstar_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_superstar_m", MaxPlayers = 1 },
    },

    ["superstar_m"] = {
        Config = {
            Anim = "amod_gatopack_superstar_m",
            Name = "Superstar M",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 1.76, Cycle = 0.33 },
            Sound = { Time1 = 42.1, Time2 = 38.5 }
        },
        Sounds = {
            Start = { Sound = "music/superstar_start.ogg", Delay = 0 },
			StartExtra = { Sound = "music/superstar_loop.ogg", Delay = 3.5 },
			Repeat = { Sound = "music/superstar_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_superstar_l", MaxPlayers = 1 },
    },

    ["mourning"] = {
        Config = {
            Anim = "amod_gatopack_mourning",
            Name = "Mourning",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = true, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 5.2, Cycle = 0 },
            Sound = { Time1 = 5.2 }
        },
        Sounds = {
			Start = { Sound = "music/mourning.ogg", Delay = 0 },
			Repeat = { Sound = "music/mourning.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["pump_it_up"] = {
        Config = {
            Anim = "amod_gatopack_pump_it_up",
            Name = "Pump it up",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 5.98, Cycle = 0 },
            Sound = { Time1 = 23.7 }
        },
        Sounds = {
			Start = { Sound = "music/pump_it_up.ogg", Delay = 0 },
			Repeat = { Sound = "music/pump_it_up.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["lost_media_1"] = {
        Config = {
            Anim = "amod_gatopack_lost_media_1",
            Name = "You found lost media! 1",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 7.73, Cycle = 0 },
            Sound = { Time1 = 15.5 }
        },
        Sounds = {
			Start = { Sound = "music/lost_media.ogg", Delay = 0 },
			Repeat = { Sound = "music/lost_media.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_lost_media_2", MaxPlayers = 2 },
    },

    ["lost_media_2"] = {
        Config = {
            Anim = "amod_gatopack_lost_media_2",
            Name = "You found lost media! 2",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 7.73, Cycle = 0 },
            Sound = { Time1 = 15.5 }
        },
        Sounds = {
			Start = { Sound = "music/lost_media.ogg", Delay = 0 },
			Repeat = { Sound = "music/lost_media.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_lost_media_3", MaxPlayers = 2 },
    },

    ["lost_media_3"] = {
        Config = {
            Anim = "amod_gatopack_lost_media_3",
            Name = "You found lost media! 3",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 7.73, Cycle = 0 },
            Sound = { Time1 = 15.5 }
        },
        Sounds = {
			Start = { Sound = "music/lost_media.ogg", Delay = 0 },
			Repeat = { Sound = "music/lost_media.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_lost_media_1", MaxPlayers = 2 },
    },

    ["reddit_phonk"] = {
        Config = {
            Anim = "amod_gatopack_reddit_phonk",
            Name = "Reddit Phonk",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = true, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 8.16, Cycle = 0 },
            Sound = { Time1 = 16.32 }
        },
        Sounds = {
			Start = { Sound = "music/reddit_phonk.ogg", Delay = 0 },
			Repeat = { Sound = "music/reddit_phonk.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["street_dance"] = {
        Config = {
            Anim = "amod_gatopack_street_dance",
            Name = "Street dance",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 12, Cycle = 0 },
            Sound = { Time1 = 24 }
        },
        Sounds = {
			Start = { Sound = "music/street_dance.ogg", Delay = 0 },
			Repeat = { Sound = "music/street_dance.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["naoya_party"] = {
        Config = {
            Anim = "amod_gatopack_naoya_party",
            Name = "Naoya party",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.73, Cycle = 0 },
            Sound = { Time1 = 41.5, Time2 = 27.1 }
        },
        Sounds = {
            Start = { Sound = "music/naoya_party_start.ogg", Delay = 0 },
			StartExtra = { Sound = "music/naoya_party_loop.ogg", Delay = 14.4 },
			Repeat = { Sound = "music/naoya_party_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["dante_trigger"] = {
        Config = {
            Anim = "amod_gatopack_dante_trigger",
            Name = "Dante trigger",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.76, Cycle = 0 },
            Sound = { Time1 = 72 }
        },
        Sounds = {
            Start = { Sound = "music/devil_trigger.ogg", Delay = 0 },
			Repeat = { Sound = "music/devil_trigger.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_nero_trigger", MaxPlayers = 1 },
    },

    ["nero_trigger"] = {
        Config = {
            Anim = "amod_gatopack_nero_trigger",
            Name = "Nero trigger",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.76, Cycle = 0 },
            Sound = { Time1 = 72 }
        },
        Sounds = {
            Start = { Sound = "music/devil_trigger.ogg", Delay = 0 },
			Repeat = { Sound = "music/devil_trigger.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_dante_trigger", MaxPlayers = 1 },
    },

    ["lonely"] = {
        Config = {
            Anim = "amod_gatopack_lonely",
            Name = "Lonely",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 3.7, Cycle = 0 },
            Sound = { Time1 = 15.3 }
        },
        Sounds = {
            Start = { Sound = "music/lonely.ogg", Delay = 0 },
			Repeat = { Sound = "music/lonely.ogg" }
        },
    },

    ["stuck_in_my_head"] = {
        Config = {
            Anim = "amod_gatopack_stuck_in_my_head",
            Name = "Stuck in my head",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 29.5, Cycle = 0 },
            Sound = { Time1 = 29.5 }
        },
        Sounds = {
            Start = { Sound = "music/stuck_in_my_head.ogg", Delay = 0 },
			Repeat = { Sound = "music/stuck_in_my_head.ogg" }
        },
    },

    ["moonwalk"] = {
        Config = {
            Anim = "amod_gatopack_moonwalk",
            Name = "Moonwalk",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 2.73, Cycle = 0.33 },
            Sound = { Time1 = 213.2 }
        },
        Movement = { Type = 1, Speed = -75 },
        Sounds = {
			Start = { Sound = "music/moonwalk.ogg", Delay = 0 },
			Repeat = { Sound = "music/moonwalk.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["grounded"] = {
        Config = {
            Anim = "amod_gatopack_goanimate",
            Name = "You're Grounded!",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.93, Cycle = 0 },
            Sound = { Time1 = 199.8, Time2 = 191 }
        },
        Sounds = {
            Start = { Sound = "music/grounded_start.ogg", Delay = 0 },
			StartExtra = { Sound = "music/grounded_loop.ogg", Delay = 8.8 },
			Repeat = { Sound = "music/grounded_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["danxfnaf_celebration"] = {
        Config = {
            Anim = "amod_gatopack_danxfnaf",
            Name = "DanXFnaf's Celebration",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "DanXFnaf", S64 = "76561199524478667", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.8, Cycle = 0 },
            Sound = { Time1 = 101 }
        },
        Movement = { Type = 3, Speed = 50, Motion = { Static = "amod_gatopack_danxfnaf", Walk = "amod_gatopack_danxfnaf" }	},
        Sounds = {
            Start = { Sound = "music/danxfnaf_celebration.ogg", Delay = 0 },
			Repeat = { Sound = "music/danxfnaf_celebration.ogg" }
        },
    },

    ["peanut_butter_jelly_time"] = {
        Config = {
            Anim = "amod_gatopack_peanut_butter_jelly_time",
            Name = "Peanut Butter Jelly Time",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.8, Cycle = 0 },
            Sound = { Time1 = 73.6, Time2 = 68.6 }
        },
        Sounds = {
            Start = { Sound = "music/peanut_butter_jelly_time_start.ogg", Delay = 0 },
			StartExtra = { Sound = "music/peanut_butter_jelly_time_loop.ogg", Delay = 5 },
			Repeat = { Sound = "music/peanut_butter_jelly_time_loop.ogg" }
        },
    },

    ["mii_maker"] = {
        Config = {
            Anim = "amod_gatopack_mii_maker",
            Name = "Mii Maker",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "2" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.8, Cycle = 0 },
            Sound = { Time1 = 86.4 }
        },
        Sounds = {
			Start = { Sound = "music/mii_maker.ogg", Delay = 0 },
			Repeat = { Sound = "music/mii_maker.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["creepy_run_shaggy"] = {
        Config = {
            Anim = "amod_gatopack_creepy_run_shaggy_idle",
            Name = "Creepy Run Shaggy",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.4, Cycle = 0 },
            Sound = { Time1 = 109 }
        },
        Movement = { Type = 3, Speed = 250, Motion = { Static = "amod_gatopack_creepy_run_shaggy_idle", Walk = "amod_gatopack_creepy_run_shaggy" }	},
        Sounds = {
			Start = { Sound = "music/creepy_run.ogg", Delay = 0 },
			Repeat = { Sound = "music/creepy_run.ogg" }
        },
        Coop = { Sync = false, MaxDist = 500 },
    },

    ["creepy_run_skeleton"] = {
        Config = {
            Anim = "amod_gatopack_creepy_run_skeleton_idle",
            Name = "Creepy Run Skeleton",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.48, Cycle = 0 },
            Sound = { Time1 = 109 }
        },
        Movement = { Type = 3, Speed = 250, Motion = { Static = "amod_gatopack_creepy_run_skeleton_idle", Walk = "amod_gatopack_creepy_run_skeleton" }	},
        Sounds = {
			Start = { Sound = "music/creepy_run.ogg", Delay = 0 },
			Repeat = { Sound = "music/creepy_run.ogg" }
        },
        Coop = { Sync = false, MaxDist = 500 },
    },

    ["last_tour_1"] = {
        Config = {
            Anim = "amod_gatopack_last_tour_1",
            Name = "Last tour 1",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 15, Cycle = 0 },
            Sound = { Time1 = 30 }
        },
        Sounds = {
            Start = { Sound = "music/last_tour.ogg", Delay = 0 },
			Repeat = { Sound = "music/last_tour.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_last_tour_2", MaxPlayers = 1 },
    },

    ["last_tour_2"] = {
        Config = {
            Anim = "amod_gatopack_last_tour_2",
            Name = "Last tour 2",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 15, Cycle = 0 },
            Sound = { Time1 = 30 }
        },
        Sounds = {
            Start = { Sound = "music/last_tour.ogg", Delay = 0 },
			Repeat = { Sound = "music/last_tour.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_last_tour_1", MaxPlayers = 1 },
    },

    ["gang_dance"] = {
        Config = {
            Anim = "amod_gatopack_gang_dance",
            Name = "Gangstar torture dance",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 17.9, Time2 = 8.9, Cycle = 0.5 },
            Sound = { Time1 = 89.5, Time2 = 80.6 }
        },
        Sounds = {
            Start = { Sound = "music/gangstar_torture_dance_start.ogg", Delay = 0 },
            StartExtra = { Sound = "music/gangstar_torture_dance_loop.ogg", Delay = 8.9 },
			Repeat = { Sound = "music/gangstar_torture_dance_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["aura_monster"] = {
        Config = {
            Anim = "amod_gatopack_aura_monster",
            Name = "Aura Monster",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 2.13, Cycle = 0.33 },
            Sound = { Time1 = 34.1, Time2 = 34.1 }
        },
        Movement = { Type = 1, Speed = 75 },
        Sounds = {
            Start = { Sound = "music/aura_monster_quote.ogg", Delay = 0 },
            StartExtra = { Sound = "music/aura_monster.ogg", Delay = 0 },
			Repeat = { Sound = "music/aura_monster.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["competent"] = {
        Config = {
            Anim = "amod_gatopack_competent",
            Name = "Competent",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 7.23, Time2 = 3.46, Cycle = 0.61 },
            Sound = { Time1 = 32.1, Time2 = 28.3 }
        },
        Sounds = {
            Start = { Sound = "music/competent_intro.ogg", Delay = 0 },
            StartExtra = { Sound = "music/competent_loop.ogg", Delay = 3.8 },
			Repeat = { Sound = "music/competent_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["mj_lean"] = {
        Config = {
            Anim = "amod_gatopack_michael_jackson_lean",
            Name = "MJ's Lean",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            Repeat = false,
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        -- Custom = {
        --     Anim = { Time1 = 8.9, Cycle = 0 },
        --     Sound = { Time1 = 8.9 }
        -- },
        Sounds = {
			Start = { Sound = "music/mj_lean.ogg", Delay = 0 },
			Repeat = { Sound = "music/mj_lean.ogg" }
        },
        Coop = { Sync = false, MaxDist = 500 },
    },

    ["dj_jig"] = {
        Config = {
            Anim = "amod_gatopack_dj_jig",
            Name = "DJ Jig",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 3.4, Cycle = 0 },
            Sound = { Time1 = 46.6 }
        },
        Sounds = {
			Start = { Sound = "music/dj_jig.ogg", Delay = 0 },
			Repeat = { Sound = "music/dj_jig.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["the_prank"] = {
        Config = {
            Anim = "amod_gatopack_the_prank",
            Name = "The Prank",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "2" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 3.8, Cycle = 0 },
            Sound = { Time1 = 7.6 }
        },
        Sounds = {
			Start = { Sound = "music/the_prank.ogg", Delay = 0 },
			Repeat = { Sound = "music/the_prank.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["hai_yorokonde"] = {
        Config = {
            Anim = "amod_gatopack_hai_yorokonde",
            Name = "Hai Yorokonde",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 13.1, Cycle = 0 },
            Sound = { Time1 = 26.2 }
        },
        Sounds = {
            Start = { Sound = "music/hai_yorokonde.ogg", Delay = 0 },
			Repeat = { Sound = "music/hai_yorokonde.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["my_time"] = {
        Config = {
            Anim = "amod_gatopack_my_time",
            Name = "My Time",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 3.6, Cycle = 0 },
            Sound = { Time1 = 187.2 }
        },
        Sounds = {
            Start = { Sound = "music/my_time.ogg", Delay = 0 },
			Repeat = { Sound = "music/my_time.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["giga_shake"] = {
        Config = {
            Anim = "amod_gatopack_giga_shake",
            Name = "Attack of the Giga Shake",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 25.5, Cycle = 0 },
            Sound = { Time1 = 25.5 }
        },
        Sounds = {
            Start = { Sound = "music/giga_shake.ogg", Delay = 0 },
			Repeat = { Sound = "music/giga_shake.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["virtual_insanity"] = {
        Config = {
            Anim = "amod_gatopack_virtual_insanity",
            Name = "Virtual Insanity",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 12, Time2 = 3.76, Cycle = 0.68 },
            Sound = { Time1 = 156.56 }
        },
        Movement = { Type = 3, Speed = 25 },
        Sounds = {
            Start = { Sound = "music/virtual_insanity.ogg", Delay = 0 },
			Repeat = { Sound = "music/virtual_insanity.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["chicken_dance"] = {
        Config = {
            Anim = "amod_gatopack_chicken_dance",
            Name = "Chicken Dance",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 6.88, Cycle = 0 },
            Sound = { Time1 = 124.47 }
        },
        Sounds = {
            Start = { Sound = "music/chicken_dance.ogg", Delay = 0 },
			Repeat = { Sound = "music/chicken_dance.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["chronoshift"] = {
        Config = {
            Anim = "amod_gatopack_chronoshift",
            Name = "Chronoshift",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 14.75, Cycle = 0 },
            Sound = { Time1 = 14.85 }
        },
        Sounds = {
            Start = { Sound = "music/chronoshift.ogg", Delay = 0 },
			Repeat = { Sound = "music/chronoshift.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["chronoshift_remix"] = {
        Config = {
            Anim = "amod_gatopack_chronoshift",
            Name = "Chronoshift Remix",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 14.75, Cycle = 0 },
            Sound = { Time1 = 59.2 }
        },
        Sounds = {
            Start = { Sound = "music/chronoshift_remix.ogg", Delay = 0 },
			Repeat = { Sound = "music/chronoshift_remix.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["animals_of_the_farm"] = {
        Config = {
            Anim = "amod_gatopack_animals_of_the_farm",
            Name = "?",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 24.58, Cycle = 0 },
            Sound = { Time1 = 24.58 }
        },
        Sounds = {
            Start = { Sound = "music/animals_of_the_farm.ogg", Delay = 0 },
			Repeat = { Sound = "music/animals_of_the_farm.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["looping_the_rooms"] = {
        Config = {
            Anim = "amod_gatopack_looping_the_rooms",
            Name = "Looping the rooms",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 23.73, Cycle = 0 },
            Sound = { Time1 = 23.73 }
        },
        Sounds = {
            Start = { Sound = "music/looping_the_rooms.ogg", Delay = 0 },
			Repeat = { Sound = "music/looping_the_rooms.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["birdy_bunnie"] = {
        Config = {
            Anim = "amod_gatopack_birdy_bunnie",
            Name = "Birdy Bunnie",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 2.33, Cycle = 0 },
            Sound = { Time1 = 27.4 }
        },
        Movement = { Type = 3, Speed = 25 },
        Sounds = {
            Start = { Sound = "music/birdy_bunnie.ogg", Delay = 0 },
			Repeat = { Sound = "music/birdy_bunnie.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["side_step"] = {
        Config = {
            Anim = "amod_gatopack_side_step",
            Name = "Side Step",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 1.66, Cycle = 0 },
            Sound = { Time1 = 39.8, Time2 = 17.3 }
        },
        Sounds = {
            Start = { Sound = "music/side_step_start.ogg", Delay = 0 },
			StartExtra = { Sound = "music/side_step_loop.ogg", Delay = 22.5 },
			Repeat = { Sound = "music/side_step_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["dai_dai_dai_kirai"] = {
        Config = {
            Anim = "amod_gatopack_dai_dai_dai_kirai",
            Name = "Dai dai dai kirai",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 15.06, Time2 = 13.84, Cycle = 0.0774 },
            Sound = { Time1 = 15.06, Time2 = 13.84 }
        },
        Sounds = {
            Start = { Sound = "music/dai_dai_dai_kirai_intro.ogg", Delay = 0 },
			StartExtra = { Sound = "music/dai_dai_dai_kirai_loop.ogg", Delay = 1.22 },
			Repeat = { Sound = "music/dai_dai_dai_kirai_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["tetra"] = {
        Config = {
            Anim = "amod_gatopack_tetra",
            Name = "You're just like pop music",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "Jonatan", S64 = "76561199260572195", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 1, Cycle = 0 },
            Sound = { Time1 = 37.29, Time2 = 35.88 }
        },
        Sounds = {
            Start = { Sound = "music/tetra_dance_intro.ogg", Delay = 0 },
			StartExtra = { Sound = "music/tetra_dance_loop.ogg", Delay = 1.4 },
			Repeat = { Sound = "music/tetra_dance_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["mailbox_1"] = {
        Config = {
            Anim = "amod_gatopack_mailbox_1",
            Name = "Mailbox (Sonic)",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.73, Cycle = 0 },
            Sound = { Time1 = 39.2, Time2 = 38.32 }
        },
        Sounds = {
            Start = { Sound = "music/mailbox_intro.ogg", Delay = 0 },
			StartExtra = { Sound = "music/mailbox_loop.ogg", Delay = 0.88 },
			Repeat = { Sound = "music/mailbox_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_mailbox_2", MaxPlayers = 1 },
    },

    ["mailbox_2"] = {
        Config = {
            Anim = "amod_gatopack_mailbox_2",
            Name = "Mailbox (Tails)",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.73, Cycle = 0 },
            Sound = { Time1 = 39.2, Time2 = 38.32 }
        },
        Sounds = {
            Start = { Sound = "music/mailbox_intro.ogg", Delay = 0 },
			StartExtra = { Sound = "music/mailbox_loop.ogg", Delay = 0.88 },
			Repeat = { Sound = "music/mailbox_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500, OtherAnim = "amod_gatopack_mailbox_1", MaxPlayers = 1 },
    },

    ["gang_flex"] = {
        Config = {
            Anim = "amod_gatopack_gang_flex",
            Name = "Gang flex",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 0.5, Cycle = 0 },
            Sound = { Time1 = 79.45, Time2 = 75.64 }
        },
        Sounds = {
            Start = { Sound = "music/gang_flex_intro.ogg", Delay = 0 },
			StartExtra = { Sound = "music/gang_flex_loop.ogg", Delay = 3.81 },
			Repeat = { Sound = "music/gang_flex_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },

    ["muffin_time"] = {
        Config = {
            Anim = "amod_gatopack_muffin_time",
            Name = "Muffin time",
            CList = {
                Title = "Gato's Pack Emotes",
                Icon = "actmod/background/gatopack_logo.png",
                Background = "actmod/background/gatopack_background.jpg",
                BColor = Color(10, 10, 10, 120)
            },
            class = 1,
            isNew = true
        },
        About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
        Camera = { Follow = false, Transition = 1.5 },
        Custom = {
            Anim = { Time1 = 17.86, Time2 = 17.21, Cycle = 0.033 },
            Sound = { Time1 = 17.86, Time2 = 17.21 }
        },
        Sounds = {
            Start = { Sound = "music/muffin_time_intro.ogg", Delay = 0 },
			StartExtra = { Sound = "music/muffin_time_loop.ogg", Delay = 0.65 },
			Repeat = { Sound = "music/muffin_time_loop.ogg" }
        },
        Coop = { Sync = true, MaxDist = 500 },
    },



    -- ["metroman"] = {
    --     Config = {
    --         Anim = "amod_gatopack_metroman",
    --         Name = "Metroman",
    --         CList = {
    --             Title = "Gato's Pack Emotes",
    --             Icon = "actmod/background/gatopack_logo.png",
    --             Background = "actmod/background/gatopack_background.jpg",
    --             BColor = Color(10, 10, 10, 120)
    --         },
    --         class = 1,
    --         isNew = true
    --     },
    --     About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
    --     Camera = { Follow = false, Transition = 1.5 },
    --     Custom = {
    --         Anim = { Time1 = 7.51, Time2 = 0.583, Cycle = 0.865 },
    --         Sound = { Time1 = 29.55, Time2 = 22.55 }
    --     },
    --     Sounds = {
    --         Start = { Sound = "music/metroman_start.ogg", Delay = 0 },
    --         StartExtra = { Sound = "music/metroman_loop.ogg", Delay = 6.9 },
	-- 		Repeat = { Sound = "music/metroman_loop.ogg" }
    --     },
    --     Coop = { Sync = true, MaxDist = 500 },
    -- },

    -- ["yokai_watch"] = {
    --     Config = {
    --         Anim = "amod_gatopack_yokai_watch",
    --         Name = "Yo-kai Watch",
    --         CList = {
    --             Title = "Gato's Pack Emotes",
    --             Icon = "actmod/background/gatopack_logo.png",
    --             Background = "actmod/background/gatopack_background.jpg",
    --             BColor = Color(10, 10, 10, 120)
    --         },
    --         class = 1,
    --         isNew = true
    --     },
    --     About = { Author = "AdrielElGato", S64 = "76561199231961807", Version = "1" },
    --     Camera = { Follow = false, Transition = 1.5 },
    --     Custom = {
    --         Anim = { Time1 = 53.53, Cycle = 0 },
    --         Sound = { Time1 = 53.53 }
    --     },
    --     Sounds = {
	-- 		Start = { Sound = "music/yokai_watch.ogg", Delay = 0 },
	-- 		Repeat = { Sound = "music/yokai_watch.ogg" }
    --     },
    --     Coop = { Sync = true, MaxDist = 500 },
    -- }

}