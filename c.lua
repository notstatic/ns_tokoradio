a = nil
local b = {}
local k = false
local g = nil

Citizen.CreateThread(function()
    while a == nil do
        TriggerEvent('esx:getSharedObject', function(obj) a = obj end)
        Citizen.Wait(0)
    end
    while b.job == nil do
        Citizen.Wait(1000)
        b = a.GetPlayerData()
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(c)
  b.job = c
end)

function d()
    local e = {}
    local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(GetPlayerName(PlayerId()), "radio:channel")
    if b.job.name == 'police' then
        table.insert(e, {label = 'Virkavalta 1', value = 1})
        table.insert(e, {label = 'Virkavalta 2', value = 2})
        table.insert(e, {label = 'Virkavalta 3', value = 3})
    elseif b.job.name == 'ambulance' then
        table.insert(e, {label = 'Ensihoito', value = 4})
    elseif b.job.name == 'mechanic' then
        table.insert(e, {label = 'Mekaanikko', value = 5})
    elseif b.job.name == 'taxi' then
        table.insert(e, {label = 'Taksi', value = 6})
    end
    table.insert(e, {label = 'Liity avoimelle taajuudelle', value = 'l'}) 
    table.insert(e, {label = 'Poistu radiotaajuudelta', value = 'p'})
    a.UI.Menu.CloseAll()

    a.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'radio', 
        {
            title = 'Radio', 
            align = 'bottom-right', 
            elements = e,
        }, 
        function(f,g)
        g.close()
        if h ~= nil then
            exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
            exports.tokovoip_script:setPlayerData(GetPlayerName(PlayerId()), "radio:channel", "nil", true)
            h = nil
        end
        if f.current.value == 'l' then
            AddTextEntry('FMMC_KEY_TIP8', "Taajuus 10.0 - 99.9")
            DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "","","","","",4)
            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                Citizen.Wait(0)
            end
            local i = GetOnscreenKeyboardResult()
            i = tonumber(i)
            Citizen.Wait(300)
            if i ~= nil and i >= 10 and i <= 99.9 then
                h = i
                exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
                exports.tokovoip_script:setPlayerData(GetPlayerName(PlayerId()), "radio:channel", tonumber(h), true);
                exports.tokovoip_script:addPlayerToRadio(tonumber(h))
                a.ShowNotification('Liityit avoimelle radiotaajuudelle '..h..' MHz')
            end
        elseif f.current.value == 'p' then
            exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
            exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
            h = nil
        else
            exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
            exports.tokovoip_script:setPlayerData(GetPlayerName(PlayerId()), "radio:channel", tonumber(f.current.value), true);
            exports.tokovoip_script:addPlayerToRadio(tonumber(f.current.value))
        end

        end, 
        function(f,g)
        g.close()
    end)
end

RegisterNetEvent('esx_tokoradio:radio')
AddEventHandler('esx_tokoradio:radio', function(j)
    local k = j
    if not k then
        if h ~= nil then
            exports.tokovoip_script:removePlayerFromRadio(h)
            h = nil
        end
    end
end)

RegisterCommand('radio', function()
    d()
end)

RegisterNetEvent('esx_tokoradio:ur')
AddEventHandler('esx_tokoradio:ur', function()
    d()
end)

RegisterKeyMapping('radio', 'Avaa radio', "keyboard", 28) -- keymappingit radiolle
