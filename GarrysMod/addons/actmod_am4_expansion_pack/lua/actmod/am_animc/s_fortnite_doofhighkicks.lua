// Doof's High Kicks (commission)
// 2026-AM4|19672|148635
return{
	["fortnite_peacescarf"] = {
		Config = { Anim = "amod_fortnite_peacescarf",Name = "Doof's High Kicks",isNew = true,class = 1,CList = {Title="ActMod Commission Hub",OFtn=true} }
		,About = { Author = "AhmedMake400",Version = "4.1" } ,Camera = { Transition = 2.8 } ,Coop = { Sync = true }
		,Sounds = { Start = { Sound = "actmod/i_act/am4/fortnite/Emote_PeaceScarf.mp3" } }
		,Models = { [1] = { Model = "models/actmod/prop/PeaceScarf_Gadget.mdl" } }
		,Scrpt = function()
			if SERVER then return end
			local math_Clamp,math_TimeFraction = math.Clamp,math.TimeFraction
			local math_QuadraticBezier = math.QuadraticBezier
			local function CycG(c,a,b) return math.Clamp(math_TimeFraction(a,b,c),0,1) end
			local function MovBPA(gP,gA,c,bP,bA,sP,sA) return LocalToWorld(LerpVector(c,bP,sP),LerpAngle(c,bA,sA),gP,gA) end

			local GetKeyframes = {
				h = {
					m = {
						{0.009, 0.192, Vector(7.52, -7.20, 0), Angle(0, -56.29, -101.78)},
						{0.192, 0.207, Vector(7.52, -7.20, 0), Angle(0, -56.29, -101.78), Vector(8.88, -6.34, -0.42), Angle(-75.35, -20.55, -111.88)},
						{0.207, 0.216, Vector(8.88, -6.34, -0.42), Angle(-75.35, -20.55, -111.88), Vector(7.32, -6.41, 0.92), Angle(-92.27, -37.89, -111.21)},
						{0.216, 0.3368, Vector(7.32, -6.41, 0.92), Angle(-92.27, -37.89, -111.21)},
						{0.3368, 0.3522, Vector(7.32, -6.41, 0.92), Angle(-92.27, -37.89, -111.21), Vector(7.99, -5.71, 1.14), Angle(-92.27, -37.89, -95.75)},
						{0.3522, 0.519, Vector(7.99, -5.71, 1.14), Angle(-92.27, -37.89, -95.75)},
						{0.533, 0.5490, Vector(7.08, 1.60, 5.25), Angle(31.64, -3.70, -14.38), Vector(7.99, -3.42, 5.25), Angle(45.62, -0.41, -3.70), isLH = true},
						{0.5490, 0.5556, Vector(7.99, -3.42, 5.25), Angle(45.62, -0.41, -3.70), Vector(5.71, -1.60, 7.53), Angle(20.96, -57.12, -42.33), isLH = true},
						{0.5556, 0.5619, Vector(5.71, -1.60, 7.53), Angle(20.96, -57.12, -42.33), Vector(7.08, 1.60, 5.25), Angle(-43.97, -159.86, -12.74), isLH = true},
						{0.5619, 0.5657, Vector(7.08, 1.60, 5.25), Angle(-43.97, -159.86, -12.74), Vector(8.90, -1.14, 2.97), Angle(-53.84, -180, 0.41), isLH = true},
						{0.5657, 0.5701, Vector(8.90, -1.14, 2.97), Angle(-53.84, -180, 0.41), Vector(7.08, -3.88, 3.88), Angle(-48.08, 126.16, 37.40), isLH = true},
						{0.5701, 0.5744, Vector(7.08, -3.88, 3.88), Angle(-48.08, 126.16, 37.40), Vector(5.71, -2.05, 6.62), Angle(-48.08, 144.25, 37.40), isLH = true},
						{0.5744, 0.5826, Vector(5.71, -2.05, 6.62), Angle(-48.08, 144.25, 37.40), Vector(6.16, 2.05, 5.25), Angle(9.45, 92.47, 47.26), isLH = true},
						{0.5826, 0.5918, Vector(6.16, 2.05, 5.25), Angle(9.45, 92.47, 47.26), Vector(9.36, 1.14, 4.34), Angle(34.11, 43.97, 30.82), isLH = true},
						{0.5918, 0.5982, Vector(9.36, 1.14, 4.34), Angle(34.11, 43.97, 30.82), Vector(6.16, -2.97, 6.16), Angle(39.04, -37.40, -22.60), isLH = true},
						{0.5982, 0.6056, Vector(6.16, -2.97, 6.16), Angle(39.04, -37.40, -22.60), Vector(7.08, -0.68, 5.25), Angle(46.44, -19.32, -14.38), isLH = true},
						{0.6056, 0.6125, Vector(7.08, -0.68, 5.25), Angle(46.44, -19.32, -14.38), Vector(7.08, -0.68, 5.25), Angle(68.63, -30, -7.81), isLH = true},
						{0.6125, 0.6201, Vector(7.08, -0.68, 5.25), Angle(68.63, -30, -7.81), isLH = true},
						{0.6355, 0.6470, Vector(8.88, -6.34, -0.42), Angle(-75.35, -20.55, -111.88), Vector(4.88, -8.14, -0.70), Angle(-75.35, -44.79, -111.88)},
						{0.6470, 0.6553, Vector(4.88, -8.14, -0.70), Angle(-75.35, -44.79, -111.88)},
						{0.6553, 0.6595, Vector(4.88, -8.14, -0.70), Angle(-75.35, -44.79, -111.88), Vector(3.02, -7.21, 1.16), Angle(-75.77, -75.77, -111.88)},
						{0.6595, 0.6736, Vector(3.02, -7.21, 1.16), Angle(-75.77, -75.77, -111.88), Vector(3.95, -8.14, 1.16), Angle(-75.77, -66.56, -111.88)},
						{0.6736, 0.6787, Vector(3.95, -8.14, 1.16), Angle(-75.77, -66.56, -111.88), Vector(3.49, -7.25, 1.16), Angle(-75.77, -66.56, -111.88)},
						{0.6787, 0.6932, Vector(3.49, -7.25, 1.16), Angle(-75.77, -66.56, -111.88)},
						{0.6932, 0.7021, Vector(3.49, -7.25, 1.16), Angle(-75.77, -66.56, -111.88), Vector(5.81, -6.74, 1.16), Angle(-79.95, -48.14, -103.40)},
						{0.7021, 0.7267, Vector(5.81, -6.74, 1.16), Angle(-79.95, -48.14, -103.40), Vector(5.81, -6.74, 1.16), Angle(-105.91, -50.65, -100.88)},
						{0.7267, 0.8198, Vector(5.81, -6.74, 1.16), Angle(-105.91, -50.65, -100.88)},
						{0.8198, 0.8291, Vector(5.81, -6.74, 1.16), Angle(-105.91, -50.65, -100.88), Vector(6.74, -5.81, 1.16), Angle(-105.91, -37.26, -100.88)},
						{0.8291, 0.9448, Vector(6.74, -5.81, 1.16), Angle(-105.91, -37.26, -100.88)},
						{0.9448, 0.9490, Vector(6.74, -5.81, 1.16), Angle(-105.91, -37.26, -100.88), Vector(3.37, -2.905, 0.58), Angle(-105.91, -37.26, -100.88)}
					},
					f = {}
				}
				,c = {
					m = {
						{0.009, 0.020, Vector(3.48, -5.08, -9.89), Angle(0, 0, -100.6), Vector(1.87, -2.94, -9.89), Angle(8, 8, -97)},
						{0.020, 0.043, Vector(1.87, -2.94, -9.89), Angle(8, 8, -97), Vector(-0.1, -1.7, -9.89), Angle(16, 16, -88)},
						{0.043, 0.118, Vector(-0.1, -1.7, -9.89), Angle(16, 16, -88)},
						{0.118, 0.129, Vector(-0.1, -1.7, -9.89), Angle(16, 16, -88), Vector(0.80, -1.34, -9.89), Angle(12, 12, -88)},
						{0.129, 0.192, Vector(0.80, -1.34, -9.89), Angle(12, 12, -88)},
						{0.192, 0.1945, Vector(0.80, -1.34, -9.89), Angle(12, 12, -88), Vector(2.28, -12.76, -7.29), Angle(1.64, -13.94, -129.57)},
						{0.1945, 0.1978, Vector(2.28, -12.76, -7.29), Angle(1.64, -13.94, -129.57), Vector(-4.56, -15.49, -7.74), Angle(22.96, -29.52, -147.61)},
						{0.1978, 0.2045, Vector(-4.56, -15.49, -7.74), Angle(22.96, -29.52, -147.61), Vector(9.11, -20.96, 0.91), Angle(0, 14.76, 180)},
						{0.2045, 0.2092, Vector(9.11, -20.96, 0.91), Angle(0, 14.76, 180), Vector(7.29, -19.59, 0.91), Angle(0, 14.76, 180)},
						{0.2092, 0.3146, Vector(7.29, -19.59, 0.91), Angle(0, 14.76, 180)},
						{0.3146, 0.3220, Vector(7.29, -19.59, 0.91), Angle(0, 14.76, 180), Vector(-4.10, -14.58, -6.83), Angle(0, -40.18, -136.13)},
						{0.3220, 0.3289, Vector(-4.10, -14.58, -6.83), Angle(0, -40.18, -136.13), Vector(0.80, -1.34, -9.89), Angle(12, 12, -88)},
						{0.3289, 0.3370, Vector(0.80, -1.34, -9.89), Angle(12, 12, -88), Vector(-5.47, -0.91, -7.74), Angle(29.52, 50.02, -54.94)},
						{0.3370, 0.5273, Vector(-5.47, -0.91, -7.74), Angle(29.52, 50.02, -54.94)},
						{0.5273, 0.5471, Vector(-5.47, -0.91, -7.74), Angle(29.52, 50.02, -54.94), Vector(-5.47, -1.82, -7.74), Angle(25.42, 65.60, -52.48)},
						{0.5471, 0.6374, Vector(-5.47, -1.82, -7.74), Angle(25.42, 65.60, -52.48)},
						{0.6374, 0.6479, Vector(-5.47, -1.82, -7.74), Angle(25.42, 65.60, -52.48), Vector(0.68, -1.60, -0.68), Angle(25.42, 65.60, -52.48)},
						{0.6479, 0.6531, Vector(0.68, -1.60, -0.68), Angle(25.42, 65.60, -52.48), Vector(3.88, -1.14, 1.14), Angle(19.32, 62.05, -71.10)},
						{0.6531, 0.6597, Vector(3.88, -1.14, 1.14), Angle(19.32, 62.05, -71.10), Vector(2.51, -1.14, 11.19), Angle(-1.23, -11.10, -90)},
						{0.6597, 0.6646, Vector(2.51, -1.14, 11.19), Angle(-1.23, -11.10, -90)},
						{0.6646, 0.6713, Vector(2.51, -1.14, 11.19), Angle(-1.23, -11.10, -90), Vector(4.79, -2.51, 9.82), Angle(14.38, -11.92, -85.07)},
						{0.6713, 0.6762, Vector(4.79, -2.51, 9.82), Angle(14.38, -11.92, -85.07), Vector(3.42, -2.05, 4.79), Angle(6.99, -10.27, -85.07)},
						{0.6762, 0.6911, Vector(3.42, -2.05, 4.79), Angle(6.99, -10.27, -85.07), Vector(-1.14, -1.60, -3.42), Angle(25.42, 65.60, -52.48)},
						{0.6911, 0.7269, Vector(-1.14, -1.60, -3.42), Angle(25.42, 65.60, -52.48), Vector(3.88, -1.14, 2.05), Angle(25.42, 65.60, -52.48)},
						{0.7269, 0.8304, Vector(3.88, -1.14, 2.05), Angle(25.42, 65.60, -52.48)},
						{0.8304, 0.8377, Vector(3.88, -1.14, 2.05), Angle(25.42, 65.60, -52.48), Vector(3.88, -1.14, 2.05), Angle(25.42, 76.85, -52.48)},
						{0.8377, 0.8436, Vector(3.88, -1.14, 2.05), Angle(25.42, 76.85, -52.48), Vector(2.51, -12.10, -2.51), Angle(62.88, 57.12, -76.85)},
						{0.8436, 0.8538, Vector(2.51, -12.10, -2.51), Angle(62.88, 57.12, -76.85), Vector(-12.56, -18.95, -4.79), Angle(77.67, 57.12, -76.85)},
						{0.8538, 0.8592, Vector(-12.56, -18.95, -4.79), Angle(77.67, 57.12, -76.85), Vector(2.51, -23.52, 1.14), Angle(0, 0, -180)},
						{0.8592, 0.8626, Vector(2.51, -23.52, 1.14), Angle(0, 0, -180), Vector(1.14, -22.15, -0.23), Angle(0, 0, -180)},
						{0.8626, 0.8657, Vector(1.14, -22.15, -0.23), Angle(0, 0, -180), Vector(0.23, -20.78, 1.14), Angle(0, -7.81, -180)},
						{0.8657, 0.9436, Vector(0.23, -20.78, 1.14), Angle(0, -7.81, -180)},
						{0.9436, 0.9539, Vector(0.23, -20.78, 1.14), Angle(0, -7.81, -180), Vector(2.97, -2.05, 0.23), Angle(0, 6.99, -180)}
					},
					f = {
						{0.009, 0.020, Vector(3.48, -5.08, -9.89), Angle(0, 0, -100.6), Vector(1.87, -2.94, -9.89), Angle(8, 8, -97)},
						{0.020, 0.043, Vector(1.87, -2.94, -9.89), Angle(8, 8, -97), Vector(-0.1, -1.7, -9.89), Angle(16, 16, -88)},
						{0.043, 0.118, Vector(-0.1, -1.7, -9.89), Angle(16, 16, -88)},
						{0.118, 0.129, Vector(-0.1, -1.7, -9.89), Angle(16, 16, -88), Vector(0.80, -1.34, -9.89), Angle(12, 12, -88)},
						{0.129, 0.192, Vector(0.80, -1.34, -9.89), Angle(12, 12, -88)},
						{0.192, 0.1945, Vector(0.80, -1.34, -9.89), Angle(12, 12, -88), Vector(4.34,-12.56,-14.84), Angle(1.64,-3.70,-113.01)},
						{0.1945, 0.1978, Vector(4.34,-12.56,-14.84), Angle(1.64,-3.70,-113.01), Vector(-4.56, -15.49, -7.74), Angle(22.96, -29.52, -147.61)},
						{0.1978, 0.2011, Vector(-4.56, -15.49, -7.74), Angle(22.96, -29.52, -147.61), Vector(-4.32,-16.59,-10.68), Angle(22.96,-29.52,-147.61)},
						{0.1978, 0.2045, Vector(-4.32,-16.59,-10.68), Angle(22.96,-29.52,-147.61), Vector(9.32,-18.86,-7.05), Angle(0,14.32,-158.32)},
						{0.2045, 0.2061, Vector(9.32,-18.86,-7.05), Angle(0,14.32,-158.32), Vector(12.05,-17.95,-4.32), Angle(0,27.41,-166.50)},
						{0.2061, 0.3147, Vector(12.05,-17.95,-4.32), Angle(0,27.41,-166.50)},
						{0.3147, 0.3166, Vector(12.05,-17.95,-4.32), Angle(0,27.41,-166.50), Vector(11.19,-19.41,-7.08), Angle(0,14.76,-150)},
						{0.3146, 0.3220, Vector(11.19,-19.41,-7.08), Angle(0,14.76,-150), Vector(-4.10, -14.58, -6.83), Angle(0, -40.18, -136.13)},
						{0.3220, 0.3289, Vector(-4.10, -14.58, -6.83), Angle(0, -40.18, -136.13), Vector(0.80, -1.34, -9.89), Angle(12, 12, -88)},
						{0.3289, 0.3370, Vector(0.80, -1.34, -9.89), Angle(12, 12, -88), Vector(-5.47, -0.91, -7.74), Angle(29.52, 50.02, -54.94)},
						{0.3370, 0.5273, Vector(-5.47, -0.91, -7.74), Angle(29.52, 50.02, -54.94)},
						{0.5273, 0.5471, Vector(-5.47, -0.91, -7.74), Angle(29.52, 50.02, -54.94), Vector(-5.47, -1.82, -7.74), Angle(25.42, 65.60, -52.48)},
						{0.5471, 0.6374, Vector(-5.47, -1.82, -7.74), Angle(25.42, 65.60, -52.48)},
						{0.6374, 0.6479, Vector(-5.47, -1.82, -7.74), Angle(25.42, 65.60, -52.48), Vector(0.68, -1.60, -0.68), Angle(25.42, 65.60, -52.48)},
						{0.6479, 0.6531, Vector(0.68, -1.60, -0.68), Angle(25.42, 65.60, -52.48), Vector(3.88, -1.14, 1.14), Angle(19.32, 62.05, -71.10)},
						{0.6531, 0.6597, Vector(3.88, -1.14, 1.14), Angle(19.32, 62.05, -71.10), Vector(2.51, -1.14, 11.19), Angle(-1.23, -11.10, -90)},
						{0.6597, 0.6646, Vector(2.51, -1.14, 11.19), Angle(-1.23, -11.10, -90)},
						{0.6646, 0.6713, Vector(2.51, -1.14, 11.19), Angle(-1.23, -11.10, -90), Vector(4.79, -2.51, 9.82), Angle(14.38, -11.92, -85.07)},
						{0.6713, 0.6762, Vector(4.79, -2.51, 9.82), Angle(14.38, -11.92, -85.07), Vector(3.42, -2.05, 4.79), Angle(6.99, -10.27, -85.07)},
						{0.6762, 0.6911, Vector(3.42, -2.05, 4.79), Angle(6.99, -10.27, -85.07), Vector(-1.14, -1.60, -3.42), Angle(25.42, 65.60, -52.48)},
						{0.6911, 0.7269, Vector(-1.14, -1.60, -3.42), Angle(25.42, 65.60, -52.48), Vector(3.88, -1.14, 2.05), Angle(25.42, 65.60, -52.48)},
						{0.7269, 0.8304, Vector(3.88, -1.14, 2.05), Angle(25.42, 65.60, -52.48)},
						{0.8304, 0.8377, Vector(3.88, -1.14, 2.05), Angle(25.42, 65.60, -52.48), Vector(3.88, -1.14, 2.05), Angle(25.42, 76.85, -52.48)},
						{0.8377, 0.8436, Vector(3.88, -1.14, 2.05), Angle(25.42, 76.85, -52.48), Vector(2.51, -12.10, -2.51), Angle(62.88, 57.12, -76.85)},
						{0.8436, 0.8538, Vector(2.51, -12.10, -2.51), Angle(62.88, 57.12, -76.85), Vector(-12.56, -18.95, -4.79), Angle(77.67, 57.12, -76.85)},
						{0.8538, 0.8580, Vector(-12.56, -18.95, -4.79), Angle(77.67, 57.12, -76.85), Vector(2.51,-23.52,-3.86), Angle(0, 0, -168.95)},
						{0.8580, 0.8593, Vector(2.51,-23.52,-3.86), Angle(0, 0, -168.95), Vector(7.05,-19.77,-3.41), Angle(0,11.86,-168.95)},
						{0.8593, 0.8657, Vector(7.05,-19.77,-3.41), Angle(0,11.86,-168.95), Vector(3.86,-19.77,-7.05), Angle(-0.41,3.68,-159.14)},
						{0.8657, 0.9436, Vector(3.86,-19.77,-7.05), Angle(-0.41,3.68,-159.14)},
						{0.9436, 0.9539, Vector(3.86,-19.77,-7.05), Angle(-0.41,3.68,-159.14), Vector(2.97, -2.05, 0.23), Angle(0, 6.99, -180)}
					}
				}
			}
			GetKeyframes.h.f = next(GetKeyframes.h.f) and GetKeyframes.h.f or GetKeyframes.h.male
			-- GetKeyframes.c.f = next(GetKeyframes.c.f) and GetKeyframes.c.f or GetKeyframes.c.male

			local function ProcessFrames(cyc,Avg, keyframes, defaultGPos, defaultGAng, altGPos, altGAng)
				for i = 1, #keyframes do
					local kf = keyframes[i]
					if cyc > kf[1] and cyc < kf[2] then
						local gP = kf.isLH and altGPos or defaultGPos
						local gA = kf.isLH and altGAng or defaultGAng
						if kf[5] then 
							return MovBPA(gP, gA, CycG(cyc, kf[1], kf[2]), kf[3]*Avg, kf[4], kf[5]*Avg, kf[6])
						else 
							return LocalToWorld(kf[3]*Avg, kf[4], gP, gA)
						end
					end
				end
				return nil, nil
			end
			
			return {
				SCpt = function(pl,cyc,Fram)
					local model1
					if pl.AAct_mdl1 then model1 = pl.AAct_mdl1 end
					if model1 and pl.actmodstr == "amod_cumact_fortnite_peacescarf" then
						if model1.tr_1 and model1.step and model1.bfMm and cyc > 0.002 and cyc < 0.96 and model1.CutTim == pl.ActMod_CurTRun then
							if model1.tHide and model1.step == 0 then model1.tHide = nil end
							if model1.step == 0 then
								if cyc > 0.013 then
									model1:ManipulateBoneScale( 3, model1.MScleH )
									model1:ManipulateBoneScale( 4, model1.MScleC )
									model1.step = 1
								elseif cyc > 0.009 then
									local acyc = CycG(cyc,0.009,0.013)
									model1:ManipulateBoneScale( 3, model1.MScleH*acyc )
									model1:ManipulateBoneScale( 4, model1.MScleC*acyc )
								end
							end
							local BHandR,BHandL = pl:LookupBone("ValveBiped.Bip01_R_Hand"),pl:LookupBone("ValveBiped.Bip01_L_Hand")
							if cyc > 0.009 and BHandR and BHandL then
								local GRPos, GRAng = A_AM.ActMod:GBonePosAng(pl, "ValveBiped.Bip01_R_Hand")
								local GLPos, GLAng = A_AM.ActMod:GBonePosAng(pl, "ValveBiped.Bip01_L_Hand")
								
								local gender = model1.A_SubMF and "f" or "m"
								local hatTable,caneTable,Avg = GetKeyframes.h[gender] or GetKeyframes.h.m ,GetKeyframes.c[gender] or GetKeyframes.c.m ,model1.Ghupf
								local SRPos,SRAng,SLPos,SLAng

								if cyc > 0.519 and cyc < 0.533 then
									local acyc = CycG(cyc, 0.519, 0.533)
									if not istable(model1.savTPALst) then
										local ltW_p, ltW_a = LocalToWorld(Vector(-6.16, -6.16, 86.07), Angle(0, 58.77, -60.41), pl:GetPos(), pl:GetRenderAngles())
										model1.savTPALst = {ltW_p, ltW_a}
									end
									local hl_p, hl_a = LocalToWorld(Vector(7.08, 1.60, 5.25)*Avg, Angle(31.64, -3.70, -14.38), GLPos, GLAng)
									local pRenderAng = pl:GetRenderAngles()
									local Pont = math_QuadraticBezier(acyc, model1.savTPALst[1], model1.savTPALst[1] - pRenderAng:Right()*30*Avg + pRenderAng:Up()*35*Avg, hl_p)
									SRPos, SRAng = Pont, LerpAngle(acyc, model1.savTPALst[2], hl_a)
								elseif cyc > 0.6201 and cyc < 0.6355 then
									local acyc = CycG(cyc, 0.6201, 0.6355)
									if not istable(model1.savTPALst) then
										local ltW_p, ltW_a = LocalToWorld(Vector(9.36, -11.64, 88.81)*Avg, Angle(5.34, -44.79, 5.34), pl:GetPos(), pl:GetRenderAngles())
										model1.savTPALst = {ltW_p, ltW_a}
									end
									local hl_p, hl_a = LocalToWorld(Vector(8.88, -6.34, -0.42)*Avg, Angle(-75.35, -20.55, -111.88), GRPos, GRAng)
									local pRenderAng = pl:GetRenderAngles()
									local Pont = math_QuadraticBezier(acyc, model1.savTPALst[1], model1.savTPALst[1] + pRenderAng:Right()*20*Avg + pRenderAng:Up()*10*Avg, hl_p)
									SRPos, SRAng = Pont, LerpAngle(acyc, model1.savTPALst[2], hl_a)
								else
									SRPos, SRAng = ProcessFrames(cyc,Avg, hatTable, GRPos, GRAng, GLPos, GLAng)
								end

								if cyc > 0.216 and cyc < 0.519 then
									model1.savTPALst = {SRPos, SRAng}
								elseif cyc > 0.6125 and cyc < 0.6201 then
									model1.savTPALst = {SRPos, SRAng}
								end

								SLPos, SLAng = ProcessFrames(cyc,model1.Ghupf, caneTable, GLPos, GLAng)

								if cyc > 0.9448 and cyc < 0.949 then
									local acyc = CycG(cyc, 0.9448, 0.949)
									model1:ManipulateBoneScale(3, model1.MScleH * (1 - acyc))
								elseif cyc > 0.949 then
									model1:ManipulateBoneScale(3, Vector(0,0,0))
								elseif not SRPos then
									SRPos, SRAng = MovBPA(GRPos, GRAng, CycG(cyc, 0, 0.013), Vector(), Angle(), Vector(7.52, -7.20, 0)*Avg, Angle(0, -56.29, -101.78))
								end

								if cyc > 0.9436 and cyc < 0.9539 then
									local acyc = CycG(cyc, 0.9436, 0.9539)
									model1:ManipulateBoneScale(4, model1.MScleC * (1 - acyc))
								elseif cyc > 0.9539 then
									model1:ManipulateBoneScale(4, Vector(0,0,0))
								elseif cyc <= 0.192 and not SLPos then
									SLPos, SLAng = MovBPA(GLPos, GLAng, CycG(cyc, 0, 0.013), Vector(), Angle(), Vector(3.48, -5.08, -9.89)*Avg, Angle(0, 0, -100.6))
								end

								if SRPos and SRAng then A_AM.ActMod:APBoneTT(model1, {pos = SRPos, ang = SRAng}, "JNT_Hat") end
								if SLPos and SLAng then A_AM.ActMod:APBoneTT(model1, {pos = SLPos, ang = SLAng}, "JNT_Cane") end
							end

						elseif cyc >= 0.96 and model1.tr_1 then
							model1.tr_1 = nil
							model1.savTPALst = nil
							model1:ManipulateBoneScale(3, Vector(0,0,0))
							model1:ManipulateBoneScale(4, Vector(0,0,0))
						end
						if not model1.tr_1 and pl.actmodstr == "amod_cumact_fortnite_peacescarf" and cyc < 0.96 then
							model1.tr_1 = true model1.ra_1 = true model1.tHide = true model1.step = 0 model1.CutTim = pl.ActMod_CurTRun
							model1:ManipulateBoneScale( 3, Vector(0,0,0) )
							model1:ManipulateBoneScale( 4, Vector(0,0,0) )
							local A_SubMF = A_AM.ActMod:AA_SubMF( pl,"F" )
							local hup,h = A_AM.ActMod:GetSizUpEnt(pl,true,true),1
							local HPe = A_AM.ActMod:CBoneAniDistance( pl,"amod_fortnite_peacescarf",0.901,"ValveBiped.Bip01_L_Hand","Vector()",true)["VectorUp_1-0"] or 0
							if hup then
								if A_SubMF then
									h = 1+math.Round(hup- 58.49235534668,3)*0.011
								else
									h = 1+math.Round(hup- 60.565292358398,3)*0.011
								end
							end
							model1.Ghupf = h model1.bfMm = 0 model1.A_SubMF = A_SubMF
							model1.MScleH = Vector(1,1,1)*h
							model1.MScleC = Vector(1,1,1)*h
							pl.AAct_Tmdl1["size"] = pl.AAct_Tmdl1["size"]*h
							-- model1.TMvAni = {
								-- { bone="JNT_Cane",plyT=pl,boneT="ValveBiped.Bip01_R_Hand",ABTT=true ,ACyc=0.1768,BCyc=0.6038, Apos=Vector(0,0,0),Bpos=Vector(0,0,0) ,Aang=Angle(0,0,0),Bang=Angle(0,0,0) }
							-- }
						end
					end
				end
			}
		end
	}
}