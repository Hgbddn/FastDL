// Star Power (commission)
// 2026-AM4|9703|148635
return{
	["fortnite_poprock"] = {
		Config = { Anim = "amod_fortnite_poprock",Name = "Star Power",isNew = true,class = 1,CList = {Title = "ActMod Commission Hub",OFtn = true} }
		,About = { Author = "AhmedMake400",Version = "3.7" } ,Camera = { Transition = 1.4 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time1 = 8,Cycle = 0 },Sound = { Time1 = 16 } }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_PopRock_01.mp3" } }
		,Scrpt = function()
			local math_Clamp,math_TimeFraction = math.Clamp,math.TimeFraction
			local mat_ppr,mat_ppk = Material("actmod/eff_particle/p_i_ligtstar_05"),Material("actmod/eff_particle/pprkcyc")
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
			local tclo = {{255,220,100},{0,255,255},{255,255,0},{220,0,255},{19,203,19},{127,0,255}}
			local function CStarEfft01(pos,aang,Asz,QHt,pl)
				local emitter = ParticleEmitter(pos)
				if not IsValid(pl) or not isstring(pl.actmodstr) then return end
				if not emitter then return end
				local e1 = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_1", pos)
				if not e1 then return end
				local sTime,velo = CurTime(),VectorRand() * 10*Asz
				local flStart,ftim,fszi,tol = math.Rand(0.5,0.8),math.Rand(0,0.3),math.random(2,3)*Asz,math.random(1,6)
				local fadeStart,aol,sfrm = flStart + 0.3,math.random(180,255),math.Rand(0.001,0.2)
				e1:SetVelocity(velo) e1:SetDieTime(1) e1:SetRoll(math.Rand(-1,1))
				e1:SetStartAlpha(0) e1:SetEndAlpha(0) e1:SetColor(tclo[tol][1],tclo[tol][2],tclo[tol][3])
				e1:SetStartSize(fszi) e1:SetEndSize(fszi) e1.sTr = pl.actmodstr e1.tspda = math.Rand(6,9)
				e1:SetAirResistance(math.Rand(10,20)*(1+(Asz*1.2))) e1.tspAA = 128+127*math.sin(CurTime()*e1.tspda+e1.tspda)
				e1:SetThinkFunction(function(p)
					if not e1.sstop and (not IsValid(pl) or e1.sTr ~= pl.actmodstr) then e1:SetDieTime(0) e1:SetLifeTime(1.1) e1.sstop = true end
					if e1.sstop then return end
					local time,sizeFa = CurTime() - sTime,1
					if time < ftim then
						sizeFa = time / ftim
					elseif time > flStart then
						sizeFa = 1 - (time - flStart) / (fadeStart - flStart)
					else
						sizeFa = 1
					end
					if time >= fadeStart then
						local a = math_Clamp(1 - (time - fadeStart) * 2, 0, 1)
						e1.tspAA = (128+127*math.sin(CurTime()*e1.tspda+e1.tspda))*a
						p:SetStartAlpha(e1.tspAA) if a <= 0 then e1.sstop = true end
					else
						if sizeFa >= 1 then
							e1.tspAA = 128+127*math.sin(CurTime()*e1.tspda+e1.tspda)
							p:SetStartAlpha(e1.tspAA)
						else
							p:SetStartAlpha(e1.tspAA*sizeFa)p:SetEndAlpha(e1.tspAA*sizeFa)
							e1:SetStartSize(fszi*sizeFa) e1:SetEndSize(fszi*sizeFa)
						end
					end
					p:SetNextThink(CurTime())
				end)
				e1:SetNextThink(CurTime())
				emitter:Finish()
			end
			local function SpEAt(pl,pos, GFord,dist,QHt,Asz)
				local emitter = ParticleEmitter(pos)
				if not emitter then return end
				for i = 0, QHt == 1 and math.random(1,3) or QHt == 2 and math.random(3,6) or QHt == 3 and math.random(6,10) or QHt > 3 and math.random(10,15) do
					local p = emitter:Add("actmod/eff_particle/laser_tracer01", pos + VectorRand() * 0.3*Asz)
					if not p then break end local aaw,tol = math_Clamp(math.random(dist*0.1 ,dist),0,2),math.random(1,6)
					p:SetVelocity((isvector(GFord) and GFord * (isnumber(dist) and math.random(dist*0.2 ,dist*4) or math.random(1,20)) + VectorRand() * 3 or VectorRand() * 30))
					p:SetDieTime(math.Rand(0.1,0.4)) p:SetStartAlpha(255) p:SetEndAlpha(0)
					p:SetStartSize(math.Rand(0.1,2)*aaw*Asz) p:SetEndSize(math.Rand(0,1)*aaw*Asz)
					p:SetAirResistance(math.Rand(10,50)*(1+(Asz*1.2))) p:SetColor(tclo[tol][1],tclo[tol][2],tclo[tol][3])
					p:SetStartLength(math.Rand(1,2)*Asz) p:SetEndLength(math.Rand(0.1,1)*Asz)
				end
				emitter:Finish()
			end
			local function SpPAt(pl,aPos,Asz)
				local QHt = GetConVarNumber("actmod_cl_q_ef")
				if QHt < 2 then return end
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
				-- ,SDrwO = function(pl,_,model1)
				SCpt = function(pl,cyc,Fram)
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.Dpoprock and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.Pprkrn then
						if pl.actmod_cl_TmpDtEf.Pprkrn == 0 and cyc > 0.2394 and cyc < 0.2449 then
							pl.actmod_cl_TmpDtEf.Pprkrn = 1
							pl.actmod_cl_TmpDtEf.PpSetPos = 1
							local bone = pl:LookupBone("ValveBiped.Bip01_R_Hand")
							if bone then
								local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
								-- local apos,aang = A_AM.ActMod:GBonePosAng( pl,"ValveBiped.Bip01_R_Hand" )
								-- pl.actmod_cl_TmpDtEf.geffPos = apos
								-- for i = 1,QHt > 2 and 30 or 6 do CStarEfft01(apos,aang,Asz,QHt,pl) end
								if QHt > 1 then
									local gaa = 0.03
									if QHt == 2 then gaa = gaa*1.4 end
									if QHt > 3 then gaa = gaa*0.7 end
									pl.actmod_cl_TmpDtEf.TPpRk = AM_CL_CreateTrail({
										ply = pl, ent = pl
										,Material = "actmod/eff_particle/pprktila"
										,boneName = "ValveBiped.Bip01_R_Hand"
										,Nobreak = QHt > 2
										,color = Color(255,255,255), width = 4*Asz
										,duration = 0.4, holdTime = 0.1,lifetime = 0.3
										,TrailPointInterval = gaa ,SVector = {3.5*Asz, 0, 0}
										,AS_Pos = function(a,b) if a and b then SpPAt(pl,{a,b},Asz) end end
									})
								end
							end
						end
						if pl.actmod_cl_TmpDtEf.PpSetPos then
							if pl.actmod_cl_TmpDtEf.PpSetPos == 1 then
								pl.actmod_cl_TmpDtEf.PpSetPos = 2
							elseif pl.actmod_cl_TmpDtEf.PpSetPos == 2 then
								pl.actmod_cl_TmpDtEf.PpSetPos = 3
								local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
								local apos,aang = A_AM.ActMod:GBonePosAng( pl,"ValveBiped.Bip01_R_Hand" )
								pl.actmod_cl_TmpDtEf.geffPos = apos+aang:Forward()*3*Asz
								for i = 1,QHt > 2 and 30 or 6 do CStarEfft01(pl.actmod_cl_TmpDtEf.geffPos,aang,Asz,QHt,pl) end
							end
						end
						if pl.actmod_cl_TmpDtEf.Pprkrn == 1 then
							if not pl.actmod_cl_TmpDtEf.aaTPpRk and cyc > 0.287 then
								pl.actmod_cl_TmpDtEf.aaTPpRk = true
								if pl.actmod_cl_TmpDtEf.TPpRk then AM_CL_StopTrail(pl.actmod_cl_TmpDtEf.TPpRk) end
							end
							if cyc > 0.35 then
								if pl.actmod_cl_TmpDtEf.TPpRk then AM_CL_StopAllTrails(pl.actmod_cl_TmpDtEf.TPpRk,true) end
								if GetConVarNumber("actmod_cl_q_ef") > 2 then
									pl.actmod_cl_TmpDtEf = nil
								else
									pl.actmod_cl_TmpDtEf.Pprkrn = 0
									pl.actmod_cl_TmpDtEf.geffPos = nil
									pl.actmod_cl_TmpDtEf.aaTPpRk = nil
									pl.actmod_cl_TmpDtEf.PpSetPos = nil
								end
							end
						end
					elseif (not istable(pl.actmodstr) or not pl.actmodstr.Dpoprock or not pl.actmod_cl_TmpDtEf.Pprkrn or pl.actmod_cl_TmpDtEf.Pprkrn == 1 and cyc > 0.35 and GetConVarNumber("actmod_cl_q_ef") > 2 ) and pl.actmodstr == "amod_cumact_fortnite_poprock" and cyc < 0.2 then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,Pprkrn = 0 ,Dpoprock = true ,A_hupf = hupf,A_SubMF = A_SubMF }
					end
				end
				,SDrw = function(pl,cyc)
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.Dpoprock and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.Pprkrn and pl.actmod_cl_TmpDtEf.geffPos and cyc > 0.2394 and cyc < 0.31 then
						local Asz = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale()
						local aa = CycG(cyc,0.2394,0.31)
						local ab,z = CycGHS(cyc,0.2394,0.31),15*Asz
						render.SetMaterial(mat_ppk)
						render.DrawSprite(pl.actmod_cl_TmpDtEf.geffPos,z*2+35*Asz*aa,z*2+35*Asz*aa, Color(255, 255, 255,200*ab))
						if cyc > 0.2394 and cyc < 0.27 then
							aa = CycG(cyc,0.2394,0.27)
							ab = CycGHS(cyc,0.2394,0.27)
							render.SetMaterial(mat_ppr)
							render.DrawSprite(pl.actmod_cl_TmpDtEf.geffPos,z+40*Asz*aa+35*Asz*ab,z+40*Asz*aa+35*Asz*ab, Color(255, 255, 255-100*(aa*2),230*ab))
						end
					end
				end
			}
		end
	}
	
}