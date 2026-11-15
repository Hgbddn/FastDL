-- Server-Side Fix for ActMod Unpacked Addons & Expansion Packs (e.g., kami_dance)
-- Prevents ActMod's file.Time/file.Size check from setting GFilszFld and unloading lua/actmod/am_animc/*.lua on the Dedicated Server.

local function ApplyActModExpansionFix()
    if not A_AM or not istable(A_AM.ActMod) then return end

    A_AM.ActMod.GFilszFld = nil

    if istable(A_AM.ActMod.GFilsz) then
        for k, _ in pairs(A_AM.ActMod.GFilsz) do
            A_AM.ActMod.GFilsz[k] = "True"
        end
        A_AM.ActMod.GFilsz["LuaOri"] = "True"
    end

    A_AM.ActMod.AOri = function(self)
        if istable(A_AM.ActMod.GFilsz) then
            for k, _ in pairs(A_AM.ActMod.GFilsz) do
                A_AM.ActMod.GFilsz[k] = "True"
            end
            A_AM.ActMod.GFilsz["LuaOri"] = "True"
        end
        A_AM.ActMod.GFilszFld = nil
        return true
    end

    A_AM.ActMod.RetChfg = function(self)
        A_AM.ActMod.GFilszFld = nil
        if istable(A_AM.ActMod.GFilsz) then
            for k, _ in pairs(A_AM.ActMod.GFilsz) do
                A_AM.ActMod.GFilsz[k] = "True"
            end
            A_AM.ActMod.GFilsz["LuaOri"] = "True"
        end
        if istable(A_AM.ActMod.GetMSS_Tab) then
            A_AM.ActMod.GetMSS_Tab["GetORG"] = 1
        end
    end

    if istable(A_AM.ActMod.GTabActO) and not A_AM.ActMod.GTabActO["amod_cumact_kami_dance"] and isfunction(A_AM.ActMod.aLoadAllTablAS) then
        A_AM.ActMod.GFilszFld = nil
        A_AM.ActMod:aLoadAllTablAS(false)
    end
end

hook.Add("InitLoadLuaActMod", "TTT2_ActModExpansionFix_InitLoad", function()
    ApplyActModExpansionFix()
    timer.Simple(0.5, ApplyActModExpansionFix)
    timer.Simple(3, ApplyActModExpansionFix)
    timer.Simple(8, ApplyActModExpansionFix)
end)

hook.Add("InitPostEntity", "TTT2_ActModExpansionFix_PostEntity", function()
    ApplyActModExpansionFix()
    timer.Create("TTT2_ActModExpansionFix_Check", 5, 6, ApplyActModExpansionFix)
end)

hook.Add("PreLoadAnimations", "TTT2_DynaBase_WosPackAllGenders", function(gender)
    if not WOS_DYNABASE or not IncludeModel then return end
    if gender == WOS_DYNABASE.MALE or gender == WOS_DYNABASE.FEMALE or gender == WOS_DYNABASE.ZOMBIE or gender == WOS_DYNABASE.SHARED then
        IncludeModel("models/player/wiltos/amod_wos_pack.mdl")
        IncludeModel("models/player/wiltos/amod_wos_pack_2.mdl")
    end
end)
