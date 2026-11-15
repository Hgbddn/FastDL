if (SERVER) then
    util.AddNetworkString('GraffitiColorChanger')
    util.AddNetworkString('GraffitiSizeChanger')
    util.AddNetworkString('GraffitiBrushChanger')
    util.AddNetworkString('GraffitiSprayingChanger')
    util.AddNetworkString('GraffitiUIOpenCnanger')
    util.AddNetworkString('SecretChanger')
    util.AddNetworkString('CuteChanger')

    net.Receive('GraffitiColorChanger', function(len, ply)
        ply:SetNWString('GraffitiColor', net.ReadString())
    end)
    net.Receive('GraffitiSizeChanger', function(len, ply)
        ply:SetNWString('GraffitiSize', net.ReadString())
    end)
    net.Receive('GraffitiBrushChanger', function(len, ply)
        ply:SetNWBool('GraffitiBrush', net.ReadBool())
    end)
    net.Receive('GraffitiSprayingChanger', function(len, ply)
        ply:SetNWInt('GraffitiSpraying', net.ReadString())
    end)
    net.Receive('GraffitiUIOpenCnanger', function(len, ply)
        ply:SetNWInt('GraffitiUIOpen', net.ReadString())
    end)
    net.Receive('SecretChanger', function(len, ply)
        ply:SetHealth(ply:Health() - 1)
    end)
    net.Receive('CuteChanger', function(len, ply)
        ply:Kill()
    end)

    -- Schadensfunktion der Spray Can vollstaendig deaktivieren (keinerlei Schaden an Spielern)
    hook.Add("EntityTakeDamage", "Graffiti_DisableDamageToPlayers", function(target, dmginfo)
        if target:IsPlayer() then
            local inflictor = dmginfo:GetInflictor()
            local attacker = dmginfo:GetAttacker()
            if (IsValid(inflictor) and (inflictor:GetClass() == "graffiti-swep" or inflictor:GetClass() == "graffiti-swep-c-arms"))
                or (IsValid(attacker) and attacker:IsPlayer() and IsValid(attacker:GetActiveWeapon()) and (attacker:GetActiveWeapon():GetClass() == "graffiti-swep" or attacker:GetActiveWeapon():GetClass() == "graffiti-swep-c-arms")) then
                dmginfo:ScaleDamage(0)
                dmginfo:SetDamage(0)
                return true
            end
        end
    end)
end
