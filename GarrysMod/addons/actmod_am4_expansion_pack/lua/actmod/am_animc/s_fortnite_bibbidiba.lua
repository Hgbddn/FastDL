// Bring it around (commission)
// 2026-AM4|8799|148635
return{
	["fortnite_stonefly"] = {
		Config = { Anim = "amod_fortnite_stonefly",Name = "BIBBIDIBA",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "5.1" } ,Camera = { Transition = 2.2 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 16 ,Cycle = 0.099437148217636 } ,Sound = { Time1 = 17.76667 ,Time2 = 16 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_StoneFly_1.mp3" ,Delay = 0.08 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_StoneFly_2.mp3" ,Delay = 1.76667 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_StoneFly_2.mp3" }
		}
		,Scrpt = function()
			local function aDist(pl,taa) if pl == LocalPlayer() or LocalPlayer():GetPos():Distance(pl:GetPos()) < taa then return true end return false end
			local tclo = {{255,220,100},{100,255,255},{255,200,70},{255,255,100}}
			local function CStarEfft01(pos,aang,Asz,QHt,pl)
				local emitter = ParticleEmitter(pos)
				if not IsValid(pl) or not isstring(pl.actmodstr) then return end
				if not emitter then return end
				local e1 = emitter:Add("actmod/eff_particle/tesfs_0"..math.random(1,4), pos)
				if not e1 then return end
				local sTime,velo = CurTime(),VectorRand() * 10*Asz + Vector(0, 0, math.random(20,30)*Asz)
				local flStart,ftim,fszi,tol = math.Rand(0.5,0.9),math.Rand(0.2,0.4),math.random(10,24)*Asz,math.random(1,2)
				local fadeStart = flStart + 0.3
				e1:SetVelocity(velo) e1:SetDieTime(1.3) e1:SetGravity(Vector(0, 0, math.random(7,16)*Asz))
				e1:SetStartAlpha(0) e1:SetEndAlpha(0) e1:SetColor(tclo[tol][1],tclo[tol][2],tclo[tol][3])
				e1:SetStartSize(fszi) e1:SetEndSize(fszi) e1.sTr = pl.actmodstr
				e1:SetThinkFunction(function(p)
					if not e1.sstop and (not IsValid(pl) or e1.sTr ~= pl.actmodstr) then e1:SetDieTime(0) e1:SetLifeTime(1.5) e1.sstop = true end
					if e1.sstop then return end
					local time,sizeFa = CurTime() - sTime,1
					local progress,vel = time / fadeStart,p:GetVelocity()
					vel = vel + aang:Right()*(math.cos(CurTime()*2+flStart) * math.Rand(0,0.2))*Asz
					p:SetVelocity(vel)
					if time < ftim then
						sizeFa = time / ftim
					elseif time > flStart then
						sizeFa = 1 - (time - flStart) / (fadeStart - flStart)
					else
						sizeFa = 1
					end
					if time >= fadeStart then
						local a = math.Clamp(1 - (time - fadeStart) * 2, 0, 1)
						p:SetStartAlpha(255 * a) if a <= 0 then e1.sstop = true end
					else
						if sizeFa >= 1 then p:SetStartAlpha(155+100*math.abs(math.sin(CurTime()*(2*math.Rand(0,0.2))))) else p:SetStartAlpha(255*sizeFa)p:SetEndAlpha(255*sizeFa) end
					end
					p:SetNextThink(CurTime())
				end)
				e1:SetNextThink(CurTime())
				emitter:Finish()
			end
			local o_MAT01 = Material("actmod/sm_hover3.png")
			local function CStarEfft02(pos,Asz,QHt,pl)
				if not IsValid(pl) or not isstring(pl.actmodstr) then return end
				local emitter = ParticleEmitter(pos,true)
				if not emitter then return end
				local glow = emitter:Add(o_MAT01, pos)
				if not glow then return end
				local startTime = CurTime() or CONFIG.distanceEntity
				local sTime,velo,fadeStartDistance = CurTime(),VectorRand() * 10*Asz + Vector(0, 0, math.random(20,30)*Asz),110
				local flStart,ftim,fszi,tol = math.Rand(0.5,0.9),math.Rand(0.2,0.4),math.random(6,20)*Asz,math.random(1,4)
				local fadeStart = flStart + 0.3
				glow:SetDieTime(2) glow:SetRoll(-90) glow:SetStartAlpha(200) glow:SetEndAlpha(0)
				glow:SetColor(tclo[tol][1],tclo[tol][2],tclo[tol][3]) glow.sTr = pl.actmodstr
				glow:SetThinkFunction(function(pa)
					if not pa.sstop and (not IsValid(pl) or pa.sTr ~= pl.actmodstr) then pa:SetDieTime(0) pa:SetLifeTime(1.5) pa.sstop = true end
					if pa.sstop then return end
					local time,sizeFa = CurTime() - sTime,0
					if time < ftim then
						sizeFa = time / ftim
					elseif time < (ftim + flStart) then
						sizeFa = 1
					elseif time < (ftim + flStart + flStart) then
						local t = (time - ftim - flStart) / flStart
						sizeFa = 1 - t
					else
						sizeFa = 0
					end
					local disFactor = 1
					if IsValid(pl) then
						local dist = pl:GetPos():Distance(pos)
						if dist >= fadeStartDistance then
							disFactor = 1 - math.Clamp((dist - fadeStartDistance) / (fadeStartDistance*1.35 - fadeStartDistance),0,1)
						end
					end
					pa:SetStartSize(fszi * sizeFa)
					if tol > 2 then pa:SetEndSize(fszi * sizeFa) end
					pa:SetStartAlpha(200 * sizeFa * disFactor)
					pa:SetNextThink(CurTime())
				end)
				glow:SetNextThink(CurTime())
				emitter:Finish()
			end
			local function CStarEfft03(pos,aang,Asz,QHt,pl)
				local emitter = ParticleEmitter(pos)
				if not IsValid(pl) or not isstring(pl.actmodstr) then return end
				if not emitter then return end
				local e1 = emitter:Add("actmod/eff_particle/p_i_ligtstar_05", pos)
				if not e1 then return end
				local sTime,velo = CurTime(),VectorRand() * 10*Asz + Vector(0, 0, math.random(20,30)*Asz)
				local flStart,ftim,fszi,tol = math.Rand(0.5,0.9),math.Rand(0.2,0.5),math.random(2,10)*Asz,math.random(1,2)
				local fadeStart,aol,sfrm = flStart + 0.3,math.random(180,255),math.Rand(0.001,0.2)
				e1:SetVelocity(velo) e1:SetDieTime(3) e1:SetGravity(Vector(0, 0, math.random(8,22)*Asz)) e1:SetRoll(0.50)
				e1:SetStartAlpha(0) e1:SetEndAlpha(0) e1:SetColor(aol,math.max(math.random(220,255),aol),255)
				e1:SetStartSize(fszi) e1:SetEndSize(fszi) e1.sTr = pl.actmodstr
				e1:SetThinkFunction(function(p)
					if not e1.sstop and (not IsValid(pl) or e1.sTr ~= pl.actmodstr) then e1:SetDieTime(0) e1:SetLifeTime(3.1) e1.sstop = true end
					if e1.sstop then return end
					local time,sizeFa = CurTime() - sTime,1
					local progress,vel = time / fadeStart,p:GetVelocity()
					vel = vel + (aang:Right()*(math.cos(CurTime()*2+flStart) * math.Rand(0,0.2))*Asz) + (pl:GetUp()*(math.sin(CurTime()*3+flStart) * math.Rand(0.1,0.3))*Asz)
					p:SetVelocity(vel)
					if time < ftim then
						sizeFa = time / ftim
					elseif time > flStart then
						sizeFa = 1 - (time - flStart) / (fadeStart - flStart)
					else
						sizeFa = 1
					end
					if time >= fadeStart then
						local a = math.Clamp(1 - (time - fadeStart) * 2, 0, 1)
						p:SetStartAlpha(255 * a) if a <= 0 then e1.sstop = true end
					else
						if sizeFa >= 1 then
							local w = math.max(math.abs(math.sin(CurTime()*(2+tol*math.Rand(0,0.2)))),math.Rand(0.1,0.3))
							p:SetStartAlpha(155+100*w) if not e1.ttsiz then e1.ttsiz = math.Rand(0,1) end
							e1.ttsiz = Lerp(sfrm,e1.ttsiz,w)
							e1:SetStartSize(fszi*w) e1:SetEndSize(fszi*e1.ttsiz)
						else
							p:SetStartAlpha(255*sizeFa)p:SetEndAlpha(255*sizeFa)
							e1:SetStartSize(fszi*sizeFa) e1:SetEndSize(fszi*sizeFa)
						end
					end
					p:SetNextThink(CurTime())
				end)
				e1:SetNextThink(CurTime())
				emitter:Finish()
			end
			return {
				SCpt = function(pl,cyc,Fram)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")/2) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun and pl.actmod_cl_TmpDtEf.ttimr then
						if pl.actmod_cl_TmpDtEf.ttimr < CurTime() then
							pl.actmod_cl_TmpDtEf.ttimr = CurTime() + math.Rand(0.05,0.3)
							local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
							local aang = pl:GetRenderAngles()
							local apos = pl:GetPos() + aang:Right()*math.random(-30,30)*Asz + Vector(0,0,0.5*Asz)
							local apos2 = apos - aang:Forward()*math.random(25,40)*Asz + Vector(0,0,math.random(8,14)*Asz)
							local apos3 = apos - aang:Forward()*math.random(-5,40)*Asz
							for i=0,math.random(0,2) do if math.random(1,9) > 5 then CStarEfft01(apos2,aang,Asz,QHt,pl) end end
							if QHt > 1 then for i=0,math.random(0,3) do if math.random(1,9) > 7 then CStarEfft02(apos3,Asz,QHt,pl) end end end
							if QHt > 2 then for i=0,math.random(0,6) do if math.random(1,9) > 4 then CStarEfft03(apos3,aang,Asz,QHt,pl) end end end
						end
					else
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,eni = 0 ,ams = false ,ttimr = CurTime()+0.3 ,A_hupf = hupf,A_SubMF = A_SubMF ,TEff = {} }
					end
				end
			}
		end
	}
	
}