local T = Angleur_Translate

local debugChannel = 3
local colorDebug = CreateColor(1, 0.41, 0) -- orange

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorRed = CreateColor(1, 0, 0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)

-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.extraItems = {}

local mistsItems = ang.mists.items
local gameVersion = ang.gameVersion

local items_registry = CreateFromMixins(CallbackRegistryMixin)
items_registry:OnLoad()
items_registry:SetUndefinedEventsAllowed(true)

Angleur_SlottedExtraItems = {
    [1] = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0, 
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUpdateTime = 0, remainingTime = 0, delayOffset = 0,
        equipLoc = 0, forceEquip = false
    },
    [2] = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0,
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUpdateTime = 0, remainingTime = 0, delayOffset = 0,
        equipLoc = 0, forceEquip = false
    },
    [3] = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0,
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUpdateTime = 0, remainingTime = 0, delayOffset = 0,
        equipLoc = 0, forceEquip = false
    }
}

-- Used throughout the entire file, initialized during Angleur_LoadExtraItems() - can't initialize here because Angleur.xml hasn't happened yet :)
local extraItemsFrame

ang.extraItems.slotCount = 3
local slotCount = ang.extraItems.slotCount
local function _initializeSavedItems()
    if ang.loadedPlugins.niche and AngleurNicheOptions_UI.checkboxes[1].moreItems == true then
        ang.extraItems.slotCount = 6
        slotCount = 6
    end
    for i=1, slotCount, 1 do
        if not Angleur_SlottedExtraItems[i] or type(Angleur_SlottedExtraItems[i]) ~= "table" then
            Angleur_SlottedExtraItems[i] = {}
        end
        local slot = Angleur_SlottedExtraItems[i]
        if not slot.name then slot.name = 0 end
        if not slot.itemID then slot.itemID = 0 end
        if not slot.spellID then slot.spellID = 0 end
        if not slot.icon then slot.icon = 0 end
        if not slot.mightHaveAura then slot.mightHaveAura = false end
        if not slot.auraEffectDuration then slot.auraEffectDuration = 0 end
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
        if not slot.delayOffset then slot.delayOffset = 0 end
        if not slot.equipLoc then slot.equipLoc = 0 end
        if not slot.forceEquip then slot.forceEquip = false end
    end
    if not ang.loadedPlugins.niche or not AngleurNicheOptions_UI.checkboxes[1].moreItems then
        for i=4, 6, 1 do
            Angleur_SlottedExtraItems[i] = nil
        end
    end
end



-- ********************************************************* [1] *********************************************************
-- ************************************************* UI Setup & Updating *************************************************
-- ********** Mostly contained within items_base, functions relating to loading and updating of the UI Elements **********
-- ********************************************************* [1] *********************************************************
local EDITBOX_DIGITWIDTH = 8
local function _calculateSteps(seconds)
    if seconds > 10 then return 5 end
    return 1
end
local function handleMoreAdjustmentsForSlot(slotFrame, slot)
    local collapseFrame = slotFrame.collapseFrame
    local popup = collapseFrame.popup
    local delayOffsetSlider = popup.delayOffsetSlider

    if slot.delay ~= 0 then
        slot.delayOffset = 0
        popup:Hide()
        collapseFrame:Hide()
        delayOffsetSlider:ReAdjust(0, 0, 0, "sec")
        delayOffsetSlider:SetDesaturated(false)
    elseif slot.mightHaveAura then
        collapseFrame:Show()
        if slot.auraEffectDuration ~= 0 then
            local boxDigitCount = tonumber(string.len(tostring(slot.auraEffectDuration)))
            if boxDigitCount < 3 then boxDigitCount = 3 end
            -- Why linearSizeScaler? Needs bigger size increase as count increases, so we can't just change EDITBOX_DIGITWIDTH
            local linearSizeScaler = boxDigitCount - 2
            delayOffsetSlider.editBox:SetWidth(boxDigitCount * EDITBOX_DIGITWIDTH + linearSizeScaler)
            delayOffsetSlider:ReAdjust(math.floor(-slot.auraEffectDuration), 0, _calculateSteps(slot.auraEffectDuration), "sec")
            delayOffsetSlider:SetDesaturated(false)
        else
            delayOffsetSlider:ReAdjust(-1, 0, 1, "sec")
            delayOffsetSlider:SetDesaturated(true)
        end
    else
        slot.delayOffset = 0
        popup:Hide()
        collapseFrame:Hide()
        delayOffsetSlider:ReAdjust(0, 0, 0, "sec")
        delayOffsetSlider:SetDesaturated(false)
    end
