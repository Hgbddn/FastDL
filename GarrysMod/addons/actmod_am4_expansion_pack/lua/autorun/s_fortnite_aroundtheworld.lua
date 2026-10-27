hook.Add( "PreLoadAnimations", "AM4.Fortnite_aroundtheworld", function( gender )
	if gender == WOS_DYNABASE.MALE then
		IncludeModel( "models/player/ani_am4/add_c/aroundtheworld_m.mdl" )
	elseif gender == WOS_DYNABASE.FEMALE then
		IncludeModel( "models/player/ani_am4/add_c/aroundtheworld_f.mdl" )
	elseif gender == WOS_DYNABASE.ZOMBIE then
		IncludeModel( "models/player/ani_am4/add_c/aroundtheworld_m.mdl" )  
	end
end )

if SERVER then return end

local tt_CONFIG = {
	qef = 2,groundOffset = 0.3,materialSize = 17
	,material = Material("actmod/eff_particle/am_eff_04_l")
	,gridSpacing = 17,gridRadius = 55
	,maxDistance = 50,renderDistance = 600
	,AutoQ = false
	,TAutoQ = {
		[1] = { material = Material("actmod/eff_particle/am_eff_04_l"),uTLShow = false,uTLHGround = false,uTLUp = false }
		,[2] = { material = Material("actmod/eff_particle/am_eff_04_l"),uTLShow = true,uTLHGround = false,uTLUp = false }
		,[3] = { material = Material("actmod/eff_particle/am_eff_04"),uTLShow = true,uTLHGround = false,uTLUp = true }
		,[4] = { material = Material("actmod/eff_particle/am_eff_04"),uTLShow = true,uTLHGround = true,uTLUp = true }
	}
	,uTLShow = true,uTLHGround = true,uTLUp = false
	,gridOffset = { enabled = false,rowPattern = { {x = 0, y = 0},{x = 0.5, y = 0} } }
	,minAlpha = 0,maxAlpha = 255,fadeStartDistance = 25
	,colors = { Color(50, 100, 255),Color(255, 50, 50),Color(255, 255, 50),Color(50, 100, 255),Color(50, 100, 255) }
	,colorDuration = 0.193
	,ring = { enabled = true,speed = 123,thickness = 85,smoothness = 0.8 }
	-- ,Debug = true
}

A_AM = A_AM or {}
A_AM.ActMod = A_AM.ActMod or {}
A_AM.ActMod.AM_ActiveEffts = A_AM.ActMod.AM_ActiveEffts or {}

