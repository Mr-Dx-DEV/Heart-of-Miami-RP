TGIANN_INVENTORY_ITEMS = {
    {
        name = 'banner', 
        label = 'banner',
        weight = 100,
        type = 'item',
        image = 'Banner.webp',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    {
        name = 'banner_remover',
        label = 'Banner Remover',
        weight = 100,
        type = 'item',
        image = 'banner_remover.webp',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    {
        name = 'paper',
        label = 'Paper',
        weight = 100,
        type = 'item',
        image = 'paper.webp',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
}

CreateThread(function()
    if Config.Inventory == Inventory.TGIANN then
        InventoryService.AddItem = function(playerId, itemName, amount, metadata)
            local match = string.match(itemName, "^WEAPON_(.*)")

            if match then
                itemName = itemName:lower()
            end

            return exports[Inventory.TGIANN]:AddItem(playerId, itemName, amount, nil, metadata, false)
        end

        InventoryService.RemoveItem = function(playerId, itemName, amount, metadata)
            local match = string.match(itemName, "^WEAPON_(.*)")

            if match then
                itemName = itemName:lower()
            end

            return exports[Inventory.TGIANN]:RemoveItem(playerId, itemName, amount, metadata)
        end

        InventoryService.HasItem = function(playerId, itemName, amount)
            local match = string.match(itemName, "^WEAPON_(.*)")

            if match then
                itemName = itemName:lower()
            end

            return exports[Inventory.TGIANN]:HasItem(playerId, itemName, amount)
        end

        InventoryService.RegisterUsableItem = function(itemName, callBack)
            if not SharedObject then
                return
            end

            if Config.Framework == Framework.ESX then
                SharedObject.RegisterUsableItem(itemName, function(source)
                    callBack(source, nil)
                end)
            elseif IS_QB[Config.Framework] then -- QBCORE, QBOX
                SharedObject.Functions.CreateUseableItem(itemName, function(source, item)
                    callBack(source, item.info or item.metadata or {})
                end)
            else
                -- playerId
                callBack(nil, nil)
            end
        end


        InventoryService.CanProduceBanner = function(playerId, targetAmount)
            local retval = false
        
            if Config.Business.Printers.ProductionItemNeed then
                local itemName = Config.Business.Printers.ProductionItem
        
                dbg.business('1. Checking if player %s (%s) has item %s with amount total amount %s', GetPlayerName(playerId), playerId, itemName, targetAmount)
        
                local itemCount = Inventory.HasItem(playerId, itemName, targetAmount)
        
                if itemCount then
                    dbg.business('2. Checking if player %s (%s) has item %s with total amount %s', GetPlayerName(playerId), playerId, itemName, targetAmount)
                    InventoryService.RemoveItem(playerId, itemName, targetAmount)
                    retval = true
                end
            else
                dbg.business('Production item is not required for production.')
                retval = true
            end
        
            return retval
        end
    
        
        InventoryService.GetInventoryItems = function(playerId)
            if not playerId then
                return
            end

            return exports[Inventory.TGIANN]:GetPlayerItems(playerId) or {}
        end

        AssetDeployer:registerCopyFilesDeploy('items-images', 'inventory_images', 'assets/inventoryImages/webp', 'images',
            function(data)
                local files = {}
                for _, item in ipairs(data) do
                    table.insert(files, item .. '.webp')
                end

                return files
            end, { 'banner', 'banner_remover', 'paper' }
        )
    end
end)