end


local function minSecEditBoxes_onSaveCallback(editBoxes, value, slot)
    -- DevTools_Dump(slot)
    slot.lastUpdateTime = 0
    slot.remainingTime = 0
    print(T["Timer set to: "], math.floor(value/60), T[" minutes, "], value%60, T[" seconds"])
    local timeButton = editBoxes:GetParent()
    if not timeButton:IsMouseOver() and not editBoxes.tabbing then
        editBoxes:Hide()
    end
    Angleur_UpdateExtraItems()
end
local function delayOffset_onSaveCallback(slider, value, table)
    -- do nothing
end
-- Hook this to print out the chosen value when popup menu is hidden
local function popup_onHideHook(popupFrame)
    local slider = popupFrame.delayOffsetSlider
    local teeburu = slider.savedVarTable
    local value = teeburu[slider.reference]
    local name = teeburu.name
    if name == 0 then 
        name = teeburu.macroName
    end
    print(name, "will be recast when its aura has", colorYello:WrapTextInColorCode(math.abs(value)), "seconds left.")
end
function Angleur_ExtraItems_CreateSlots()
    local parentName = extraItemsFrame:GetDebugName()
    for i=1, slotCount, 1 do
        extraItemsFrame[i] = CreateFrame("Button", parentName .. i, extraItemsFrame, "ExtraItemButtonTemplate")
        local frame = extraItemsFrame[i]
        frame:SetID(i)
        local timeButton = frame.timeButton
        timeButton.inputBoxes:SetScale(0.95)
        timeButton.inputBoxes.savedVarTable = Angleur_SlottedExtraItems[i]
        timeButton.inputBoxes.reference = "delay"
        timeButton.inputBoxes.onSaveCallback = minSecEditBoxes_onSaveCallback
        timeButton.inputBoxes:Init()
        local delayOffsetSlider = frame.collapseFrame.popup.delayOffsetSlider
        delayOffsetSlider.showEditBox = true
        delayOffsetSlider.savedVarTable = Angleur_SlottedExtraItems[i]
        delayOffsetSlider.reference = "delayOffset"
        delayOffsetSlider.onSaveCallback = delayOffset_onSaveCallback
        delayOffsetSlider.privateRegistry = items_registry
        delayOffsetSlider.privateRegistryString = extraItemsFrame[i].collapseFrame.popup:GetDebugName() .. "DelayOffsetChanged"
        delayOffsetSlider.disabledMessage = "Activate the Aura once to enable."
        delayOffsetSlider.unitTextInvertSign = true
        delayOffsetSlider.unitTextRight = "seconds left"
        -- delayOffsetSlider.unitText:SetScale(0.95)
        delayOffsetSlider:Init(-100, 0, 5)
        local titleText =  delayOffsetSlider:CreateFontString(nil, "ARTWORK", "GameFontHighlightExtraSmall")
        titleText:SetPoint("BOTTOMLEFT", delayOffsetSlider, "TOPLEFT", 0, 6)
        titleText:SetText("Reapply Aura when")
        titleText:SetScale(0.95)
        local popup = frame.collapseFrame.popup
        popup:HookScript("OnHide", popup_onHideHook)
        local expandButton = frame.collapseFrame.expandButton
        expandButton.tooltipTitleText = "Aura Adjustments"
        expandButton.tooltipBodyText = colorGrae:WrapTextInColorCode("\nOnly works with Capturable Auras.\nDoes NOT work with Delay Timers")
        expandButton.tooltipAnchorTable = {[1] = "ANCHOR_BOTTOMLEFT", [2]= 0, [3] = 12}
        expandButton:GetNormalTexture():SetTexture("Interface/AddOns/Angleur/images/apluscollapse.png")
	    expandButton:GetHighlightTexture():SetTexture("Interface/AddOns/Angleur/images/apluscollapse.png")
        if slotCount == 6 then
            frame:SetPoint("LEFT", extraItemsFrame, "LEFT", 18 + 54*(i - 1), 15)
            frame:SetScale(0.85)
            frame.closeButton:SetScale(0.85)
            timeButton:SetScale(0.95)
        else
            frame:SetPoint("LEFT", extraItemsFrame, "LEFT", 35 + 90*(i - 1), 15)
        end
    end
