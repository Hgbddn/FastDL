AddCSLuaFile()

SWEP.PrintName = "Camera"
SWEP.Author = "Facepunch"
SWEP.Instructions = "Left Click: Take snapshot"

SWEP.Base = "weapon_base"

SWEP.Slot = 8 -- Slot 9 in engine (0-indexed: 0=Slot 1, 8=Slot 9)
SWEP.SlotPos = 1
SWEP.Kind = 99 -- Eigener Kind-Slot (verhindert Konflikt mit WEAPON_ROLE / WEAPON_CLASS = 9 des DNA-Scanners)
SWEP.Weight = 5

SWEP.AllowDrop = false
SWEP.NoDrop = true
SWEP.overrideDropOnDeath = (DROP_ON_DEATH_TYPE_DENY or 2)
SWEP.InLoadoutFor = nil
SWEP.IsFunAndGames = true

SWEP.ViewModel = Model("models/weapons/c_arms_animations.mdl")
SWEP.WorldModel = Model("models/MaxOfS2D/camera.mdl")

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Spawnable = true

SWEP.ShootSound = Sound("NPC_CScanner.TakePhoto")

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

if SERVER then
    concommand.Add("gmod_camera", function(ply, cmd, args)
        if IsValid(ply) then
            ply:SelectWeapon("gmod_camera")
        end
    end)
end

function SWEP:SetupDataTables()
    self:NetworkVar("Float", 0, "Zoom")
    self:NetworkVar("Float", 1, "Roll")

    if SERVER then
        self:SetZoom(75)
        self:SetRoll(0)
    end
end

function SWEP:Initialize()
    self:SetHoldType("camera")
end

function SWEP:Reload()
end

function SWEP:PrimaryAttack()
    self:DoShootEffect()

    if not game.SinglePlayer() and SERVER then return end
    if CLIENT and not IsFirstTimePredicted() then return end

    local owner = self:GetOwner()
    if not IsValid(owner) or not owner:IsPlayer() then return end

    if CLIENT then
        RunConsoleCommand("jpeg")
    else
        owner:SendLua([[RunConsoleCommand("jpeg")]])
    end
end

function SWEP:SecondaryAttack()
end

function SWEP:Tick()
end

function SWEP:TranslateFOV(current_fov)
    return current_fov
end

function SWEP:Deploy()
    return true
end

function SWEP:Equip()
end

function SWEP:ShouldDropOnDie()
    return false
end

function SWEP:DoShootEffect()
    if self.NextShootEffect and self.NextShootEffect > CurTime() then return end
    self.NextShootEffect = CurTime() + 0.4

    local owner = self:GetOwner()
    if not IsValid(owner) then return end

    self:EmitSound(self.ShootSound)
    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
    owner:SetAnimation(PLAYER_ATTACK1)

    if SERVER and not game.SinglePlayer() then
        local vPos = owner:GetShootPos()
        local vForward = owner:GetAimVector()

        local trace = {}
        trace.start = vPos
        trace.endpos = vPos + vForward * 256
        trace.filter = owner

        local tr = util.TraceLine(trace)

        local effectdata = EffectData()
        effectdata:SetOrigin(tr.HitPos)
        util.Effect("camera_flash", effectdata, true)
    end
end

if SERVER then return end

SWEP.WepSelectIcon = surface.GetTextureID("vgui/gmod_camera")

function SWEP:DrawHUD() end
function SWEP:PrintWeaponInfo(x, y, alpha) end

function SWEP:HUDShouldDraw(name)
    if name == "CHudWeaponSelection" or name == "CHudChat" then return true end
    return false
end

function SWEP:FreezeMovement()
    return false
end

function SWEP:CalcView(ply, origin, angles, fov)
    return origin, angles, fov
end

function SWEP:AdjustMouseSensitivity()
    return 1
end