local function GetOffset(CONFIG, x, y)
	if not CONFIG.gridOffset.enabled then return 0, 0 end
	local p = CONFIG.gridOffset.rowPattern[(math.floor(y / CONFIG.gridSpacing) % #CONFIG.gridOffset.rowPattern) + 1]
	return p.x * CONFIG.gridSpacing, p.y * CONFIG.gridSpacing
end
local function GetAlpha(CONFIG,distance)
	if distance <= CONFIG.fadeStartDistance then return CONFIG.maxAlpha elseif distance >= CONFIG.maxDistance then return 0 end
	return CONFIG.maxAlpha * (1 - ((distance - CONFIG.fadeStartDistance) / (CONFIG.maxDistance - CONFIG.fadeStartDistance)))
end
local function LerpColor(cA, cB, t) return Color(Lerp(t, cA.r, cB.r), Lerp(t, cA.g, cB.g), Lerp(t, cA.b, cB.b)) end

local function GetPointColor(data, distFromCenter, currentColor, nextColor)
	local CONFIG = data.CONFIG
	if not CONFIG.ring.enabled then return currentColor end
	local dFRing,hTness = math.abs(distFromCenter - data.ringRadius),CONFIG.ring.thickness * 0.5
	if dFRing > hTness then return currentColor end
	local ringProgress = 1 - (dFRing / hTness)
	ringProgress = math.pow(ringProgress, 1 / (CONFIG.ring.smoothness + 0.1))
	ringProgress = math.Clamp(ringProgress, 0, 1)
	return LerpColor(currentColor, nextColor, ringProgress)
end


local MAX_TRACES_PER_TICK = 40
local function RebuildPointCache(data,pPos,gcvN)
	local CONFIG = data.CONFIG
	local Asz,gridR,gridSp = data.ent:GetModelScale(),CONFIG.gridRadius,CONFIG.gridSpacing
	local maxDistSq,startX,startY = gridR * gridR ,math.floor((pPos.x - gridR) / gridSp) * gridSp ,math.floor((pPos.y - gridR) / gridSp) * gridSp
	if not data.rebuildQueue then
		local queue = {}
		for x = startX, pPos.x + gridR, gridSp do
			for y = startY, pPos.y + gridR, gridSp do
				local offX, offY = GetOffset(CONFIG, x, y)
				local fx,fy = x + offX,y + offY
				local dx,dy = fx - pPos.x,fy - pPos.y
				if dx * dx + dy * dy <= maxDistSq then queue[#queue + 1] = {fx = fx, fy = fy} end
			end
		end
		data.rebuildQueue = queue
		data.rebuildCursor = 1
		data.rebuildBatch = {}
	end
	local queue,batch,cursor = data.rebuildQueue,data.rebuildBatch,data.rebuildCursor
	local limit = math.min(cursor + MAX_TRACES_PER_TICK - 1, #queue)
	local afilter = function(ent) return not ent:IsPlayer() and not (ent == data.ent and ent:GetOwner() ~= data.ent) end
	for i = cursor, limit do
		local e = queue[i]
		local fx,fy = e.fx,e.fy
		if CONFIG.uTLShow then
			local tr = util.TraceHull({ start = pPos + Vector(0,0,5) ,endpos = Vector(fx,fy,pPos.z+5),filter = afilter,mins = Vector(-5,-5,0.4)*Asz,maxs = Vector(5,5,3)*Asz })
			if tr.Hit then continue end
		end
		local groundZ = pPos.z
		if CONFIG.uTLHGround then
			local tr = util.TraceLine({ start = Vector(fx,fy,pPos.z+0.3*Asz),endpos = Vector(fx,fy,pPos.z-20*Asz),filter = afilter })
			if not tr.Hit then continue end
			groundZ = tr.HitPos.z
		end
		if CONFIG.uTLUp then
			local tr = isnumber(gcvN) and gcvN>2 and util.TraceHull({ start = Vector(fx,fy,pPos.z+20*Asz),endpos = Vector(fx,fy,pPos.z-80*Asz),filter = afilter ,mins = Vector(-5,-5,-0.1)*Asz,maxs = Vector(5,5,0.1)*Asz })
			or util.TraceLine({ start = Vector(fx,fy,pPos.z+20*Asz),endpos = Vector(fx,fy,pPos.z-80*Asz),filter = afilter })
			groundZ = tr.Hit and tr.HitPos.z or pPos.z
		end
		local dx,dy = fx - pPos.x ,fy - pPos.y
		local dist = math.sqrt(dx * dx + dy * dy)
		batch[#batch + 1] = { pos = Vector(fx, fy, groundZ + CONFIG.groundOffset),dist = dist,alpha = GetAlpha(CONFIG, dist) }
		continue
	end
	data.rebuildCursor = limit + 1
	if limit >= #queue then
		data.cachedPoints = data.rebuildBatch
		data.cachePos = Vector(pPos.x, pPos.y, pPos.z)
		data.rebuildQueue = nil
		data.rebuildBatch = nil
		data.rebuildCursor = nil
	end
end

local function NeedsRebuild(data,pPos,gN)
	if not data.cachedPoints or not data.cachePos then return true end
	local gcvN = gN or 2
	if (CurTime() - (data.cacheTime or 0)) > (gcvN>3 and 0.04 or gcvN==3 and 0.08 or gcvN==2 and 0.2 or gcvN<=1 and 0.4) then return true end
	local halfStep,dx,dy = data.CONFIG.gridSpacing * 0.5 ,pPos.x - data.cachePos.x ,pPos.y - data.cachePos.y
	if dx * dx + dy * dy >= halfStep * halfStep then return true end
	return false
end

local function DrawGrid(data, pPos)
	local CONFIG = data.CONFIG
	if not istable(CONFIG) or type(CONFIG.material) ~= "IMaterial" or CONFIG.material:IsError() or not data.cachedPoints then return end
	local Asz,cColor,nColor,rPGrid,dAlpha = data.ent:GetModelScale(),CONFIG.colors[data.currentColorIndex],CONFIG.colors[data.nextColorIndex],data.ringRadius > CONFIG.gridRadius + CONFIG.ring.thickness,1
	if data.viewDistance then dAlpha = 1 - math.Clamp((EyePos():Distance(pPos) - data.viewDistance.fadeDist or 270 * Asz) / data.viewDistance.max or 330 * Asz, 0, 1) end
	local AColor = math.Clamp((CurTime() - data.ShwnTime) / 0.5, 0, dAlpha)
	if AColor <= 0 then return end
	render.SetMaterial(CONFIG.material)
	local matSize,upVec,debugColor = CONFIG.materialSize,Vector(0, 0, 1),CONFIG.Debug and Color(255, 0, 0, 255)
	for _, pt in ipairs(data.cachedPoints) do
		local alpha = pt.alpha * AColor
		if alpha <= 0 then continue end
		local pointColor
		if rPGrid then pointColor = nColor else pointColor = GetPointColor(data, pt.dist, cColor, nColor) end
		render.DrawQuadEasy( pt.pos, upVec,matSize, matSize, Color(pointColor.r, pointColor.g, pointColor.b, alpha),0 )
		if debugColor then
			render.DrawWireframeBox( pt.pos + Vector(0, 0, -1), Angle(0, 0, 0),Vector(-matSize * 0.5, -matSize * 0.5, 0),Vector( matSize * 0.5,  matSize * 0.5, 3), debugColor, true )
			render.SetMaterial(CONFIG.material)
		end
	end
end

local function UpdateColorSystem(data)
	local curTime,CONFIG = CurTime(),data.CONFIG
	if CONFIG.ring.enabled then data.ringRadius = math.Clamp(curTime - data.ringStartTime, 0, 1) * CONFIG.ring.speed end
	if curTime - data.colorChangeTime >= CONFIG.colorDuration then
		data.currentColorIndex = data.nextColorIndex
		data.nextColorIndex = (data.nextColorIndex % #CONFIG.colors) + 1
		data.colorChangeTime = curTime
		data.ringStartTime = curTime
		data.ringRadius = 0
	end
end

local gcvN
hook.Add("Think", "GridEffectRender", function()
	gcvN = ConVarExists("actmod_cl_q_ef") and GetConVarNumber("actmod_cl_q_ef") or 2
	for k, data in pairs(A_AM.ActMod.AM_ActiveEffts) do
		local ply = data.ent
		if not IsValid(ply) or ply:IsPlayer() and not ply:Alive() then A_AM.ActMod.AM_ActiveEffts[k] = nil continue end
		if data.CONFIG.AutoQ and (data.ttchk or 0) < CurTime() then
			data.ttchk = CurTime() + 0.5
			local CONFIG = data.CONFIG
			if isnumber(gcvN) and istable(CONFIG) then
				local TAutoQ = data.CONFIG.TAutoQ and data.CONFIG.TAutoQ[gcvN]
				if istable(TAutoQ) then
					if TAutoQ.material then CONFIG.material = TAutoQ.material end
					if TAutoQ.uTLShow then CONFIG.uTLShow = TAutoQ.uTLShow end
					if TAutoQ.uTLHGround then CONFIG.uTLHGround = TAutoQ.uTLHGround end
					if TAutoQ.uTLUp then CONFIG.uTLUp = TAutoQ.uTLUp end
				end
			end
		end
		UpdateColorSystem(data)
		local playerPos = ply:GetPos()
		if NeedsRebuild(data,playerPos,gcvN) then
			if data.rebuildQueue and data.cachePos then
				local halfStep,dx,dy = data.CONFIG.gridSpacing*0.5 ,playerPos.x - data.cachePos.x ,playerPos.y - data.cachePos.y
				if dx * dx + dy * dy >= halfStep * halfStep then data.rebuildQueue = nil end
			end
			data.cacheTime = CurTime()
			RebuildPointCache(data,playerPos,gcvN)
		elseif data.rebuildQueue then
			RebuildPointCache(data,playerPos,gcvN)
		end
	end
end)

hook.Add("PostDrawTranslucentRenderables", "GridEffectRender", function(depth, skybox)
	if skybox or not A_AM or not A_AM.ActMod or GetConVarNumber("actmod_sv_enabled_addef") < 1 then return end
	for k, data in pairs(A_AM.ActMod.AM_ActiveEffts) do
		local ply = data.ent
		if not IsValid(ply) or ply:IsPlayer() and (not ply:Alive() or not ply:A_ActMod_IsActing()) then A_AM.ActMod.AM_ActiveEffts[k] = nil continue end
		if not ply:A_ActModEffects() or ply ~= LocalPlayer() and not LocalPlayer():trueShowMld(ply) then continue end
		local playerPos = ply:GetPos()
		if EyePos():Distance(playerPos) > data.CONFIG.renderDistance then continue end
		DrawGrid(data, playerPos)
	end
end)


local mt01 = Material("actmod/eff_particle/am_eff_04_l")
local mt02 = Material("actmod/eff_particle/am_eff_04")
local function CreateGridEffect(ply)
	if not A_AM or not A_AM.ActMod or GetConVarNumber("actmod_sv_enabled_addef") < 1 or not IsValid(ply) or not ply:A_ActModEffects() then return end
	local SMF,hup,hupf = A_AM.ActMod:AA_SubMF( ply,"F" ),A_AM.ActMod:GetSizUpEnt(ply,true,true),1
	if hup then if SMF then hupf = 1+math.Round(hup- 58.49235534668,3)*0.018 else hupf = 1+math.Round(hup- 60.565292358398,3)*0.018 end end
	local Asz = hupf*ply:GetModelScale()
	local tTb = {
		currentColorIndex = 1,nextColorIndex = 2,colorChangeTime = 0
		,ringStartTime = 0,ringRadius = 0,renderDistance = 500*Asz
		,viewDistance = { fadeDist = 420*Asz ,max = 80*Asz }
		,ShwnTime = CurTime(),ttchk = CurTime() + 1
	}
	if not ply:GetNWBool( "A_AM.ActMod.OnHimself", false ) and IsValid(ply.actmod_Coop_Tply) and A_AM.ActMod.AM_ActiveEffts[ply.actmod_Coop_Tply] then
		local CTb = A_AM.ActMod.AM_ActiveEffts[ply.actmod_Coop_Tply]
		tTb.currentColorIndex = CTb.currentColorIndex
		tTb.nextColorIndex = CTb.nextColorIndex
		tTb.colorChangeTime = CTb.colorChangeTime
		tTb.ringStartTime = CTb.ringStartTime
		tTb.ringRadius = CTb.ringRadius
	end
	A_AM.ActMod.AM_ActiveEffts[ply] = {
		ent = ply
		,currentColorIndex = tTb.currentColorIndex
		,nextColorIndex = tTb.nextColorIndex
		,colorChangeTime = tTb.colorChangeTime
		,ringStartTime = tTb.ringStartTime
		,ringRadius = tTb.ringRadius
		,ShwnTime = tTb.ShwnTime
		,renderDistance = tTb.renderDistance
		,viewDistance = tTb.viewDistance
		,cachedPoints = nil
		,CONFIG = {
			qef = 2,materialSize = 17*Asz,groundOffset = 0.3
			,material = Material("actmod/eff_particle/am_eff_04_l")
			,gridSpacing = 17*Asz,gridRadius = 55*Asz
			,maxDistance = 50*Asz,renderDistance = 600*Asz
			,AutoQ = true
			,TAutoQ = {
				[1] = { material = mt01 ,uTLShow = false,uTLHGround = false,uTLUp = false }
				,[2] = { material = mt01 ,uTLShow = true,uTLHGround = false,uTLUp = false }
				,[3] = { material = mt02 ,uTLShow = true,uTLHGround = false,uTLUp = true }
				,[4] = { material = mt02 ,uTLShow = true,uTLHGround = true,uTLUp = true }
			}
			,uTLShow = true,uTLHGround = true,uTLUp = false
			,gridOffset = { enabled = false,rowPattern = { {x = 0, y = 0} ,{x = 0.5, y = 0} } }
			,minAlpha = 0,maxAlpha = 255,fadeStartDistance = 25*Asz
			,colors = { Color(50, 100, 255),Color(255, 50, 50),Color(255, 255, 50),Color(50, 100, 255),Color(50, 100, 255) }
			,colorDuration = 0.193
			,ring = { enabled = true,speed = 123*Asz,thickness = 85,smoothness = 0.8*Asz }
			-- ,Debug = true
		}
	}
end

local function RemoveGridEffect(player)
	if A_AM.ActMod.AM_ActiveEffts[player] then A_AM.ActMod.AM_ActiveEffts[player] = nil end
end

hook.Add("ActMod_RunStopAct", "Fortnite_aroundtheworld_stopEffectsCL", function(pl) RemoveGridEffect(pl) end)
hook.Add("ActMod_cl_RunaPlyEmot", "Fortnite_aroundtheworld_stopEffectsCL", function(pl) RemoveGridEffect(pl) end)
hook.Add("ActMod_cl_StartAniAct_A", "Fortnite_aroundtheworld_StartEffectsCL", function(pl,txt)
	if txt == "amod_cumact_fortnite_stridemicegiant" then RemoveGridEffect(pl) CreateGridEffect(pl) end
end)
