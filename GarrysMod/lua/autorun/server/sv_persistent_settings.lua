-- ========================================================
-- Vollständige Server-Persistenz für ConVars & Karma
-- ========================================================
-- 1. Überwacht automatisch ALLE über CreateConVar erstellten Server-ConVars
--    (inkl. ttt_*, ttt2_*, actmod_sv_*, sv_playermodel_selector_* usw.)
--    sowie alle Änderungen über das F1-Admin-Menü, den Shop-/Rollen-Editor,
--    ULX (!menu) UND direkte Eingaben in der Server-Konsole!
-- 2. Nutzt ConVar:SetString() statt RunConsoleCommand beim Laden, damit
--    alle gespeicherten Werte sofort synchron und ohne Rate-Limit gesetzt werden.
-- 3. Speichert das Spieler-Karma zusätzlich nach jeder Runde und beim Disconnect
--    in "garrysmod/data/ttt2_persistent_karma.json", damit Karma auch auf einem
--    lokalen Server ohne GSLT-Token über Neustarts hinweg erhalten bleibt.

if not SERVER then return end

local DATA_FILE = "ttt2_persistent_cvars.json"
local KARMA_FILE = "ttt2_persistent_karma.json"
local savedCvars = {}
local savedKarma = {}
local isApplyingSavedCvars = false
local registeredCallbacks = {}

-- Interne System-ConVars, die nicht überschrieben werden sollen
local ignoredCvars = {
    ["hostname"] = true,
    ["rcon_password"] = true,
    ["sv_loadingurl"] = true,
    ["sv_downloadurl"] = true,
    ["sv_timeout"] = true,
    ["sv_max_queries_sec"] = true,
    ["sv_max_queries_window"] = true,
    ["sv_max_queries_sec_global"] = true,
    ["net_maxroutable"] = true,
    ["net_splitpacket_maxrate"] = true,
    ["net_maxcleartime"] = true,
    ["sv_minrate"] = true,
    ["sv_maxrate"] = true,
    ["sv_minupdaterate"] = true,
    ["sv_maxupdaterate"] = true,
    ["sv_mincmdrate"] = true,
    ["sv_maxcmdrate"] = true,
    ["gamemode"] = true,
    ["mp_friendlyfire"] = true,
    ["sv_alltalk"] = true,
    ["sv_crazyphysics_defuse"] = true,
    ["sv_crazyphysics_remove"] = true,
    ["sv_crazyphysics_warning"] = true,
    ["sv_skyname"] = true,
    ["think_limit"] = true,
    ["ulx"] = true,
    ["ulx_motdurl"] = true,
    ["ulx_showMotd"] = true,
    ["xgui"] = true,
}

