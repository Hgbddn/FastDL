if SERVER then return end


A_AM = A_AM or {}
A_AM.ActMod = A_AM.ActMod or {}
AM4_ActiveEFFTS = AM4_ActiveEFFTS or {}

function AM4_ReSetAEFFSPly(aID)
	AM4_ActiveEFFTS[aID] = AM4_ActiveEFFTS[aID] or {}
	AM4_ActiveEFFTS[aID].Trails = AM4_ActiveEFFTS[aID].Trails or {}
	AM4_ActiveEFFTS[aID].Imag3D = AM4_ActiveEFFTS[aID].Imag3D or {}
	AM4_ActiveEFFTS[aID].Tornados = AM4_ActiveEFFTS[aID].Tornados or {}
	AM4_ActiveEFFTS[aID].bLampEff = AM4_ActiveEFFTS[aID].bLampEff or {}
end

function A_AM.ActMod:GetSizUpEnt(ent,aa,aaa)
	local gB_H,gB_F,gV = "","",not aa and 1 or false
	if not IsValid(ent) then return gV end
	if ent:LookupBone("ValveBiped.Bip01_Head1") then gB_H = "ValveBiped.Bip01_Head1"
	elseif ent:LookupBone("ValveBiped.Bip01_Neck1") then gB_H = "ValveBiped.Bip01_Neck1"
	elseif ent:LookupBone("ValveBiped.Bip01_Spine4") then gB_H = "ValveBiped.Bip01_Spine4"
	end
	if ent:LookupBone("ValveBiped.Bip01_R_Foot") then gB_F = "ValveBiped.Bip01_R_Foot"
	elseif ent:LookupBone("ValveBiped.Bip01_L_Foot") then gB_F = "ValveBiped.Bip01_L_Foot"
	end
	if gB_H ~= "" and gB_F ~= "" and A_AM.ActMod.CBoneAniDistance then
		gV = A_AM.ActMod:CBoneAniDistance(ent,"drive_pd",0,gB_F,gB_H) or gV
		if isnumber(gV) and gV == 0 then gV = not aa and 1 or false end
	end
	return gV
end
function A_AM.ActMod:APBoneTT(prop, target, propBoneName, targetBoneName, offsetPos, offsetAng, weight)
    if not IsValid(prop) then return end
    local pBone = prop:LookupBone(propBoneName)
    if not pBone then return end
    local tBone = nil
    if IsValid(target) and IsEntity(target) then
        tBone = target:LookupBone(targetBoneName or "")
        if not tBone then return end
    end --print("[<->]")
    local weightPos,weightAng = 1,1
    if type(weight) == "number" then
        weightPos = math.Clamp(weight, 0, 1) weightAng = math.Clamp(weight, 0, 1)
    elseif type(weight) == "table" then
        weightPos = math.Clamp(weight.pos or weight[1] or 1, 0, 1) weightAng = math.Clamp(weight.ang or weight[2] or 1, 0, 1)
    end
    prop.AttachedBones = prop.AttachedBones or {}
    prop.AttachedBones[pBone] = {
        target = target, targetBone = tBone,
        offsetPos = offsetPos or vector_origin, offsetAng = offsetAng or angle_zero,
        weightPos = weightPos, weightAng = weightAng
    }
    if not prop.HasBoneAttachmentCallback then
        prop:AddCallback("BuildBonePositions", function(ent, numBones)
            if not ent.AttachedBones then return end
            for pBoneID, data in pairs(ent.AttachedBones) do
                local targetVal = data.target
                local targetPos, targetAng
                if IsValid(targetVal) and IsEntity(targetVal) then
                    local tMatrix = targetVal:GetBoneMatrix(data.targetBone)
                    if tMatrix then
                        targetPos = tMatrix:GetTranslation()
                        targetAng = tMatrix:GetAngles()
                    end
                elseif type(targetVal) == "table" then
                    targetPos = targetVal.pos or targetVal[1] or vector_origin
                    targetAng = targetVal.ang or targetVal[2] or angle_zero
                else
                    targetPos = vector_origin targetAng = angle_zero
                end
                local origMatrix = ent:GetBoneMatrix(pBoneID)
                if targetPos and targetAng and origMatrix then
                    local origPos = origMatrix:GetTranslation()
                    local origAng = origMatrix:GetAngles()
                    local finalTargetPos, finalTargetAng = LocalToWorld(data.offsetPos, data.offsetAng, targetPos, targetAng)
                    local finalPos = LerpVector(data.weightPos, origPos, finalTargetPos)
                    local finalAng = LerpAngle(data.weightAng, origAng, finalTargetAng)
                    local finalMatrix = Matrix()
                    finalMatrix:SetTranslation(finalPos)
                    finalMatrix:SetAngles(finalAng)
					finalMatrix:Scale( ent:GetManipulateBoneScale(pBoneID)*ent:GetModelScale() )
                    ent:SetBoneMatrix(pBoneID, finalMatrix)
                end
            end
        end)
        prop.HasBoneAttachmentCallback = true
    end
end

local math_clamp = math.Clamp
local LerpVector = LerpVector
local LerpAngle = LerpAngle
local IsValid = IsValid
function A_AM.ActMod:ABoneKf(ent, cycle, keyfTracks)
	if not IsValid(ent) or not istable(keyfTracks) then return end
	if not istable(ent.activeBones) then ent.activeBones = {} end
	local activeBones = ent.activeBones
	for boneID in pairs(activeBones) do activeBones[boneID] = nil end
	for i = 1, #keyfTracks do
		local kf = keyfTracks[i]
		if kf.boneID == nil then kf.boneID = ent:LookupBone(kf.bone) or false end
		local boneID = kf.boneID
		if not boneID then continue end
		if cycle >= kf.ACyc then
			local currentBest = activeBones[boneID]
			if not currentBest or kf.ACyc > currentBest.ACyc then activeBones[boneID] = kf end
		end
	end
	for boneID, kf in pairs(activeBones) do
		local startC = kf.ACyc
		local endC = kf.BCyc
		local t = (endC == startC) and 1 or math_clamp((cycle - startC) / (endC - startC), 0, 1)
		local SPos,SAng = Vector(),Angle()
		if kf.Apos and kf.Bpos then SPos = LerpVector(t, kf.Apos, kf.Bpos) end
		if kf.Aang and kf.Bang then SAng = LerpAngle(t, kf.Aang, kf.Bang) end
		if kf.MBPos then ent:ManipulateBonePosition(boneID, SPos) end
		if kf.MBAng then ent:ManipulateBoneAngles(boneID, SAng) end
		if kf.ABTT and IsValid(kf.plyT) then print("???",ent,"|",kf.plyT,"|", kf.bone,"|",kf.boneT,"|",SPos,"|",SAng)
			A_AM.ActMod:APBoneTT( ent,kf.plyT, kf.bone,kf.boneT ,SPos,SAng ,kf.Weight or 1 )
		end
	end
