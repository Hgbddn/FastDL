// maggots for brains (commission)
// 2026-AM4|32141|148635
return{
	["fortnite_pearltaffyopera"] = {
		Config = { Anim = "amod_fortnite_pearltaffyopera",Name = "maggots for brains",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "4.5" } ,Camera = { Transition = 2.5 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 11.63333 ,Cycle = 0.0592991913746631 } ,Sound = { Time1 = 47.06233 ,Time2 = 46.53332 } }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_PearlTaffyOpera_1.ogg" }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_PearlTaffyOpera_2.ogg" ,Delay = 0.529 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_PearlTaffyOpera_2.ogg" }
		}
		,Scrpt = function()
			if SERVER then return end
			local mat_h1,mat_h2 = Material("actmod/eff_particle/ih_00","noclamp smooth"),Material("actmod/eff_particle/ih_02","noclamp smooth")
			local mat_g1,mat_g2 = Material("actmod/eff_particle/ccmix_02","noclamp smooth"),Material("actmod/eff_particle/ccmix_01","noclamp smooth")
			local function aDist(p,t) if p == LocalPlayer() or LocalPlayer():GetPos():Distance(p:GetPos()) < t then return true end return false end
			local function AM_namT(ply,Ent)
				if not IsValid(ply) then return "__NULL_" end
				Ent = Ent or ply
				local aID = "__mdl_".. tostring(Ent:EntIndex{})
				if ply:IsPlayer() then aID = tostring(ply:SteamID64{} .. ply:Nick{}) end
				return aID
			end
			local function aRemoveBMdlS(ply)
				if IsValid(ply) then
					if ply.actmod_cl_TmpDtEf and istable(ply.actmod_cl_TmpDtEf.Tctve) then
						for i = 1,2 do
							local nid = AM_namT(ply) .. "_menerg_" .. i
							if IsValid(ply.actmod_cl_TmpDtEf.Tctve[nid]) then ply.actmod_cl_TmpDtEf.Tctve[nid]:Remove() end
							ply.actmod_cl_TmpDtEf.Tctve[nid] = nil
						end
						ply.actmod_cl_TmpDtEf.Tctve = nil
					end
				end
			end
			hook.Add("ActMod_RunStopAct", "am_pearltaffyopera_RemovMdlS", function(ply) aRemoveBMdlS(ply) end)
			hook.Add("ActMod_cl_RunaPlyEmot", "am_pearltaffyopera_RemovMdlS", function(ply,atXt,tst) aRemoveBMdlS(ply) end)
			hook.Add("Think", "am_pearltaffyopera_RemovMdlS", function()
				local p = LocalPlayer()
				if not IsValid(p) then return end
				if (p.amtim_maxenergize_RemovMdlS or 0) < CurTime() then
					p.amtim_maxenergize_RemovMdlS = CurTime() + 0.1
					for _ ,pl in player.Iterator() do
						if pl.actmod_cl_TmpDtEf and pl.actmod_cl_TmpDtEf.CPffye and (not pl:A_ActMod_GetIsAct() or pl:A_ActMod_GetActDir() ~= "amod_fortnite_pearltaffyopera") and istable(pl.actmod_cl_TmpDtEf.Tctve) then
							aRemoveBMdlS(pl)
						end
					end
				end
			end)
			hook.Add("EntityRemoved", "am_pearltaffyopera_RemovMdlS", function(ent) if IsValid(ent) and ent:IsPlayer() then aRemoveBMdlS(ent) end end)
			
			local tclo = {{255,150,160},{100,220,255},{255,200,250},{255,150,100},{50,255,255}}
			local function GetBEl(pl,tt)
				local a = ""
				for _,n in ipairs(tt) do if pl:LookupBone(n) then a = n break end end
				return a
			end
			local function addfEf_1(pl,pos,bAng,Asz,QHt,rl)
				local emitter = ParticleEmitter(pos)
				if emitter then
					for i = 0, math.random(3,6) do
						local tpos,rcol = pos + VectorRand()*3*Asz,tclo[ math.random(1,2) ]
						local SVel,SAir = VectorRand()*math.random(20,26)*Asz + (rl==1 and bAng:Up()*-42*Asz or rl==2 and bAng:Forward()*70*Asz+VectorRand()*math.random(10,20)*Asz or rl==3 and bAng:Right()*-40*Asz+Vector(0,0,1)*math.random(-10,10)*Asz),math.Rand(50,90)*(1+(Asz*1.2))
						local sizA,sizB,tdie = math.Rand(5,6)*Asz,math.Rand(1,2)*Asz,math.Rand(0.7,0.9)
						local p = QHt > 2 and emitter:Add("actmod/eff_particle/p_glow_01", tpos)
						if p then
							p:SetVelocity(SVel) p:SetColor(200,70,140)
							p:SetDieTime(tdie*0.5) p:SetStartAlpha(40) p:SetEndAlpha(0)
							p:SetStartSize(sizA*2.9) p:SetEndSize(sizB*2.5) p:SetAirResistance(SAir)
						end
						local l = emitter:Add("actmod/eff_particle/p_i_ligtstar_05", tpos)
						if l then
							l:SetVelocity(SVel) l:SetColor(rcol[1],rcol[2],rcol[3]) l:SetRoll( 0.45 )
							l:SetDieTime(tdie) l:SetStartAlpha(255) l:SetEndAlpha(0)
							l:SetStartSize(sizA) l:SetEndSize(sizB*1.3) l:SetAirResistance(SAir)
						end
						local o = emitter:Add("actmod/eff_particle/ih_04", tpos)
						if o then
							o:SetVelocity(SVel) o:SetColor(255,255,255)
							o:SetDieTime(tdie*0.7) o:SetStartAlpha(255) o:SetEndAlpha(0)
							o:SetStartSize(sizA*1.2) o:SetEndSize(sizB) o:SetAirResistance(SAir)
						end
					end
					emitter:Finish()
				end
			end
			local function addfEf_2(pl,gpos,Asz,QHt,floatSpeed, windForce, swayForce, orbitForce, orbitSpeed)
				Asz = Asz or 1
				floatSpeed = floatSpeed or 15
				windForce = windForce or 20
				swayForce = swayForce or 15
				orbitForce = orbitForce or 25
				orbitSpeed = orbitSpeed or 3

				local emitter = ParticleEmitter(gpos)
				if not emitter then return end
				
				local phaseOffset,rdmC = math.Rand(0, math.pi * 2),tclo[math.random(1,2)]
				local STime, HTime, ETime = math.Rand(0.1,0.4), math.Rand(1,2), math.Rand(0.1,0.3)
				local SSize, MSize, ESize = math.Rand(0,1) * Asz, math.Rand(2,4) * Asz, math.Rand(1,0) * Asz
				local SAlpha, HAlpha, EAlpha = 0, math.random(100,255), 0
				local SColor, HColor, EColor = {rdmC[1]*0.6,rdmC[2]*0.6,rdmC[3]*0.6}, {rdmC[1],rdmC[2],rdmC[3]}, {rdmC[1]*0.4,rdmC[2]*0.4,rdmC[3]*0.4}

				local g = QHt > 1 and emitter:Add("actmod/eff_particle/ih_03", gpos) or nil
				local p = emitter:Add("actmod/eff_particle/ih_01", gpos)
				if p then
					local aa = 1.0
					p:SetDieTime(STime + HTime + ETime)
					p:SetStartSize(SSize) p:SetEndSize(SSize)
					p:SetStartAlpha(SAlpha) p:SetEndAlpha(SAlpha)
					p:SetColor(SColor[1]*aa, SColor[2]*aa, SColor[3]*aa)
					p:SetAirResistance(math.random(10,40)) p.sTr = pl.actmodstr p.rr = CurTime()
					p:SetThinkFunction(function(pa)
						if not p.sstop and (not IsValid(pl) or p.sTr ~= pl.actmodstr) then p:SetDieTime(0) p:SetLifeTime(1.5) p.sstop = true end
						local ct,life = CurTime(),pa:GetLifeTime()
						local gWX,gWY,swayX = math.sin(ct * 1.5) * windForce * Asz ,math.cos(ct * 1.2) * windForce * Asz ,math.sin(ct * 3 + phaseOffset) * swayForce * Asz
						local angle = (ct * orbitSpeed) + phaseOffset
						local orbX,orbY = math.cos(angle) * orbitForce * Asz ,math.sin(angle) * orbitForce * Asz
						pa:SetVelocity(VectorRand()*3*Asz + Vector(gWX + swayX + orbX, gWY + orbY, floatSpeed * Asz))
						if g then g:SetPos( p:GetPos() ) g:SetRoll( p:GetRoll() ) end
						if p.rr < CurTime() and math.random(1,4)==3 then p.rr = CurTime()+math.Rand(0.1,0.3) p:SetRollDelta( math.random(3,-3) ) end
						local gEnd, hEnd = STime, STime + HTime
						if life < gEnd then
							local t = life / STime
							local size, alpha = Lerp(t, SSize, MSize), Lerp(t, SAlpha, HAlpha)
							pa:SetStartSize(size) pa:SetEndSize(size)
							pa:SetStartAlpha(alpha) pa:SetEndAlpha(alpha)
							pa:SetColor(Lerp(t, SColor[1]*aa, HColor[1]*aa), Lerp(t, SColor[2]*aa, HColor[2]*aa), Lerp(t, SColor[3]*aa, HColor[3]*aa))
						elseif life < hEnd then
							pa:SetStartSize(MSize) pa:SetEndSize(MSize)
							pa:SetStartAlpha(HAlpha) pa:SetEndAlpha(HAlpha)
							pa:SetColor(HColor[1]*aa, HColor[2]*aa, HColor[3]*aa)
						else
							local t = (life - hEnd) / ETime
							local size, alpha = Lerp(t, MSize, ESize), Lerp(t, HAlpha, EAlpha)
							pa:SetStartSize(size) pa:SetEndSize(size)
							pa:SetStartAlpha(alpha) pa:SetEndAlpha(alpha)
							pa:SetColor(Lerp(t, HColor[1]*aa, EColor[1]*aa), Lerp(t, HColor[2]*aa, EColor[2]*aa), Lerp(t, HColor[3]*aa, EColor[3]*aa))
						end
						pa:SetNextThink(CurTime())
					end)
					p:SetNextThink(CurTime())
				end
				if g then
					local zz = 1.5
					g:SetDieTime(STime + HTime + ETime)
					g:SetStartSize(SSize*zz) g:SetEndSize(SSize*zz)
					g:SetStartAlpha(SAlpha) g:SetEndAlpha(SAlpha)
					g:SetColor(SColor[1], SColor[2], SColor[3])
					g.sTr = pl.actmodstr g.rr = CurTime()
					g:SetThinkFunction(function(pa)
						if not g.sstop and (not IsValid(pl) or g.sTr ~= pl.actmodstr) then g:SetDieTime(0) p:SetLifeTime(1.5) g.sstop = true end
						local life = pa:GetLifeTime()
						if p then g:SetPos( p:GetPos() ) g:SetRoll( p:GetRoll() ) end
						local gEnd,hEnd,apha = STime,STime + HTime,1-math.Clamp(math.abs(math.sin(CurTime()*4)),0,0.6)
						if life < gEnd then
							local t = life / STime
							local size, alpha = Lerp(t, SSize*zz, MSize*zz), Lerp(t, SAlpha, HAlpha)
							pa:SetStartSize(size) pa:SetEndSize(size)
							pa:SetStartAlpha(alpha*apha) pa:SetEndAlpha(alpha*apha)
							pa:SetColor(Lerp(t, SColor[1], HColor[1]), Lerp(t, SColor[2], HColor[2]), Lerp(t, SColor[3], HColor[3]))
						elseif life < hEnd then
							pa:SetStartSize(MSize*zz) pa:SetEndSize(MSize*zz)
							pa:SetStartAlpha(HAlpha*apha) pa:SetEndAlpha(HAlpha*apha)
							pa:SetColor(HColor[1], HColor[2], HColor[3])
						else
							local t = (life - hEnd) / ETime
							local size, alpha = Lerp(t, MSize*zz, ESize*zz), Lerp(t, HAlpha, EAlpha)
							pa:SetStartSize(size) pa:SetEndSize(size)
							pa:SetStartAlpha(alpha*apha) pa:SetEndAlpha(alpha*apha)
							pa:SetColor(Lerp(t, HColor[1], EColor[1]), Lerp(t, HColor[2], EColor[2]), Lerp(t, HColor[3], EColor[3]))
						end
						pa:SetNextThink(CurTime())
					end)
					p:SetNextThink(CurTime())
				end
				emitter:Finish()
			end
			local function addfEf_3(pl,gpos,Asz,floatSpeed, windForce, swayForce, orbitForce, orbitSpeed)
				Asz = Asz or 1
				floatSpeed = floatSpeed or 15
				windForce = windForce or 20
				swayForce = swayForce or 15
				orbitForce = orbitForce or 25
				orbitSpeed = orbitSpeed or 3

				local emitter = ParticleEmitter(gpos)
				if not emitter then return end
				
				local phaseOffset,rdmC = math.Rand(0, math.pi * 2),tclo[math.random(1,4)]
				local STime, HTime, ETime = math.Rand(0.1,0.4), math.Rand(1,2), math.Rand(0.1,0.3)
				local SSize, MSize, ESize = math.Rand(0,1) * Asz, math.Rand(2,4) * Asz, math.Rand(1,0) * Asz
				local SAlpha, HAlpha, EAlpha = 0, math.random(100,255), 0
				local SColor, HColor, EColor = {rdmC[1]*0.6,rdmC[2]*0.6,rdmC[3]*0.6}, {rdmC[1],rdmC[2],rdmC[3]}, {rdmC[1]*0.4,rdmC[2]*0.4,rdmC[3]*0.4}

				local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_05", gpos)
				if p then
					local aa,ab,as = math.Rand(0.8,1),math.Rand(0.7,1),math.random(2,5)
					p:SetDieTime(STime + HTime + ETime) p:SetRoll( 0.45 )
					p:SetStartSize(SSize) p:SetEndSize(SSize)
					p:SetStartAlpha(SAlpha) p:SetEndAlpha(SAlpha)
					p:SetColor(SColor[1]*aa, SColor[2]*aa, SColor[3]*aa)
					p:SetAirResistance(math.random(10,40)) p.sTr = pl.actmodstr p.rr = CurTime()
					p:SetThinkFunction(function(pa)
						if not p.sstop and (not IsValid(pl) or p.sTr ~= pl.actmodstr) then p:SetDieTime(0) p:SetLifeTime(1.5) p.sstop = true end
						local ct,life,apha = CurTime(),pa:GetLifeTime(),1-math.Clamp(math.abs(math.sin(CurTime()*as)),0,ab)
						local gWX,gWY,swayX = math.sin(ct * 1.5) * windForce * Asz ,math.cos(ct * 1.2) * windForce * Asz ,math.sin(ct * 3 + phaseOffset) * swayForce * Asz
						local angle = (ct * orbitSpeed) + phaseOffset
						local orbX,orbY = math.cos(angle) * orbitForce * Asz ,math.sin(angle) * orbitForce * Asz
						pa:SetVelocity(VectorRand()*3*Asz + Vector(gWX + swayX + orbX, gWY + orbY, floatSpeed * Asz))
						if p.rr < CurTime() and math.random(1,4)==3 then p.rr = CurTime()+math.Rand(0.1,0.3) p:SetRollDelta( math.random(3,-3) ) end
						local gEnd, hEnd = STime, STime + HTime
						if life < gEnd then
							local t = life / STime
							local size, alpha = Lerp(t, SSize, MSize), Lerp(t, SAlpha, HAlpha)
							pa:SetStartSize(size) pa:SetEndSize(size)
							pa:SetStartAlpha(alpha*apha) pa:SetEndAlpha(alpha*apha)
							pa:SetColor(Lerp(t, SColor[1]*aa, HColor[1]*aa), Lerp(t, SColor[2]*aa, HColor[2]*aa), Lerp(t, SColor[3]*aa, HColor[3]*aa))
						elseif life < hEnd then
							pa:SetStartSize(MSize) pa:SetEndSize(MSize)
							pa:SetStartAlpha(HAlpha*apha) pa:SetEndAlpha(HAlpha*apha)
							pa:SetColor(HColor[1]*aa, HColor[2]*aa, HColor[3]*aa)
						else
							local t = (life - hEnd) / ETime
							local size, alpha = Lerp(math.ease.InBack(t), MSize, ESize), Lerp(t, HAlpha, EAlpha)
							pa:SetStartSize(size) pa:SetEndSize(size)
							pa:SetStartAlpha(alpha*apha) pa:SetEndAlpha(alpha*apha)
							pa:SetColor(Lerp(t, HColor[1]*aa, EColor[1]*aa), Lerp(t, HColor[2]*aa, EColor[2]*aa), Lerp(t, HColor[3]*aa, EColor[3]*aa))
						end
						pa:SetNextThink(CurTime())
					end)
					p:SetNextThink(CurTime())
				end
				emitter:Finish()
			end
			local function addfEf_4(pl,gpos,Asz)
				local pos = gpos + VectorRand()*math.random(2,5)*Asz
				local emitter = ParticleEmitter(pos)
				if emitter then
					local p = emitter:Add("actmod/eff_particle/p_glow_01", pos)
					if p then
						p:SetVelocity(VectorRand()*math.random(11,18)*Asz) p:SetColor(255,170,200)
						p:SetDieTime(math.Rand(0.1,0.3)) p:SetStartAlpha(math.random(60,100)) p:SetEndAlpha(0)
						p:SetStartSize(math.Rand(1,3)*Asz) p:SetEndSize(math.Rand(2,0)*Asz) p:SetAirResistance(math.random(150,180)*Asz)
					end
					emitter:Finish()
				end
			end
			local function cafEf(pl,bAng,nn)
				local Asz,QHt = pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
				local gf,pos = pl:GetVelocity(),pl:GetPos() - bAng:Forward()*3*Asz + Vector(0,0,5)*Asz
				if nn == 1 then
					pl.actmod_cl_TmpDtEf.OnEffHRL = false
					AM_CL_StopTrail(pl.actmod_cl_TmpDtEf.Thhk_r)
					AM_CL_StopTrail(pl.actmod_cl_TmpDtEf.Thhk_l)
					pl.actmod_cl_TmpDtEf.EfB_Hh = CurTime() + 0.5
					for i = 1,QHt > 3 and math.random(10,18) or math.random(6,15) do
						local gpos = pl:GetPos() + bAng:Up()*math.random(10,80)*Asz + Vector(math.random(30,-30),math.random(30,-30),0)*Asz
						addfEf_2(pl,gpos,Asz,QHt,math.random(-10,10),math.random(10,30),math.random(5,25),math.random(10,30),math.random(1,6))
						for i = 1,math.random(3,7) do addfEf_3(pl,gpos + VectorRand()*8*Asz,Asz,math.random(-10,10),math.random(10,30),math.random(5,25),math.random(10,30),math.random(1,6)) end
					end
				elseif nn == 2 then
					pl.actmod_cl_TmpDtEf.OnEffLoop = true
					pl.actmod_cl_TmpDtEf.OnEffHRL = false
				elseif nn == 3 then
					pl.actmod_cl_TmpDtEf.OnEffHRL = false
				elseif nn == 4 then
					pl.actmod_cl_TmpDtEf.OnEffHRL = true
					local a,b = GetBEl(pl,{"ValveBiped.Bip01_R_Hand","ValveBiped.Anim_Attachment_RH"}),GetBEl(pl,{"ValveBiped.Bip01_L_Hand","ValveBiped.Anim_Attachment_LH"})
					local gaa = 0.03
					if QHt == 1 then gaa = gaa*1.9 end
					if QHt == 2 then gaa = gaa*1.4 end
					if QHt > 3 then gaa = gaa*0.7 end
					if a ~= "" then
						pl.actmod_cl_TmpDtEf.Thhk_r = AM_CL_CreateTrail({
							ply = pl, ent = pl ,Nobreak = QHt > 2
							,Material = "actmod/eff_particle/plasma",boneName = a
							,color = Color(255,180,200,180), width = 4*Asz
							,duration = 2.4, holdTime = 0.01,lifetime = 0.2
							,TrailPointInterval = gaa ,SVector = {2.5*Asz, 0, 0}
						})
					end
					if b ~= "" then
						pl.actmod_cl_TmpDtEf.Thhk_l = AM_CL_CreateTrail({
							ply = pl, ent = pl ,Nobreak = QHt > 2
							,Material = "actmod/eff_particle/plasma",boneName = b
							,color = Color(255,180,200,180), width = 4*Asz
							,duration = 2.4, holdTime = 0.01,lifetime = 0.2
							,TrailPointInterval = gaa ,SVector = {2.5*Asz, 0, 0}
						})
					end
				elseif nn == 5 then
					pl.actmod_cl_TmpDtEf.OnEffHRL = false
					AM_CL_StopTrail(pl.actmod_cl_TmpDtEf.Thhk_r)
					AM_CL_StopTrail(pl.actmod_cl_TmpDtEf.Thhk_l)
					local a,b = GetBEl(pl,{"ValveBiped.Bip01_Spine4","ValveBiped.Bip01_Spine2","ValveBiped.Bip01_Spine1","ValveBiped.Bip01_Spine","ValveBiped.Bip01_R_Hand"}),GetBEl(pl,{"ValveBiped.Bip01_L_Hand","ValveBiped.Anim_Attachment_LH"})
					if a ~= "" then
						local gpos,gang = A_AM.ActMod:GBonePosAng( pl,a )
						if gpos then
							if a == "ValveBiped.Bip01_R_Hand" then
								gpos = gpos + bAng:Forward()*7*Asz
							elseif a == "ValveBiped.Bip01_Spine4" then
								gpos = gpos + bAng:Forward()*15*Asz + bAng:Right()*2*Asz + bAng:Up()*-2*Asz
							elseif a == "ValveBiped.Bip01_Spine2" then
								gpos = gpos + bAng:Forward()*15*Asz + bAng:Right()*2*Asz + bAng:Up()*6*Asz
							elseif a == "ValveBiped.Bip01_Spine1" then
								gpos = gpos + bAng:Forward()*16*Asz + bAng:Right()*2*Asz + bAng:Up()*9*Asz
							elseif a == "ValveBiped.Bip01_Spine" then
								gpos = gpos + bAng:Forward()*14*Asz + bAng:Right()*2*Asz + bAng:Up()*13*Asz
							end
							local emitter = ParticleEmitter(gpos)
							if emitter then
								local p = emitter:Add("actmod/eff_particle/ih_01", gpos)
								if p then
									local STime,HTime,ETime = 0.1,0.1,0.2
									local SSize,MSize,ESize = math.Rand(2,3)*Asz,math.Rand(8,9)*Asz,math.Rand(3,4)*Asz
									local SAlpha,HAlpha,EAlpha = 0,255,0
									local SColor,HColor,EColor = {240,90,180},{255,170,200},{150,40,80}
									p:SetVelocity(gf+bAng:Forward()*80*Asz + bAng:Up()*math.random(-5,5)*Asz)
									p:SetColor(SColor[1],SColor[2],SColor[3]) p:SetAirResistance(500*Asz)
									p:SetDieTime(STime + HTime + ETime) p.sTr = pl.actmodstr
									p:SetStartSize(SSize) p:SetEndSize(SSize)
									p:SetStartAlpha(SAlpha) p:SetEndAlpha(SAlpha)
									p:SetThinkFunction(function(pa)
										if not p.sstop and (not IsValid(pl) or p.sTr ~= pl.actmodstr) then p:SetDieTime(0) p:SetLifeTime(1.5) p.sstop = true end
										local life,total,gEnd,hEnd = pa:GetLifeTime(),STime + HTime + ETime,STime,STime + HTime
										if life < gEnd then
											local t = life / STime
											local size,alpha = Lerp(t, SSize, MSize),Lerp(t, SAlpha, HAlpha)
											pa:SetStartSize(size) pa:SetEndSize(size)
											pa:SetStartAlpha(alpha) pa:SetEndAlpha(alpha)
											pa:SetColor(Lerp(t, SColor[1], HColor[1]),Lerp(t, SColor[2], HColor[2]),Lerp(t, SColor[3], HColor[3]))
										elseif life < hEnd then
											pa:SetStartSize(MSize) pa:SetEndSize(MSize)
											pa:SetStartAlpha(HAlpha) pa:SetEndAlpha(HAlpha)
											pa:SetColor(HColor[1], HColor[2], HColor[3])
										else
											local t = (life - hEnd) / ETime
											local size,alpha = Lerp(t, MSize, ESize),Lerp(t, HAlpha, EAlpha)
											pa:SetStartSize(size) pa:SetEndSize(size)
											pa:SetStartAlpha(alpha) pa:SetEndAlpha(alpha)
											pa:SetColor(Lerp(t, HColor[1], EColor[1]),Lerp(t, HColor[2], EColor[2]),Lerp(t, HColor[3], EColor[3]))
										end
										pa:SetNextThink(CurTime())
									end)
									p:SetNextThink(CurTime())
								end
								emitter:Finish()
							end
						end
					end
					if b ~= "" then addfEf_1(pl,A_AM.ActMod:GBonePosAng( pl,b ),bAng,Asz,QHt,3) end
				elseif nn == 6 then
					pl.actmod_cl_TmpDtEf.OnEffHRL = false
					local a,b = GetBEl(pl,{"ValveBiped.Bip01_R_Hand","ValveBiped.Anim_Attachment_RH"}),GetBEl(pl,{"ValveBiped.Bip01_L_Hand","ValveBiped.Anim_Attachment_LH"})
					if a ~= "" then addfEf_1(pl,A_AM.ActMod:GBonePosAng( pl,a ),bAng,Asz,QHt,1) end
					if b ~= "" then addfEf_1(pl,A_AM.ActMod:GBonePosAng( pl,b ),bAng,Asz,QHt,1) end
				elseif nn == 7 then
					pl.actmod_cl_TmpDtEf.OnEffHRL = false
					local a,b = GetBEl(pl,{"ValveBiped.Bip01_R_Hand","ValveBiped.Anim_Attachment_RH"}),GetBEl(pl,{"ValveBiped.Bip01_L_Hand","ValveBiped.Anim_Attachment_LH"})
					if a ~= "" then addfEf_1(pl,A_AM.ActMod:GBonePosAng( pl,a ),bAng,Asz,QHt,2) end
					if b ~= "" then addfEf_1(pl,A_AM.ActMod:GBonePosAng( pl,b ),bAng,Asz,QHt,2) end
				elseif nn == 8 then
					pl.actmod_cl_TmpDtEf.OnEffHRL = true
					AM_CL_StopTrail(pl.actmod_cl_TmpDtEf.Thhk_r)
					AM_CL_StopTrail(pl.actmod_cl_TmpDtEf.Thhk_l)
					local a,b = GetBEl(pl,{"ValveBiped.Bip01_R_Hand","ValveBiped.Anim_Attachment_RH"}),GetBEl(pl,{"ValveBiped.Bip01_L_Hand","ValveBiped.Anim_Attachment_LH"})
					local gaa = 0.03
					if QHt == 1 then gaa = gaa*1.9 end
					if QHt == 2 then gaa = gaa*1.4 end
					if QHt > 3 then gaa = gaa*0.7 end
					if a ~= "" then
						pl.actmod_cl_TmpDtEf.Thhk_r = AM_CL_CreateTrail({
							ply = pl, ent = pl ,Nobreak = QHt > 2
							,Material = "actmod/eff_particle/plasma",boneName = a
							,color = Color(255,180,200,170), width = 4*Asz
							,duration = 1.8, holdTime = 0.01,lifetime = 0.4
							,TrailPointInterval = gaa ,SVector = {2.5*Asz, 0, 0}
						})
					end
					if b ~= "" then
						pl.actmod_cl_TmpDtEf.Thhk_l = AM_CL_CreateTrail({
							ply = pl, ent = pl ,Nobreak = QHt > 2
							,Material = "actmod/eff_particle/plasma",boneName = b
							,color = Color(255,180,200,170), width = 4*Asz
							,duration = 1.8, holdTime = 0.01,lifetime = 0.4
							,TrailPointInterval = gaa ,SVector = {2.5*Asz, 0, 0}
						})
					end
				end
			end
			
			return {
				SCpt = function(pl,cyc,Fram)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.CPffye and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
						local aID,basePos,bAng,Asz,QHt = AM_namT(pl) .. "_menerg_",pl:GetPos(),pl:GetRenderAngles(),pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef")
						if not pl.actmod_cl_TmpDtEf.twwh then
							pl.actmod_cl_TmpDtEf.twwh = true
							for i = 1,2 do
								local tMdl = ClientsideModel("models/actmod/prop/am_cylinder.mdl",RENDERGROUP_TRANSLUCENT)
								if IsValid(tMdl) then
									local nid,pid = aID .. i,"AMTmp_".. pl:SteamID64() .."|".. pl:EntIndex() .."|".. i
									tMdl:SetNoDraw(true)
									tMdl:SetPos(basePos) tMdl:SetAngles(bAng+Angle(0,0,0))
									tMdl:SetColor( Color(0,0,0,0) ) tMdl:SetRenderMode( 5 )
									tMdl:SetModelScale(1*Asz) tMdl:SetMaterial("actmod/eff_particle/tsmokefhm_".. tostring(math.Round(1+(i%4))))
									tMdl:ManipulateBoneScale(0,Vector(0,0,0))
									tMdl.tply = pl
									tMdl.Astr = pl.actmod_cl_TmpDtEf.Astr
									tMdl.CurTRun = pl.ActMod_CurTRun
									tMdl.Cpffim = true
									pl.actmod_cl_TmpDtEf.Tctve[nid] = tMdl
									pl:CallOnRemove( pid, function( ent )
										if timer.Exists(pid) then timer.Remove(pid) end
										if ent.actmod_cl_TmpDtEf and ent.actmod_cl_TmpDtEf.Tctve then
											local e = ent.actmod_cl_TmpDtEf.Tctve[nid]
											if IsValid(e) then e:Remove() end
										end
									end )
									tMdl:CallOnRemove( "AMTep_".. pl:SteamID64() .."|".. tMdl:EntIndex() .."|".. i, function( ent ) if IsValid(ent.tply) then ent.tply:RemoveCallOnRemove(pid) end end )
									timer.Create(pid,0.1,0,function()
										if IsValid(tMdl) and (not tMdl.Astr or not tMdl.CurTRun or not IsValid(pl) or not pl.actmod_cl_TmpDtEf or not pl.actmod_cl_TmpDtEf.Astr or tMdl.Astr ~= pl.actmod_cl_TmpDtEf.Astr or tMdl.Astr ~= pl.actmod_cl_TmpDtEf.Astr or tMdl.CurTRun ~= pl.ActMod_CurTRun) then
											if timer.Exists(pid) then timer.Remove(pid) end
											tMdl:Remove()
										end
									end)
									tMdl.RenderOverride = function(self)
										render.SuppressEngineLighting(true)
										render.SetLightingMode(1)
										self:DrawModel(STUDIO_RENDER + STUDIO_STATIC_LIGHTING)
										render.SetLightingMode(0)
										render.SuppressEngineLighting(false)
										if IsValid(self) and (not self.Astr or not self.CurTRun or not IsValid(pl) or not pl.actmod_cl_TmpDtEf or not pl.actmod_cl_TmpDtEf.Astr or self.Astr ~= pl.actmod_cl_TmpDtEf.Astr or self.Astr ~= pl.actmod_cl_TmpDtEf.Astr or self.CurTRun ~= pl.ActMod_CurTRun) then
											if timer.Exists(pid) then timer.Remove(pid) end
											self:Remove()
										end
									end
								end
							end
						end
						if (cyc > 0.938 or cyc < 0.055) and pl.actmod_cl_TmpDtEf.Castp_n ~= 0 then pl.actmod_cl_TmpDtEf.Castp_n = 0
							pl.actmod_cl_TmpDtEf.OnEffLoop = false
							pl.actmod_cl_TmpDtEf.OnEffHRL = false
							if QHt > 2 then
								local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
								local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
								if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
								pl.actmod_cl_TmpDtEf.A_SubMF = A_SubMF
								pl.actmod_cl_TmpDtEf.A_hupf = hupf
							end
						elseif cyc > 0.738 and cyc < 0.785 and pl.actmod_cl_TmpDtEf.Castp_n ~= 13 then pl.actmod_cl_TmpDtEf.Castp_n = 13 cafEf(pl,bAng,8)
						elseif cyc > 0.708 and cyc < 0.725 and pl.actmod_cl_TmpDtEf.Castp_n ~= 12 then pl.actmod_cl_TmpDtEf.Castp_n = 12 cafEf(pl,bAng,7)
						elseif cyc > 0.654 and cyc < 0.665 and pl.actmod_cl_TmpDtEf.Castp_n ~= 11 then pl.actmod_cl_TmpDtEf.Castp_n = 11 cafEf(pl,bAng,7)
						elseif cyc > 0.586 and cyc < 0.595 and pl.actmod_cl_TmpDtEf.Castp_n ~= 10 then pl.actmod_cl_TmpDtEf.Castp_n = 10 cafEf(pl,bAng,6)
						elseif cyc > 0.526 and cyc < 0.536 and pl.actmod_cl_TmpDtEf.Castp_n ~= 9 then pl.actmod_cl_TmpDtEf.Castp_n = 9 cafEf(pl,bAng,6)
						elseif cyc > 0.449 and cyc < 0.457 and pl.actmod_cl_TmpDtEf.Castp_n ~= 8 then pl.actmod_cl_TmpDtEf.Castp_n = 8 cafEf(pl,bAng,5)
						elseif cyc > 0.420 and cyc < 0.429 and pl.actmod_cl_TmpDtEf.Castp_n ~= 7 then pl.actmod_cl_TmpDtEf.Castp_n = 7 cafEf(pl,bAng,5)
						elseif cyc > 0.391 and cyc < 0.400 and pl.actmod_cl_TmpDtEf.Castp_n ~= 6 then pl.actmod_cl_TmpDtEf.Castp_n = 6 cafEf(pl,bAng,5)
						elseif cyc > 0.362 and cyc < 0.369 and pl.actmod_cl_TmpDtEf.Castp_n ~= 5 then pl.actmod_cl_TmpDtEf.Castp_n = 5 cafEf(pl,bAng,5)
						elseif cyc > 0.153 and cyc < 0.185 and pl.actmod_cl_TmpDtEf.Castp_n ~= 4 then pl.actmod_cl_TmpDtEf.Castp_n = 4 cafEf(pl,bAng,4)
						elseif cyc > 0.113 and cyc < 0.135 and pl.actmod_cl_TmpDtEf.Castp_n ~= 3 then pl.actmod_cl_TmpDtEf.Castp_n = 3 cafEf(pl,bAng,3)
						elseif cyc > 0.078 and cyc < 0.094 and pl.actmod_cl_TmpDtEf.Castp_n ~= 2 then pl.actmod_cl_TmpDtEf.Castp_n = 2 cafEf(pl,bAng,2)
						elseif cyc > 0.055 and cyc < 0.070 and pl.actmod_cl_TmpDtEf.Castp_n ~= 1 then pl.actmod_cl_TmpDtEf.Castp_n = 1 cafEf(pl,bAng,1)
							pl.actmod_cl_TmpDtEf.OnEffLoop = false
						end
						
						if pl.actmod_cl_TmpDtEf.OnEffLoop and (pl.actmod_cl_TmpDtEf.trEffLoop or 0) < CurTime() then
							pl.actmod_cl_TmpDtEf.trEffLoop = CurTime() + math.Rand(0.3,1)
							for i = 0,math.random(1,5) do
								local gpos = pl:GetPos() + bAng:Up()*math.random(10,80)*Asz + Vector(math.random(30,-30),math.random(30,-30),0)*Asz
								if math.random(0,1)==1 then addfEf_2(pl,gpos,Asz,QHt,math.random(-10,10),math.random(10,30),math.random(5,25),math.random(10,30),math.random(1,6)) end
								gpos = gpos + VectorRand()*8*Asz
								if math.random(0,1)==1 then addfEf_3(pl,gpos,Asz,math.random(-10,10),math.random(10,30),math.random(5,25),math.random(10,30),math.random(1,6)) end
							end
							if math.random(0,1)==1 then
								for i = 0,math.random(1,3) do if math.random(0,2)==1 then continue end
									local gpos = pl:GetPos() + bAng:Up()*math.random(40,80)*Asz + bAng:Right()*math.random(25,-25)*Asz + bAng:Forward()*math.random(-18,-30)*Asz
									local emitter = ParticleEmitter(gpos)
									if not emitter then continue end
									local p = emitter:Add("actmod/eff_particle/p_i_ligtstar_00_2", gpos)
									if p then
										p:SetVelocity(VectorRand()*math.random(11,18)*Asz) p:SetColor(255,150,160)
										p:SetDieTime(math.Rand(0.7,1.1)) p:SetStartAlpha(math.random(60,100)) p:SetEndAlpha(0)
										p:SetStartSize(math.Rand(8,12)*Asz) p:SetEndSize(math.Rand(6,8)*Asz) p:SetAirResistance(math.random(50,100)*Asz)
									end
									emitter:Finish()
								end
							end
						end
						if pl.actmod_cl_TmpDtEf.OnEffHRL and (pl.actmod_cl_TmpDtEf.trEffHRL or 0) < CurTime() then
							pl.actmod_cl_TmpDtEf.trEffHRL = CurTime() + math.Rand(0.01,0.1)
							local a,b = GetBEl(pl,{"ValveBiped.Bip01_R_Hand","ValveBiped.Anim_Attachment_RH"}),GetBEl(pl,{"ValveBiped.Bip01_L_Hand","ValveBiped.Anim_Attachment_LH"})
							for i = 0,math.random(2,5) do
								if a ~= "" then addfEf_4(pl,A_AM.ActMod:GBonePosAng( pl,a ),Asz) end
								if b ~= "" then addfEf_4(pl,A_AM.ActMod:GBonePosAng( pl,b ),Asz) end
							end
						end
						
						if istable(pl.actmod_cl_TmpDtEf.Tctve) and pl.actmod_cl_TmpDtEf.EfB_Hh and pl.actmod_cl_TmpDtEf.EfB_Hh > CurTime() then
							local tt = math.Clamp((pl.actmod_cl_TmpDtEf.EfB_Hh-0.2 - CurTime()) / 0.3, 0, 1)
							local eShw,siz = math.sin(tt * math.pi),(0.5+1.2*(1-tt))*Asz
							for i = 1,2 do
								local tMdl = pl.actmod_cl_TmpDtEf.Tctve[aID .. i]
								if IsValid(tMdl) and tMdl.Cpffim then
									if eShw > 0 then
										local ua,aang = 1-tt,tMdl:GetManipulateBoneAngles(0)
										tMdl:SetNoDraw(false)
										tMdl:SetPos(basePos+bAng:Up()*35*Asz) tMdl:SetAngles(bAng)
										aang.y = i==1 and 45 or -45
										aang.p = aang.p + 8
										tMdl:ManipulateBoneAngles( 0, aang )
										tMdl:SetColor( Color( 255, 180, 200, 150*eShw ) )
										tMdl:ManipulateBoneScale(0,Vector(siz,siz,siz)*ua)
									else
										tMdl:SetNoDraw(true)
										tMdl:SetColor( Color( 0, 0, 0, 0 ) )
										tMdl:ManipulateBoneScale(0,Vector(0,0,0))
									end
								end
							end
						end
					elseif pl.actmodstr == "amod_cumact_fortnite_pearltaffyopera" then
						local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
						local hup,hupf = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
						if hup then if A_SubMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
						pl.actmod_cl_TmpDtEf = { Astr = pl.actmodstr,CurTRun = pl.ActMod_CurTRun ,Castp_n = 0 ,CPffye = true ,A_hupf = hupf,A_SubMF = A_SubMF ,Tctve = {} }
					end
				end
				,SDrw = function(pl,cyc)
					if not pl:A_ActModEffects() or not aDist(pl,GetConVarNumber("actmod_cl_viewdis")*0.8) then return end
					if istable(pl.actmod_cl_TmpDtEf) and pl.actmod_cl_TmpDtEf.CPffye and pl.actmod_cl_TmpDtEf.Tctve and pl.actmod_cl_TmpDtEf.Astr == pl.actmodstr and isnumber(pl.actmod_cl_TmpDtEf.CurTRun) and pl.actmod_cl_TmpDtEf.CurTRun == pl.ActMod_CurTRun then
						local pos,Asz,QHt,BAng = pl:GetPos(),pl.actmod_cl_TmpDtEf.A_hupf*pl:GetModelScale(),GetConVarNumber("actmod_cl_q_ef"),pl:GetRenderAngles()
						if pl.actmod_cl_TmpDtEf.EfB_Hh and pl.actmod_cl_TmpDtEf.EfB_Hh > CurTime() then
							local remTime = pl.actmod_cl_TmpDtEf.EfB_Hh - CurTime()
							local fraction = math.Clamp(remTime / 0.3, 0, 1)
							local eShw,siz = math.sin(fraction * math.pi),(50+50*(1-fraction))*Asz
							local width, height = siz, siz*0.6+(30*(1-fraction))*Asz
							local drawPos = pos - BAng:Forward()*(6+10*Asz) + BAng:Up()*(42+10*(1-fraction))*Asz
							local fra2 = math.Clamp(remTime / 0.5, 0, 1)
							local nShw,saz = math.sin(fra2 * math.pi),(80+60*(1-fra2))*Asz
							render.SetMaterial(mat_g1)
							render.DrawQuadEasy(drawPos, BAng:Forward(), saz*nShw, saz*nShw, Color(255, 190, 240, 255 * nShw), CurTime()*180)
							if QHt > 1 then
								render.SetMaterial(mat_g2)
								render.DrawQuadEasy(drawPos, BAng:Forward(), saz*nShw, saz*nShw, Color(255, 190, 240, 255 * nShw), CurTime()*-90)
								render.SetMaterial(mat_h1)
								render.DrawQuadEasy(drawPos, BAng:Forward(), width, height, Color(255, 127, 180, 110 * eShw *math.Clamp(math.sin(CurTime()*20),0.4,1)), 180)
							end
							render.SetMaterial(mat_h2)
							render.DrawQuadEasy(drawPos, BAng:Forward(), width * 0.99, height * 0.99, Color(255, 130, 190, 120 * eShw), 180)
						end
					end
				end
			}
		end
	}
}