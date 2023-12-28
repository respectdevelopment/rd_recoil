if rd.DisableHeadshot then
    Citizen.CreateThread(function()
        Citizen.Wait(2500)
        SetPedSuffersCriticalHits(globalPed, false)
    end)
end

if rd.DisableRpunch then 
    Citizen.Wait(7)
    local Player = PlayerPedId()
    if IsPedArmed(Player, 4) then
        Citizen.Wait(7)
        DisableControlAction(1, 140, true)
        DisableControlAction(1, 141, true)
        DisableControlAction(1, 142, true)

    end
end

if rd.HideCrosshair then 
    Citizen.CreateThread( function()
        while true do
            Citizen.Wait(7)
            HideHudComponentThisFrame(14)
        end
    end)
end

if rd.SetFlashLightKeepOnWhileMoving then 
    SetFlashLightKeepOnWhileMoving(true)
end



if rd.RespectRecoil.StartMessageInConsole then
    Citizen.Wait(7)
    AddEventHandler('onResourceStart', function()
        print('---------------------------------')
        print('Respect Recoil Has Neen Started.')
        print('---------------------------------')
    end)
end
