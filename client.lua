ESX = exports["es_extended"]:getSharedObject()

local lastMessageTime = 0
local messageSent = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local isDead = exports.wasabi_ambulance:isPlayerDead()

        if isDead and not messageSent then
            local currentTime = GetGameTimer()

            TriggerEvent('chat:addMessage', {
                color = {255, 99, 71},
                args = { "[ ! ]: You are dead. Use /acceptdeath to CK your character." }
            })

            lastMessageTime = currentTime
            messageSent = true
        end

        if messageSent and (GetGameTimer() - lastMessageTime >= 600000) then
            messageSent = false
        end

        TriggerServerEvent('acceptdeath:isPlayerDead', isDead)
    end
end)
