local T = Angleur_Translate
local colorDebug = CreateColor(1, 0.41, 0) -- orange
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorRed = CreateColor(1, 0, 0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)

local cata = AngleurItemsCata

Angleur_SlottedExtraItems = {
    first = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0, 
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUpdateTime = 0, remainingTime = 0,
        equipLoc = 0, forceEquip = false
    },
    second = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0,
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUpdateTime = 0, remainingTime = 0,
        equipLoc = 0, forceEquip = false
    },
    third = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0,
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUpdateTime = 0, remainingTime = 0,
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
        if not slot.lastUpdateTime then slot.lastUpdateTime = 0 end
        if not slot.remainingTime then slot.remainingTime = 0 end
        if not slot.equipLoc then slot.equipLoc = 0 end
        if not slot.forceEquip then slot.forceEquip = false end
    end
end

function Angleur_LoadExtraItems(self)
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 2 or gameVersion == 3 then
        cata:AdjustCloseButton(self)
    end
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
    Angleur_SlottedExtraItems[keyofParent].lastUpdateTime = 0
    Angleur_SlottedExtraItems[keyofParent].remainingTime = 0
    if Angleur_SlottedExtraItems[keyofParent].equipLoc ~= 0 then
        Angleur_SlottedExtraItems[keyofParent].equipLoc = 0
        print(T["Unslotted " .. colorBlu:WrapTextInColorCode("Angleur ") 
        .. colorYello:WrapTextInColorCode("Equipment Set ") 
        .. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it."])
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
    [88710] = T["Nat's Hat"],
    [117405] = T["Nat's Drinking Hat"],
    [33820] = T["Weather-Beaten Fishing Hat"],
}
local function checkForHats(itemID)
    if warningHats[itemID] ~= nil then
        print(" ")
        print(" ")
        print(" ")
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Fishing Hat") .. " detected."])
        print(T["For it to work properly, please make sure to add it as a macro like so: "])
        print(colorGrae:WrapTextInColorCode("      _____________________"))
        print(colorGrae:WrapTextInColorCode("     I"))
        print("        /use " .. warningHats[itemID])
        if Angleur_CheckVersion(1) then
            print("        /use 28")
        elseif Angleur_CheckVersion(2) or Angleur_CheckVersion(3) then
            print("        /use 16")
        end
        
        print(colorGrae:WrapTextInColorCode("      _____________________I"))
        print(" ")
        print(T["Otherwise, you will have to manually target your fishing rod every time."
        .. "If you want to see an example of how to slot macros, click the " 
        ..  colorRed:WrapTextInColorCode("[HOW?] ") .. "button on the " 
        .. colorYello:WrapTextInColorCode("Extra Tab")])
    end
end
function Angleur_GrabCursorItem(self)
    if InCombatLockdown() then
        ClearCursor()
        print(T["Can't drag item in combat."])
        return
    end
    local itemLoc = C_Cursor.GetCursorItem()
    local itemID = C_Item.GetItemID(itemLoc)
    local link = C_Item.GetItemLink(itemLoc)
    local itemInfo = {C_Item.GetItemInfo(itemID)}
    if not C_Item.IsUsableItem(itemID) then
        print(T["Please select a usable item."])
        ClearCursor()
        return
    end
    local _, spellID = C_Item.GetItemSpell(itemID)
    if spellID == nil then
        print(T["This item does not have a castable spell."])
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
        print(T["Can't drag macro in combat."])
        return
    end
    local parentKey = self:GetParentKey()
    Angleur_RemoveExtraItem(self.closeButton)
    if macroIndex then 
        local spellID = GetMacroSpell(macroIndex)
        local itemName, itemLink = GetMacroItem(macroIndex)
        if spellID then
            Angleur_SlottedExtraItems[parentKey].macroSpellID = spellID
            print(T["link of macro spell: "] .. C_Spell.GetSpellLink(Angleur_SlottedExtraItems[parentKey].macroSpellID))
        elseif itemName then
            print(T["link of macro item: "], itemLink)
            local _, spellID = C_Item.GetItemSpell(itemName)
            if spellID == nil then
                print(T[colorYello:WrapTextInColorCode("Can't use Macro: ") 
                .. "The item used in this macro doesn't have a trackable spell/aura."])
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
                Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_GrabCursorMacro ") .. ": spell link of macro item: " .. C_Spell.GetSpellLink(Angleur_SlottedExtraItems[parentKey].macroSpellID))
            end
        else
            print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Failed to get macro spell/item. If you are using " 
            .. colorYello:WrapTextInColorCode("macro conditions \n") 
            .. "you need to drag the macro into the button frame when the conditions are met."])
            ClearCursor()
            return
        end
    else
        print(T["Failed to get macro index"])
        return
    end
    Angleur_SlottedExtraItems[parentKey].macroName, Angleur_SlottedExtraItems[parentKey].macroIcon, Angleur_SlottedExtraItems[parentKey].macroBody = GetMacroInfo(macroIndex)
    local body = GetMacroBody(macroIndex)

    Angleur_SlottedExtraItems[parentKey].macroBody = body
    if Angleur_SlottedExtraItems[parentKey].macroBody == "" then
        print(T["Macro empty"])
    else
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Macro successfully slotted. If you make changes to it, you need to " 
        .. colorYello:WrapTextInColorCode("re-drag ") .. "the new version to the slot. You can also delete the macro to save space, Angleur will remember it."])
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
    print(T["Timer set to: "], math.floor(Angleur_SlottedExtraItems[keyOfGrandGrandParent].delay/60), T[" minutes, "], Angleur_SlottedExtraItems[keyOfGrandGrandParent].delay%60, T[" seconds"])
