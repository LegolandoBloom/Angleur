Angleur_SlottedExtraItems = {
    first = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0, 
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUsed = 0, 
        equipLoc = 0, forceEquip = false
    },
    second = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0,
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUsed = 0,
        equipLoc = 0, forceEquip = false
    },
    third = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0,
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUsed = 0,
        equipLoc = 0, forceEquip = false
    }
}

local function initializeSavedItems()
    for i, slot in pairs(Angleur_SlottedExtraItems) do
        if not slot.name then slot.name = 0 end
        if not slot.itemID then slot.itemID = 0 end
        if not slot.spellID then slot.spellID = 0 end
        if not slot.icon then slot.icon = 0 end
        if not slot.auraActive then slot.auraActive = false end
        if not slot.loaded then slot.loaded = false end
        if not slot.macroName then slot.macroName = 0 end
        if not slot.macroIcon then slot.macroIcon = 0 end
        if not slot.macroBody then slot.macroBody = 0 end
        if not slot.macroSpellID then slot.macroSpellID = 0 end
        if not slot.macroItemID then slot.macroItemID = 0 end
        if not slot.delay then slot.delay = 0 end
        if not slot.lastUsed then slot.lastUsed = 0 end
        if not slot.equipLoc then slot.equipLoc = 0 end
        if not slot.forceEquip then slot.forceEquip = false end
    end
end

local function clearTable(table)
    for i, v in pairs(table) do
        table[i] = nil
    end
end

function Angleur_LoadExtraItems(self)
    initializeSavedItems()
    for i, slot in pairs(Angleur_SlottedExtraItems) do
        Angleur_SlottedExtraItems[i].loaded = false
        --self[i].name = Angleur_SlottedExtraItems[i].name
        --self[i].spellID = Angleur_SlottedExtraItems[i].spellID
        if Angleur_SlottedExtraItems[i].name ~= 0 then
            self[i].itemID = Angleur_SlottedExtraItems[i].itemID
            self[i].icon:SetTexture(Angleur_SlottedExtraItems[i].icon)
            self[i].closeButton:Show()
            self[i].Name:SetText(nil)
            self[i].timeButton:Show()
            if Angleur_SlottedExtraItems[i].delay ~= nil then
                self[i].timeButton.inputBoxes.minutes:SetNumber(math.floor(Angleur_SlottedExtraItems[i].delay / 60))
                self[i].timeButton.inputBoxes.seconds:SetNumber(Angleur_SlottedExtraItems[i].delay % 60)
                Angleur_FillEditBox(self[i].timeButton.inputBoxes.minutes)
                Angleur_FillEditBox(self[i].timeButton.inputBoxes.seconds)
            end
            local item = Item:CreateFromItemID(Angleur_SlottedExtraItems[i].itemID)
            item:ContinueOnItemLoad(function(self)
                Angleur_SlottedExtraItems[i].loaded = true
                --print("Extra item loaded: ", item:GetItemLink())
            end)
        elseif Angleur_SlottedExtraItems[i].macroName ~= 0 then
            self[i].icon:SetTexture(Angleur_SlottedExtraItems[i].macroIcon)
            self[i].closeButton:Show()
            self[i].Name:SetText(Angleur_SlottedExtraItems[i].macroName)
            self[i].timeButton:Show()
            if Angleur_SlottedExtraItems[i].delay ~= nil then
                self[i].timeButton.inputBoxes.minutes:SetNumber(math.floor(Angleur_SlottedExtraItems[i].delay / 60))
                self[i].timeButton.inputBoxes.seconds:SetNumber(Angleur_SlottedExtraItems[i].delay % 60)
                Angleur_FillEditBox(self[i].timeButton.inputBoxes.minutes)
                Angleur_FillEditBox(self[i].timeButton.inputBoxes.seconds)
            end
        else
            self[i].itemID = nil
            self[i].icon:SetTexture(nil)
            self[i].closeButton:Hide()
            self[i].Name:SetText(nil)
            self[i].timeButton:Hide()
        end
    end
end

