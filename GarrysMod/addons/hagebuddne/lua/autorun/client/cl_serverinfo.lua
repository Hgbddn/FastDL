surface.CreateFont("hagebuddne_ServerInfo", {
    font = "Zemalgo Oswald",
    size = 28,
    weight = 300,
    antialias = true,
    extended = true,
})

surface.CreateFont("hagebuddne_ServerInfo_Stars", {
    font = "Zemalgo Oswald",
    size = 54,
    weight = 300,
    antialias = true,
    extended = true,
})

hook.Add("HUDPaint", "Hagebuddne_HUD_ServerInfo", function()
    local scrW, scrH = ScrW(), ScrH()
    local margin = 10

    local star1  = "⭐"
    local title  = " Hagebuddne "
    local bar    = "|"
    local domain = " zemalgo.com/ttt "
    local star2  = "⭐"

    surface.SetFont("hagebuddne_ServerInfo_Stars")
    local w1 = surface.GetTextSize(star1)
    local w5 = surface.GetTextSize(star2)

    surface.SetFont("hagebuddne_ServerInfo")
    local w2 = surface.GetTextSize(title)
    local w3 = surface.GetTextSize(bar)
    local w4 = surface.GetTextSize(domain)

    local totalW = w1 + w2 + w3 + w4 + w5
    local totalH = select(2, surface.GetTextSize(title))

    local boxW = totalW + 24
    local boxH = totalH + 20

    local boxX = margin
    local boxY = margin

    local x = boxX + 12
    local y = boxY + 10

    draw.RoundedBox(12, boxX, boxY, boxW, boxH, Color(0, 0, 0, 169))

    local white = Color(255, 255, 255, 240)
    local blue  = Color(0x56, 0x70, 0xB2, 255)

    surface.SetFont("hagebuddne_ServerInfo_Stars")
    surface.SetTextColor(blue)
    surface.SetTextPos(x, y - 14)
    surface.DrawText(star1)
    x = x + w1

    surface.SetFont("hagebuddne_ServerInfo")
    surface.SetTextColor(white)
    surface.SetTextPos(x, y)
    surface.DrawText(title)
    x = x + w2

    -- |
    surface.SetTextColor(blue)
    surface.SetTextPos(x, y)
    surface.DrawText(bar)
    x = x + w3

    surface.SetTextColor(white)
    surface.SetTextPos(x, y)
    surface.DrawText(domain)
    x = x + w4

    surface.SetFont("hagebuddne_ServerInfo_Stars")
    surface.SetTextColor(blue)
    surface.SetTextPos(x, y - 14)
    surface.DrawText(star2)
end)