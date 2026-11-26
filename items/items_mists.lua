local T = Angleur_Translate

local LU = LegolandoUtil
local LI = LU.Item
local LUI = LU.UI


local debugChannel = 3
local colorDebug = CreateColor(1, 0.41, 0) -- orange

-- 'ang' is the angleur namespace
local addonName, ang = ...
local gameVersion = ang.gameVersion

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





local baitPossibilities = {
    [1] = {itemID = 111111}, 
    [2] = {name= T["Shiny Bauble"], itemID = 6529, icon = 134335},
    [3] = {itemID = 222222},
    [4] = {name = T["Nightcrawlers"], itemID = 6530, icon = 134324},
    [5] = {itemID = 333333},
    [6] = {name = "Aquadynamic Fish Lens", itemID = 6811, icon = 134440},
    [7] = {name = T["Bright Baubles"], itemID = 6532, icon = 134139},
    [8] = {name = T["Flesh Eating Worm"], itemID = 7307, icon = 134324},
    [9] = {name = T["Aquadynamic Fish Attractor"], itemID = 6533, icon = 133982},
    [10] = {name = T["Feathered Lure"], itemID = 62673, icon = 135992},
    [11] = {name = T["Sharpened Fish Hook"], itemID = 34861, icon = 134226},
    [12] = {name = T["Glow Worm"], itemID = 46006, icon = 237147},
    [13] = {name = T["Heat-Treated Spinning Lure"], itemID = 68049, icon = 135811},
    [14] = {name = T["Camper's Lure"], itemID = 291005, icon = 134895, loaded = false,},
}

AngleurItems = {
    ownedBait = {},
    baitApplied = false
}
local baitDD_ElementTable = {}
local itemLoader = LI.CreateItemLoader(false)



itemLoader.onLoadCallback = function(itemID)
    local found, innerTable = LU.ScanTablesInsideTableForFieldValue_AndReturnFoundInnerTable(baitPossibilities, "itemID", itemID)
    if found and innerTable then
        innerTable.loaded = true
        -- This is done to localise the names 
        innerTable.name = C_Item.GetItemNameByID(itemID)
    end
end

-- ownedTable = {
--     15192 = 1, -->
--     15192 = 2, --> index is itemID, value is priority
--     15192 = 3, -->
--         ...
-- }
-- Owned items will get their priority assigned according to their ordering in the "Possibility Table"
-- Example: Out of 15 items, possibility table index 2, 5 and 9 are the only ones get added to the owned table. Priorities assigned shown in parantheses: 2(1), 5(2), 9(3)  
local function _iterate_possibility_table(possibility)
    local ownedTable = {}
    local DD_ElementTable = {}
    local priority = 1
    for i, item in ipairs(possibility) do
        if item.loaded == true and C_Item.IsUsableItem(item.itemID) then
            if C_Item.GetItemCount(item.itemID) > 0 then
                ownedTable[item.itemID] = priority
                DD_ElementTable[priority] = item.name
                priority = priority + 1
            end
        end
    end
    return ownedTable, DD_ElementTable
end
function AngleurItems_RefreshOwnedItems()
    AngleurItems.ownedBait, baitDD_ElementTable = _iterate_possibility_table(baitPossibilities)
end

function Angleur_GetSelectedBait(index)
    local baitID = AngleurItems.ownedBait[index] 
    local _, itemTable = LU.ScanTablesInsideTableForFieldValue_AndReturnFoundInnerTable(baitPossibilities, "itemID", baitID)
    if not itemTable then
        print("Error: item couldn't be located on possibility table")
        return
    end
    local localisedName = C_Item.GetItemNameByID(baitID)
    local icon = itemTable.icon
    return localisedName, icon
end

local function requestLoad_Bait()
    -- itemLoader:SetOnLoadCallback(some function that refreshes dropdown etc.)
    for i, itemTable in ipairs(baitPossibilities) do
        itemLoader:AppendItemID(itemTable.itemID)
    end
end

function Angleur_LoadItems()
    GetTimePreciseSec()
    requestLoad_Bait()
end

local function CheckTableSpell(table ,spell)
    local matchFound = false
    for i, value in pairs(table) do
        if spell == value then
            matchFound = true
            break
        end
    end
    return matchFound
end

-- WHERE TO FIND: Refer to my templates -> "How to find Temporary Enchant ID on Wowhead" guide
local baitEnchantIDTable = {
    263, -- Shiny Bauble
    264, -- Nightcrawlers, Aquadynamic Fish Lens
    265, -- Bright Baubles, Flesh Eating Worm
    266, -- Aquadynamic Fish Attractor, Feathered Lure, Sharpened Fish Hook
    3868, -- Glow Worm
    4225, -- Heat-Treated Spinning Lure
    8773, -- Camper's Lure
}

