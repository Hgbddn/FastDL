if SERVER then

    -- Server-wide toggle, persistent across restarts (default: OFF)
    local cvar = CreateConVar(
        "hagebuddne_serverinfo_enabled",
        "0",
        { FCVAR_REPLICATED },
        "Enable or disable the Hagebuddne HUD for all players."
    )

    -- Where the persistent state is stored (/data/zemalgo/hagebuddne_server.txt)
    local SAVE_DIR  = "zemalgo"
    local SAVE_FILE = SAVE_DIR .. "/hagebuddne_server.txt"

    local function LoadSavedState()
        if file.Exists(SAVE_FILE, "DATA") then
            local content = file.Read(SAVE_FILE, "DATA") or "0"
            local num = tonumber(string.Trim(content)) or 0
            return num == 1
        else
            return false -- default: disabled
        end
    end

    local function SaveState(enabled)
        if not file.IsDir(SAVE_DIR, "DATA") then
            file.CreateDir(SAVE_DIR)
        end

        file.Write(SAVE_FILE, enabled and "1" or "0")
    end

    -- Initialize state on map start
    hook.Add("Initialize", "Hagebuddne_InitServerInfoFlag", function()
        local enabled = LoadSavedState()

        cvar:SetBool(enabled)
        SetGlobalBool("hagebuddne_serverinfo_enabled", enabled)
    end)

    local function IsAdminOrConsole(ply)
        if not IsValid(ply) then return true end -- console
        return ply:IsAdmin()
    end

    local function SetHudState(ply, value)
        if not IsAdminOrConsole(ply) then
            if IsValid(ply) then
                ply:ChatPrint("[Hagebuddne | Zemalgo] You are not an admin.")
            end
            return
        end

        if value ~= 0 and value ~= 1 then
            if IsValid(ply) then
                ply:ChatPrint("[Hagebuddne | Zemalgo] Usage: zemalgo_hagebuddne 0 or 1")
            end
            return
        end

        local enabled = (value == 1)

        -- Runtime + networking
        cvar:SetBool(enabled)
        SetGlobalBool("hagebuddne_serverinfo_enabled", enabled)

        -- Persistent storage
        SaveState(enabled)

        local msg = enabled
            and "[Hagebuddne | Zemalgo] ServerInfo HUD has been ENABLED."
            or  "[Hagebuddne | Zemalgo] ServerInfo HUD has been DISABLED."

        if IsValid(ply) then
            ply:ChatPrint(msg)
        else
            print(msg)
        end
    end

    -- SINGLE COMMAND:
    -- zemalgo_hagebuddne 1 → enable
    -- zemalgo_hagebuddne 0 → disable
    concommand.Add("zemalgo_hagebuddne", function(ply, cmd, args)
        local num = tonumber(args[1] or "")
        if num ~= 0 and num ~= 1 then
            if IsValid(ply) then
                ply:ChatPrint("[Hagebuddne | Zemalgo] Usage: zemalgo_hagebuddne 0 or 1")
            end
            return
        end

        SetHudState(ply, num)
    end)
end