end

function Angleur_UpdateExtraItems()
    for i=1, slotCount, 1 do
        local slot = Angleur_SlottedExtraItems[i]
        local slotFrame = extraItemsFrame[i]
        slot.loaded = false
        --slotFrame.name = slot.name
        --slotFrame.spellID = slot.spellID
        if slot.name ~= 0 then
            slotFrame.itemID = slot.itemID
            slotFrame.icon:SetTexture(slot.icon)
            slotFrame.closeButton:Show()
            slotFrame.Name:SetText(nil)
            slotFrame.timeButton:Show()
            local item = Item:CreateFromItemID(slot.itemID)
            item:ContinueOnItemLoad(function()
                slot.loaded = true
                print("Extra item loaded: ", item:GetItemLink())
            end)
        elseif slot.macroName ~= 0 then
            slotFrame.icon:SetTexture(slot.macroIcon)
            slotFrame.closeButton:Show()
            slotFrame.Name:SetText(slot.macroName)
            slotFrame.timeButton:Show()
        else
            slotFrame.itemID = nil
            slotFrame.icon:SetTexture(nil)
            slotFrame.closeButton:Hide()
            slotFrame.Name:SetText(nil)
            slotFrame.timeButton:Hide()
        end
        handleMoreAdjustmentsForSlot(slotFrame, slot)
    end
end

function Angleur_LoadExtraItems()
    extraItemsFrame = Angleur.configPanel.tab2.contents.extraItems
    _initializeSavedItems()
    local gameVersion = Angleur_CheckVersion()
    Angleur_ExtraItems_CreateSlots()
    if gameVersion == 2 or gameVersion == 3 then
        mistsItems:AdjustCloseButton(extraItemsFrame)
    end
    Angleur_UpdateExtraItems()
end

