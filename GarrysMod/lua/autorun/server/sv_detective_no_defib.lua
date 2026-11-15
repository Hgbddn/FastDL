-- ========================================================
-- Defibrillator für Detectives sperren (Shop + Aufheben/Nutzung)
-- ========================================================
if not SERVER then return end

local function IsDefibClass(cls)
    if not isstring(cls) then return false end
    return string.find(string.lower(cls), "defib", 1, true) ~= nil
end

local function StripDetectiveDefib()
    -- 1. Aus den Waffen-/Item-Tabellen entfernen
    if weapons and weapons.GetList then
        for _, wep in ipairs(weapons.GetList()) do
            local cls = wep and (wep.ClassName or wep.Classname)
            if IsDefibClass(cls) and istable(wep.CanBuy) and ROLE_DETECTIVE then
                table.RemoveByValue(wep.CanBuy, ROLE_DETECTIVE)
            end
        end
    end

    -- 2. Aus der TTT2 ShopEditor-Datenbank für Detectives entfernen
    if sql and sql.TableExists and sql.TableExists("ttt2_shop_detective") then
        sql.Query("DELETE FROM ttt2_shop_detective WHERE LOWER(name) LIKE '%defib%'")
    end

    -- 3. Falls bereits im Shop-Cache geladen, über ShopEditor/roles aktualisieren
    if ShopEditor and ShopEditor.ReadItemData then
        -- ShopEditor liest beim Runden-/Mapstart aus SQLite; DELETE oben greift direkt
    end
end

hook.Add("TTT2Loaded", "ZM_NoDetectiveDefib_Loaded", StripDetectiveDefib)
hook.Add("InitPostEntity", "ZM_NoDetectiveDefib_Init", StripDetectiveDefib)

hook.Add("TTT2CanOrderEquipment", "ZM_NoDetectiveDefib_CanOrder", function(ply, cls)
    if not IsValid(ply) or not IsDefibClass(cls) then return end
    if (ply.GetBaseRole and ply:GetBaseRole() == ROLE_DETECTIVE) or (ply.GetSubRole and ply:GetSubRole() == ROLE_DETECTIVE) then
        return false
    end
end)

hook.Add("PlayerCanPickupWeapon", "ZM_NoDetectiveDefib_Pickup", function(ply, wep)
    if not IsValid(ply) or not IsValid(wep) then return end
    if not IsDefibClass(wep:GetClass()) then return end
    if (ply.GetBaseRole and ply:GetBaseRole() == ROLE_DETECTIVE) or (ply.GetSubRole and ply:GetSubRole() == ROLE_DETECTIVE) then
        return false
    end
end)
