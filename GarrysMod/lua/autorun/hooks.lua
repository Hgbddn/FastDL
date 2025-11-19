hook.Add( "PlayerButtonDown", "Model", function( ply, button )
    if button != KEY_P then return end

    if CLIENT and not IsFirstTimePredicted() then
        return
    end

    RunConsoleCommand("playermodel_selector")
end)



hook.Add( "PlayerButtonDown", "Spectator End", function( ply, button )
    if button != KEY_L then return end

    if CLIENT and not IsFirstTimePredicted() then
        return
    end

    RunConsoleCommand("ttt_spectate", "0")
end)



hook.Add( "PlayerButtonDown", "MOTD", function( ply, button )
    if button != KEY_M then return end

    if CLIENT and not IsFirstTimePredicted() then
        return
    end

    RunConsoleCommand("ulx", "motd")
end)



hook.Add( "PlayerButtonDown", "Kill", function( ply, button )
    if button != KEY_K then return end

    if CLIENT and not IsFirstTimePredicted() then
        return
    end

    RunConsoleCommand("kill")
end)



hook.Add( "PlayerButtonDown", "Spectator Death Match", function( ply, button )
    if button != KEY_O then return end

    if CLIENT and not IsFirstTimePredicted() then
        return
    end

    ply:ConCommand('say !dm')
end)