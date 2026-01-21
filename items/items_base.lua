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

Angleur_SlottedExtraItems = {
    [1] = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0, 
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUpdateTime = 0, remainingTime = 0,
        equipLoc = 0, forceEquip = false
    },
    [2] = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0,
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUpdateTime = 0, remainingTime = 0,
        equipLoc = 0, forceEquip = false
    },
    [3] = {
        name = 0, itemID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false, macroName = 0,
        macroIcon = 0, macroBody = 0, macroSpellID = 0, macroItemID = 0, delay = 0, lastUpdateTime = 0, remainingTime = 0,
        equipLoc = 0, forceEquip = false
    }
}

ang.extraItems.slotCount = 3 
local slotCount = ang.extraItems.slotCount
function Angleur_ExtraItems_CreateSlots(self)
    local parentName = self:GetDebugName()
    if ang.loadedPlugins.niche and AngleurNicheOptions_UI.checkboxes[1].moreItems == true then
        ang.extraItems.slotCount = 6
        slotCount = 6
        for i=1, slotCount, 1 do
            self[i] = CreateFrame("Button", parentName .. i, self, "ExtraItemButtonTemplate")
            self[i]:SetPoint("LEFT", self, "LEFT", 18 + 54*(i - 1), 15)
            self[i]:SetID(i)
            self[i]:SetScale(0.85)
            self[i].timeButton:SetScale(0.85)
            self[i].closeButton:SetScale(0.85)
        end
    else
        for i=1, slotCount, 1 do
            self[i] = CreateFrame("Button", parentName .. i, self, "ExtraItemButtonTemplate")
            self[i]:SetPoint("LEFT", self, "LEFT", 35 + 90*(i - 1), 15)
            self[i]:SetID(i)
        end
    end
end

local function initializeSavedItems()
    for i=1, slotCount, 1 do
        if not Angleur_SlottedExtraItems[i] or type(Angleur_SlottedExtraItems[i]) ~= "table" then
            Angleur_SlottedExtraItems[i] = {}
        end
        local slot = Angleur_SlottedExtraItems[i]
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
    if not ang.loadedPlugins.niche or not AngleurNicheOptions_UI.checkboxes[1].moreItems then
        for i=4, 6, 1 do
            local slot = Angleur_SlottedExtraItems[i]
            if slot then slot = nil end
        end
    end
end

function Angleur_ExtraItems_Load(self)
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 2 or gameVersion == 3 then
        mistsItems:AdjustCloseButton(self)
    end
    initializeSavedItems()
    for i=1, slotCount, 1 do
        local slot = Angleur_SlottedExtraItems[i]
        local slotFrame = self[i]
        slot.loaded = false
        --slotFrame.name = slot.name
        --slotFrame.spellID = slot.spellID
        if slot.name ~= 0 then
            slotFrame.itemID = slot.itemID
            slotFrame.icon:SetTexture(slot.icon)
            slotFrame.closeButton:Show()
            slotFrame.Name:SetText(nil)
            slotFrame.timeButton:Show()
            if slot.delay ~= nil then
                slotFrame.timeButton.inputBoxes.minutes:SetNumber(math.floor(slot.delay / 60))
                slotFrame.timeButton.inputBoxes.seconds:SetNumber(slot.delay % 60)
                Angleur_FillEditBox(slotFrame.timeButton.inputBoxes.minutes)
                Angleur_FillEditBox(slotFrame.timeButton.inputBoxes.seconds)
            end
            local item = Item:CreateFromItemID(slot.itemID)
            item:ContinueOnItemLoad(function(self)
                slot.loaded = true
                --print("Extra item loaded: ", item:GetItemLink())
            end)
        elseif slot.macroName ~= 0 then
            slotFrame.icon:SetTexture(slot.macroIcon)
            slotFrame.closeButton:Show()
            slotFrame.Name:SetText(slot.macroName)
            slotFrame.timeButton:Show()
            if slot.delay ~= nil then
                slotFrame.timeButton.inputBoxes.minutes:SetNumber(math.floor(slot.delay / 60))
                slotFrame.timeButton.inputBoxes.seconds:SetNumber(slot.delay % 60)
                Angleur_FillEditBox(slotFrame.timeButton.inputBoxes.minutes)
                Angleur_FillEditBox(slotFrame.timeButton.inputBoxes.seconds)
            end
        else
            slotFrame.itemID = nil
            slotFrame.icon:SetTexture(nil)
            slotFrame.closeButton:Hide()
            slotFrame.Name:SetText(nil)
            slotFrame.timeButton:Hide()
        end
    end
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
    if slot.equipLoc ~= 0 then
        slot.equipLoc = 0
        print(T["Unslotted " .. colorBlu:WrapTextInColorCode("Angleur ") 
        .. colorYello:WrapTextInColorCode("Equipment Set ") 
        .. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it."])
    end
    slot.forceEquip = false
    local grandParent = parent:GetParent()

    Angleur_ExtraItems_Load(grandParent)
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
    if C_Item.IsEquippableItem(itemID) then
        slot.equipLoc = typeToSlotID[itemInfo[9]]
        slot.forceEquip = true
    end
    --print(itemID)
    --DevTools_Dump(C_Item.GetItemInventoryType(itemLoc))
    --DevTools_Dump(GetItemInteractionInfo(itemLoc))
    checkForHats(itemID)
    Angleur_ExtraItems_Load(self:GetParent())
end

function Angleur_GrabCursorMacro(self, macroIndex)
    if InCombatLockdown() then
        ClearCursor()
        print(T["Can't drag macro in combat."])
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
    Angleur_ExtraItems_Load(self:GetParent())
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
    local grandGrandParentID = self:GetParent():GetParent():GetID()
    local slot = Angleur_SlottedExtraItems[grandGrandParentID]
    slot.lastUpdateTime = 0
    slot.remainingTime = 0
    slot.delay = self.minutes:GetNumber() * 60 + self.seconds:GetNumber()
    print(T["Timer set to: "], math.floor(slot.delay/60), T[" minutes, "], slot.delay%60, T[" seconds"])
end


local function clearCountdown(slot)
    slot.lastUpdateTime = 0
    slot.remainingTime = 0
end
function Angleur_UpdateItemsCountdown(resetUpdateTime)
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
                clearCountdown(slot)
            elseif timePassedSince == 0 then
                -- do nothing
            elseif timePassedSince > 0 then
                slot.remainingTime = slot.remainingTime - timePassedSince
                slot.lastUpdateTime = timeNow
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_UpdateItemsCountdown ") .. ": Remaining time for: [" .. slot.name .. "]", slot.remainingTime)
            end
            if slot.remainingTime <= 0 then
                clearCountdown(slot)
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_UpdateItemsCountdown ") .. ": Timer ran out, usable again: ", C_Spell.GetSpellLink(slot.spellID))
            end
        end
    end
end

local function items_Events(self, event, unit, ...)
    local arg4, arg5 = ...
    if ang.gameVersion == 1 then
        if issecretvalue(unit) or issecretvalue(arg4) or issecretvalue(arg5) then return end
    end
    if event == "UNIT_SPELLCAST_SUCCEEDED" and unit == "player" then
        for i=1, slotCount, 1 do
            local slot = Angleur_SlottedExtraItems[i]
            if slot.delay ~= 0 and slot.delay ~= nil then
                if slot.spellID == arg5 or slot.macroSpellID == arg5 then
                    slot.lastUpdateTime = math.floor(GetTime())
                    slot.remainingTime = slot.delay
                    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_GrabCursorMacro ") .. ": ", i, "delay timer starting, remaining time set to: ", slot.delay)
                    return
                end
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