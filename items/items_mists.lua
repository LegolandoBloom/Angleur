local T = Angleur_Translate

local LU = LegolandoUtil
local LI = LU.Item



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

-- chosenBait = 0 --> default, aka no bait 
Angleur_Items = {
    bait = {
        [1] = {itemID = 111111, loaded = false,}, 
        [2] = {name= T["Shiny Bauble"], itemID = 6529, icon = 134335, loaded = false,},
        [3] = {itemID = 222222, loaded = false,},
        [4] = {name = T["Nightcrawlers"], itemID = 6530, icon = 134324, loaded = false,},
        [5] = {itemID = 333333, loaded = false,},
        [6] = {name = "Aquadynamic Fish Lens", itemID = 6811, icon = 134440, loaded = false,},
        [7] = {name = T["Bright Baubles"], itemID = 6532, icon = 134139, loaded = false,},
        [8] = {name = T["Flesh Eating Worm"], itemID = 7307, icon = 134324, loaded = false,},
        [9] = {name = T["Aquadynamic Fish Attractor"], itemID = 6533, icon = 133982, loaded = false,},
        [10] = {name = T["Feathered Lure"], itemID = 62673, icon = 135992, loaded = false,},
        [11] = {name = T["Sharpened Fish Hook"], itemID = 34861, icon = 134226, loaded = false,},
        [12] = {name = T["Glow Worm"], itemID = 46006, icon = 237147, loaded = false,},
        [13] = {name = T["Heat-Treated Spinning Lure"], itemID = 68049, icon = 135811, loaded = false,}
    },
}


local ownedBait = {
    -- itemID1 = true
    -- itemID2 = true
    -- itemID3 = true
    --      ...
}

local itemLoader = LI.CreateItemLoader()


local function clearTable(table)
    for i, v in pairs(table) do
        table[i] = nil
    end
end
function Angleur_CheckOwnedItems(teeburu)
    clearTable(ownedBait)
    for i, itemTable in pairs(teeburu) do
        if itemTable.loaded == true then
            if C_Item.GetItemCount(itemTable.itemID) > 0 then
                --print("in bag")
                ownedBait[itemTable.itemID] = true
            end
        end
    end
end
function Angleur_DecideBait()
    -- dropdown uses "ownedBait" table to fill itself
    -- this function gets the itemID(the index) from the ownedBait table,
    -- and looks up the rest of the details on bait table
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
local function requestLoad_Bait()
    -- itemLoader:SetOnLoadCallback(some function that refreshes dropdown etc.)
    for i, v in ipairs(Angleur_Items.bait) do
        itemLoader:AppendItemID(v.itemID)
    end
end

function Angleur_LoadItems()
    GetTimePreciseSec()
    requestLoad_Bait()
end
