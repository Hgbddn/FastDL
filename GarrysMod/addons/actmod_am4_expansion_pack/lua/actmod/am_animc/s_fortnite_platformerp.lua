// Platformer Pace (commission)
// 2026-AM4|9276|148635
return{
	["fortnite_framedash"] = {
		Config = { Anim = "amod_fortnite_framedash",Name = "Platformer Pace",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "1.9" } ,Camera = { Transition = 3.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 12.76667,Cycle = 0.0051948051948052 },Sound = { Time1 = 128 } }
		,Movement = { Type = 3 ,Speed = 170 }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_FrameDash_1.ogg" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_FrameDash_2.ogg" }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_FrameDash_2.ogg" }
		}
		,Scrpt = function()
			local function aDist(pl,taa) if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then return true end return false end
			local function aisrun(pl) if IsValid(ply) and pl == LocalPlayer() and pl.AalowAnim_MForward or pl:GetVelocity():Dot(pl:GetForward()) > 10 then return true end return false end --pl:GetPoseParameter("move_x") > 0.55
			local function cfEff(pl,isR)
				local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
				if isR < 3 and aisrun(pl) then
					local b = pl:LookupBone(isR==1 and "ValveBiped.Bip01_R_Foot" or isR==2 and "ValveBiped.Bip01_L_Foot")
					if b then
						local apos = A_AM.ActMod:GBonePosAng( pl,isR==1 and "ValveBiped.Bip01_R_Foot" or isR==2 and "ValveBiped.Bip01_L_Foot" )
						local gAng = pl:GetRenderAngles()
						local pos = Vector(apos.x,apos.y,pl:GetPos().z) - gAng:Forward()*8*Asz + Vector(0,0,2*Asz)
						local emitter = ParticleEmitter(pos)
						if not emitter then return end
						for i = 0, QHt == 1 and math.random(6,9) or QHt == 2 and math.random(7,15) or QHt == 3 and math.random(15,20) or QHt > 3 and math.random(20,30) do
							local p = emitter:Add(string.format("actmod/eff_particle/pcb0%s",math.random(1,5)), pos + gAng:Forward()*math.random(3,-15)*Asz + VectorRand()*2*Asz + Vector(0,0,math.random(0,10)*Asz))
							if p then
								p:SetVelocity(-gAng:Forward()*math.random(100,150)*Asz +gAng:Right()*math.random(20,-20)*Asz + VectorRand() *5*Asz + Vector(0,0,math.random(-2,90)*Asz))
								p:SetDieTime(math.Rand(0.3,0.6)) p:SetStartAlpha(255) p:SetEndAlpha(255)
								p:SetStartSize(math.Rand(4,6)*Asz) p:SetEndSize(math.Rand(0,0.2)*Asz)
								p:SetAirResistance(math.Rand(30,50)*(1+(Asz*1.2)))
							end
						end
						emitter:Finish()
					end
				elseif isR == 3 and aisrun(pl) or isR == 4 then
					local pos = pl:GetPos() + Vector(0,0,4*Asz)
					local emitter = ParticleEmitter(pos)
					if not emitter then return end local pCount = 24
					for i = 1, pCount do
						local angle = (i / pCount) * math.pi * 2
						local dir = Vector(math.cos(angle), math.sin(angle), 0)
						local p = emitter:Add(string.format("actmod/eff_particle/pcb0%s",math.random(1,5)), pos + dir * (isR==3 and 10*Asz or 30*Asz)*math.Rand(0.5,1))
						if p then
							p:SetVelocity(dir*(isR==3 and 200*Asz or 150*Asz)*math.Rand(0.6,1)) p:SetDieTime(math.Rand(0.5,0.8))
							p:SetStartAlpha(255) p:SetEndAlpha(255) p:SetAirResistance((isR==3 and 50*Asz or 80*Asz)*math.Rand(0.7,1)*(1+(Asz*1.2)))
							p:SetStartSize((math.Rand(6,10)*Asz)*(isR==3 and 0.5 or 1)) p:SetEndSize(math.Rand(0.5,1)*Asz) p:SetColor(255, 255, 255)
						end
					end
					emitter:Finish()
				end
			end
			return {
				SCpt = function(pl,cyc,Fram)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.FrmDush and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
						if not pl.actmod_cl_TmpDtEf.tSndFt and cyc > 0.004 and (cyc < 0.01731 or cyc > 0.98) then
							pl.actmod_cl_TmpDtEf.tSndFt = true
							A_AM.ActMod:C_StopSond(pl,"3") A_AM.ActMod:A_aSond(pl,"actmod/i_act/am4/fortnite/Emote_FrameDash_3.ogg","3",75,"0")
						elseif pl.actmod_cl_TmpDtEf.tSndFt and (cyc < 0.004 or cyc > 0.2) then
							pl.actmod_cl_TmpDtEf.tSndFt = nil
						end
						if cyc > 0.0173 and cyc < 0.9845 then
							pl.actmod_cl_TmpDtEf.FDFtrn = 1
							if cyc > 0.98095 and cyc < 0.98441 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 29 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 29 cfEff(pl,1)
							elseif cyc > 0.94978 and cyc < 0.95324 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 28 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 28 cfEff(pl,2)
							elseif cyc > 0.91861 and cyc < 0.92121 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 27 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 27 cfEff(pl,1)
							elseif cyc > 0.88744 and cyc < 0.89090 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 26 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 26 cfEff(pl,2)
							elseif cyc > 0.85627 and cyc < 0.86060 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 25 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 25 cfEff(pl,1)
							elseif cyc > 0.82510 and cyc < 0.82857 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 24 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 24 cfEff(pl,2)
							elseif cyc > 0.76796 and cyc < 0.77575 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 23 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 23 cfEff(pl,1)
							elseif cyc > 0.73160 and cyc < 0.73506 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 22 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 22 cfEff(pl,2)
							elseif cyc > 0.70043 and cyc < 0.70389 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 21 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 21 cfEff(pl,1)
							elseif cyc > 0.66926 and cyc < 0.67272 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 20 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 20 cfEff(pl,2)
							elseif cyc > 0.63809 and cyc < 0.64155 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 19 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 19 cfEff(pl,1)
							elseif cyc > 0.60692 and cyc < 0.60952 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 18 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 18 cfEff(pl,2)
							elseif cyc > 0.57576 and cyc < 0.58008 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 17 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 17 cfEff(pl,1)
							elseif cyc > 0.56363 and cyc < 0.56883 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 16 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 16 cfEff(pl,4)
							elseif cyc > 0.51421 and cyc < 0.51948 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 15 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 15 cfEff(pl,3)
							elseif cyc > 0.47965 and cyc < 0.48311 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 14 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 14 cfEff(pl,1)
							elseif cyc > 0.44848 and cyc < 0.45194 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 13 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 13 cfEff(pl,2)
							elseif cyc > 0.41731 and cyc < 0.42077 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 12 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 12 cfEff(pl,1)
							elseif cyc > 0.38614 and cyc < 0.38874 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 11 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 11 cfEff(pl,2)
							elseif cyc > 0.35497 and cyc < 0.35757 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 10 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 10 cfEff(pl,1)
							elseif cyc > 0.32380 and cyc < 0.32640 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 9 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 9 cfEff(pl,2)
							elseif cyc > 0.26666 and cyc < 0.27099 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 8 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 8 cfEff(pl,1)
							elseif cyc > 0.23030 and cyc < 0.23290 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 7 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 7 cfEff(pl,2)
							elseif cyc > 0.19913 and cyc < 0.20173 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 6 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 6 cfEff(pl,1)
							elseif cyc > 0.16796 and cyc < 0.17056 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 5 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 5 cfEff(pl,2)
							elseif cyc > 0.13679 and cyc < 0.13852 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 4 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 4 cfEff(pl,1)
							elseif cyc > 0.10562 and cyc < 0.10735 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 3 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 3 cfEff(pl,2)
							elseif cyc > 0.07445 and cyc < 0.07619 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 2 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 2 cfEff(pl,1)
							elseif cyc > 0.01731 and cyc < 0.02077 and pl.actmod_cl_TmpDtEf.RDFt_PRL ~= 1 then pl.actmod_cl_TmpDtEf.RDFt_PRL = 1 cfEff(pl,2)
							end
						end
						if pl.actmod_cl_TmpDtEf.FDFtrn == 1 and cyc < (0.0131 or cyc > 0.981) and GetConVarNumber("actmod_cl_q_ef") > 2 then pl.actmod_cl_TmpDtEf = nil end
					elseif (not istable(pl.actmodstr) or not pl.actmodstr.FrmDush or not pl.actmod_cl_TmpDtEf.FDFtrn or pl.actmod_cl_TmpDtEf.FDFtrn == 1 and cyc > 0.981 and GetConVarNumber("actmod_cl_q_ef") > 2 ) and pl.actmodstr == "amod_cumact_fortnite_framedash" then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,FDFtrn = 0 ,RDFt_PRL = 0 ,FrmDush = true ,A_hupf = hupf,A_SubMF = A_SubMF }
					end
				end
			}
		end
	}
	
}