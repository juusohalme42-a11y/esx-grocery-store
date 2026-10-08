ESX = exports['es_extended']:getSharedObject()

local inZone = false

local function OpenShopMenu()
    local elements = {}

    for _, item in ipairs(Config.Items) do
        table.insert(elements, {
            label = item.label .. ' - $' .. item.price,
            value = item.item
        })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'grocery_shop', {
        title = Config.Shop.name,
        align = 'bottom-right',
        elements = elements
    }, function(data, menu)
        TriggerServerEvent('esx_grocery:buyItem', data.current.value)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end

CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - Config.Shop.coords)

        if dist < Config.Shop.radius then
            if not inZone then
                inZone = true
                ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to open the grocery store')
            end

            if IsControlJustReleased(0, 38) then
                OpenShopMenu()
            end
        else
            if inZone then
                inZone = false
            end
        end

        Wait(250)
    end
end)
