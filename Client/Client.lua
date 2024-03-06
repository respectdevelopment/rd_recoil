local ActiveRecoil = false

Citizen.CreateThread(function()

    if Config.CustomDamage then
        for k, v in pairs(Config.Weapons) do

            SetWeaponDamageModifier(k, v.Damage)
    
        end
    end
    
    if Config.ClassicRecoil then
        for k,v in pairs(Config.Weapons) do

            SetWeaponRecoilShakeAmplitude(GetHashKey(k), Config.Weapons[k].ClassicRecoil)

        end
    end

    if Config.RealisticFlashLight then

        SetFlashLightKeepOnWhileMoving(true)

    end

end)


Citizen.CreateThread(function()

    while (Config.HideCrossHair) do

        Citizen.Wait(1)

        local sleep = true
        
        if IsPedArmed(PlayerPedId(), 6) then
            sleep = false
            HideHudComponentThisFrame(14)
        end

        if sleep then
            Wait(1000)
        end
    end


end)

Citizen.CreateThread(function()

    while (Config.DisableHeadShots) do

        Citizen.Wait(5000)

        SetPedSuffersCriticalHits(PlayerPedId(), false)

    end

end)

Citizen.CreateThread(function()

    while (Config.RemovePistolWhipping) do

        Citizen.Wait(15)
        local sleep = true

        if IsPedArmed(PlayerPedId(), 6) then
            sleep = false

            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)

        end

        if sleep then
            Wait(1000)
        end

    end
    
end) 

Citizen.CreateThread(function()

    while (Config.DrunkRecoil) do

        Citizen.Wait(150)
        local sleep = true

        if IsPedArmed(PlayerPedId(), 6) then
            sleep = false

            local CurrentWeapon = nil
            local _, Weapon = GetCurrentPedWeapon(PlayerPedId())

            for k in pairs(Config.Weapons) do
                local key = GetHashKey(k)

                if key == Weapon then
                    CurrentWeapon = k
                end

            end
                
            if CurrentWeapon ~= nil then

                local Player = PlayerId()
                local PlayerPed = PlayerPedId() 

                if IsPlayerFreeAiming(Player) or IsPedShooting(PlayerPed) and Config.Weapons[CurrentWeapon].DrunkRecoil ~= 0 then

                    if not ActiveRecoil then
                        ActiveRecoil = true
                        ShakeGameplayCam("DRUNK_SHAKE", Config.Weapons[CurrentWeapon].DrunkRecoil)
                    end
                else

                    if ActiveRecoil then

                        ActiveRecoil = false
                        Wait(150)
                        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    
                    end

                end
            else
                sleep = true
            end
        end

        if sleep then
            Wait(1000)
        end

    end

end)