function Angleur_RemoveExtraItem(self)
    local parent = self:GetParent()
    local parentID = parent:GetID()
    local slot = Angleur_SlottedExtraItems[parentID]
    --if slot.name == 0 then error("Angleur ERROR: Trying to remove extra item, but it is already removed.") end
    slot.name = 0
    slot.itemID = 0
    slot.spellID = 0
    slot.icon = 0
    slot.mightHaveAura = false
    slot.auraEffectDuration = 0
    slot.auraActive = false
    slot.loaded = false
    slot.macroName = 0
    slot.macroIcon = 0
    slot.macroBody = 0
    slot.macroSpellID = 0
    slot.macroItemID = 0
    slot.delay = 0
    slot.lastUpdateTime = 0
    slot.remainingTime = 0
    slot.delayOffset = 0
    if slot.equipLoc ~= 0 then
        slot.equipLoc = 0
        print(T["Unslotted " .. colorBlu:WrapTextInColorCode("Angleur ") 
        .. colorYello:WrapTextInColorCode("Equipment Set ") 
        .. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it."])
    end
    slot.forceEquip = false
    local grandParent = parent:GetParent()

    Angleur_UpdateExtraItems()
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

local function checkAuraPossibility(spellID)
    if C_Spell.IsSpellHelpful(spellID) or C_Spell.IsSelfBuff(spellID) then return true end
    return false
end
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
    local isRestricted, restrictedTypes = Angleur_IsAddonSecretRestrictedForTypes("Combat", "Encounter", "ChallengeModes", "PvPMatch", "Map")
    if isRestricted then 
        print(T["Can't drag item due to restrictions:"])
        DevTools_Dump(restrictedTypes)
        return
    end
    local itemLoc = C_Cursor.GetCursorItem()
    local itemID = C_Item.GetItemID(itemLoc)
    local link = C_Item.GetItemLink(itemLoc)
    local itemInfo = {C_Item.GetItemInfo(itemID)}
    
    --___________ The warning for Sharpened Tuskarr Spear for MoP ___________
    --         Suggests downloading the Angleur_NicheOptions Plugin
    --_______________________________________________________________________
    if gameVersion == 2 and itemID == 88535 then
        print(" ")
        print(" ")
        print(" ")
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Sharpened Tuskarr Spear(MoP)") .. " detected."])
        print(T["Due to the fishing rod taking up the mainhand slot in Classic, this item cannot be added to the Auto-Equip System."])
        print(T["Please download the: "])
        print(colorGrae:WrapTextInColorCode("      _____________________"))
        print(colorGrae:WrapTextInColorCode("     I"))
        print(colorYello:WrapTextInColorCode("        \'Angleur_NicheOptions\'"))        
        print(colorGrae:WrapTextInColorCode("      _____________________I"))
        print(" ")
        print(T[" plugin from Curseforge if you want Angleur to use it for you."])
        ClearCursor()
        return
    end
    --_______________________________________________________________________
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
    local ID = self:GetID()
    local slot = Angleur_SlottedExtraItems[ID]
    slot.itemID = itemID
    slot.name = name
    slot.icon = icon
    slot.spellID = spellID    
    slot.mightHaveAura = checkAuraPossibility(spellID)
    if C_Item.IsEquippableItem(itemID) then
        slot.equipLoc = typeToSlotID[itemInfo[9]]
        slot.forceEquip = true
    end
    --print(itemID)
    --DevTools_Dump(C_Item.GetItemInventoryType(itemLoc))
    --DevTools_Dump(GetItemInteractionInfo(itemLoc))
    checkForHats(itemID)
    Angleur_UpdateExtraItems()
end

function Angleur_GrabCursorMacro(self, macroIndex)
    if InCombatLockdown() then
        ClearCursor()
        print(T["Can't drag macro in combat."])
        return
    end
    local isRestricted, restrictedTypes = Angleur_IsAddonSecretRestrictedForTypes("Combat", "Encounter", "ChallengeModes", "PvPMatch", "Map")
    if isRestricted then 
        print(T["Can't drag macro due to restrictions:"])
        DevTools_Dump(restrictedTypes)
        return
    end
    local ID = self:GetID()
    local slot = Angleur_SlottedExtraItems[ID]
    Angleur_RemoveExtraItem(self.closeButton)
    if macroIndex then 
        local spellID = GetMacroSpell(macroIndex)
        local itemName, itemLink = GetMacroItem(macroIndex)
        if spellID then
            slot.macroSpellID = spellID
            print(T["link of macro spell: "] .. C_Spell.GetSpellLink(slot.macroSpellID))
        elseif itemName then
            print(T["link of macro item: "], itemLink)
            local _, spellID = C_Item.GetItemSpell(itemName)
            if spellID == nil then
                print(T[colorYello:WrapTextInColorCode("Can't use Macro: ") 
                .. "The item used in this macro doesn't have a trackable spell/aura."])
                ClearCursor()
            else
                slot.macroSpellID = spellID
                local itemID = C_Item.GetItemIDForItemInfo(itemName)
                slot.macroItemID = itemID
                checkForHats(itemID)
                if C_Item.IsEquippableItem(itemID) then
                    local itemInfo = {C_Item.GetItemInfo(itemID)}
                    slot.equipLoc = typeToSlotID[itemInfo[9]]
                    slot.forceEquip = true
                end
                local _, zarinku = C_Item.GetItemInfo(slot.macroItemID)
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_GrabCursorMacro ") .. ": spell link of macro item: " .. C_Spell.GetSpellLink(slot.macroSpellID))
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
    slot.mightHaveAura = checkAuraPossibility(slot.macroSpellID)
    slot.macroName, slot.macroIcon, slot.macroBody = GetMacroInfo(macroIndex)
    local body = GetMacroBody(macroIndex)

    slot.macroBody = body
    if slot.macroBody == "" then
        print(T["Macro empty"])
    else
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Macro successfully slotted. If you make changes to it, you need to " 
        .. colorYello:WrapTextInColorCode("re-drag ") .. "the new version to the slot. You can also delete the macro to save space, Angleur will remember it."])
    end
    ClearCursor()
    Angleur_UpdateExtraItems()
end



local function _startDelayTimerIfHasDelay(slot, indexForPrint)
    if slot.delay == 0 or slot.delay == nil then return end
    slot.lastUpdateTime = math.floor(GetTime())
    slot.remainingTime = slot.delay
    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_GrabCursorMacro ") .. ": ", "Slot [" .. indexForPrint .. "]", "delay timer starting, remaining time set to: ", slot.delay)