if not ConVarExists("mp_friendlyfire") then
    CreateConVar("mp_friendlyfire", "1", { FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Legacy HL2/CS:S friendly fire cvar")
end

local function SavePersistentCvarsToDisk()
    file.Write(DATA_FILE, util.TableToJSON(savedCvars, true))
end

local function TrackConVar(cvarName)
    if not isstring(cvarName) then return end
    cvarName = string.Trim(cvarName)
    if cvarName == "" or ignoredCvars[cvarName] or registeredCallbacks[cvarName] then
        return
    end

    registeredCallbacks[cvarName] = true

    cvars.AddChangeCallback(cvarName, function(name, oldVal, newVal)
        if isApplyingSavedCvars then return end
        if tostring(oldVal) == tostring(newVal) then return end

        if name == "ttt_session_limits_mode" and tostring(newVal) == "0" then
            local tb = debug.traceback("", 2)
            MsgN("[TTT2 Persistent Settings] ttt_session_limits_mode wurde auf 0 geaendert! Quelle:\n" .. tb)
            local lowerTb = string.lower(tb)
            local isAdminAction = string.find(lowerTb, "ttt2_sync_cvar", 1, true)
                or string.find(lowerTb, "ulx", 1, true)
                or string.find(lowerTb, "xgui", 1, true)
            if not isAdminAction then
                local wanted = savedCvars[name] or "1"
                if tostring(wanted) ~= "0" then
                    timer.Simple(0, function()
                        local cv = GetConVar(name)
                        if cv and cv:GetString() ~= tostring(wanted) then
                            isApplyingSavedCvars = true
                            cv:SetString(tostring(wanted))
                            isApplyingSavedCvars = false
                        end
                    end)
                    return
                end
            end
        end

        savedCvars[name] = tostring(newVal)
        SavePersistentCvarsToDisk()
    end, "TTT2PersistentSettingsCallback")
end

-- Alle von Addons/Gamemode über CreateConVar registrierten ConVars automatisch überwachen
local origCreateConVar = _G.CreateConVar
_G.CreateConVar = function(name, default, flags, helptext, min, max)
    if name == "ttt_session_limits_mode" and flags ~= nil then
        if isnumber(flags) then
            flags = bit.band(flags, bit.bnot(FCVAR_NOTIFY))
        elseif istable(flags) then
            local cleanFlags = {}
            for _, f in ipairs(flags) do
                if f ~= FCVAR_NOTIFY then
                    cleanFlags[#cleanFlags + 1] = f
                end
            end
            flags = cleanFlags
        end
    end
    local cv = origCreateConVar(name, default, flags, helptext, min, max)
    if isstring(name) then
        TrackConVar(name)
        -- Falls bereits ein gespeicherter Wert existiert, sofort anwenden
        if savedCvars[name] ~= nil and not ignoredCvars[name] and cv then
            isApplyingSavedCvars = true
            cv:SetString(tostring(savedCvars[name]))
            isApplyingSavedCvars = false
        end
    end
    return cv
end

-- Zusätzlich bekannte ActMod- und TTT2-ConVars registrieren, falls sie vor diesem Skript erstellt wurden
local extraConVarsToTrack = {
    "actmod_sv_enabled",
    "actmod_sv_a_move",
    "actmod_sv_a_crouching",
    "actmod_sv_a_ground",
    "actmod_sv_a_vehicles",
    "actmod_sv_a_weapact",
    "actmod_sv_enabled_addef",
    "actmod_sv_enabled_addso",
    "actmod_sv_avs",
    "actmod_sv_soundlevel",
    "actmod_sv_syrhook",
    "actmod_sv_typmovecl",
    "actmod_sv_alowangcl",
    "actmod_sv_alowdsyn",
    "actmod_sv_showhisyn",
    "actmod_sv_ondcklpos",
    "actmod_sv_alowacop",
    "actmod_sv_rangecam",
    "actmod_sv_syflex",
    "actmod_sv_shofcl",
    "ttt_session_limits_mode",
    "ttt_time_limit_minutes",
    "ttt_round_limit",
    "ttt_roundtime_minutes",
    "ttt_preptime_seconds",
    "ttt_firstpreptime",
}

local origRunConsoleCommand = _G.RunConsoleCommand

local function LoadAndApplyPersistentCvars()
    if file.Exists(DATA_FILE, "DATA") then
        local content = file.Read(DATA_FILE, "DATA")
        local decoded = content and util.JSONToTable(content)
        if istable(decoded) then
            savedCvars = decoded
        end
    end

    for _, cvName in ipairs(extraConVarsToTrack) do
        if ConVarExists(cvName) then
            TrackConVar(cvName)
        end
    end

    if KARMA and istable(KARMA.cv) then
        for _, cvObj in pairs(KARMA.cv) do
            if cvObj and cvObj.GetName then
                TrackConVar(cvObj:GetName())
            end
        end
    end

    if ShopEditor and istable(ShopEditor.cvars) then
        for cvName, _ in pairs(ShopEditor.cvars) do
            TrackConVar(tostring(cvName))
        end
    end

    isApplyingSavedCvars = true

    for cvarName, val in pairs(savedCvars) do
        if not ignoredCvars[cvarName] and ConVarExists(cvarName) then
            TrackConVar(cvarName)
            local cv = GetConVar(cvarName)
            if cv and cv:GetString() ~= tostring(val) then
                cv:SetString(tostring(val))
            end
        end
    end

    timer.Create("TTT2PersistentSettings_ResetFlag", 0.25, 1, function()
        isApplyingSavedCvars = false
    end)
end

-- Beim Laden direkt einmal die Datei einlesen, damit der CreateConVar-Wrapper sie schon kennt
if file.Exists(DATA_FILE, "DATA") then
    local content = file.Read(DATA_FILE, "DATA")
    local decoded = content and util.JSONToTable(content)
    if istable(decoded) then
        savedCvars = decoded
    end
end

-- RunConsoleCommand auf dem Server abfangen (wird von TTT2 F1-Menü, ShopEditor, Role-Settings & ULX !menu genutzt)
_G.RunConsoleCommand = function(cmd, ...)
    local args = { ... }
    origRunConsoleCommand(cmd, ...)

    if isApplyingSavedCvars then return end
    if not isstring(cmd) then return end

    local cvarName = string.Trim(cmd)
    if ignoredCvars[cvarName] or #args < 1 then return end

    if ConVarExists(cvarName) then
        TrackConVar(cvarName)
        local newVal = tostring(args[1])

        timer.Simple(0.05, function()
            if isApplyingSavedCvars then return end
            local cv = GetConVar(cvarName)
            if cv then
                savedCvars[cvarName] = cv:GetString()
            else
                savedCvars[cvarName] = newVal
            end
            SavePersistentCvarsToDisk()
        end)
    end
end

-- Auch alle über das F1-Admin-Menü abgefragten ConVars automatisch überwachen
hook.Add("TTT2FinishedLoading", "TTT2PersistentSettings_TTT2FinishedLoading", function()
    timer.Simple(0.2, LoadAndApplyPersistentCvars)
end)

hook.Add("Initialize", "TTT2PersistentSettings_Initialize", function()
    timer.Simple(0.1, LoadAndApplyPersistentCvars)
end)

hook.Add("InitPostEntity", "TTT2PersistentSettings_InitPostEntity", function()
    timer.Simple(0.5, LoadAndApplyPersistentCvars)
    timer.Simple(3.0, function()
        LoadAndApplyPersistentCvars()
        MsgN("[TTT2 Persistent Settings] Gespeicherte In-Game-Einstellungen aus data/" .. DATA_FILE .. " geladen.")
    end)
end)

-- ========================================================
-- KARMA-PERSISTENZ (auch für lokalen Server ohne GSLT)
-- ========================================================
local function GetPlayerKarmaKey(ply)
    local sid64 = ply:SteamID64()
    if sid64 and sid64 ~= "" and sid64 ~= "0" then
        return "sid_" .. tostring(sid64)
    end
    return "id_" .. tostring(ply:SteamID() or ply:Nick())
end

local function LoadPersistentKarma()
    if file.Exists(KARMA_FILE, "DATA") then
        local raw = file.Read(KARMA_FILE, "DATA")
        local tbl = raw and util.JSONToTable(raw)
        if istable(tbl) then
            savedKarma = tbl
        end
    end
end

local function SavePlayerKarma(ply)
    if not IsValid(ply) or ply:IsBot() then return end
    if not KARMA or not KARMA.IsEnabled or not KARMA.IsEnabled() then return end

    local liveK = ply.GetLiveKarma and ply:GetLiveKarma()
    if isnumber(liveK) and liveK > 0 then
        local key = GetPlayerKarmaKey(ply)
        savedKarma[key] = math.Round(liveK)
        file.Write(KARMA_FILE, util.TableToJSON(savedKarma, true))
    end
end

LoadPersistentKarma()

hook.Add("PlayerInitialSpawn", "TTT2PersistentKarma_Restore", function(ply)
    timer.Simple(1.5, function()
        if not IsValid(ply) or ply:IsBot() then return end
        if not KARMA or not KARMA.IsEnabled or not KARMA.IsEnabled() then return end

        LoadPersistentKarma()
        local key = GetPlayerKarmaKey(ply)
        local stored = tonumber(savedKarma[key])
        if stored and stored > 0 then
            ply:SetBaseKarma(stored)
            ply:SetLiveKarma(stored)
            if KARMA.ApplyKarma then
                KARMA.ApplyKarma(ply)
            end
        end
    end)
end)

hook.Add("TTTEndRound", "TTT2PersistentKarma_SaveRoundEnd", function()
    timer.Simple(0.5, function()
        for _, ply in ipairs(player.GetAll()) do
            SavePlayerKarma(ply)
        end
    end)
end)

hook.Add("PlayerDisconnected", "TTT2PersistentKarma_SaveDisconnect", function(ply)
    SavePlayerKarma(ply)
end)

hook.Add("ShutDown", "TTT2PersistentSettings_ShutDown", function()
    for _, ply in ipairs(player.GetAll()) do
        SavePlayerKarma(ply)
    end
    SavePersistentCvarsToDisk()
end)

-- ========================================================
-- Intelligente Vorbereitungszeit-Steuerung (Prep-Time Fix)
-- ========================================================
-- Problem: Wenn eine Runde sehr lang ging oder das Karten-Zeitlimit erreicht wurde,
-- startete die nächste Runde auf derselben Map fälschlicherweise erneut mit FirstPrepTime
-- statt mit ttt_preptime_seconds.
-- Lösung:
-- 1. Pro Map-Start gilt für die allererste Runde volle ttt_firstpreptime (z. B. 120s),
--    unabhängig davon, wie lange der Server-Prozess (SysTime) schon läuft.
-- 2. Sobald die erste Runde auf der aktuellen Map begonnen hat oder beendet wurde,
--    wird für alle Folgerunden auf dieser Map IMMER ttt_preptime_seconds (z. B. 30s) garantiert.
local hasPlayedFirstRoundThisMap = false

hook.Add("TTTBeginRound", "Hagebuddne_MarkFirstRoundStartedOnMap", function()
    hasPlayedFirstRoundThisMap = true
end)

hook.Add("TTTEndRound", "Hagebuddne_MarkSessionActiveOnRoundEnd", function()
    hasPlayedFirstRoundThisMap = true
end)

hook.Add("TTT2PrePrepareRound", "Hagebuddne_EnforceNormalPrepTimeAfterFirstRound", function(prepTime)
    local normalPrep = GetConVar("ttt_preptime_seconds") and GetConVar("ttt_preptime_seconds"):GetInt() or 30
    local firstPrep = GetConVar("ttt_firstpreptime") and GetConVar("ttt_firstpreptime"):GetInt() or 120

    if hasPlayedFirstRoundThisMap and prepTime >= firstPrep and normalPrep < firstPrep then
        -- Korrigiere die Vorbereitungszeit sofort auf die reguläre Zeit
        if timer.Exists("prep2begin") then
            timer.Adjust("prep2begin", normalPrep, 1, gameloop and gameloop.Begin)
        end
        if gameloop and gameloop.SetPhaseEnd then
            gameloop.SetPhaseEnd(CurTime() + normalPrep)
        end
        if SetRoundEnd then
            SetRoundEnd(CurTime() + normalPrep)
        end
        LANG.Msg("round_begintime", { num = normalPrep })
    end
end)

-- ========================================================
-- Synchrone Playermodel- & Beine-Synchronisation (Legs Fix)
-- ========================================================
-- Problem:
-- 1. TTT2 erzwingt bei "ttt2_use_custom_models = 0" und jedem Spawn standardmäßig
--    das Phoenix-Terroristen-Model (phoenix.mdl).
-- 2. Das Kompatibilitäts-Addon für Enhanced PlayerModel Selector (LF_PMS) hatte eine
--    asynchrone Verzögerung (timer.Simple 0.2s) und blockierte die Zuweisung während
--    einer aktiven Runde (ROUND_ACTIVE) vollständig.
-- 3. In diesem Zeitraum lasen Bein-Addons (z. B. VManip Legs, Viewmodel-Legs oder
--    First-Person-Beine) bereits ply:GetModel() aus. Da dort zu diesem Zeitpunkt noch
--    das Phoenix-Model aktiv war, wurden zufällig die falschen Beine (Terroristen-Hose/Stiefel)
--    instanziiert und dauerhaft zwischengespeichert.
--
-- Lösung:
-- - Wunsch-Playermodel (cl_playermodel) synchron beim Spawn und PlayerSetModel setzen.
-- - ply.defaultModel synchron setzen, damit TTT2 das Model beim Rundenstart nicht überschreibt.
-- - Failsafe auf Next-Tick (timer.Simple 0), TTTBeginRound und TTTPrepareRound.
-- - Entsperren des ROUND_ACTIVE-Blocks, damit auch Respawns während der Runde
--   sofort die korrekten Beine und das Wunschmodel erhalten.

util.AddNetworkString("playermodel_spawn_fix")

local function ApplyPlayerPreferredModel(ply)
    if not IsValid(ply) or ply:IsBot() then return end

    -- Wenn die aktive Sonderrolle ein eigenes Rollenmodell nutzt (z.B. Infected, Zombie, Vampire-Bat),
    -- darf dieses während der laufenden Runde NIEMALS durch das Standardmodell überschrieben werden!
    if _G.CustomPMS_HasActiveRoleModel and _G.CustomPMS_HasActiveRoleModel(ply) then
        return
    end

    -- Beachtet das vom eigenen PlayerModel Selector verwaltete Model
    if ply.currentCustomModel and ply.currentCustomModel ~= "" and util.IsValidModel(ply.currentCustomModel) then
        ply.defaultModel = ply.currentCustomModel
        if ply:GetModel() ~= ply.currentCustomModel then
            ply:SetModel(ply.currentCustomModel)
        end
        return
    end

    local modelName = ply:GetInfo("cl_playermodel")
    if not modelName or modelName == "" then return end

    local modelPath = player_manager.TranslatePlayerModel(modelName)
    if not modelPath or modelPath == "" or not util.IsValidModel(modelPath) then
        if util.IsValidModel(modelName) then
            modelPath = modelName
        else
            return
        end
    end

    ply.defaultModel = modelPath
    if ply:GetModel() ~= modelPath then
        ply:SetModel(modelPath)
    end

    local skin = ply:GetInfoNum("cl_playerskin", 0)
    ply:SetSkin(skin)

    local groups = ply:GetInfo("cl_playerbodygroups")
    if groups and groups ~= "" then
        local groupList = string.Explode(" ", groups)
        for k = 0, ply:GetNumBodyGroups() - 1 do
            local v = tonumber(groupList[k + 1]) or 0
            ply:SetBodygroup(k, v)
        end
    end

    ply.lf_playermodel_spawned = true
    hook.Run("SetModel", ply, modelPath)
end

-- Ersetzt den fehlerhaften Hook aus dem LF_PMS-TTT2-Fix (hebt die ROUND_ACTIVE-Sperre auf)
hook.Add("PlayerSpawn", "lf_playermodel_spawn_fix", function(ply)
    if not IsValid(ply) or ply:IsBot() then return end
    ApplyPlayerPreferredModel(ply)
    net.Start("playermodel_spawn_fix")
    net.Send(ply)
end)

hook.Add("PlayerSetModel", "Hagebuddne_SyncPlayerModel", function(ply)
    ApplyPlayerPreferredModel(ply)
end)

hook.Add("PlayerSpawn", "Hagebuddne_SyncPlayerModelSpawn", function(ply)
    ApplyPlayerPreferredModel(ply)
    timer.Simple(0, function()
        if IsValid(ply) then
            ApplyPlayerPreferredModel(ply)
        end
    end)
end)

hook.Add("TTTBeginRound", "Hagebuddne_SyncPlayerModelRoundBegin", function()
    for _, ply in ipairs(player.GetAll()) do
        ApplyPlayerPreferredModel(ply)
    end
end)

hook.Add("TTTPrepareRound", "Hagebuddne_SyncPlayerModelPrepRound", function()
    for _, ply in ipairs(player.GetAll()) do
        ApplyPlayerPreferredModel(ply)
    end
end)