local MAINHAND_SLOT = 16
local RETAIL_ROD_SLOT = 28
-- Implement later: fish without rod in mists(where does the bait go?)
function AngleurItems_CheckBaitEnchant()
    -- GetWeaponEnchantInfo() --> DEPRECATED, SOON TO BE REMOVED
    -- REPLACE WITH THIS: PaperDollInfo.GetTemporaryEnchantmentInfo()
    local baitEnchantSlot = MAINHAND_SLOT
    if gameVersion == 1 then
        baitEnchantSlot = RETAIL_ROD_SLOT
    end
    -- local enchantInfo = C_PaperDollInfo.GetTemporaryEnchantmentInfo(baitEnchantSlot)
    -- local enchantID = Angleur_ScrubSecret(enchantInfo.enchantID)
    local _, _, _, enchantID = GetWeaponEnchantInfo()
    if enchantID then
        if CheckTableSpell(baitEnchantIDTable, enchantID) then
            AngleurItems.baitApplied = true
        else
            AngleurItems.baitApplied = false
        end
    else
        AngleurItems.baitApplied = false
    end
end



function AngleurItems_GetBestApplicableBait()
    AngleurItems_RefreshOwnedItems()
    local ownedBait = AngleurItems.ownedBait
    if next(ownedBait) == nil then return end
    local playerChosenBaitID = AngleurConfig.chosenBaitID
    if playerChosenBaitID and playerChosenBaitID ~= 0 and ownedBait[playerChosenBaitID] then
        local _, itemTable = LU.ScanTablesInsideTableForFieldValue_AndReturnFoundInnerTable(baitPossibilities, "itemID", playerChosenBaitID)
        if itemTable then
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("AngleurItems_GetBestApplicapleBait ") .. ": player chosen bait is applicable. Activating.")
            return itemTable.name, itemTable.icon
        else
            print("AngleurItems_GetBestApplicableBait: Unexpected Error")
            return
        end
    end
    for itemID, priority in pairs(ownedBait) do
        if priority == 1 then
            local _, itemTable = LU.ScanTablesInsideTableForFieldValue_AndReturnFoundInnerTable(baitPossibilities, "itemID", itemID)
            if itemTable then
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("AngleurItems_GetBestApplicapleBait ") .. ": Can't apply player chosen bait. Activating the next best option.")
                return itemTable.name, itemTable.icon
            else
                print("AngleurItems_GetBestApplicableBait: Unexpected Error")
                return
            end
        end
    end
    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("AngleurItems_GetBestApplicapleBait ") .. ": Can't apply player chosen bait, or any next best option. Deactivating bait.")
end


function AngleurItems_SetupBaitDropdown(parent)
    AngleurItems_RefreshOwnedItems()
    parent.dropDown = LUI.SetupGenericBlizzMenuDropdown(parent, AngleurConfig, "chosenBaitID", "Bait", "bait improvement test", baitDD_ElementTable, function()
        print("is selected")
    end, function()
        print("set selected")
    end, function(self, button, down)
        print(button, down)
        if button == "LeftButton" and down == true then
            AngleurItems_RefreshOwnedItems()
            parent.dropDown:RefreshElements(baitDD_ElementTable)
            print("baitDD_ElementTable")
            DevTools_Dump(baitDD_ElementTable)
        end
    end)
    parent.dropDown:SetPoint("LEFT", parent.checkbox, "RIGHT", 5, 0)
    if not AngleurConfig.baitEnabled then 
        parent.dropDown:Hide()
    end


    
    SLASH_ITEMLOADERTEST1 = "/iloader"
    SlashCmdList["ITEMLOADERTEST"] = function()
        -- AngleurItems_RefreshOwnedItems()
        -- parent.dropDown:RefreshElements(AngleurItems.ownedBait)
        itemLoader:PrintAll()
        -- print("\n\n")
        -- print("Possibility Table:")
        -- for i, v in ipairs(baitPossibilities) do
        --     print(i)
        --     DevTools_Dump(v)
        -- end
        -- print("\n\n")
        -- print("Owned Table:")
        -- DevTools_Dump(AngleurItems.ownedBait)
    end

end


    SLASH_BITEMLOADERTEST1 = "/itesty"
    SlashCmdList["BITEMLOADERTEST"] = function()
        AngleurItems_SetupBaitDropdown(Angleur.configPanel.tab1.contents.baitEnable)
    end