end
local function items_Events(self, event, unit, ...)
    local arg4, arg5 = ...
    if ang.gameVersion == 1 then
        if issecretvalue(unit) or issecretvalue(arg4) or issecretvalue(arg5) then return end
    end
    if event == "UNIT_SPELLCAST_SUCCEEDED" and unit == "player" then
        for i=1, slotCount, 1 do
            local slot = Angleur_SlottedExtraItems[i]
            if slot.spellID == arg5 or slot.macroSpellID == arg5 then
                _startDelayTimerIfHasDelay(slot, i)
                -- Returning here will cause the slots that have the same spellID to be ignored
                -- Commenting for now despite it improving performance(though infinitesimal), 
                -- even if it is unlikely that the same spell will be slotted two times
                -- return
            end
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        if unit == false and arg4 == false then return end
        -- Set extra itemslast update time to when player loads in, so the countdowns can resume properly
        local timeNow = math.floor(GetTime())
        for i=1, slotCount, 1 do
            local slot = Angleur_SlottedExtraItems[i]
            if slot and slot.delay ~= 0 and slot.delay ~= nil and slot.lastUpdateTime ~= 0 and slot.lastUpdateTime ~= nil then
                slot.lastUpdateTime = timeNow
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("items_Events: ") .. ": force reset last uptade time due to reload: [" .. slot.name .. "]", slot.remainingTime)
            end
        end
    end
end
local timerFrame = CreateFrame("Frame")
timerFrame:SetScript("OnEvent", items_Events)
timerFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
timerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
-- ********************************************************* [1] *********************************************************





-- ************************************************************* [2] *************************************************************
-- *********************************************** Functions Called By Angleur.lua ***********************************************
-- ***  Called directly from Angleur.lua(or AngleurVanilla etc), used in determining what actions to take regarding ExtraItems ***
-- ************************************************************* [2] *************************************************************

-- Originally located in Angleur.lua, needed for Angleur_ActionHandler_ExtraItems here as well
local function _SetOverrideBindingClick_Custom(owner, isPriority, key, buttonName)
    if not key then return end
    SetOverrideBindingClick(owner, isPriority, key, buttonName)
end

local function getNonSecretActiveAuraDataFromSlot(slot)
    local spellAuraID
    if slot.spellID ~= 0 then
        spellAuraID = slot.spellID
    elseif slot.macroSpellID ~= 0 then
        spellAuraID = slot.macroSpellID
    end
    if not spellAuraID then return end
    local name = Angleur_ScrubSecret(C_Spell.GetSpellInfo(spellAuraID).name)
    if not name then return end
    -- Can't get auraData from SpellID, have to have name
    local auraData = C_UnitAuras.GetAuraDataBySpellName("player", name)
    if not auraData or Angleur_IsSecret(auraData) then return end
    -- return spellAuraID as well, as it's needed for print in ExtraItems_Auras
    return auraData, spellAuraID
end

local debug_pauseTable = {
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
    [6] = false,
}
local function _debug_pauseSlot(indexForPrint)
    debug_pauseTable[indexForPrint] = true
end
local function _debug_unPauseSlot(indexForPrint)
    debug_pauseTable[indexForPrint] = false
end
local function _debug_printSlotWithoutSpam(indexForPrint, ...)
    if debug_pauseTable[indexForPrint] == true then return end
    Angleur_BetaPrint(debugChannel, ...)
end
local function _checkAuraAndAuraOffsetDelay(slot, indexForPrint)
    -- if slot.auraActive == true then return false end
    --doesn't work -> print("Non passive: ", C_UnitAuras.GetPlayerAuraBySpellID(spellAuraID))
    local auraData = getNonSecretActiveAuraDataFromSlot(slot)
    if not auraData then
--        ┌────────────────┐                
--        │   DEBUG ONLY   │ When no aura of the slot -> Reset debug pause, we can print the next application
--   ┌────└────────────────┘───────────────┐
        _debug_unPauseSlot(indexForPrint)
--   └─────────────────────────────────────┘ 
        return false
    end
    local delayOffset = slot.delayOffset
    if delayOffset == 0 then return true end
    local expirationTime = auraData.expirationTime
    -- Aura is clearly active because aura data exists, but we can't get expiration time.
    -- We return true, meaning aura is active. When only expiry is secret, behave like there is no offsetDelay
    if not expirationTime or Angleur_IsSecret(expirationTime) then return true end
    local timeNow = GetTime()
    local untilExpiry = expirationTime - timeNow
    -- delayOffset is always negative, hence the +
    local offsettedExpiry = untilExpiry + delayOffset
