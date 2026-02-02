local T = Angleur_Translate

local debugChannel = 3
local colorDebug = CreateColor(1, 0.41, 0) -- orange

-- 'ang' is the angleur namespace
local addonName, ang = ...

ang.mists.items = {}
local mistsItems = ang.mists.items

local done = false
function mistsItems:AdjustCloseButton(extraItemsFrame)
    if done then return end
    for i=1, ang.extraItems.slotCount, 1 do
        extraItemsFrame[i].closeButton:SetSize(29, 31)
        extraItemsFrame[i].closeButton:AdjustPointsOffset(3, 4)
    end
    done = true
end

angleurItems = {
    baitPossibilities = {
        {itemID = 111111}, 
        {name= T["Shiny Bauble"], itemID = 6529, icon = 134335},
        {itemID = 222222},
        {name = T["Nightcrawlers"], itemID = 6530, icon = 134324},
        {itemID = 333333},
        --{name = "Aquadynamic Fish Lens", itemID = 6811, icon = 134440},
        {name = T["Bright Baubles"], itemID = 6532, icon = 134139},
        {name = T["Flesh Eating Worm"], itemID = 7307, icon = 134324},
        {name = T["Aquadynamic Fish Attractor"], itemID = 6533, icon = 133982},
        {name = T["Feathered Lure"], itemID = 62673, icon = 135992},
        {name = T["Sharpened Fish Hook"], itemID = 34861, icon = 134226},
        {name = T["Glow Worm"], itemID = 46006, icon = 237147},
        {name = T["Heat-Treated Spinning Lure"], itemID = 68049, icon = 135811}
    },
    --baitPossibilities = {{itemID = 111111, spellID = 111111}, {itemID = 222222, spellID = 222222}, {itemID = 333333, spellID = 333333}} --filled with fake items for testing purposes, normally quoted out
    ownedBait = {},
    selectedBaitTable = {name = 0, itemID = 0, icon = 0, hasItem = false, loaded = false, dropDownID = 0}
}

local function clearTable(table)
    for i, v in pairs(table) do
        table[i] = nil
    end
end
function Angleur_CheckOwnedItems(selectedItemTable, ownedItemsTable, possibilityTable)
    clearTable(ownedItemsTable)
    for i, item in pairs(possibilityTable) do
        if C_Item.IsItemDataCachedByID(item.itemID) then
            --print("Item name: ", item.name)
            if C_Item.GetItemCount(item.itemID) > 0 then
                --print("in bag")
                table.insert(ownedItemsTable, item)
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
local function requestItems(selectedItemTable, ownedItemsTable, possibilityTable)
    local requestFrame = CreateFrame("Frame")
    requestFrame:RegisterEvent("ITEM_DATA_LOAD_RESULT")
    requestFrame:SetScript("OnEvent", function(self, event, itemID, success) 
        if event ~= "ITEM_DATA_LOAD_RESULT" then return end
        local allTrue = true
        for i, item in pairs(possibilityTable) do
            if item.itemID == itemID then
                local _, link = C_Item.GetItemInfo(itemID)
                Angleur_BetaPrint(debugChannel, "Requested item loaded: ", link)
                item.loaded = true
            end
            if item.loaded ~= true then
                allTrue = false
            end
        end
        if allTrue == true then
            self:SetScript("OnEvent", nil)
            Angleur_BetaPrint(debugChannel, "all have finished loading, setting tables")
            Angleur_CheckOwnedItems(angleurItems.selectedBaitTable, angleurItems.ownedBait, angleurItems.baitPossibilities)
            Angleur_SetSelectedItem(angleurItems.selectedBaitTable, angleurItems.ownedBait, AngleurConfig.chosenBait.itemID)
        end
    end)
    for i, item in pairs(possibilityTable) do
        item.loaded = false
        C_Item.RequestLoadItemDataByID(item.itemID)
    end
end

function Angleur_LoadItems()
    GetTimePreciseSec()
    requestItems(angleurItems.selectedBaitTable, angleurItems.ownedBait, angleurItems.baitPossibilities)
end
