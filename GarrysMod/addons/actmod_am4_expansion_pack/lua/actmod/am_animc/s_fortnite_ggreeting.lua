// Gauntlet Greeting (commission)
// 2026-AM4|13998|148635
return{
	["fortnite_foundkelp"] = {
		Config = {
			Anim = "amod_fortnite_foundkelp_p1"
			,Name = "Gauntlet Greeting" ,class = 1 ,isNew = true
			,CList = {Title="ActMod Commission Hub",OFtn=true}
		}
		,About = { Author = "AhmedMake400",Version = "5.2" }
		,Camera = { Transition = 1 }
		,Custom = {
			Anim = { Time2 = 1.4,Cycle = 0.832 }
			,Sound = { Time1 = 11.4 ,Time2 = 10.1 }
		}
		,Coop = {
			Sync = true
			,Reverse = true
			,YourAnim = "fortnite_FoundKelp_s1"
			,OtherAnim = "fortnite_FoundKelp_s2"
			,ReplaySelf = true
			,NoRepetition = true
			,MaxPlayers = 1
			,SoundOther = true
			,TryFixPos = {
				["+Forward"] = true ,["*add"] = 1.0 ,["add+_m"] = 1.5 ,["add+_f"] = 4 ,["Cycl"] = 0.4107883
				,["Ani1"] = "amod_fortnite_foundkelp_p3" ,["Ani2"] = "amod_fortnite_foundkelp_p2"
				,["Bip1"] = "ValveBiped.Bip01_R_Hand" ,["Bip2"] = "ValveBiped.Bip01_R_Hand"
			}
		}
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_FoundKelp_1.mp3" ,Delay = 0.01 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_FoundKelp_2.mp3" ,Delay = 1.4 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_FoundKelp_2.mp3" }
		}
		,Scrpt = function()
			local mat01 = Material( "trails/plasma" )
			local mat02 = Material( "sprites/physbeam" )
			function A_AM.ActMod:AEEff_foundkelp(pl)
				local now,hupf = CurTime(),pl.actmod_cl_TmpDtEf.A_hupf
				local elapsed = now - pl.actmod_cl_TmpDtEf.stCurT
				local Asz,QHt = hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
				local boneID = pl:LookupBone("ValveBiped.Bip01_R_Hand")
				if not boneID then return end
				local bonePos, boneAng = pl:GetBonePosition(boneID)
				if not bonePos then return end
				local localDir = Angle(2, -15, 0):Forward()
				localDir:Rotate(boneAng)
				local vNormal,localOffset = localDir,Vector(-4*hupf, 0*hupf, 0)
				localOffset:Rotate(boneAng)
				local vOffset,gScale = bonePos + localOffset ,pl.actmod_cl_TmpDtEf.tEndTime and math.Clamp( 1-( CurTime() - pl.actmod_cl_TmpDtEf.tEndTime )/0.8, 0, 1 ) or math.Clamp( ( CurTime() - pl.actmod_cl_TmpDtEf.stCurT )/0.6, 0, 1 )
				local scroll,az,aaz,Scale = 10 + ( CurTime() * -0.5 ) ,0.3*gScale*hupf,0.55*gScale*hupf ,math.Clamp( ( CurTime() - elapsed ) * 5, 0, 1 )*hupf
				render.SetMaterial( mat01 )
				render.StartBeam( 5 )
					render.AddBeam( vOffset, 5*aaz * Scale, scroll, Color( 50, 100, 255, 255 ) )
					render.AddBeam( vOffset + vNormal * 20*az * Scale, 20*aaz * Scale, scroll + 0.25, Color( 100, 150, 255, 200 ) )
					render.AddBeam( vOffset + vNormal * 48*az * Scale, 10*aaz * Scale, scroll + 0.5, Color( 10, 255, 255, 50 ) )
					render.AddBeam( vOffset + vNormal * 60*az * Scale, 6*aaz * Scale, scroll + 0.75, Color( 0, 10, 100, 0 ) )
					render.AddBeam( vOffset + vNormal * 60*az * Scale, 3*aaz * Scale, scroll + 1, Color( 0, 0, 0, 0 ) )
				render.EndBeam()
				if QHt > 1 then
					scroll = scroll * 0.7
					render.StartBeam( 5 )
						render.AddBeam( vOffset, 20*aaz * Scale, scroll, Color( 50, 200, 255, 0 ) )
						render.AddBeam( vOffset + vNormal * 20*az * Scale, 10*aaz * Scale, scroll + 0.25, Color( 155, 200, 255, 200 ) )
						render.AddBeam( vOffset + vNormal * 48*az * Scale, 20*aaz * Scale, scroll + 0.5, Color( 10, 150, 255, 50 ) )
						render.AddBeam( vOffset + vNormal * 60*az * Scale, 8*aaz * Scale, scroll + 0.75, Color( 0, 10, 100, 0 ) )
						render.AddBeam( vOffset + vNormal * 80*az * Scale, 4*aaz * Scale, scroll + 1, Color( 0, 0, 0, 0 ) )
					render.EndBeam()
					render.EndBeam() scroll = scroll * 0.8 render.SetMaterial( mat02 )
					render.StartBeam( 5 )
						render.AddBeam( vOffset, 10*aaz * Scale, scroll, Color( 50, 100, 255, 0 ) )
						render.AddBeam( vOffset + vNormal * 20*az * Scale, 20*aaz * Scale, scroll + 0.75, Color( 100, 200, 255, 200 ) )
						render.AddBeam( vOffset + vNormal * 48*az * Scale, 40*aaz * Scale, scroll + 1.5, Color( 50, 100, 255, 50 ) )
						render.AddBeam( vOffset + vNormal * 60*az * Scale, 10*aaz * Scale, scroll + 2.25, Color( 0, 10, 100, 0 ) )
						render.AddBeam( vOffset + vNormal * 80*az * Scale, 5*aaz * Scale, scroll + 3, Color( 0, 0, 0, 0 ) )
					render.EndBeam()
				end
				if gScale == 1 then
					local pos = vOffset + vNormal*3.5*Asz
					local emitter = ParticleEmitter(pos)
					if emitter then
						for i = 0, math.random(1,2) do
							if math.random(1,9) ~= 6 then continue end
							local p = emitter:Add("actmod/eff_particle/p_glow_01", pos + VectorRand() * 0.3*Asz + vNormal*math.random(-1,5)*Asz)
							if not p then break end
							p:SetVelocity(VectorRand() * math.random(10,60) + Vector(0,0,math.random(5,15))*Asz)
							p:SetDieTime(math.Rand(0.1,0.8)) p:SetStartAlpha(255) p:SetEndAlpha(0) p:SetColor(50, 150, 255)
							p:SetStartSize(math.Rand(0.5,2)*Asz) p:SetEndSize(math.Rand(0,2)*Asz)
							p:SetAirResistance(math.Rand(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,math.Rand(90, 100)))
							p:SetStartLength(math.Rand(0.5,3)*Asz) p:SetEndLength(math.Rand(0.1,2)*Asz)
						end
						emitter:Finish()
					end
				end
			end
			return {
				SCpt = function(pl,cyc)
					if istable(pl.actmod_cl_TmpDtEf) and isstring(pl.actmod_cl_TmpDtEf.Astr) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.aEffG then
						if pl.actmod_cl_TmpDtEf.cEff == 0 and cyc > 0.074 then pl.actmod_cl_TmpDtEf.cEff = 1 pl.actmod_cl_TmpDtEf.stCurT = CurTime() end
					elseif pl.actmodstr == "amod_cumact_fortnite_foundkelp" then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr ,cEff = 0 ,CurTRun = pl.ActMod_CurTRun ,A_hupf = hupf ,A_SubMF = A_SubMF ,aEffG = true }
					end
				end
				,SDrw = function(pl,cyc)
					if istable(pl.actmod_cl_TmpDtEf) and isstring(pl.actmod_cl_TmpDtEf.Astr) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.aEffG and isnumber(pl.actmod_cl_TmpDtEf.stCurT) and pl.actmod_cl_TmpDtEf.cEff == 1 then
						if A_AM.ActMod.AEEff_foundkelp then A_AM.ActMod:AEEff_foundkelp(pl) end
					end
				end
			}
		end
	}
	,["fortnite_FoundKelp_s1"] = {
		Config = { Anim = "amod_fortnite_foundkelp_p2" ,Name = "Gauntlet Greeting" ,class = -1 ,CList = {Title="ActMod Commission Hub",OFtn=true},DontAllowAng=true }
		,Camera = { Transition = 2 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_FoundKelp_3.mp3" ,Delay = 0 } }
		,Scrpt = function()
			local mat01 = Material( "actmod/eff_particle/p_glow_02" )
			local mat02 = Material( "actmod/eff_particle/efx_ligh02" )
			return {
				SCpt = function(pl,cyc)
					if istable(pl.actmod_cl_TmpDtEf) and isstring(pl.actmod_cl_TmpDtEf.Astr) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.aEffG then
						if pl.actmod_cl_TmpDtEf.caff == 0 and cyc > 0.534 then pl.actmod_cl_TmpDtEf.caff = 1 pl.actmod_cl_TmpDtEf.tEndTime = CurTime() end
						if pl.actmod_cl_TmpDtEf.cEff == 1 and cyc > 0.7 then pl.actmod_cl_TmpDtEf.cEff = 2 end
						if pl.actmod_cl_TmpDtEf.caaf == 0 and cyc > 0.414 then
							if cyc > 0.56 then pl.actmod_cl_TmpDtEf.caaf = 1 end
							if not pl.actmod_cl_TmpDtEf.stEf2 then pl.actmod_cl_TmpDtEf.stEf2 = CurTime() end
							local boNe = pl:LookupBone("ValveBiped.Bip01_R_Hand")
							if boNe then
								local gScale = math.Clamp( 1-( CurTime() - pl.actmod_cl_TmpDtEf.stEf2 )/1.9,0,1)
								local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale()*gScale,GetConVarNumber("actmod_cl_q_ef")
								local PP_pos,PP_ang = pl:GetBonePosition(boNe)
								local a_pos = PP_pos + PP_ang:Forward()*5.5*Asz
								if QHt > 1 then
									local emitter = ParticleEmitter(PP_pos)
									if emitter then
										for i = 0, QHt == 2 and math.random(3,5) or QHt > 2 and math.random(7,9) do
											local p = emitter:Add("actmod/eff_particle/p_glow_01", PP_pos + VectorRand() * 2.5*Asz + PP_ang:Forward()*math.random(-1,5)*Asz)
											if not p then break end
											p:SetVelocity(VectorRand() *math.random(60,90)*Asz + Vector(0,0,math.random(50,80)*gScale*Asz))
											p:SetDieTime(math.Rand(0.2,0.8)*gScale)  p:SetColor(50, 150, 255)
											p:SetStartAlpha(255) p:SetEndAlpha(0)
											p:SetStartSize(math.Rand(1,3)*gScale*Asz) p:SetEndSize(math.Rand(0,3)*gScale*Asz)
											p:SetAirResistance(math.Rand(50,150)*(1+(Asz*1.2))) p:SetGravity(Vector(0,0,-math.Rand(150, 240)))
										end
										if (pl.actmod_cl_TmpDtEf.aatImr01 or 0) < CurTime() then
											pl.actmod_cl_TmpDtEf.aatImr01 = CurTime() + math.Rand(0.4,0.6)
											local p = emitter:Add("actmod/eff_particle/p_ring_wave", PP_pos + PP_ang:Forward() *3*Asz)
											if p then
												p:SetDieTime(math.Rand(0.7,1.3)) p:SetColor(50, 190, 255) p:SetStartAlpha(255) p:SetEndAlpha(0)
												p:SetStartSize(math.Rand(9,15)*gScale*Asz) p:SetEndSize(math.Rand(35,35)*math.max(gScale,0.5)*Asz)
												p:SetRoll( math.Rand(-1,1) ) p:SetRollDelta( math.random(10,-10) )
											end
										end
										emitter:Finish()
									end
								end
							end
						end
					elseif pl.actmodstr == "amod_cumact_fortnite_foundkelp_s1" then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr ,caff = 0 ,caaf = 0 ,cEff = 1 ,CurTRun = pl.ActMod_CurTRun ,stCurT = CurTime()-2 ,A_hupf = hupf ,A_SubMF = A_SubMF ,aEffG = true }
					end
				end
				,SDrw = function(pl,cyc)
					if istable(pl.actmod_cl_TmpDtEf) and isstring(pl.actmod_cl_TmpDtEf.Astr) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.aEffG and isnumber(pl.actmod_cl_TmpDtEf.stCurT) and pl.actmod_cl_TmpDtEf.cEff == 1 then
						if A_AM.ActMod.AEEff_foundkelp then A_AM.ActMod:AEEff_foundkelp(pl) end
						if pl.actmod_cl_TmpDtEf.stEf2 then
							local boNe = pl:LookupBone("ValveBiped.Bip01_R_Hand")
							if boNe then
								local gScale = math.Clamp( 1-( CurTime() - pl.actmod_cl_TmpDtEf.stEf2 )/1.6,0,1)
								local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale()*gScale,GetConVarNumber("actmod_cl_q_ef")
								local PP_pos,PP_ang = pl:GetBonePosition(boNe)
								local a_pos = PP_pos + PP_ang:Forward()*5.5*Asz
								render.SetMaterial(mat01)
								render.DrawSprite(a_pos, math.random(30,40)*Asz, math.random(30,40)*Asz, Color(50,200,255,255*math.Rand(0.5,1)*gScale))
								if QHt > 1 then
									render.SetMaterial(mat02)
									render.DrawSprite(a_pos, math.random(40,60)*Asz, math.random(40,60)*Asz, Color(255,255,255,255*math.Clamp(gScale*2-1.6,0,1)))
								end
								if QHt > 2 then
									local now = CurTime()
									local dl = DynamicLight(pl:EntIndex() ,QHt < 4)
									if dl then
										dl.Pos = a_pos
										dl.r = 50 dl.g = 200 dl.b = 255
										dl.Brightness = 5.1 * Asz
										dl.Size = 140 * Asz * math.Clamp( 1-( CurTime() - pl.actmod_cl_TmpDtEf.stEf2 )/2.7,0,1)
										dl.Decay = 400
										dl.DieTime = now + 0.07
									end
								end
							end
						end
					end
				end
			}
		end
	}
	,["fortnite_FoundKelp_s2"] = {
		Config = { Anim = "amod_fortnite_foundkelp_p3" ,Name = "Gauntlet Greeting" ,class = -1 ,CList = {Title="ActMod Commission Hub",OFtn=true},DontAllowAng=true }
		,Camera = { Transition = 3 }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_FoundKelp_4.mp3" ,Delay = 0 } }
		,Scrpt = function()
			return {
				SCpt = function(pl,cyc)
					if istable(pl.actmod_cl_TmpDtEf) and isstring(pl.actmod_cl_TmpDtEf.Astr) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.aEffG then
						if pl.actmod_cl_TmpDtEf.cEff == 0 and cyc > 0.036 then pl.actmod_cl_TmpDtEf.cEff = 1 pl.actmod_cl_TmpDtEf.stCurT = CurTime() end
						if pl.actmod_cl_TmpDtEf.caff == 0 and cyc > 0.534 then pl.actmod_cl_TmpDtEf.caff = 1 pl.actmod_cl_TmpDtEf.tEndTime = CurTime() end
						if pl.actmod_cl_TmpDtEf.cEff == 1 and cyc > 0.7 then pl.actmod_cl_TmpDtEf.cEff = 2 end
					elseif pl.actmodstr == "amod_cumact_fortnite_foundkelp_s2" then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr ,caff = 0 ,cEff = 0 ,CurTRun = pl.ActMod_CurTRun ,A_hupf = hupf ,A_SubMF = A_SubMF ,aEffG = true }
					end
				end
				,SDrw = function(pl,cyc)
					if istable(pl.actmod_cl_TmpDtEf) and isstring(pl.actmod_cl_TmpDtEf.Astr) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.aEffG and isnumber(pl.actmod_cl_TmpDtEf.stCurT) and pl.actmod_cl_TmpDtEf.cEff == 1 then
						if A_AM.ActMod.AEEff_foundkelp then A_AM.ActMod:AEEff_foundkelp(pl) end
					end
				end
			}
		end
	}
}