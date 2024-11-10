ESX = exports["es_extended"]:getSharedObject()

local playerDeadStatus = {}

RegisterServerEvent('acceptdeath:isPlayerDead')
AddEventHandler('acceptdeath:isPlayerDead', function(isDead)
    local _source = source
    playerDeadStatus[_source] = isDead
end)

RegisterCommand('acceptdeath', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not playerDeadStatus[source] then
        TriggerClientEvent('esx:showNotification', source, "You can only use /acceptdeath when you are dead.")
        return
    end

    local identifier = xPlayer.getIdentifier()
    local characterName = xPlayer.getName()

    MySQL.update('UPDATE `users` SET `disabled` = 1 WHERE identifier = ?', { identifier }, function(result)
        if result > 0 then
            TriggerEvent('esx:playerLogout', source)
        end
    end)
end, false)