--                                                            ┌────────────────┐                                                                
--                                                            │   DEBUG ONLY   │                                                                
--┌───────────────────────────────────────────────────────────└────────────────┘───────────────────────────────────────────────────────────────┐
    _debug_printSlotWithoutSpam(indexForPrint, "\n")
    _debug_printSlotWithoutSpam(indexForPrint, colorDebug:WrapTextInColorCode("---------------------------------------------------------"))
    _debug_printSlotWithoutSpam(indexForPrint, colorDebug:WrapTextInColorCode("     Slot [" .. indexForPrint .. "]") .. " - " ..slot.name)
    _debug_printSlotWithoutSpam(indexForPrint, "   expiration time: ", auraData.expirationTime)
    _debug_printSlotWithoutSpam(indexForPrint, "   time now: ", timeNow)
    _debug_printSlotWithoutSpam(indexForPrint, "   untilExpiry:", untilExpiry)
    _debug_printSlotWithoutSpam(indexForPrint, "   delay offset:", delayOffset)
    _debug_printSlotWithoutSpam(indexForPrint, "   ofsettedExpiry:", offsettedExpiry, "seconds.")
    _debug_printSlotWithoutSpam(indexForPrint, colorDebug:WrapTextInColorCode("---------------------------------------------------------"))
    _debug_printSlotWithoutSpam(indexForPrint, "\n")
    _debug_pauseSlot(indexForPrint)
--└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ 
    if offsettedExpiry <= 0 then return false end
    return true
end
local function _checkUsabilityItem(itemID)
    if not Angleur_ScrubSecret(C_Item.IsUsableItem(itemID)) then return false end
    local _, cooldown = Angleur_ScrubSecret(C_Container.GetItemCooldown(itemID))
    if cooldown ~= 0 then return false end
    local itemCount = Angleur_ScrubSecret(C_Item.GetItemCount(itemID))
    -- not (itemCount > 0) --> if item count is bigger than 0: false(aka do not return, keep going. We're good.)
    if not itemCount or not (itemCount > 0) then return false end
    local equippable = Angleur_ScrubSecret(C_Item.IsEquippableItem(itemID))
    -- If we can't query equipability due to secrecy or the query function returning nil --> item not usable(return false)
    if equippable == nil then return false end
    -- If equippable == true(without secrecy) --> if item ISN'T equipped/can't query equipped due to secrecy --> item not usable right now(return false)
    if equippable == true then
        if not Angleur_ScrubSecret(C_Item.IsEquippedItem(itemID)) then return false end
    end
    return true
end
-- 1) No Conditionals --> return true
-- 2) 1 or More Conditionals, at least 1 is non-secret and true --> return true
-- 3) 1 or More Conditionals, ALL are false or secret --> return false
local function _parseAndCheckMacroConditionals(macroBody)
    local returnValue = true
    for conditionBracket in string.gmatch (macroBody, "(%[.-%])") do
        -- If successful even once, return true early
        if Angleur_ScrubSecret(SecureCmdOptionParse(conditionBracket)) ~= nil then
            -- print("Condition Won: ", conditionBracket)
            return true
        -- If it fails ALL attempts, only then will we return false at the end of the function
        else
            -- print("Condition Failed: ", conditionBracket)
            returnValue = false
        end
    end
    -- If loop doesn't happen due to no matches, it will automatically default to true
    return returnValue
end
local function _checkAvailabilityOfSlotItem(self, slot, assignKey, indexForPrint)
    if slot.delay ~= 0 and slot.delay ~= nil then
        if slot.remainingTime ~= 0 then return false end
    end
    if slot.name ~= 0 then
        if _checkUsabilityItem(slot.itemID) == false then return false end
        if _checkAuraAndAuraOffsetDelay(slot, indexForPrint) == true then return false end
        _SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
        self.toyButton:SetAttribute("macrotext", "/cast " .. slot.name)
        self.visual.texture:SetTexture(slot.icon)
        return true
    elseif slot.macroName ~= 0 then
        if slot.macroBody == "" then return false end
        if slot.macroSpellID == 0 then return false end
        -- Don't necessarily have top return false if there is no macroItemID. The macro can just have a spell instead
        if slot.macroItemID ~= 0 and slot.macroItemID ~= nil then
            if _checkUsabilityItem(slot.macroItemID) == false then return false end
        end
        local spellExists = Angleur_ScrubSecret(C_Spell.DoesSpellExist(slot.macroSpellID))
        if not spellExists then return false end
        local spellUsable = Angleur_ScrubSecret(C_Spell.IsSpellUsable(slot.macroSpellID))
        if not spellUsable then return false end
        local spellCooldownInfo = Angleur_ScrubSecret(C_Spell.GetSpellCooldown(slot.macroSpellID))
        if not spellCooldownInfo then return false end
        local spellCooldownDuration = Angleur_ScrubSecret(spellCooldownInfo.duration)
        if not spellCooldownDuration then return false end
        if spellCooldownDuration ~= 0 then return false end
        if _checkAuraAndAuraOffsetDelay(slot, indexForPrint) == true then return false end
        if _parseAndCheckMacroConditionals(slot.macroBody) == false then return false end
        _SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
        self.toyButton:SetAttribute("macrotext", slot.macroBody)
        self.visual.texture:SetTexture(slot.macroIcon)
        return true
    end
