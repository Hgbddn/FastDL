// Flamenco | Pop Lock (commission)
// 2026-AM4|5931|148635
return{
	["fortnite_flamenco"] = {
		Config = { Anim = "Amod_Fortnite_Flamenco",Name = "Flamenco",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "2.2" } ,Camera = { Follow = false,Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 9.03333,Cycle = 0.1172638436482085 } ,Sound = { Time1 = 28.29999,Time2 = 27.09999 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_Flamenco2018_1.mp3" ,Delay = 0.3 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_Flamenco2018_2.mp3" ,Delay = 1.2 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_Flamenco2018_2.mp3" }
		}
		,Scrpt = function()
			local function aDist(pl,taa) if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then return true end return false end
			local function SpEAt(pl,pos, GFord,dist,QHt,Asz)
				local emitter = ParticleEmitter(pos)
				if not emitter then return end
				for i = 0, QHt == 1 and math.random(1,3) or QHt == 2 and math.random(3,6) or QHt == 3 and math.random(6,10) or QHt > 3 and math.random(13,20) do
					local p = emitter:Add("particles/smokey", pos + VectorRand() * 0.3*Asz)
					if not p then break end local aaw = math.Clamp(math.random(dist*0.1 ,dist),0,2)
					p:SetVelocity((isvector(GFord) and GFord * (isnumber(dist) and math.random(dist*0.2 ,dist*4) or math.random(1,20)) + VectorRand() * 3 or VectorRand() * 30 + Vector(0,0,1)))
					p:SetDieTime(math.Rand(0.1,0.3)) p:SetStartAlpha(255) p:SetEndAlpha(0)
					p:SetStartSize(math.Rand(1.1,4)*aaw*Asz) p:SetEndSize(math.Rand(0,7)*aaw*Asz)
					p:SetAirResistance(math.Rand(10,50)*(1+(Asz*1.2))) p:SetGravity(Vector(0, 0, math.random(5,20)*Asz))
				end
				emitter:Finish()
			end
			local function SpPAt(pl,aPos,Asz)
				local QHt = GetConVarNumber("actmod_cl_q_ef")
				if QHt < 3 then return end
				if istable(aPos) and #aPos >= 2 and isvector(aPos[1]) and isvector(aPos[2]) then
					local dist = aPos[1]:Distance(aPos[2])
					if dist > 1 then
						SpEAt(pl,LerpVector(0.7,aPos[1],aPos[2]), (aPos[2] - aPos[1]):GetNormalized(),dist,QHt,Asz)
					end
				elseif isvector(aPos) then
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.apos then
						local dist = pl.actmod_cl_TmpDtEf.apos:Distance(aPos)
						if dist > 1 then
							SpEAt(pl,LerpVector(0.7,pl.actmod_cl_TmpDtEf.apos,aPos), (aPos - pl.actmod_cl_TmpDtEf.apos):GetNormalized(),dist,QHt,Asz)
						end
					end
					if not istable(pl.actmod_cl_TmpDtEf) then pl.actmod_cl_TmpDtEf = {} end
					pl.actmod_cl_TmpDtEf.apos = aPos
				end
			end
			return {
				SCpt = function(pl,cyc)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.ismk and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.ttimr then
						if pl.actmod_cl_TmpDtEf.smko and (pl.actmodstr == "amod_cumact_fortnite_flamenco" and (cyc < 0.842 or cyc > 0.8952) or pl.actmodstr == "amod_cumact_fortnite_poplock" and (cyc < 0.296 or cyc > 0.3978)) then pl.actmod_cl_TmpDtEf.smko = false end
						if pl.actmod_cl_TmpDtEf.ttimr < CurTime() and (pl.actmodstr == "amod_cumact_fortnite_flamenco" and (cyc > 0.842 and cyc < 0.8952) or pl.actmodstr == "amod_cumact_fortnite_poplock" and (cyc > 0.296 and cyc < 0.3978)) then
							pl.actmod_cl_TmpDtEf.ttimr = CurTime() + math.Rand(0,0.05)
							local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
							SpEAt(pl,A_AM.ActMod:GBonePosAng( pl,"ValveBiped.Bip01_L_Foot" ),nil,math.Rand(0.1,2),QHt,Asz)
							if QHt > 1 then
								if not pl.actmod_cl_TmpDtEf.smko and QHt > 1 then
									pl.actmod_cl_TmpDtEf.smko = true
									local gaa = 0.03
									if QHt == 1 then gaa = gaa*1.9 end
									if QHt == 2 then gaa = gaa*1.4 end
									if QHt > 3 then gaa = gaa*0.7 end
									pl.actmod_cl_TmpDtEf.TEsk = AM_CL_CreateTrail({
										ply = pl, ent = pl
										,Material = "trails/smoke"
										,boneName = "ValveBiped.Bip01_L_Foot"
										,color = Color(255,255,255), width = 4.5*Asz
										,duration = 0.64, holdTime = 0.01,lifetime = 0.3
										,TrailPointInterval = gaa ,SVector = {2.5*Asz, 0, 0}
										,AS_Pos = function(a,b) if a and b then SpPAt(pl,{a,b},Asz) end end
									})
								end
							end
						end
					elseif pl.actmodstr == "amod_cumact_fortnite_flamenco" or pl.actmodstr == "amod_cumact_fortnite_poplock" then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,ismk = true ,ttimr = CurTime()+(pl.actmodstr == "amod_cumact_fortnite_poplock" and 0.5 or 4.3) ,A_hupf = hupf,A_SubMF = A_SubMF }
					end
				end
			}
		end
	}
	
	,["fortnite_poplock"] = {
		Config = { Anim = "Amod_Fortnite_poplock",Name = "Pop Lock",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "1.6" } ,Camera = { Follow = false,Transition = 1.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 8.3,Cycle = 0.0235294117647059 } ,Sound = { Time1 = 16.8,Time2 = 16.6 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_PopLock.ogg" ,Delay = 0.2 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_PopLock.ogg" }
		}
		,Scrpt = function() return {SCpt = "amod_cumact_fortnite_flamenco"} end
	}
}