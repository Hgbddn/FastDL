if SERVER then return end

A_AM = A_AM or {}
A_AM.ActMod = A_AM.ActMod or {}
A_AM.ActMod.aTabFncs = A_AM.ActMod.aTabFncs or {}
A_AM.ActMod.aTabFncs.AMesh = function(ent, boneName, offset, shapeType, shapeData, planeDir, uvTransform, material, color)
    if not IsValid(ent) then return end
    color = color or Color(255, 255, 255, 255)
    offset = offset or Vector(0, 0, 0)
    shapeData = shapeData or {}
    uvTransform = uvTransform or {}
    local uvOffsetX = uvTransform.offsetX or 0
    local uvOffsetY = uvTransform.offsetY or 0
    local uvRotation = uvTransform.rotation or 0
    local uvScaleX = uvTransform.scaleX or 1
    local uvScaleY = uvTransform.scaleY or 1
    local uvScrollSpeedX = uvTransform.scrollSpeedX or 0
    local uvScrollSpeedY = uvTransform.scrollSpeedY or 0
    local uvCenterX = uvTransform.centerX or 0.5
    local uvCenterY = uvTransform.centerY or 0.5
    local scrollX = uvOffsetX + (CurTime() * uvScrollSpeedX)
    local scrollY = uvOffsetY + (CurTime() * uvScrollSpeedY)
    local function TransformUV(u, v)
        local tu = u - uvCenterX
        local tv = v - uvCenterY
        tu = tu * uvScaleX
        tv = tv * uvScaleY
        if uvRotation ~= 0 then
            local rad = math.rad(uvRotation)
            local cos = math.cos(rad)
            local sin = math.sin(rad)
            local newU = tu * cos - tv * sin
            local newV = tu * sin + tv * cos
            tu = newU
            tv = newV
        end
        tu = tu + uvCenterX + scrollX
        tv = tv + uvCenterY + scrollY
        return tu, tv
    end
    
    local boneID = ent:LookupBone(boneName)
    if not boneID then return end
    local boneMatrix = ent:GetBoneMatrix(boneID)
    if not boneMatrix then return end
    local bonePos = boneMatrix:GetTranslation()
    local boneAng = boneMatrix:GetAngles()
    local axisX, axisY, axisZ
    if type(planeDir) == "table" then
        axisX = planeDir.forward or boneAng:Forward()
        axisY = planeDir.right or boneAng:Right()
        axisZ = planeDir.up or boneAng:Up()
    elseif planeDir == "xy" then
        axisX = boneAng:Forward() axisY = boneAng:Right() axisZ = boneAng:Up()
    elseif planeDir == "xz" then
        axisX = boneAng:Forward() axisY = boneAng:Up() axisZ = boneAng:Right()
    elseif planeDir == "yz" then
        axisX = boneAng:Right() axisY = boneAng:Up() axisZ = boneAng:Forward()
    else
        axisX = boneAng:Forward() axisY = boneAng:Right() axisZ = boneAng:Up()
    end
    
    local centerPos = bonePos + boneAng:Forward() * offset.x + boneAng:Right() * offset.y + boneAng:Up() * offset.z
    local vertices = {}
    if shapeType == "arc" then
        local radius = shapeData.radius or 10
        local innerRadius = shapeData.innerRadius or 0
        local arcAngle = shapeData.arcAngle or 90
        local startAngle = shapeData.startAngle or 0
        local segments = shapeData.segments or 20
        local fadeOut = shapeData.fadeOut or false
        local fadeInner = shapeData.fadeInner or false
        local angleStep = arcAngle / segments
        for i = 0, segments do
            local progress = i / segments
            local angle = math.rad(startAngle + angleStep * i)
            local cos, sin = math.cos(angle), math.sin(angle)
            local innerX = cos * innerRadius
            local innerY = sin * innerRadius
            local innerPos = centerPos + axisX * innerX + axisY * innerY
            local outerX = cos * radius
            local outerY = sin * radius
            local outerPos = centerPos + axisX * outerX + axisY * outerY
            local innerAlpha = color.a
            local outerAlpha = color.a
            if fadeOut then outerAlpha = Lerp(progress, color.a, 0) end
            if fadeInner then innerAlpha = Lerp(progress, color.a, 0) end
            local u = progress
            table.insert(vertices, { pos = innerPos,u = u,v = 0,color = Color(color.r, color.g, color.b, innerAlpha) } )
            table.insert(vertices, { pos = outerPos,u = u,v = 1,color = Color(color.r, color.g, color.b, outerAlpha) } )
        end
        
    elseif shapeType == "rectangle" then
        local width = shapeData.width or 10
        local height = shapeData.height or 10
        local pivotX = shapeData.pivotX or 0.5
        local pivotY = shapeData.pivotY or 0.5
        local x1 = -width * pivotX
        local x2 = width * (1 - pivotX)
        local y1 = -height * pivotY
        local y2 = height * (1 - pivotY)
        table.insert(vertices, {pos = centerPos + axisX * x1 + axisY * y1, u = 0, v = 0, color = color})
        table.insert(vertices, {pos = centerPos + axisX * x2 + axisY * y1, u = 1, v = 0, color = color})
        table.insert(vertices, {pos = centerPos + axisX * x2 + axisY * y2, u = 1, v = 1, color = color})
        table.insert(vertices, {pos = centerPos + axisX * x1 + axisY * y2, u = 0, v = 1, color = color})
    elseif shapeType == "triangle" then
        local size = shapeData.size or 10
        local p1 = shapeData.p1 or Vector(0, size, 0)
        local p2 = shapeData.p2 or Vector(-size * 0.866, -size * 0.5, 0)
        local p3 = shapeData.p3 or Vector(size * 0.866, -size * 0.5, 0)
        table.insert(vertices, { pos = centerPos + axisX * p1.x + axisY * p1.y + axisZ * p1.z ,u = 0.5, v = 0, color = color })
        table.insert(vertices, { pos = centerPos + axisX * p2.x + axisY * p2.y + axisZ * p2.z ,u = 0, v = 1, color = color })
        table.insert(vertices, { pos = centerPos + axisX * p3.x + axisY * p3.y + axisZ * p3.z ,u = 1, v = 1, color = color })
    elseif shapeType == "custom" then
        local points = shapeData.points or {}
        for i, point in ipairs(points) do
            local pos = centerPos + axisX * point.x + axisY * point.y + (axisZ * (point.z or 0))
            table.insert(vertices, {
                pos = pos,
                u = point.u or 0,
                v = point.v or 0,
                color = point.color or color
            })
        end
    end
    if #vertices > 0 then
        render.SetMaterial(material)
        mesh.Begin(MATERIAL_TRIANGLES, math.floor(#vertices / 3))
        if shapeType == "arc" then
            for i = 1, #vertices - 2, 2 do
                local v1 = vertices[i]
                local v2 = vertices[i + 1]
                local v3 = vertices[i + 2]
                local v4 = vertices[i + 3]
                if v4 then
                    local u1, v1_uv = TransformUV(v1.u, v1.v)
                    local u2, v2_uv = TransformUV(v2.u, v2.v)
                    local u3, v3_uv = TransformUV(v3.u, v3.v)
                    local u4, v4_uv = TransformUV(v4.u, v4.v)
                    mesh.Position(v1.pos) mesh.TexCoord(0, u1, v1_uv) mesh.Color(v1.color.r, v1.color.g, v1.color.b, v1.color.a) mesh.AdvanceVertex()
                    mesh.Position(v2.pos) mesh.TexCoord(0, u2, v2_uv) mesh.Color(v2.color.r, v2.color.g, v2.color.b, v2.color.a) mesh.AdvanceVertex()
                    mesh.Position(v3.pos) mesh.TexCoord(0, u3, v3_uv) mesh.Color(v3.color.r, v3.color.g, v3.color.b, v3.color.a) mesh.AdvanceVertex()
                    mesh.Position(v2.pos) mesh.TexCoord(0, u2, v2_uv) mesh.Color(v2.color.r, v2.color.g, v2.color.b, v2.color.a) mesh.AdvanceVertex()
                    mesh.Position(v4.pos) mesh.TexCoord(0, u4, v4_uv) mesh.Color(v4.color.r, v4.color.g, v4.color.b, v4.color.a) mesh.AdvanceVertex()
                    mesh.Position(v3.pos) mesh.TexCoord(0, u3, v3_uv) mesh.Color(v3.color.r, v3.color.g, v3.color.b, v3.color.a) mesh.AdvanceVertex()
                end
            end
        elseif shapeType == "rectangle" then
            local u1, v1_uv = TransformUV(vertices[1].u, vertices[1].v)
            local u2, v2_uv = TransformUV(vertices[2].u, vertices[2].v)
            local u3, v3_uv = TransformUV(vertices[3].u, vertices[3].v)
            local u4, v4_uv = TransformUV(vertices[4].u, vertices[4].v)
            mesh.Position(vertices[1].pos) mesh.TexCoord(0, u1, v1_uv) mesh.Color(color.r, color.g, color.b, color.a) mesh.AdvanceVertex()
            mesh.Position(vertices[2].pos) mesh.TexCoord(0, u2, v2_uv) mesh.Color(color.r, color.g, color.b, color.a) mesh.AdvanceVertex()
            mesh.Position(vertices[3].pos) mesh.TexCoord(0, u3, v3_uv) mesh.Color(color.r, color.g, color.b, color.a) mesh.AdvanceVertex()
            mesh.Position(vertices[1].pos) mesh.TexCoord(0, u1, v1_uv) mesh.Color(color.r, color.g, color.b, color.a) mesh.AdvanceVertex()
            mesh.Position(vertices[3].pos) mesh.TexCoord(0, u3, v3_uv) mesh.Color(color.r, color.g, color.b, color.a) mesh.AdvanceVertex()
            mesh.Position(vertices[4].pos) mesh.TexCoord(0, u4, v4_uv) mesh.Color(color.r, color.g, color.b, color.a) mesh.AdvanceVertex()
        elseif shapeType == "triangle" then
            for i = 1, 3 do
                local v = vertices[i]
                local u_trans, v_trans = TransformUV(v.u, v.v)
                mesh.Position(v.pos)
                mesh.TexCoord(0, u_trans, v_trans)
                mesh.Color(v.color.r, v.color.g, v.color.b, v.color.a)
                mesh.AdvanceVertex()
            end
        elseif shapeType == "custom" then
            for i = 1, #vertices, 3 do
                for j = 0, 2 do
                    local v = vertices[i + j]
                    if v then
                        local u_trans, v_trans = TransformUV(v.u, v.v)
                        mesh.Position(v.pos)
                        mesh.TexCoord(0, u_trans, v_trans)
                        mesh.Color(v.color.r, v.color.g, v.color.b, v.color.a)
                        mesh.AdvanceVertex()
                    end
                end
            end
        end
        mesh.End()
    end
end
