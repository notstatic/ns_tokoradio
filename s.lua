a = nil

TriggerEvent('esx:getSharedObject', function(b) a = b end)

a.RegisterUsableItem('radio', function(c)
    local d = a.GetPlayerFromId(c)
    TriggerClientEvent('esx_tokoradio:ur', c)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local e = a.GetPlayers()
        for i=1,#e,1 do
            local d = a.GetPlayerFromId(e[i])
            if d ~= nil then
                local c = e[i]
                if d.getInventoryItem('radio').count == 0 then
                    TriggerClientEvent('esx_tokoradio:radio', c, false)
                    break;
                elseif d.getInventoryItem('radio').count ~= 0 and d.getInventoryItem('radio').count >= 0 then
                    TriggerClientEvent('esx_tokoradio:radio', c, true)
                    break;
                end
            end
        end
    end
end)