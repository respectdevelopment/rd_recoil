if rd.DisableHeadshot then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(7)
            local Player = PlayerPedId()
            SetPedSuffersCriticalHits(Player, false)
        end
    end)
end
if rd.RemovePistolWhipping then 
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
if rd.HideCrosshair then 
    Citizen.CreateThread(function()
        while true do

            Citizen.Wait(7)
            HideHudComponentThisFrame(14)

        end
    end)
end
if rd.SetFlashLightKeepOnWhileMoving then 
    Wait(7)
    SetFlashLightKeepOnWhileMoving(true)
end



