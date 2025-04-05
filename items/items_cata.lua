local T = Angleur_Translate
local colorDebug = CreateColor(1, 0.41, 0) -- orange

function Angleur_LoadItems()
    initializeSavedItems()
    GetTimePreciseSec()
    Angleur_RequestItems(angleurItems.selectedBaitTable, angleurItems.ownedBait, angleurItems.baitPossibilities)
end


function Angleur_RequestItems(selectedItemTable, ownedItemsTable, possibilityTable)
    local requestFrame = CreateFrame("Frame")
    requestFrame:RegisterEvent("ITEM_DATA_LOAD_RESULT")
    requestFrame:SetScript("OnEvent", function(self, event, itemID, success) 
        if event ~= "ITEM_DATA_LOAD_RESULT" then return end
        local allTrue = true
        for i, item in pairs(possibilityTable) do
            if item.itemID == itemID then
                item.loaded = true
            end
            if item.loaded ~= true then
                allTrue = false
            end
        end
        if allTrue == true then
            self:SetScript("OnEvent", nil)
            Angleur_CheckOwnedItems(angleurItems.selectedBaitTable, angleurItems.ownedBait, angleurItems.baitPossibilities)
            Angleur_SetSelectedItem(angleurItems.selectedBaitTable, angleurItems.ownedBait, AngleurConfig.chosenBait.itemID)
        end
    end)
    for i, item in pairs(possibilityTable) do
        item.loaded = false
        C_Item.RequestLoadItemDataByID(item.itemID)
    end
    --if foundUsableItem == false then print("NOTHING FOUND") end
    return foundUsableItem
end

function Angleur_CheckOwnedItems(selectedItemTable, ownedItemsTable, possibilityTable)
    clearTable(ownedItemsTable)
    for i, item in pairs(possibilityTable) do
        if C_Item.IsItemDataCachedByID(item.itemID) then
            --print("Item name: ", item.name)
            if C_Item.GetItemCount(item.itemID) > 0 then
                --print("in bag")
                table.insert(ownedItemsTable, item)
                foundUsableItem = true
            end
        end
    end
end

function Angleur_SetSelectedItem(selectedItemTable, ownedItemsTable, chosenByPlayer)
    local selection = {}
    local dropDownID
    for i, ownedItem in pairs(ownedItemsTable) do
        selection = ownedItem
        dropDownID = i
        if chosenByPlayer == ownedItem.itemID then
            break
        end
    end
    if next(selection) == nil then return end
    selectedItemTable.itemID = selection.itemID
    selectedItemTable.dropDownID = dropDownID
    selectedItemTable.hasItem = true
    selectedItemTable.loaded = true
    selectedItemTable.name = C_Item.GetItemNameByID(selection.itemID)
    selectedItemTable.spellID = selection.spellID
    selectedItemTable.icon = selection.icon
end