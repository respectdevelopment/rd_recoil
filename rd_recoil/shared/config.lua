rd = {}

rd.DisableHeadshot = false -- Disable headshot damagage for PLAYERS
rd.DisableRpunch = false -- Disable imaing punch (r punch)
rd.SetFlashLightKeepOnWhileMoving = false -- Realistic flashlight when you are mooving
rd.HideCrosshair = true -- Hide crosshair
rd.Debug = false -- Call debug message in console.

rd.DrunkRecoil = {

    Enabled = true,

    NormalSettings = { -- When is player doesnt in the vehicle
        shake = 0.6,
    },

    VehicleSettings = { -- When is player in the vehicle
        shake = 0.4,
    },

    ignoredWeapons = { -- Ignored Weapons
        [`weapon_sniperrifle`] = true,
        [`weapon_heavysniper`] = true,
        [`weapon_heavysniper_mk2`] = true,
        [`weapon_marksmanrifle`] = true,
        [`weapon_marksmanrifle_mk2`] = true,
    }
}

rd.CustomWeaponDamage = {
    enabled = true,
    Damage = {  -- Add more into client/damage.lua

        Pistol = 0.5,
        PistolMK2 = 0.6,
        CombatPistol = 0.7,
        ApPistol = 0.45,
        Stungun = 0.1,
        Pistol50 = 0.6,
        SnSpistol = 0.45,
        SnSpistolMK2 = 0.5,
        HeavyPistol = 0.6,
        VintagePistol = 0.55,
        Revolver = 1.0,
        RevolverMK2 = 1.0,
        DubleAction = 0.65,
        CeramicPistol = 0.50,
        MicroSMG = 0.73,
        Smg = 0.79,
        SmgMK2 = 0.81,
        CombatPDW = 0.84,
        AssaultSMG = 0.55,
        MachinePistol = 0.45,
        AssaultRifle = 0.50,
        AssaultRifleMK2 = 0.65,
        CarbineRifle = 0.65,
        CarbineRifleMK2 = 0.65,
        BullUPrifle = 0.4,
        CompactRifle = 0.50,
        PumpShotgun = 0.2,
        SawnOffShotgun = 0.95,
        BullUPshotgun = 1.2,
        AssaultShotgun = 0.1,
        Musket = 0.5,
        HeavyShotgun = 0.35,
        DbShotgun = 1.5,
        PumpShotgunMK2 = 1.0,
        MilitaryRIFLE = 0.45, 
    }
}
