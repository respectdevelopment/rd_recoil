if rd.DrunkRecoil.enabled then

    Citizen.CreateThread(function()
        while true do

            Citizen.Wait(150)
            local sleep  = true
        
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
        local playerPed = PlayerPedId()
        local playerId = PlayerId()

        local _, weapon = GetCurrentPedWeapon(playerPed)

        if not rd.DrunkRecoil.ignoredWeapons[weapon] then
            if IsPlayerFreeAiming(playerId) then
                Wait(150)
                enableDrunkCameraNORMAL()
           elseif IsPedShooting(playerPed) then
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
            local ped = PlayerPedId()

            if IsPedInAnyVehicle(ped, false) then
                Wait(150)
                ShakeGameplayCam("DRUNK_SHAKE", rd.DrunkRecoil.VehicleSettings.shake)
                if rd.Debug then 
                    local shake = rd.DrunkRecoil.VehicleSettings.shake
                    print("DEBUG: Is entity in the vehicle: Yes")
                    print("DEBUG: Drunk recoil has started with shake " ..shake.. "")
                end
            else 
                Wait(150)
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