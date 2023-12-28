if rd.DrunkRecoil.NormalSettings.enabled then

    Citizen.CreateThread(function()
        while true do

            Citizen.Wait(7)
            local sleep  = true
        
            if IsPedArmed(PlayerPedId(), 6) then
                sleep = false
                GunRecoil()
            end

            if sleep then
                Wait(1000)
            end
        end
    end)

    local toggleDrunk = false

    function GunRecoil()
        local playerPed = PlayerPedId()
        local playerId = PlayerId()

        local _, weapon = GetCurrentPedWeapon(playerPed)

        if not rd.DrunkRecoil.ignoredWeapons[weapon] then
            if IsPlayerFreeAiming(playerId) then
                enableDrunkCameraNORMAL()
           elseif IsPedShooting(playerPed) then
                enableDrunkCameraNORMAL()
            else
                if toggleDrunk then
                    toggleDrunk = false
                    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
                end
            end
        end
    end


    function enableDrunkCameraNORMAL()
        if not toggleDrunk then
            toggleDrunk = true

            local Vehicled = globalIsPedInAnyVehicle
            local ped = PlayerPedId()

            if IsPedInAnyVehicle(ped, false) then
                ShakeGameplayCam("DRUNK_SHAKE", rd.DrunkRecoil.VehicleSettings.shake)
                if rd.Debug then 
                    local shake = rd.DrunkRecoil.VehicleSettings.shake
                    print("DEBUG: Is entity in the vehicle: Yes")
                    print("DEBUG: Drunk recoil has started with shake " ..shake.. "")
                end
            else 
                ShakeGameplayCam("DRUNK_SHAKE", rd.DrunkRecoil.NormalSettings.shake)
                if rd.Debug then 
                    local shake = rd.DrunkRecoil.NormalSettings.shake
                    print("DEBUG: Is entity in the vehicle: No")
                    print("DEBUG: Drunk recoil has started with shake " ..shake.. "")
                end
            end
        end
    end
end