end
function Angleur_ActionHandler_ExtraItems(self, assignKey)
    local returnValue = false
    for i=1, ang.extraItems.slotCount, 1 do
        if _checkAvailabilityOfSlotItem(self, Angleur_SlottedExtraItems[i], assignKey, i) == true then return true end
    end
    return returnValue
end

local function _grabAuraDurationOnFirstApplication(slot, auraData, indexForPrint)
    if not slot.mightHaveAura then return end
    if slot.auraEffectDuration ~= 0 then return end
    if InCombatLockdown() then return end
    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("_grabAuraDurationOnFirstApplication ") .. ": ", "Slot [" .. indexForPrint .. "]", "Aura Data:", auraData)
    -- auraData has "neverSecret" compontents, so we can index it without checking for IsSecret on it
    local duration = auraData.duration
    if Angleur_IsSecret(duration) then return end
    if duration and duration > 0 then
        slot.auraEffectDuration = duration
    else
        slot.mightHaveAura = false
    end
    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("_grabAuraDurationOnFirstApplication ") .. ": ", "Slot [" .. indexForPrint .. "]", "Aura Duration:", duration)
    Angleur_UpdateExtraItems()
end
function Angleur_ExtraItems_Auras()
    for i=1, ang.extraItems.slotCount, 1 do
        local slot = Angleur_SlottedExtraItems[i]
        slot.auraActive = false
        local auraData, spellAuraID = getNonSecretActiveAuraDataFromSlot(slot)
        if auraData then
            slot.auraActive = true
            -- should not need to do secret check because it's only used for print and no logic
            local link = C_Spell.GetSpellLink(spellAuraID)
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_ExtraItems_Auras ") .. ": Slotted item/macro aura is active:", link)
            _grabAuraDurationOnFirstApplication(slot, auraData, i)
        end
    end
end

local function _clearCountdown(slot)
    slot.lastUpdateTime = 0
    slot.remainingTime = 0
end
function Angleur_ExtraItems_UpdateItemsCountDown(resetUpdateTime)
    for i=1, slotCount, 1 do
        local slot = Angleur_SlottedExtraItems[i]
        if slot.delay ~= 0 and slot.delay ~= nil and slot.lastUpdateTime ~= 0 and slot.lastUpdateTime ~= nil then      
            -- better to call GetTime() inside the if clause since most users will only have 1 timered item if any at all - instead of outside the for loop
            --                  
            -- _________________________!!! FIX TO THE PREVIOUS BUG !!!__________________________
            -- I used to floor(timeNow - slot.lastUpdateTime) instead of flooring timeNow itself
            -- which caused the timer to be slower approx 0.8x slower than real time
            -- __________________________________________________________________________________
            local timeNow = math.floor(GetTime())
            local timePassedSince = timeNow - slot.lastUpdateTime
            if timePassedSince < 0 or not timePassedSince then
                print("Timer update has went to negative or nil, please inform the addon author: ", timePassedSince)
                _clearCountdown(slot)
            elseif timePassedSince == 0 then
                -- do nothing
            elseif timePassedSince > 0 then
                slot.remainingTime = slot.remainingTime - timePassedSince
                slot.lastUpdateTime = timeNow
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_ExtraItems_UpdateItemsCountDown ") .. ": Remaining time for: [" .. slot.name .. "]", slot.remainingTime)
            end
            if slot.remainingTime <= 0 then
                _clearCountdown(slot)
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_ExtraItems_UpdateItemsCountDown ") .. ": Timer ran out, usable again: ", C_Spell.GetSpellLink(slot.spellID))
            end
        end
    end
end
-- ************************************************************* [2] *************************************************************