function Angleur_RemoveExtraItem(self)
    local colorYellow = CreateColor(1.0, 0.82, 0.0)
    local colorBlu = CreateColor(0.61, 0.85, 0.92)
    local parent = self:GetParent()
    local keyofParent = parent:GetParentKey()
    --if Angleur_SlottedExtraItems[keyofParent].name == 0 then error("Angleur ERROR: Trying to remove extra item, but it is already removed.") end
    Angleur_SlottedExtraItems[keyofParent].name = 0
    Angleur_SlottedExtraItems[keyofParent].itemID = 0
    Angleur_SlottedExtraItems[keyofParent].spellID = 0
    Angleur_SlottedExtraItems[keyofParent].icon = 0
    Angleur_SlottedExtraItems[keyofParent].auraActive = false
    Angleur_SlottedExtraItems[keyofParent].loaded = false
    Angleur_SlottedExtraItems[keyofParent].macroName = 0
    Angleur_SlottedExtraItems[keyofParent].macroIcon = 0
    Angleur_SlottedExtraItems[keyofParent].macroBody = 0
    Angleur_SlottedExtraItems[keyofParent].macroSpellID = 0
    Angleur_SlottedExtraItems[keyofParent].macroItemID = 0
    Angleur_SlottedExtraItems[keyofParent].delay = 0
    Angleur_SlottedExtraItems[keyofParent].lastUsed = 0
    if Angleur_SlottedExtraItems[keyofParent].equipLoc ~= 0 then
        Angleur_SlottedExtraItems[keyofParent].equipLoc = 0
        print("Unslotted " .. colorBlu:WrapTextInColorCode("Angleur ") .. colorYellow:WrapTextInColorCode("Equipment Set ") .. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it.")
    end
    Angleur_SlottedExtraItems[keyofParent].forceEquip = false
    local grandParent = parent:GetParent()

    Angleur_LoadExtraItems(grandParent)
end

local typeToSlotID = {
    INVTYPE_HEAD = 1,
    INVTYPE_NECK = 2,
    INVTYPE_SHOULDER = 3,
    INVTYPE_BODY = 4,
    INVTYPE_CHEST = 5,
    INVTYPE_WAIST = 6,
    INVTYPE_LEGS = 7,
    INVTYPE_FEET = 8,
    INVTYPE_WRIST = 9,
    INVTYPE_HAND = 10,
    INVTYPE_FINGER = {11, 12},
    INVTYPE_TRINKET = {13, 14},
    INVTYPE_WEAPON = {16, 17},
    INVTYPE_SHIELD = 17,
    INVTYPE_RANGED = 16,
    INVTYPE_CLOAK = 15,
    INVTYPE_2HWEAPON = 16,
    INVTYPE_TABARD = 19,
    INVTYPE_ROBE = 5,
    INVTYPE_WEAPONMAINHAND = 16,
    INVTYPE_WEAPONOFFHAND = 16,
    INVTYPE_HOLDABLE = 17,
    INVTYPE_THROWN = 16,
    INVTYPE_RANGEDRIGHT = 16
}

local warningHats = {
    [88710] = "Nat's Hat",
    [117405] = "Nat's Drinking Hat",
    [33820] = "Weather-Beaten Fishing Hat",
}
local function checkForHats(itemID)
    if warningHats[itemID] ~= nil then
        local colorBlu = CreateColor(0.61, 0.85, 0.92)
        local colorYellow = CreateColor(1.0, 0.82, 0.0)
        local colorRed = CreateColor(1, 0, 0)
        local colorGrae = CreateColor(0.85, 0.85, 0.85)
        print(" ")
        print(" ")
        print(" ")
        print(colorBlu:WrapTextInColorCode("Angleur: ") .. colorYellow:WrapTextInColorCode("Fishing Hat") .. " detected.")
        print("For it to work properly, please make sure to add it as a macro like so: ")
        print(colorGrae:WrapTextInColorCode("      _____________________"))
        print(colorGrae:WrapTextInColorCode("     I"))
        print("        /use " .. warningHats[itemID])
        print("        /use 28")
        print(colorGrae:WrapTextInColorCode("      _____________________I"))
        print(" ")
        print("Otherwise, you will have to manually target your fishing rod every time."
        .. "If you want to see an example of how to slot macros, click the " 
        ..  colorRed:WrapTextInColorCode("[HOW?] ") .. "button on the " 
        .. colorYellow:WrapTextInColorCode("Extra Tab"))
    end
end
function Angleur_GrabCursorItem(self)
    if InCombatLockdown() then
        ClearCursor()
        print("Can't drag item in combat.")
        return
    end
    local itemLoc = C_Cursor.GetCursorItem()
    local itemID = C_Item.GetItemID(itemLoc)
    local link = C_Item.GetItemLink(itemLoc)
    local itemInfo = {C_Item.GetItemInfo(itemID)}
    if not C_Item.IsUsableItem(itemID) then
        print("Please select a usable item.")
        ClearCursor()
        return
    end
    local _, spellID = C_Item.GetItemSpell(itemID)
    if spellID == nil then
        print("This item does not have a castable spell.")
        ClearCursor()
        return
    end
    ClearCursor()
    Angleur_RemoveExtraItem(self.closeButton)
    local name = C_Item.GetItemName(itemLoc)
    local icon = C_Item.GetItemIcon(itemLoc)
    local parentKey = self:GetParentKey()
    Angleur_SlottedExtraItems[parentKey].itemID = itemID
    Angleur_SlottedExtraItems[parentKey].name = name
    Angleur_SlottedExtraItems[parentKey].icon = icon
    Angleur_SlottedExtraItems[parentKey].spellID = spellID    
    if C_Item.IsEquippableItem(itemID) then
        Angleur_SlottedExtraItems[parentKey].equipLoc = typeToSlotID[itemInfo[9]]
        Angleur_SlottedExtraItems[parentKey].forceEquip = true
    end
    --print(itemID)
    --DevTools_Dump(C_Item.GetItemInventoryType(itemLoc))
    --DevTools_Dump(GetItemInteractionInfo(itemLoc))
    checkForHats(itemID)
    Angleur_LoadExtraItems(self:GetParent())
end

function Angleur_GrabCursorMacro(self, macroIndex)
    if InCombatLockdown() then
        ClearCursor()
        print("Can't drag macro in combat.")
        return
    end
    local parentKey = self:GetParentKey()
    local colorYellow = CreateColor(1.0, 0.82, 0.0)
    local colorBlu = CreateColor(0.61, 0.85, 0.92)
    Angleur_RemoveExtraItem(self.closeButton)
    if macroIndex then 
        local spellID = GetMacroSpell(macroIndex)
        local itemName, itemLink = GetMacroItem(macroIndex)
        if spellID then
            Angleur_SlottedExtraItems[parentKey].macroSpellID = spellID
            print("link of macro spell: " .. C_Spell.GetSpellLink(Angleur_SlottedExtraItems[parentKey].macroSpellID))
        elseif itemName then
            print("link of macro item: ", itemLink)
            local _, spellID = C_Item.GetItemSpell(itemName)
            if spellID == nil then
                print(colorYellow:WrapTextInColorCode("Can't use Macro: ") 
                .. "The item used in this macro doesn't have a trackable spell/aura.")
                ClearCursor()
            else
                Angleur_SlottedExtraItems[parentKey].macroSpellID = spellID
                local itemID = C_Item.GetItemIDForItemInfo(itemName)
                Angleur_SlottedExtraItems[parentKey].macroItemID = itemID
                checkForHats(itemID)
                if C_Item.IsEquippableItem(itemID) then
                    local itemInfo = {C_Item.GetItemInfo(itemID)}
                    Angleur_SlottedExtraItems[parentKey].equipLoc = typeToSlotID[itemInfo[9]]
                    Angleur_SlottedExtraItems[parentKey].forceEquip = true
                end
                local _, zarinku = C_Item.GetItemInfo(Angleur_SlottedExtraItems[parentKey].macroItemID)
                Angleur_BetaPrint("spell link of macro item: " .. C_Spell.GetSpellLink(Angleur_SlottedExtraItems[parentKey].macroSpellID))
            end
        else
            print(colorBlu:WrapTextInColorCode("Angleur: ") .. "Failed to get macro spell/item. If you are using " .. colorYellow:WrapTextInColorCode("macro conditions \n") .. 
            "you need to drag the macro into the button frame when the conditions are met.")
            ClearCursor()
            return
        end
    else
        print("Failed to get macro index")
        return
    end
    Angleur_SlottedExtraItems[parentKey].macroName, Angleur_SlottedExtraItems[parentKey].macroIcon, Angleur_SlottedExtraItems[parentKey].macroBody = GetMacroInfo(macroIndex)
    local body = GetMacroBody(macroIndex)

    Angleur_SlottedExtraItems[parentKey].macroBody = body
    if Angleur_SlottedExtraItems[parentKey].macroBody == "" then
        print("Macro empty")
    else
        print(colorBlu:WrapTextInColorCode("Angleur: ") .. "Macro successfully slotted. If you make changes to it, you need to " .. colorYellow:WrapTextInColorCode("re-drag ") .. "the new version to the slot. You can also delete the macro to save space, Angleur will remember it.")
    end
    Angleur_LoadExtraItems(self:GetParent())
end

function Angleur_FillEditBox(self)
    local number = self:GetNumber()
    if number > 10 then return end
    self:SetCursorPosition(0)
    self:Insert(0)
    if number > 0 then return end
    self:SetCursorPosition(0)
    self:Insert(0)
end
function Angleur_GetTimeFromBox(self)
    local keyOfGrandGrandParent = self:GetParent():GetParent():GetParentKey()
    Angleur_SlottedExtraItems[keyOfGrandGrandParent].delay = self.minutes:GetNumber() * 60 + self.seconds:GetNumber()
    print("Timer set to: ", math.floor(Angleur_SlottedExtraItems[keyOfGrandGrandParent].delay/60), " minutes, ", Angleur_SlottedExtraItems[keyOfGrandGrandParent].delay%60, " seconds")
end

local function startTimer_ItemOrMacro(self, event, unit, ...)
    local arg4, arg5 = ...
    if event == "UNIT_SPELLCAST_SUCCEEDED" and unit == "player" then
        for i, slot in pairs(Angleur_SlottedExtraItems) do
            if slot.spellID == arg5 or slot.macroSpellID == arg5 then
                slot.lastUsed = GetTime()
                Angleur_BetaPrint(i, "delay timer starting")
                return
            end
        end
    end
end

local timerFrame = CreateFrame("Frame")
timerFrame:SetScript("OnEvent", startTimer_ItemOrMacro)
timerFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")



--BAIT STUFF, NOT USED IN THE RETAIL VERSION
--[[

angleurItems = {
    baitPossibilities = {
        {itemID = 111111}, 
        {name= "Shiny Bauble", itemID = 6529, icon = 134335},
        {itemID = 222222},
        {name = "Nightcrawlers", itemID = 6530, icon = 134324},
        {itemID = 333333},
        --{name = "Aquadynamic Fish Lens", itemID = 6811, icon = 134440},
        {name = "Bright Baubles", itemID = 6532, icon = 134139},
        {name = "Flesh Eating Worm", itemID = 7307, icon = 134324},
        {name = "Aquadynamic Fish Attractor", itemID = 6533, icon = 133982},
        {name = "Feathered Lure", itemID = 62673, icon = 135992},
        {name = "Sharpened Fish Hook", itemID = 34861, icon = 134226},
        {name = "Glow Worm", itemID = 46006, icon = 237147},
        {name = "Heat-Treated Spinning Lure", itemID = 68049, icon = 135811}
    },
    --baitPossibilities = {{itemID = 111111, spellID = 111111}, {itemID = 222222, spellID = 222222}, {itemID = 333333, spellID = 333333}} --filled with fake items for testing purposes, normally quoted out
    ownedBait = {},
    selectedBaitTable = {name = 0, itemID = 0, icon = 0, hasItem = false, loaded = false, dropDownID = 0}
}


function Angleur_LoadItems()
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
]]