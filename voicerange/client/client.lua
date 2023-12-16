local range, time = WS.settings.startRange, 0
local currentSize, targetSize = (range * 2.0), (range * 2.0)

AddEventHandler(WS.settings.rangeEvent, function(voiceRange)
    targetSize, time = (voiceRange * 2.0), WS.settings.drawTime
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if time > 0 then
            time = time - 1

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local zCoords = playerCoords.z
            
            -- smooth transition
            local size = c(currentSize, targetSize, WS.settings.smooth)
        
            -- adjust height when in vehicle
            if IsPedInAnyVehicle(playerPed) then
                zCoords = zCoords + WS.settings.offset.vehicle
            else
                zCoords = zCoords + WS.settings.offset.default
            end
        
            DrawMarker(WS.marker.type, playerCoords.x, playerCoords.y, zCoords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, size, size, 2.0, WS.marker.color.r, WS.marker.color.g, WS.marker.color.b, WS.marker.color.t, false, WS.marker.jump, 2, WS.marker.rotate, false, false, false)

            -- update current size
            currentSize = size
        else
            -- 250ms works fine
            Citizen.Wait(250)
        end
    end
end)

function c(a, b, t)
    return a + (b - a) * t
end