end

local function clearCountdown(slot)
    slot.lastUpdateTime = 0
    slot.remainingTime = 0
end
function Angleur_UpdateItemsCountdown(resetUpdateTime)
    for i, slot in pairs(Angleur_SlottedExtraItems) do
        if slot.delay ~= 0 and slot.delay ~= nil and slot.lastUpdateTime ~= 0 and slot.lastUpdateTime ~= nil then      
            -- better to call GetTime() inside the if clause since most users will only have 1 timered item if any at all - instead of outside the for loop
            local timeNow = GetTime()
            local timePassedSince = math.floor(timeNow - slot.lastUpdateTime)
            if timePassedSince < 0 or not timePassedSince then
                print("Timer update has went to negative or nil, please inform the addon author: ", timePassedSince)
                clearCountdown(slot)
            elseif timePassedSince == 0 then
                -- do nothing
            elseif timePassedSince > 0 then
                slot.remainingTime = slot.remainingTime - timePassedSince
                slot.lastUpdateTime = timeNow
                Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_UpdateItemsCountdown ") .. ": Remaining time for: [" .. slot.name .. "]", slot.remainingTime)
            end
            if slot.remainingTime <= 0 then
                clearCountdown(slot)
                Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_UpdateItemsCountdown ") .. ": Timer ran out, usable again: ", C_Spell.GetSpellLink(slot.spellID))
            end
        end
    end
end

local function items_Events(self, event, unit, ...)
    local arg4, arg5 = ...
    if event == "UNIT_SPELLCAST_SUCCEEDED" and unit == "player" then
        for i, slot in pairs(Angleur_SlottedExtraItems) do
            if slot.delay ~= 0 and slot.delay ~= nil then
                if slot.spellID == arg5 or slot.macroSpellID == arg5 then
                    slot.lastUpdateTime = GetTime()
                    slot.remainingTime = slot.delay
                    Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_GrabCursorMacro ") .. ": ", i, "delay timer starting, remaining time set to: ", slot.delay)
                    return
                end
            end
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        if unit == false and arg4 == false then return end
        -- Set extra itemslast update time to when player loads in, so the countdowns can resume properly
        local timeNow = GetTime()
        for i, slot in pairs(Angleur_SlottedExtraItems) do
            if slot.delay ~= 0 and slot.delay ~= nil and slot.lastUpdateTime ~= 0 and slot.lastUpdateTime ~= nil then
                slot.lastUpdateTime = timeNow
                Angleur_BetaPrint(colorDebug:WrapTextInColorCode("items_Events: ") .. ": force reset last uptade time due to reload: [" .. slot.name .. "]", slot.remainingTime)
            end
        end
    end
end
local timerFrame = CreateFrame("Frame")
timerFrame:SetScript("OnEvent", items_Events)
timerFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
timerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")