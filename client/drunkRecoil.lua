if Config.DrunkRecoil.Enabled then

    Citizen.CreateThread(function()
        while true do

            Citizen.Wait(150)
            local sleep = true
        
            if IsPedArmed(PlayerPedId(), 6) then
                sleep = false
                GunRecoil()
            end

            if sleep then
                Wait(5000)
            end
        end
    end)

    local toggleDrunk = false

    function GunRecoil()
        local PlayerPed = PlayerPedId()
        local Player = PlayerId()

        local _, weapon = GetCurrentPedWeapon(PlayerPed)

        if not Config.DrunkRecoil.IgnoredWeapons[weapon] then
            if IsPlayerFreeAiming(Player) then
                Wait(150)
                enableDrunkCameraNORMAL()
           elseif IsPedShooting(PlayerPed) then
                Wait(150)
                enableDrunkCameraNORMAL()
            else
                if toggleDrunk then
                    toggleDrunk = false
                    Wait(150)
                    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
                end
            end
        end
    end
    
    function enableDrunkCameraNORMAL()
        if not toggleDrunk then
            toggleDrunk = true

            local Vehicled = globalIsPedInAnyVehicle
            local PlayerPed = PlayerPedId()

            if IsPedInAnyVehicle(PlayerPed, false) then
                Wait(150)
                ShakeGameplayCam("DRUNK_SHAKE", Config.DrunkRecoil.VehicleSettings.shake)
            else 
                Wait(150)
                ShakeGameplayCam("DRUNK_SHAKE", Config.DrunkRecoil.NormalSettings.shake)
            end
        end
    end
end