end

function AM_namT(ply,Ent)
	if not IsValid(ply) then return "__NULL_" end
	Ent = Ent or ply
	local aID = "__mdl_".. tostring(Ent:EntIndex{})
	if ply:IsPlayer() then aID = tostring(ply:SteamID64{} .. ply:Nick{}) end
	return aID
end

local function SmoothStep(x) return x * x * (3 - 2 * x) end
local function EaseInOutCubic(x) return x < 0.5 and 4 * x * x * x or 1 - math.pow(-2 * x + 2, 3) / 2 end

function AM_CL_CreateTrail(options)
	if not istable(options) then
		print("[EmoteEffect] Table data error:", options)
		return
	end
    options = options or {}
	local ply,Ent = options.ply,options.ent
	if not IsValid(ply) or not IsValid(Ent) then return end
	local boneName = options.boneName or "ValveBiped.Bip01_R_Hand"
	local boneId = Ent:LookupBone(boneName)
	if not boneId then
		print("[EmoteEffect] Bone not found:", boneName, "for model", Ent:GetModel())
		return
	end
	local NameMaterial = options.Material or "trails/laser"
	local aMaterial = Material(NameMaterial)
	if aMaterial:IsError() then
		print("[EmoteEffect] The image is incorrect or contains an error:", NameMaterial," || ",aMaterial)
		return
	end
    
	local baseColor = options.color or Color(255, 255, 255)
	local lifetime = options.lifetime or 1
	
    local trail = {
        Ply = ply or NULL,
        entity = Ent or NULL,
		
        Material = aMaterial,
        color = baseColor,
        width = options.width or 10,
		TrailPointInterval = options.TrailPointInterval or nil,
		
        holdTime = options.holdTime or 0,
        lifetime = lifetime,
        duration = options.duration or nil,
		
        SVector = options.SVector or nil,
        
		LastTrailAdd = 0,
        points = {},
		pointHead = 1,
        startTime = CurTime(),
        active = true,
        boneID = boneId
		
		,Nobreak = options.Nobreak or options.nobreak or false
		
        ,AS_Pos = options.AS_Pos
        ,AS_points = options.AS_points
		
		,_maxAlpha = math.min(255, baseColor.a)
		,_lifetimeInv = lifetime > 0 and (1 / lifetime) or 0
		,_drawColor = Color(baseColor.r, baseColor.g, baseColor.b, 255)
    }
    
    local aID = AM_namT(ply,Ent)
	if not AM4_ActiveEFFTS[aID] or not istable(AM4_ActiveEFFTS[aID].Trails) then AM4_ReSetAEFFSPly(aID) end
	table.insert(AM4_ActiveEFFTS[aID].Trails, trail)
    
    return AM4_ActiveEFFTS[aID].Trails[#AM4_ActiveEFFTS[aID].Trails]
end

hook.Add("Think", "ActMdTrailSystem_Update", function()
    local ct = CurTime()
    
	for ik, ETa in pairs(AM4_ActiveEFFTS) do
		if istable(ETa.Tornados) then
			for id, t in pairs(ETa.Tornados) do
				local elapsed = ct - t.startTime
				local globalFade = 1
				if elapsed < t.fadeIn then
					local fp = elapsed / t.fadeIn
					if t.fadeInMode == "linear" then
						globalFade = fp
					elseif t.fadeInMode == "ease" then
						globalFade = EaseInOutCubic(fp)
					else
						globalFade = SmoothStep(fp)
					end
				elseif t.remove or (t.lifetime > 0 and elapsed > t.lifetime) then
					local fadeOutProgress = (elapsed - t.lifetime) / t.fadeOut
					globalFade = SmoothStep(math.Clamp(1 - fadeOutProgress, 0, 1))
					if globalFade <= 0 then
						ETa.Tornados[id] = nil
						continue
					end
				end
				t._globalFade = globalFade
			end
		end
		if istable(ETa.Trails) then
			local EMEFAC = ETa.Trails
			for i = #EMEFAC, 1, -1 do
				local trail = EMEFAC[i]
				if trail.duration and trail.active then
					if ct - trail.startTime >= trail.duration then
						if trail.abruptEnd then
							trail.points = {}
							trail.pointHead = 1
							EMEFAC[i] = EMEFAC[#EMEFAC]
							EMEFAC[#EMEFAC] = nil
							continue
						else
							trail.active = false
						end
					end
				end
				if trail.active and (not trail.TrailPointInterval or (ct - trail.LastTrailAdd) >= trail.TrailPointInterval) then
					trail.LastTrailAdd = ct
					if not IsValid(trail.entity) then
						EMEFAC[i] = EMEFAC[#EMEFAC]
						EMEFAC[#EMEFAC] = nil
						continue
					end
					local pos,ang
					if trail.boneID then
						local boneMatrix = trail.entity:GetBoneMatrix(trail.boneID)
						if boneMatrix then
							pos = boneMatrix:GetTranslation()
							ang = boneMatrix:GetAngles()
						else
							local tpos, tang = trail.entity:GetBonePosition(trail.boneID)
							if tpos then pos = tpos ; ang = tang end
						end
					end
					if not pos then pos = trail.entity:GetPos() end
					if istable(trail.SVector) and ang then
						pos = pos + ang:Forward() * trail.SVector[1] + ang:Right() * trail.SVector[2] + ang:Up() * trail.SVector[3]
					end
					if isfunction(trail.AS_Pos) then
						local pts = trail.points
						local tail = pts[#pts]
						if tail and tail.pos then trail.AS_Pos(tail.pos, pos) end
					end
					if trail.Nobreak and #trail.points > 0 then
						local lastPt = trail.points[#trail.points]
						if lastPt and lastPt.pos then
							local dist = lastPt.pos:Distance(pos)
							if dist > 15 then
								local steps = math.min(math.floor(dist / 15), 4)
								for s = 1, steps do
									local subPos = LerpVector(s / (steps + 1), lastPt.pos, pos)
									local subTime = Lerp(s / (steps + 1), lastPt.time, ct)
									trail.points[#trail.points + 1] = { pos = subPos, time = subTime }
								end
							end
						end
					end
					trail.points[#trail.points + 1] = { pos = pos, time = ct }
					if isfunction(trail.AS_points) then trail.AS_points(trail.points) end
				end
				local maxAge,pts,head = trail.holdTime + trail.lifetime ,trail.points ,trail.pointHead
				while head <= #pts do
					if (ct - pts[head].time) > maxAge then pts[head] = nil head = head + 1 else break end
				end
				trail.pointHead = head
				if head > 3 then
					local live = #pts - head + 1
					if live > 0 then
						local newPts = {}
						for j = head, #pts do
							newPts[#newPts + 1] = pts[j]
						end
						trail.points = newPts
						trail.pointHead = 1
					else
						trail.points = {}
						trail.pointHead = 1
					end
				end
				local livePts = #trail.points - trail.pointHead + 1
				if (not trail.active and trail.StopAll) or livePts <= 0 then
					EMEFAC[i] = EMEFAC[#EMEFAC]
					EMEFAC[#EMEFAC] = nil
				end
			end
		end
	end
end)

function AM_CL_StopTrail(trail) if istable(trail) then trail.active = false end end

-- function AM_CL_StopAllTrails(a,aa)
    -- if aa then
		-- for k, EMEFAC in pairs(AM4_ActiveEFFTS) do EMEFAC.Trails = {} end
	-- else
		-- for k, EMEFAC in pairs(AM4_ActiveEFFTS) do
			-- if istable(EMEFAC.Trails) then
				-- for i, trail in ipairs(EMEFAC.Trails) do
					-- trail.active = false
					-- if a then trail.StopAll = true end
				-- end
			-- end
		-- end
    -- end
-- end

function AM_CL_StopAllTrails(a,aa)
	for k, EMEFAC in pairs(AM4_ActiveEFFTS) do
		if istable(EMEFAC.Trails) then
			if aa then
				EMEFAC.Trails = {}
			else
				for i, trail in ipairs(EMEFAC.Trails) do
					trail.active = false
					if a then trail.StopAll = true end
				end
			end
		end
	end
end




------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

AM_Images3D = AM_Images3D or {
-- AM_Images3D = {
	{
        material = "actmod/eff_particle/EffSun02.png",
        color = Color(255, 255, 255, 135),
        pos = Vector(0, 0, 100),angle = Angle(0, 90, 180),
        width = 70,height = 70,
        fadeDistance = 45,fadeSpeed = 0.9,
        viewDistance = { min = 70,max = 700,fadeDist = 100 },
        wave = { enabled = true,amplitude = 1,frequency = 3,speed = 0.5,segments = 15 }
    },
    {
        material = "actmod/eff_particle/EffSun01.png",
        color = Color(255, 255, 255, 120),
        pos = Vector(0, 0, 100),
        angle = Angle(0, 90, 180),
        width = 75,height = 75,
        fadeDistance = 45,fadeSpeed = 0.9,
        viewDistance = { min = 70,max = 700,fadeDist = 100 },
        wave = { enabled = true,amplitude = 2,frequency = 2,speed = 0.4,segments = 5 }
    },
	
    {
        material = "vgui/gradient-r",
        pos = Vector(100, 0, 100),
        angle = Angle(0, 90, 0),
        width = 80,
        height = 80,
        fadeDistance = 50,
        fadeSpeed = 3
    }
}

AM_loadedMaterials = AM_loadedMaterials or {}

local function LoadMaterials()
    for i, img in ipairs(AM_Images3D) do
        if not AM_loadedMaterials[img.material] then
            AM_loadedMaterials[img.material] = Material(img.material)
        end
    end
end

local function CreateWaveMesh(imageData, alpha)
    local wave = imageData.wave
    if not wave or not wave.enabled then return nil end
    local time,w,h,segments,mesh = CurTime(),imageData.width,imageData.height,wave.segments or 20,{}
    for i = 0, segments - 1 do
        local y1 = (i / segments) - 0.5
        local y2 = ((i + 1) / segments) - 0.5
        local waveAmount1 = (y1 + 0.5)
        local waveAmount2 = (y2 + 0.5)
        local wave1 = math.sin((y1 * wave.frequency + time * wave.speed) * math.pi * 2) * wave.amplitude * waveAmount1
        local wave2 = math.sin((y2 * wave.frequency + time * wave.speed) * math.pi * 2) * wave.amplitude * waveAmount2
        table.insert(mesh, { pos = Vector(-0.5 * w + wave1, 0, y1 * h), u = 0, v = (i / segments) })
        table.insert(mesh, { pos = Vector(0.5 * w + wave1, 0, y1 * h), u = 1, v = (i / segments) })
        table.insert(mesh, { pos = Vector(0.5 * w + wave2, 0, y2 * h), u = 1, v = ((i + 1) / segments) })
        table.insert(mesh, { pos = Vector(-0.5 * w + wave1, 0, y1 * h), u = 0, v = (i / segments) })
        table.insert(mesh, { pos = Vector(0.5 * w + wave2, 0, y2 * h), u = 1, v = ((i + 1) / segments) })
        table.insert(mesh, { pos = Vector(-0.5 * w + wave2, 0, y2 * h), u = 0, v = ((i + 1) / segments) })
    end
    return mesh
end

local function CalculateAlpha(imageData, eyePos,pos,ang)
    local imgPos = pos or imageData.pos
    local imgAng = ang or imageData.angle
    
    local distance = eyePos:Distance(imgPos)
    
    local distanceAlpha = 255
    if imageData.viewDistance then
        local minDist = imageData.viewDistance.min or 0
        local maxDist = imageData.viewDistance.max or 1000
        local fadeDist = imageData.viewDistance.fadeDist or 200
        
        if distance < minDist then
            local fadeAmount = math.Clamp((minDist - distance) / fadeDist, 0, 1)
            distanceAlpha = 255 * (1 - fadeAmount)
        elseif distance > maxDist then
            local fadeAmount = math.Clamp((distance - maxDist) / fadeDist, 0, 1)
            distanceAlpha = 255 * (1 - fadeAmount)
        end
    end
    
    if distanceAlpha <= 0 then return 0 end
    
    local forward = imgAng:Forward()
    local toPlayer = (eyePos - imgPos):GetNormalized()
    local dot = forward:Dot(toPlayer)
    local angle = math.deg(math.acos(math.Clamp(dot, -1, 1)))
    
    local angleAlpha = 255
    local fadeStart = imageData.fadeDistance or 45
    local fadeSpeed = imageData.fadeSpeed or 2.5
    
    if angle < fadeStart then
        angleAlpha = 255
    elseif angle < 90 then
        local fadeAmount = (angle - fadeStart) / (85 - fadeStart)
        fadeAmount = math.pow(fadeAmount, fadeSpeed)
        angleAlpha = math.max(0, 255 * (1 - fadeAmount))
    else
        angleAlpha = 0
    end
    
    local baseAlpha = imageData.color and imageData.color.a or 255
    local finalAlpha = (distanceAlpha / 255) * (angleAlpha / 255) * baseAlpha
    
    return math.max(0, math.min(255, finalAlpha))
end

local function DrawImage(imageData)
    local mat = imageData.material
    if not mat then return end
    
    local pos = imageData.pos
    local ang = imageData.angle
	if IsValid(imageData.entity) then
		local tpos,tang = Vector(),Angle()
		if imageData.boneID then
			local boneMatrix = imageData.entity:GetBoneMatrix(imageData.boneID)
			if boneMatrix then
				pos = boneMatrix:GetTranslation()
				ang = boneMatrix:GetAngles()
			else
				local ttpos, ttang = imageData.entity:GetBonePosition(imageData.boneID)
				if ttpos then
					pos = ttpos
					ang = ttang
				end
			end
			if tpos then
				tpos = ttpos
				tang = ttang
			end
		else
			tpos = imageData.entity:GetPos()
			tang = imageData.entity:GetAngles()
		end
		tang.r = 0 tang.p = 0
		pos = tpos + pos
		ang = tang + ang
	end
	if istable(imageData.SVector) and ang then
		pos = pos + ang:Forward() * imageData.SVector[1] + ang:Right() * imageData.SVector[2] + ang:Up() * imageData.SVector[3]
	end
	
    local alpha = CalculateAlpha(imageData, EyePos(),pos,ang)
    if alpha <= 0 then return end
    
    local w = imageData.width
    local h = imageData.height
	
    local color = imageData.color or Color(255, 255, 255, 255)
    local r, g, b = color.r / 255, color.g / 255, color.b / 255
    
    cam.Start3D(EyePos(),EyeAngles())
        render.SetMaterial(mat)
        render.SetColorModulation(r, g, b)
        render.SetBlend(alpha / 255)
        if imageData.wave and imageData.wave.enabled then
            local meshData = CreateWaveMesh(imageData, alpha)
            if meshData then
                local forward = ang:Forward()
                local right = ang:Right()
                local up = ang:Up()
                local matrix = Matrix()
                matrix:SetAngles(ang+Angle(180,-90,180))
                matrix:SetTranslation(pos)
                cam.PushModelMatrix(matrix)
                render.SetColorModulation(1, 1, 1)
                mesh.Begin(MATERIAL_TRIANGLES, #meshData / 3)
                    for i, vertex in ipairs(meshData) do
						if isvector(imageData.VVector) then
							mesh.Position(vertex.pos+imageData.VVector)
						else
							mesh.Position(vertex.pos)
						end
                        mesh.TexCoord(0, vertex.u, vertex.v)
                        mesh.Color(color.r, color.g, color.b, alpha)
                        mesh.AdvanceVertex()
                    end
                mesh.End()
                cam.PopModelMatrix()
            end
        else
            local forward = ang:Forward()
            local right = ang:Right()
            local up = ang:Up()
            render.DrawQuad(
                pos - right * w/2 - up * h/2,
                pos + right * w/2 - up * h/2,
                pos + right * w/2 + up * h/2,
                pos - right * w/2 + up * h/2,
                Color(color.r, color.g, color.b, alpha)
            )
        end
        render.SetBlend(1)
    cam.End3D()
end


function AM_CL_Add3DImage(options)
	if not istable(options) then
		print("[EmoteEffect] Table data error:", options)
		return
	end
    options = options or {}
	local ply,Ent = options.ply,options.ent
	if not IsValid(ply) then return end
	
	local boneId
	if IsValid(Ent) and options.boneName then
		local boneName = options.boneName
		boneId = Ent:LookupBone(options.boneName)
		if not boneId then
			print("[EmoteEffect] Bone not found:", options.boneName, "for model", Ent:GetModel())
			return
		end
	end
	
	local NameMaterial = options.material or "trails/laser"
	local aMaterial = Material(NameMaterial)
	if aMaterial:IsError() then
		print("[EmoteEffect] The image is incorrect or contains an error:", NameMaterial," || ",aMaterial)
		return
	end
	
    local t3DImages = {
        Ply = ply or NULL,
        entity = Ent or NULL,
		
        Material = aMaterial,
        color = options.color or Color(255, 255, 255, 255),
		
        material = aMaterial,
        pos = options.pos or Vector(0, 0, 0),
        SVector = options.SVector or nil,
        VVector = options.VVector or nil,
        angle = options.angle or Angle(0, 0, 0),
        width = options.width or 64,
        height = options.height or 64,
        fadeDistance = options.fadeDistance or 45,
        fadeSpeed = options.fadeSpeed or 2.5,
		
		viewDistance = {
			min = options.viewDistance and options.viewDistance.min or 70,
			max = options.viewDistance and options.viewDistance.max or 700,
			fadeDist = options.viewDistance and options.viewDistance.fadeDist or 100
		},
		
		wave = options.wave or nil,
		
        startTime = CurTime(),
        active = true,
        boneID = boneId
    }
    
    local aID = AM_namT(ply,Ent)
	if not AM4_ActiveEFFTS[aID] or not istable(AM4_ActiveEFFTS[aID].Imag3D) then AM4_ReSetAEFFSPly(aID) end
	table.insert(AM4_ActiveEFFTS[aID].Imag3D, t3DImages)
    
    return AM4_ActiveEFFTS[aID].Imag3D[#AM4_ActiveEFFTS[aID].Imag3D] --t3DImages
end

function AM_CL_Clear3DImages()
	for k, EMEFAC in pairs(AM4_ActiveEFFTS) do
		if istable(EMEFAC.Imag3D) then
			AM4_ActiveEFFTS[k].Imag3D = {}
		end
	end
end





----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


local function LerpColor(t, c1, c2)
    return Color( Lerp(t, c1.r, c2.r),Lerp(t, c1.g, c2.g),Lerp(t, c1.b, c2.b),Lerp(t, c1.a, c2.a) )
end

function AM_CL_CreateTornadoEffect(options)
	if not istable(options) then
		print("[EmoteEffect] Table data error:", options)
		return
	end
    options = options or {}
	local ply,Ent = options.ply,options.ent
	if not IsValid(ply) then return end
	
	local NameMaterial = options.material or "trails/laser"
	local aMaterial = Material(NameMaterial)
	if aMaterial:IsError() then
		print("[EmoteEffect] The image is incorrect or contains an error:", NameMaterial," || ",aMaterial)
		return
	end
	
    local Tbl = {
        ply = ply,
        entity = Ent or NULL,
        height = options.height or 150,
        bottomRadius = options.bottomRadius or 25,
        middleRadius = options.middleRadius or 35,
        topRadius = options.topRadius or 10,
        curveHeight = options.curveHeight or 0.5,
        waveIntensity = options.waveIntensity or 0,
        waveSpeed = options.waveSpeed or 1,
        turns = options.turns or 3,
        color = options.color or Color(200, 230, 255, 180),
        material = aMaterial,
        lifetime = options.lifetime or 0,
        fadeIn = options.fadeIn or 1,
        fadeOut = options.fadeOut or 1,
        width = options.width or 4,
        speed = options.speed or 1,
        reverse = options.reverse or false,
        enableGrow = options.enableGrow or false,
        growSpeed = options.growSpeed or 0.5,
        growDirection = options.growDirection or "up",
        fadeInMode = options.fadeInMode or "smooth",
        offset = options.offset or Vector(0, 0, 0),
        startTime = CurTime(),
        remove = false,
        _globalFade = 0,
        _growProgress = 0
    }
    
    local aID = AM_namT(ply,Ent)
	if not AM4_ActiveEFFTS[aID] or not istable(AM4_ActiveEFFTS[aID].Tornados) then AM4_ReSetAEFFSPly(aID) end
	table.insert(AM4_ActiveEFFTS[aID].Tornados, Tbl)
	
    return AM4_ActiveEFFTS[aID].Tornados[#AM4_ActiveEFFTS[aID].Tornados]
end

function AM_CL_ClearTornados()
	for k, EMEFAC in pairs(AM4_ActiveEFFTS) do
		if istable(EMEFAC.Tornados) then
			AM4_ActiveEFFTS[k].Tornados = {}
		end
	end
end

local function RemoveTornadoEffect(id, instant)
    if TornadoEffects[id] then
        if instant then
            TornadoEffects[id] = nil else TornadoEffects[id].remove = true
        end
    end
end

local function RemoveAllTornadoEffects(instant)
    local count = table.Count(TornadoEffects)
    if instant then
        TornadoEffects = {}
    else
        for id, _ in pairs(TornadoEffects) do
            RemoveTornadoEffect(id, false)
        end
    end
    print(string.format("[Tornado] تم حذف %d تأثير", count))
end

-- تعديل إعدادات تأثير موجود
local function ModifyTornadoEffect(id, newData)
    if TornadoEffects[id] then
        for k, v in pairs(newData) do
            if TornadoEffects[id][k] ~= nil then
                TornadoEffects[id][k] = v
            end
        end
        return true
    end
    return false
end

local function GetActiveTornadoEffects()
    local list = {}
    for id, tornado in pairs(TornadoEffects) do
        table.insert(list, {
            id = id,
            ent = tornado.ent,
            height = tornado.height,
            lifetime = tornado.lifetime,
            elapsed = CurTime() - tornado.startTime
        })
    end
    return list
end




------------------------------------------------------------
------------------------------------------------------------
-- AM4_ActiveEFFTS.bLampEff = AM4_ActiveEFFTS.bLampEff or {}
function AM_CL_CreateLampEff(opts)
    opts = opts or {}
	local Ent = opts.ent
	if not IsValid(Ent) then return end

    local aID = AM_namT(ply,Ent)
    local id = UnPredictedCurTime() .. "_" .. math.random(1000, 9999)

    local eff = {
        id = id,
        ent = Ent,
        isDead = false,
        startTime = CurTime(),

        fadeIn = opts.fadeIn or 0.3,
        hold = opts.hold or -1,
        fadeOut = opts.fadeOut or 0.3,

        pos = opts.pos or Vector(0, 0, 0),
        eyeBPos = opts.eyeBPos or opts.pos + Vector(0, 0, 5),
        dir = (opts.dir or Vector(1, 0, 0)):GetNormalized(),
        length = opts.length or 250,

        color = opts.color or Color(255, 255, 255, 255),

        sprite = {
            enable = opts.spriteEnable ~= false,
            mat = isstring(opts.spriteMat) and Material(opts.spriteMat) or opts.spriteMat or Material("sprites/glow01"),
            size = opts.spriteSize or 32,
            color = opts.spriteColor,
        },

        beam = {
            enable = opts.beamEnable ~= false,
            aPUp = opts.aPUp or 0,
            mat = isstring(opts.beamMat) and Material(opts.beamMat) or opts.beamMat or Material("effects/lamp_beam"),
            startWidth = opts.beamStartWidth or 8,
            endWidth = opts.beamEndWidth or 48,
            color = opts.beamColor,

            fadeOnDirectLook = opts.fadeOnDirectLook or false,
            lookThreshold = opts.lookThreshold or 0.75,
        },

        dlight = {
            enable = opts.dlightEnable ~= false,
            pos = opts.dlightPos,
            radius = opts.dlightRadius or 300,
            brightness = opts.dlightBrightness or 2,
            decay = opts.dlightDecay or 1000,
            style = opts.dlightStyle or 0,
            noWorld = opts.dlightNoWorld or false,
            noModel = opts.dlightNoModel or false,
            olym = opts.olym or false,
            color = opts.dlightColor,
            dlightIndex = math.random(1, 32),
        }
    }

    function eff:Remove()
        self.isDead = true
        if AM4_ActiveEFFTS[aID] and istable(AM4_ActiveEFFTS[aID].bLampEff) and AM4_ActiveEFFTS[aID].bLampEff[self.id] then AM4_ActiveEFFTS[aID].bLampEff[self.id] = nil end
    end
    function eff:RemoveSprite() self.sprite.enable = false end
    function eff:RemoveBeam() self.beam.enable = false end
    function eff:RemoveDLight() self.dlight.enable = false end

    function eff:_UpdateAndDraw(curTime, eyePos)
        if self.isDead then return end

        local elapsed = curTime - self.startTime
        local alphaScale = 1.0

        if self.hold == -1 then
            if self.fadeIn > 0 and elapsed < self.fadeIn then
                alphaScale = elapsed / self.fadeIn
            else
                alphaScale = 1.0
            end
        else
            local totalTime = self.fadeIn + self.hold + self.fadeOut
            if elapsed >= totalTime then
                self:Remove()
                return
            end

            if elapsed < self.fadeIn then
                alphaScale = self.fadeIn > 0 and (elapsed / self.fadeIn) or 1.0
            elseif elapsed < (self.fadeIn + self.hold) then
                alphaScale = 1.0
            else
                local fadeElapsed = elapsed - (self.fadeIn + self.hold)
                alphaScale = self.fadeOut > 0 and (1.0 - (fadeElapsed / self.fadeOut)) or 0.0
            end
        end

        alphaScale = math.Clamp(alphaScale, 0, 1)

        if self.sprite.enable and self.sprite.mat then
            local sCol = self.sprite.color or self.color
            local finalAlpha = sCol.a * alphaScale
            if finalAlpha > 0 then
                render.SetMaterial(self.sprite.mat)
                render.DrawSprite(self.pos, self.sprite.size, self.sprite.size, Color(sCol.r, sCol.g, sCol.b, finalAlpha))
            end
        end

        if self.beam.enable and self.beam.mat then
            local bCol = self.beam.color or self.color
            local normalizedDir = self.dir:GetNormalized()
            local startPos = Vector(self.pos.x,self.pos.y,self.pos.z+self.beam.aPUp)
            local endPos = startPos + (normalizedDir * self.length)
            local lookFadeMult = 1.0
            if self.beam.fadeOnDirectLook then
                local eyeDir = ((eyePos or self.eyeBPos or self.pos) - startPos):GetNormalized()
                local dot = math.abs(eyeDir:Dot(normalizedDir))
                if dot > self.beam.lookThreshold then
                    lookFadeMult = 1.0 - math.Clamp((dot - self.beam.lookThreshold) / (1.0 - self.beam.lookThreshold), 0, 1)
                end
            end
            local finalBeamAlpha = (bCol.a * alphaScale)/6 --* lookFadeMult
            if finalBeamAlpha > 0 then
                render.SetMaterial(self.beam.mat)
                render.StartBeam(2)
                render.AddBeam(startPos, self.beam.startWidth, 0, Color(bCol.r, bCol.g, bCol.b, finalBeamAlpha))
                render.AddBeam(endPos, self.beam.endWidth, -1, Color(bCol.r, bCol.g, bCol.b, finalBeamAlpha/2))
                render.EndBeam()
            end
        end

        if self.dlight.enable then
            local dlCol = self.dlight.color or self.color
            local dlAlphaMult = (dlCol.a / 255) * alphaScale
            if dlAlphaMult > 0 then
                local dlight = DynamicLight(self.dlight.dlightIndex ,self.dlight.olym)
                if dlight then
                    dlight.pos = self.dlight.pos or self.pos
                    dlight.r = dlCol.r
                    dlight.g = dlCol.g
                    dlight.b = dlCol.b
                    dlight.brightness = self.dlight.brightness * dlAlphaMult
                    dlight.Size = self.dlight.radius
                    dlight.decay = self.dlight.decay
                    dlight.dietime = curTime + 0.1
                    dlight.style = self.dlight.style
                    dlight.noworld = self.dlight.noWorld
                    dlight.nomodel = self.dlight.noModel
                end
            end
        end
    end
    -- AM4_ActiveEFFTS.bLampEff[id] = eff
	if not AM4_ActiveEFFTS[aID] or not istable(AM4_ActiveEFFTS[aID].bLampEff) then AM4_ReSetAEFFSPly(aID) end
	table.insert(AM4_ActiveEFFTS[aID].bLampEff, eff)
    return eff
end

------------------------------------------------------------
------------------------------------------------------------

A_AM.ActMod.AM_AMeshLUp = A_AM.ActMod.AM_AMeshLUp or {}
local AMeshLUp = A_AM.ActMod.AM_AMeshLUp
AMeshLUp.Active = {}

local function RotaUV(u, v, degrees, scale, scroll, offset)
	local rad = math.rad(degrees)
	local cos, sin = math.cos(rad), math.sin(rad)
	local nu = (u - 0.5) * scale
	local nv = (v - 0.5) * scale + (scroll + offset)
	local ru = cos * nu - sin * nv + 0.5
	local rv = sin * nu + cos * nv + 0.5
	return ru, rv
end

function AMeshLUp.Add(id, config)
	local finalDir = config.direction or Vector(0, 0, 1)
	if config.ang and isangle(config.ang) then finalDir = config.ang:Forward() end
	AMeshLUp.Active[id] = {
		pos = config.pos or Vector(0, 0, 0),
		direction = finalDir,
		ang = config.ang or nil,
		width = config.width or 40,
		widthBottom = config.widthBottom or 0,
		height = config.height or 500,
		mat = config.mat or Material("effects/lamp_beam"),
		color = config.color or Color(255, 255, 255, 255),
		faceCamera = config.faceCamera or false,
		strup = config.strup or false,
		strwi = config.strwi or false,
		offset = config.offset or Vector(0, 0, 0),
		texRotation = config.texRotation or 0,
		texScroll = config.texScroll or 0,
		texScale = config.texScale or 1,
		texOffset = config.texOffset or 0,
		delay = config.delay or 0,
		growthTime = config.growthTime or 1,
		sustainTime = config.sustainTime or 2,
		shrinkTime = config.shrinkTime or 2,
		mode = config.mode or "static",
		moveSpeed = config.moveSpeed or 2,
		amplitude = config.amplitude or 50,
		startTime = CurTime()
	}
	local b = AMeshLUp.Active[id]
	b.endTime = b.startTime + b.delay + b.growthTime + b.sustainTime + b.shrinkTime
	return b
end

function AMeshLUp.Draw(data)
	local curTime = CurTime()
	local elapsed = curTime - data.startTime - data.delay
	if elapsed < 0 then return end
	local scaleHeight, scaleWidth, alphaScale = 0, 0, 1
	if elapsed < data.growthTime then
		scaleHeight = math.EaseInOut(elapsed / data.growthTime, 0.5, 0.5)
		scaleWidth = scaleHeight
	elseif elapsed < (data.growthTime + data.sustainTime) then
		scaleHeight, scaleWidth = 1, 1
	else
		local sProg = math.Clamp((elapsed - (data.growthTime + data.sustainTime)) / data.shrinkTime, 0, 1)
		scaleWidth = 1 - math.Clamp(sProg * 2, 0, 1)
		scaleHeight = 1 - math.Clamp((sProg - 0.5) * 2, 0, 1)
		alphaScale = 1 - sProg
	end
	if scaleHeight <= 0 and elapsed > data.growthTime then return end
	local beamDir = data.direction
	if data.ang then beamDir = data.ang:Forward() end
	local basePos,moveOffset = data.pos + data.offset,0
	if data.mode == "pingpong" then moveOffset = math.sin(curTime * data.moveSpeed) * data.amplitude end
	local topCenter = basePos + (beamDir * (data.height * scaleHeight * (data.strup and alphaScale or 1)))
	local moveVec = beamDir:Angle():Right() * (moveOffset * scaleHeight)
	topCenter = topCenter + moveVec
	local rightDir
	if data.faceCamera then
		local viewDir = (EyePos() - topCenter):GetNormalized()
		rightDir = beamDir:Cross(viewDir):GetNormalized()
	else
		rightDir = beamDir:Angle():Right()
	end
	local scroll,aaa = curTime * data.texScroll,data.strwi and scaleWidth or 1
	render.SetMaterial(data.mat)
	render.CullMode(MATERIAL_CULLMODE_NONE)
	if data.widthBottom > 0 then
		local p1 = basePos - (rightDir * (data.widthBottom * 0.5 * scaleWidth))
		local p2 = basePos + (rightDir * (data.widthBottom * 0.5 * scaleWidth))
		local p3 = topCenter + (rightDir * (data.width * 0.5 * aaa))
		local p4 = topCenter - (rightDir * (data.width * 0.5 * aaa))
		local u1, v1 = RotaUV(0, 1, data.texRotation, data.texScale, scroll, data.texOffset)
		local u2, v2 = RotaUV(1, 1, data.texRotation, data.texScale, scroll, data.texOffset)
		local u3, v3 = RotaUV(1, 0, data.texRotation, data.texScale, scroll, data.texOffset)
		local u4, v4 = RotaUV(0, 0, data.texRotation, data.texScale, scroll, data.texOffset)
		mesh.Begin(MATERIAL_QUADS, 1)
			mesh.Position(p1) mesh.Color(data.color.r,data.color.g,data.color.b,data.color.a * alphaScale) mesh.TexCoord(0,u1,v1) mesh.AdvanceVertex()
			mesh.Position(p2) mesh.Color(data.color.r,data.color.g,data.color.b,data.color.a * alphaScale) mesh.TexCoord(0,u2,v2) mesh.AdvanceVertex()
			mesh.Position(p3) mesh.Color(data.color.r,data.color.g,data.color.b,data.color.a * alphaScale) mesh.TexCoord(0,u3,v3) mesh.AdvanceVertex()
			mesh.Position(p4) mesh.Color(data.color.r,data.color.g,data.color.b,data.color.a * alphaScale) mesh.TexCoord(0,u4,v4) mesh.AdvanceVertex()
		mesh.End()
	else
		local p1 = basePos
		local p2 = topCenter - (rightDir * (data.width * 0.5 * aaa))
		local p3 = topCenter + (rightDir * (data.width * 0.5 * aaa))
		local u1, v1 = RotaUV(0.5,1,data.texRotation, data.texScale, scroll, data.texOffset)
		local u2, v2 = RotaUV(0,0,data.texRotation, data.texScale, scroll, data.texOffset)
		local u3, v3 = RotaUV(1,0,data.texRotation, data.texScale, scroll, data.texOffset)
		mesh.Begin(MATERIAL_TRIANGLES, 1)
			mesh.Position(p1) mesh.Color(data.color.r,data.color.g,data.color.b,data.color.a * alphaScale) mesh.TexCoord(0, u1, v1) mesh.AdvanceVertex()
			mesh.Position(p2) mesh.Color(data.color.r,data.color.g,data.color.b,data.color.a * alphaScale) mesh.TexCoord(0, u2, v2) mesh.AdvanceVertex()
			mesh.Position(p3) mesh.Color(data.color.r,data.color.g,data.color.b,data.color.a * alphaScale) mesh.TexCoord(0,u3,v3) mesh.AdvanceVertex()
		mesh.End()
	end
	render.CullMode(MATERIAL_CULLMODE_CCW)
end



hook.Add("PostDrawTranslucentRenderables", "AM4EFFTSSystem_Draw", function(depth, skybox)
    local ct = CurTime()
    
	for k, EMEFAC in pairs(AM4_ActiveEFFTS) do
		if istable(EMEFAC.Imag3D) and not skybox then
			render.SetWriteDepthToDestAlpha(false)
			render.OverrideDepthEnable(true, false)
			for i, img in ipairs(EMEFAC.Imag3D) do
				if not IsValid(img.ply) or (img.ply == LocalPlayer() or LocalPlayer():trueShowMld(img.ply)) then
					DrawImage(img)
				end
			end
			render.OverrideDepthEnable(false, false)
		end
		if istable(EMEFAC.Trails) then
			for _, trail in ipairs(EMEFAC.Trails) do
				local head,pts = trail.pointHead,trail.points	 
				if (#pts - head + 1) < 2 or IsValid(trail.Ply) and trail.Ply ~= LocalPlayer() and not LocalPlayer():trueShowMld(trail.Ply) then continue end
				render.SetMaterial(trail.Material)
				local holdTime = trail.holdTime
				local maxAlpha = trail._maxAlpha
				local lifetimeInv = trail._lifetimeInv
				local drawColor = trail._drawColor
				local trailWidth = trail.width
				if trail.Nobreak then
					local liveCount = #pts - head + 1
					render.StartBeam(liveCount)
					for i = head, #pts do
						local p = pts[i]
						if not p then continue end
						local age = ct - p.time
						local alpha
						if age <= holdTime then
							alpha = maxAlpha
						else
							local fadeAge = age - holdTime
							alpha = maxAlpha * (1 - fadeAge * lifetimeInv)
							if alpha <= 0 then alpha = 0 end
							if alpha > maxAlpha then alpha = maxAlpha end
						end
						drawColor.a = alpha
						local u = (i - head) / math.max(1, liveCount - 1)
						render.AddBeam(p.pos, trailWidth, u, drawColor)
					end
					render.EndBeam()
				else
					for i = head, #pts - 1 do
						local p1,p2 = pts[i],pts[i + 1]
						if not p1 or not p2 then continue end
						local age1 = ct - p1.time
						local alpha1
						if age1 <= holdTime then
							alpha1 = maxAlpha
						else
							local fadeAge = age1 - holdTime
							alpha1 = maxAlpha * (1 - fadeAge * lifetimeInv)
							if alpha1 <= 0 then continue end
							if alpha1 > maxAlpha then alpha1 = maxAlpha end
						end
						drawColor.a = alpha1
						render.DrawBeam(p1.pos, p2.pos, trailWidth, 0, 1, drawColor)
					end
				end
			end
		end
		if istable(EMEFAC.Tornados) then
			for id, t in pairs(EMEFAC.Tornados) do
				if IsValid(t.ply) and t.ply ~= LocalPlayer() and not LocalPlayer():trueShowMld(t.ply) then continue end
				local elapsed = ct - t.startTime
				local growProgress = 1
				if t.enableGrow then
					growProgress = math.Clamp(elapsed * t.growSpeed, 0, 1)
					growProgress = SmoothStep(growProgress)
				end
				t._growProgress = growProgress
				local pos = t.offset
				if IsValid(t.entity) then
					local tpos = Vector()
					if t.boneID then
						local boneMatrix = t.entity:GetBoneMatrix(t.boneID)
						if boneMatrix then
							pos = boneMatrix:GetTranslation()
						else
							local ttpos = t.entity:GetBonePosition(t.boneID)
							if ttpos then pos = ttpos end
						end
						if tpos then tpos = ttpos end
					else
						tpos = t.entity:GetPos()
					end
					pos = tpos + pos
				end
				
				render.SetMaterial(t.material)
				local direction = t.reverse and -1 or 1
				local segments = t.turns * 20
				render.StartBeam(segments + 1)
				local beamPointCount = 0
				for i = 0, segments do
					local progress = i / segments
					local visibleProgress = progress
					if t.growDirection == "down" then
						visibleProgress = 1 - progress
					end
					
					if visibleProgress > growProgress then break end
					local height = progress * t.height

					local radius
					if progress < t.curveHeight then
						radius = Lerp(progress / t.curveHeight, t.bottomRadius, t.middleRadius)
					else
						radius = Lerp((progress - t.curveHeight) / (1 - t.curveHeight), t.middleRadius, t.topRadius)
					end
					
					local theta = (progress * 360 * t.turns * direction + ct * t.speed * 200) * math.pi / 180
					local wave = math.sin(ct * t.waveSpeed + progress * math.pi * 2) * t.waveIntensity
					local offset = Vector(
						math.cos(theta) * (radius + wave),
						math.sin(theta) * (radius + wave),
						height
					)
					
					local pointFade = 1
					if t.enableGrow and growProgress < 1 then
						local distanceFromEdge = growProgress - visibleProgress
						local fadeZone = 0.1
						if distanceFromEdge < fadeZone then
							pointFade = distanceFromEdge / fadeZone
							pointFade = SmoothStep(pointFade)
						end
					end
					
					local edgeFade = 1
					if progress < 0.05 then
						edgeFade = progress / 0.05
					elseif progress > 0.95 then
						edgeFade = (1 - progress) / 0.05
					end
					edgeFade = SmoothStep(edgeFade)
					
					local col = LerpColor(progress, t.color, Color(255, 255, 255, 0))
					col.a = col.a * t._globalFade * pointFade * edgeFade
					col.a = math.max(0, col.a)
					
					render.AddBeam(pos + offset, t.width, progress, col)
					beamPointCount = beamPointCount + 1
				end
				
				render.EndBeam()
			end
		end
		for id, eff in pairs(EMEFAC.bLampEff) do
			if not eff or eff.isDead then
				EMEFAC.bLampEff[id] = nil
			else
				eff:_UpdateAndDraw(ct)
			end
		end
    end
    for id, data in pairs(AMeshLUp.Active) do
        if ct > data.endTime then AMeshLUp.Active[id] = nil continue end
        AMeshLUp.Draw(data)
    end
end)



local function aRemoveBEFFS(ply)
	if IsValid(ply) then
		local aID = "__mdl_".. tostring(ply:EntIndex{})
		if ply:IsPlayer() then aID = tostring(ply:SteamID64{} .. ply:Nick{}) end
		if istable(AM4_ActiveEFFTS) and AM4_ActiveEFFTS[aID] then
			if istable(AM4_ActiveEFFTS[aID].Trails) then AM4_ActiveEFFTS[aID].Trails = {} end
			if istable(AM4_ActiveEFFTS[aID].Imag3D) then AM4_ActiveEFFTS[aID].Imag3D = {} end
			if istable(AM4_ActiveEFFTS[aID].Tornados) then AM4_ActiveEFFTS[aID].Tornados = {} end
			if istable(AM4_ActiveEFFTS[aID].bLampEff) then AM4_ActiveEFFTS[aID].bLampEff = {} end
		end
		if istable(A_AM.ActMod.AM_AMeshLUp) and A_AM.ActMod.AM_AMeshLUp.Active then
			for i = 1,75 do A_AM.ActMod.AM_AMeshLUp.Active[aID .. "_PBeam_" .. i] = nil end
		end
	end
end

hook.Add("ActMod_RunStopAct", "tv1tEffects", function(ply) aRemoveBEFFS(ply) end)
hook.Add("ActMod_cl_RunaPlyEmot", "tv1tEffects", function(ply,atXt,tst) aRemoveBEFFS(ply) end)


