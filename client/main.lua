if Config.DisableHeadshot then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(7)
            local Player = PlayerPedId()
            SetPedSuffersCriticalHits(Player, false)
        end
    end)
end
if Config.RemovePistolWhipping then 
    Citizen.CreateThread(function()
        Citizen.Wait(7)

        local Player = PlayerPedId()
        if IsPedArmed(Player, 4) then

            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)

        end
    end)
end
if Config.HideCrosshair then 
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            HideHudComponentThisFrame(14)
        end
    end)
end
if Config.SetFlashLightKeepOnWhileMoving then 
    Wait(7)
    SetFlashLightKeepOnWhileMoving(true)
end


if Config.DisableRoll then
    Citizen.CreateThread(function()
        while true do
            local Player = PlayerId()
            local PlayerPed = GetPlayerPed(-1)
            if(not IsPedInAnyVehicle(globalPed,false))then
                Citizen.Wait(4)
                if IsPlayerFreeAiming(Player) then
                    DisableControlAction(0, 22, 1) -- 22 is the INPUT_JUMP key
                else
                    Citizen.Wait(100)
                end
            else
                Citizen.Wait(500)
            end
        end
    end)
end