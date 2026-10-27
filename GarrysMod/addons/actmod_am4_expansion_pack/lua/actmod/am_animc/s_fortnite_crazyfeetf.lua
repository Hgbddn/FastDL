// Crazy Feet (commission)
// 2026-AM4|7792|148635
return{
	["fortnite_crazyfeet"] = {
		Config = { Anim = "amod_fortnite_crazyfeet",Name = "Crazy Feet",isNew = true,class = 1,Rate = 0.99950,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "2.5" } ,Camera = { Transition = 2.8 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time1 = 5.045,Cycle = 0 },Sound = { Time1 = 20.18 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_CrazyFeet_Banger01.mp3" } }
		,Scrpt = function()
			local math_Clamp,math_TimeFraction = math.Clamp,math.TimeFraction
			local function CycG(c,a,b) return math_Clamp(math_TimeFraction(a,b,c),0,1) end
			local function CycGHS(c,a,b,h)
				h = h or 0
				local len = b - a
				local f = (len - h) * 0.5
				local hs,he = a + f,b - f
				if c <= a or c >= b then return 0 end
				if c < hs then return math.Remap(c, a, hs, 0, 1) end
				if c <= he then return 1 end
				return math.Remap(c, he, b, 1, 0)
			end
			local tclo = {{255,50,100},{50,255,50},{255,255,0},{0,255,255}}
			local function cfEff(pl,isR)
				local Asz,QHt,tol = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef"),math.random(1,4)
				local b = pl:LookupBone(isR and "ValveBiped.Bip01_R_Toe0" or "ValveBiped.Bip01_L_Toe0")
				local apos,aang = A_AM.ActMod:GBonePosAng( pl,isR and (b and "ValveBiped.Bip01_R_Toe0" or "ValveBiped.Bip01_R_Foot") or (b and "ValveBiped.Bip01_L_Toe0" or "ValveBiped.Bip01_L_Foot") )
				local pos = Vector(apos.x,apos.y,pl:GetPos().z+2*Asz)
				if not b then pos = pos + pl:GetForward()*4*Asz end
				AM_CL_CreateLampEff({
					ent = pl,pos = pos,eyeBPos = pos + Vector(0,0,20*Asz),dir = Vector(0,0,1),
					dlightPos = pos+Vector(0,0,6*Asz) + pl:GetForward()*2*Asz,
					length = 40*Asz,color = Color(tclo[tol][1],tclo[tol][2],tclo[tol][3], 120),
					spriteMat = "actmod/eff_particle/p_i_ligtstar_00_2", spriteSize = 10*Asz,
					beamMat = "actmod/eff_particle/eray01", beamEnable =  QHt > 1,
					hold = 0.1,fadeIn = 0,fadeOut = 0.2,
					beamStartWidth = 80*Asz,beamEndWidth = 80*Asz, aPUp = -5*Asz,
					dlightRadius = 80*Asz,dlightBrightness = 1, decay = 6000, olym = QHt < 4, dlightEnable = QHt > 2
				})
			end
			return {
				SCpt = function(pl,cyc,Fram)
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.CrFet and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.CrFtrn then
						if cyc > 0.031 and cyc < 0.9867 then
							pl.actmod_cl_TmpDtEf.CrFtrn = 1
							local bL,bR = pl:LookupBone("ValveBiped.Bip01_L_Hand"),pl:LookupBone("ValveBiped.Bip01_R_Hand")
							if bL then
								if cyc > 0.927 and cyc < 0.953 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 16 then pl.actmod_cl_TmpDtEf.CrFeet_L = 16 cfEff(pl)
								elseif cyc > 0.868 and cyc < 0.886 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 15 then pl.actmod_cl_TmpDtEf.CrFeet_L = 15 cfEff(pl)
								elseif cyc > 0.776 and cyc < 0.804 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 14 then pl.actmod_cl_TmpDtEf.CrFeet_L = 14 cfEff(pl)
								elseif cyc > 0.703 and cyc < 0.72 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 13 then pl.actmod_cl_TmpDtEf.CrFeet_L = 13 cfEff(pl)
								elseif cyc > 0.617 and cyc < 0.638 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 12 then pl.actmod_cl_TmpDtEf.CrFeet_L = 12 cfEff(pl)
								elseif cyc > 0.546 and cyc < 0.5593 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 11 then pl.actmod_cl_TmpDtEf.CrFeet_L = 11 cfEff(pl)
								elseif cyc > 0.486 and cyc < 0.5 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 10 then pl.actmod_cl_TmpDtEf.CrFeet_L = 10 cfEff(pl)
								elseif cyc > 0.4539 and cyc < 0.461 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 9 then pl.actmod_cl_TmpDtEf.CrFeet_L = 9 cfEff(pl)
								elseif cyc > 0.407 and cyc < 0.421 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 8 then pl.actmod_cl_TmpDtEf.CrFeet_L = 8 cfEff(pl)
								elseif cyc > 0.355 and cyc < 0.369 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 7 then pl.actmod_cl_TmpDtEf.CrFeet_L = 7 cfEff(pl)
								elseif cyc > 0.301 and cyc < 0.315 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 6 then pl.actmod_cl_TmpDtEf.CrFeet_L = 6 cfEff(pl)
								elseif cyc > 0.256 and cyc < 0.269 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 5 then pl.actmod_cl_TmpDtEf.CrFeet_L = 5 cfEff(pl)
								elseif cyc > 0.202 and cyc < 0.215 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 4 then pl.actmod_cl_TmpDtEf.CrFeet_L = 4 cfEff(pl)
								elseif cyc > 0.131 and cyc < 0.15 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 3 then pl.actmod_cl_TmpDtEf.CrFeet_L = 3 cfEff(pl)
								elseif cyc > 0.065 and cyc < 0.079 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 2 then pl.actmod_cl_TmpDtEf.CrFeet_L = 2 cfEff(pl)
								elseif cyc > 0.0131 and cyc < 0.033 and pl.actmod_cl_TmpDtEf.CrFeet_L ~= 1 then pl.actmod_cl_TmpDtEf.CrFeet_L = 1 cfEff(pl)
								end
							end
							if bR then
								if cyc > 0.953 and cyc < 0.98 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 14 then pl.actmod_cl_TmpDtEf.CrFeet_R = 14 cfEff(pl,true)
								elseif cyc > 0.901 and cyc < 0.914 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 13 then pl.actmod_cl_TmpDtEf.CrFeet_R = 13 cfEff(pl,true)
								elseif cyc > 0.811 and cyc < 0.841 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 12 then pl.actmod_cl_TmpDtEf.CrFeet_R = 12 cfEff(pl,true)
								elseif cyc > 0.7302 and cyc < 0.75 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 11 then pl.actmod_cl_TmpDtEf.CrFeet_R = 11 cfEff(pl,true)
								elseif cyc > 0.661 and cyc < 0.69 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 10 then pl.actmod_cl_TmpDtEf.CrFeet_R = 10 cfEff(pl,true)
								elseif cyc > 0.572 and cyc < 0.61 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 9 then pl.actmod_cl_TmpDtEf.CrFeet_R = 9 cfEff(pl,true)
								elseif cyc > 0.5 and cyc < 0.526 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 8 then pl.actmod_cl_TmpDtEf.CrFeet_R = 8 cfEff(pl,true)
								elseif cyc > 0.447 and cyc < 0.466 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 7 then pl.actmod_cl_TmpDtEf.CrFeet_R = 7 cfEff(pl,true)
								elseif cyc > 0.374 and cyc < 0.401 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 6 then pl.actmod_cl_TmpDtEf.CrFeet_R = 6 cfEff(pl,true)
								elseif cyc > 0.283 and cyc < 0.305 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 5 then pl.actmod_cl_TmpDtEf.CrFeet_R = 5 cfEff(pl,true)
								elseif cyc > 0.22 and cyc < 0.25 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 4 then pl.actmod_cl_TmpDtEf.CrFeet_R = 4 cfEff(pl,true)
								elseif cyc > 0.157 and cyc < 0.1842 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 3 then pl.actmod_cl_TmpDtEf.CrFeet_R = 3 cfEff(pl,true)
								elseif cyc > 0.11 and cyc < 0.124 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 2 then pl.actmod_cl_TmpDtEf.CrFeet_R = 2 cfEff(pl,true)
								elseif cyc > 0.0328 and cyc < 0.059 and pl.actmod_cl_TmpDtEf.CrFeet_R ~= 1 then pl.actmod_cl_TmpDtEf.CrFeet_R = 1 cfEff(pl,true)
								end
							end
						end
						if pl.actmod_cl_TmpDtEf.CrFtrn == 1 and cyc < (0.0131 or cyc > 0.981) and GetConVarNumber("actmod_cl_q_ef") > 2 then pl.actmod_cl_TmpDtEf = nil end
					elseif (not istable(pl.actmodstr) or not pl.actmodstr.CrFet or not pl.actmod_cl_TmpDtEf.CrFtrn or pl.actmod_cl_TmpDtEf.CrFtrn == 1 and cyc > 0.981 and GetConVarNumber("actmod_cl_q_ef") > 2 ) and pl.actmodstr == "amod_cumact_fortnite_crazyfeet" then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,CrFtrn = 0 ,CrFeet_L = 0,CrFeet_R = 0 ,CrFet = true ,A_hupf = hupf,A_SubMF = A_SubMF }
					end
				end
			}
		end
	}
	
}