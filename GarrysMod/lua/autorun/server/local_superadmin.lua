-- ========================================================
-- Automatischer Superadmin für den lokalen Host (127.0.0.1)
-- ========================================================
-- Gibt dir automatisch Superadmin-Rechte (für das TTT2 F1-Menü),
-- sobald du vom selben PC aus (connect localhost / LAN) beitrittst.

hook.Add("PlayerInitialSpawn", "TTT2_LocalHostAutoSuperAdmin", function(ply)
    if not IsValid(ply) or ply:IsBot() then return end

    local ip = ply:IPAddress() or ""
    if string.StartWith(ip, "127.0.0.1") or string.StartWith(ip, "loopback") then
        ply:SetUserGroup("superadmin")
        print("[TTT2-Server] Lokaler Host erkannt (" .. ply:Nick() .. ") -> Superadmin-Rechte vergeben!")
    end
end)
