// Bring it around (commission)
// 2026-AM4|2831|148635
return{
	["fortnite_celebrationdance"] = {
		Config = {
			Anim = "amod_fortnite_celebrationdance"
			,Name = "Bring it around"
			,isNew = true ,class = 1
			,CList = {Title="ActMod Commission Hub",OFtn=true}
		}
		,About = { Author = "AhmedMake400",Version = "2.6" }
		,Camera = { Transition = 1.5 }
		,Custom = { Anim = { Cycle = 0 } ,Sound = { Time1 = 45.33333 } }
		,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Celebration_Dance.mp3" } }
		,Scrpt = function()
			local AAEffect = A_AM.ActMod.aTabDa_RunCyc["AAEffect"]
			local AASond = A_AM.ActMod.aTabDa_RunCyc["AASond"]
			local aTAlight = A_AM.ActMod.aTabDa_RunCyc["aTAlight"]
			local function aDist(pl,taa)
				if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then
					return true
				end
				return false
			end
			local Sounds = {
				"actmod/i_act/am4/fortnite/Emote_Celebration_Dance_SFX_01.mp3",
				"actmod/i_act/am4/fortnite/Emote_Celebration_Dance_SFX_02.mp3",
				"actmod/i_act/am4/fortnite/Emote_Celebration_Dance_SFX_03.mp3",
				"actmod/i_act/am4/fortnite/Emote_Celebration_Dance_SFX_04.mp3",
				"actmod/i_act/am4/fortnite/Emote_Celebration_Dance_SFX_05.mp3",
				"actmod/i_act/am4/fortnite/Emote_Celebration_Dance_SFX_06.mp3"
			}
			local LastSound = nil
			local function GetRandomSound()
				local sound
				repeat
					sound = Sounds[math.random(#Sounds)]
				until sound ~= LastSound
				LastSound = sound
				return sound
			end
			return {
				SCpt = function(pl,cyc,Fram)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")/2) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and pl.actmod_cl_TmpDtEf.ttimr then
						if pl.actmod_cl_TmpDtEf.ttimr < CurTime() then
							pl.actmod_cl_TmpDtEf.ttimr = CurTime() + math.Rand(0.2,0.5)
							local QHt = GetConVarNumber("actmod_cl_q_ef")
							local apos = {math.random(-20,20),math.random(-20,20),0,math.random(25,30)}
							AAEffect( 1,0.1,pl,{[1] = { ["nam"] = "am_f_celebdance" ,["Bone"] = "ValveBiped.Bip01_Head1" ,["PoS"] = apos }} )
							pl.actmod_cl_TmpDtEf.ams = not pl.actmod_cl_TmpDtEf.ams
							AASond( pl.actmod_cl_TmpDtEf.ams and 2 or 3,0.2,pl,{["Sound"] = GetRandomSound() ,["Volume"] = 73 } )
							if QHt > 2 then
								aTAlight(1,0.1,pl,{
									[1] = {["Bone"] = "ValveBiped.Bip01_Head1" ,["PoS"] = apos ,["rgb"] = {255,255,255} ,["brightness"] = 4 ,["decay"] = 45 ,["size"] = math.max(100,120) ,["dietime"] = 0.03}
								})
							end
						end
					else
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr ,ams = false ,ttimr = CurTime()+0.2 ,TEff = {} }
					end
				end
			}
		end
	}
	
}