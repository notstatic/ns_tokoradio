a = nil

TriggerEvent('esx:getSharedObject', function(b) a = b end)

a.RegisterUsableItem('radio', function(c)
    local d = a.GetPlayerFromId(c)
    TriggerClientEvent('esx_tokoradio:ur', c)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local e = a.GetPlayers()
        for i=1,#e,1 do
            Wait(100)
            local d = a.GetPlayerFromId(e[i])
            if d ~= nil then
                if d.getInventoryItem('radio').count == 0 then
                    TriggerEvent('TokoVoip:removePlayerFromAllRadio', e[i])
                end
            end
        end
    end
end)
