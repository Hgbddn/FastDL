// Summer (commission)
// 2026-AM4|5379|148635
return{
	["fortnite_dragrace"] = {
		Config = {
			Anim = "amod_fortnite_dragrace"
			,Name = "Summer" ,isNew = true ,class = 1
			,CList = {Title="ActMod Commission Hub",OFtn=true}
		}
		,About = { Author = "AhmedMake400",Version = "4.1" }
		,Camera = { Transition = 2.8 } ,Coop = { Sync = true }
		,Custom = { Anim = { Time2 = 7.5 ,Cycle = 0.1176470588235294 } ,Sound = { Time1 = 16,Time2 = 15 } }
		,Movement = { Type = 3 ,Speed = 40 }
		,Sounds = {
			Start = { Sound = "actmod/i_act/am4/fortnite/Emote_DragRace_1.mp3" ,Delay = 0.01 }
			,StartExtra = { Sound = "actmod/i_act/am4/fortnite/Emote_DragRace_2.mp3" ,Delay = 1 }
			,Repeat = { Sound = "actmod/i_act/am4/fortnite/Emote_DragRace_2.mp3" }
		}
		,Models = { [1] = { Model = "models/actmod/prop/DragRace_Gadget.mdl",Bone = "ValveBiped.Bip01_R_Hand" } }
		,Scrpt = function()
			local function CycG(c,a,b) return math.Remap(math.min(c-a,b),0,b-a,0,1) end
			local function SePFrm(p,m,c,i,a,b)
				local TEA,t = m.TEdiAni[m.A_SubMF and 2 or 1][i],CycG(c,a,b)
				local TEB = m.TEdiAni[m.A_SubMF and 2 or 1][math.max(i-1,0)]
				p.AAct_Tmdl1.pos_fo = Lerp(t,TEB[1],TEA[1])
				p.AAct_Tmdl1.pos_ri = Lerp(t,TEB[2],TEA[2])
				p.AAct_Tmdl1.pos_up = Lerp(t,TEB[3],TEA[3])
				p.AAct_Tmdl1.ang_p = Lerp(t,TEB[4],TEA[4])
				p.AAct_Tmdl1.ang_y = Lerp(t,TEB[5],TEA[5])
				p.AAct_Tmdl1.ang_r = Lerp(t,TEB[6],TEA[6])
			end
			return {
				SCpt = function(pl,cyc)
					local model1
					if pl.AAct_mdl1 then model1 = pl.AAct_mdl1 end
					if model1 then
						if model1.tr_1 and model1.len and model1.stap and model1.nfrm and cyc > 0.001 then
							if model1.tHide and model1.stap == 0 then model1.tHide = nil end
							if model1.stap == 0 then
								if cyc > 0.043 then
									model1:ManipulateBoneScale( 3, model1.GMBScle )
									model1.stap = 1
								elseif cyc > 0.022 then
									model1:ManipulateBoneScale( 3, model1.GMBScle*math.Remap(math.min(cyc-0.022,0.021),0,0.021,0,1) )
								end
							end
							if model1.nfrm < 6 then
								if cyc > 0.048 then
									model1.nfrm = 6 SePFrm(pl,model1,0.0509,3,0.0392,0.0392)
									local basePos,baseAng = model1:GetPos(),model1:GetAngles()
									local mdl = model1:GetModel()
									local len = model1.len
									local ghostAng = baseAng+Angle(0,-len*0.8,0)
									model1.tmdl = ClientsideModel(mdl,RENDERGROUP_TRANSLUCENT)
									local tmdl = model1.tmdl
									if IsValid(tmdl) then
										tmdl:SetPos(basePos) tmdl:SetAngles(ghostAng) tmdl:SetMaterial("models/actmod/prop/dragrace_gadget/mtm") tmdl:SetModelScale(model1:GetModelScale())
										tmdl:SetNoDraw(true) tmdl:ManipulateBoneScale( 3, Vector(1,0.3+len*0.6,1) )
									end
								elseif model1.nfrm < 5 and cyc < 0.048 then model1.nfrm = 4
									SePFrm(pl,model1,cyc,3,0.041,0.048)
								elseif model1.nfrm < 4 and cyc < 0.041 then model1.nfrm = 3
									SePFrm(pl,model1,cyc,2,0.038,0.041)
								elseif model1.nfrm < 3 and cyc < 0.038 then model1.nfrm = 2
									SePFrm(pl,model1,cyc,1,0.0313,0.038)
								elseif model1.nfrm < 2 and cyc < 0.0313 then model1.nfrm = 1
									SePFrm(pl,model1,cyc,0,0.02,0.02)
								end
							end
						end
						if not model1.tr_1 then model1.tr_1 = true model1.tHide = true model1.stap = 0 model1.len = 8
							model1.GMBScle = Vector(1,1,1)
							model1:ManipulateBoneScale(3,Vector(0,0,0))
							local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
							local hup,h = A_AM.ActMod:CBoneAniDistance( pl,"amod_fortnite_dragrace",0.1176470588235294,"ValveBiped.Bip01_R_Foot","ValveBiped.Bip01_R_Hand" ),1
							if A_SubMF then
								h = 1+math.Round(hup-65.467190026788,3)*0.014
							else
								h = 1+math.Round(hup-64.944146478746,3)*0.014
							end
							model1.Ghupf = h model1.nfrm = 0 model1.A_SubMF = A_SubMF
							pl.AAct_Tmdl1["size"] = 0.91*h model1.aalastTime = CurTime()
							model1.TEdiAni = {
								[1] = {
									[0] = {18.5*h,-0.8*h,-5.7*h,70,80,8.3}
									,[1] = {1.5*h,-0.8*h,-5.7*h,90,90,8.3}
									,[2] = {4.5*h,-0.8*h,-3.7*h,90,70,8.3}
									,[3] = {1.5*h,-0.8*h,-3.7*h,90,90,8.3}
								}
								,[2] = {
									[0] = {18.5*h,-0.8*h,-5.7*h,70,80,8.3}
									,[1] = {1.5*h,-0.8*h,-5.7*h,90,90,8.3}
									,[2] = {4.9*h,0.8*h,-3.7*h,89,60,10.5}
									,[3] = {1.9*h,0.8*h,-3.7*h,89,80,10.5}
								}
							}
							model1:CallOnRemove( "AMTmp_".. pl:EntIndex() .."|".. model1:EntIndex(), function( ent )
								if IsValid(ent.tmdl) then ent.tmdl:Remove() end SafeRemoveEntity(ent.tmdl)
							end )
						end
					end
				end
				,SDrwO = function(pl,_,model1)
					if not IsValid(model1) or not model1.len or not model1.stap or model1.stap ~= 1 or not IsValid(model1.tmdl) then return end
					local basePos,baseAng,len = model1:GetPos(),model1:GetAngles(),model1.len
					local ghostAng = baseAng+Angle(0,-len*0.8,0)
					local tmdl = model1.tmdl
					if IsValid(tmdl) then
						tmdl:SetPos(basePos) tmdl:SetAngles(ghostAng) tmdl:SetMaterial("models/actmod/prop/dragrace_gadget/mtm") tmdl:SetModelScale(model1:GetModelScale())
						tmdl:ManipulateBoneScale( 3, Vector(1,0.3+len*0.6,1) )
						render.SetBlend(math.Clamp(len/8,0,1)) tmdl:DrawModel() render.SetBlend(1)
					end
				end
			}
		end
	}
}