ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('esx_grocery:buyItem', function(itemName)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer then
        return
    end

    local selectedItem = nil

    for _, item in ipairs(Config.Items) do
        if item.item == itemName then
            selectedItem = item
            break
        end
    end

    if not selectedItem then
        TriggerClientEvent('esx:showNotification', src, 'This item is not available.')
        return
    end

    local itemPrice = selectedItem.price

    if xPlayer.getMoney() < itemPrice then
        TriggerClientEvent('esx:showNotification', src, 'You do not have enough cash.')
        return
    end

    xPlayer.removeMoney(itemPrice)

    local success = exports.ox_inventory:AddItem(src, selectedItem.item, 1)

    if success then
        TriggerClientEvent('esx:showNotification', src, 'You bought a ' .. selectedItem.label .. ' for $' .. itemPrice .. '.')
    else
        xPlayer.addMoney(itemPrice)
        TriggerClientEvent('esx:showNotification', src, 'Inventory is full or item could not be added.')
    end
end)
