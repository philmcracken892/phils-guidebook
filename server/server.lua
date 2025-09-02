
local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateUseableItem('guidebook', function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player then
        TriggerClientEvent('guidebook:openBook', source)
    end
end)