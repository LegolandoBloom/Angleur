---@diagnostic disable: cast-local-type, param-type-mismatch
local T = Angleur_Translate

-- 'ang' is the angleur namespace
local addonName, ang = ...

local debugChannel = 1
local colorDebug = CreateColor(0.24, 0.76, 1) -- angleur blue

local function SetOverrideBinding_Custom(owner, isPriority, key, command)
    if not key then return end
    SetOverrideBinding(owner, isPriority, key, command)
end

local function SetOverrideBindingClick_Custom(owner, isPriority, key, buttonName)
    if not key then return end
    SetOverrideBindingClick(owner, isPriority, key, buttonName)
end

local function SetOverrideBindingSpell_Custom(owner, isPriority, key, spell)
    if not key then return end
    SetOverrideBindingSpell(owner, isPriority, key, spell)
end


local erapusuThreshold = 0.3
local erapusuCounter = 0
function Angleur_OnUpdate(self, elapsed)
    erapusuCounter = erapusuCounter + elapsed
    if erapusuCounter < erapusuThreshold then
        return
    end
    Angleur_StuckFix()
    if InCombatLockdown() then return end
    if AngleurCharacter.sleeping then return end
    erapusuCounter = 0
    Angleur_ActionHandler(self)
end



--***********[~]**********
--**Events watcher that determines logic variables**
--***********[~]**********
local mounted = false
local swimming = false
local midFishing = false
local bobberWithinRange = false

local function CheckTable(table ,spell)
    local matchFound = false
    for i, value in pairs(table) do
        if spell == value then
            matchFound = true
            break
        end
    end
    return matchFound
end

local fishingPoleTable = AngleurVanilla_FishingPoleTable
function AngleurClassic_CheckFishingPoleEquipped()
    if not Angleur_TinyOptions.poleSleep then return end
    if InCombatLockdown() or UnitIsDeadOrGhost("player") then return end
    local itemLoc = ItemLocation:CreateFromEquipmentSlot(16)
    if not C_Item.DoesItemExist(itemLoc) then 
        AngleurCharacter.sleeping = true
        Angleur_SetSleep()
        Angleur_UnequipAngleurSet()
        return 
    end
    local id = C_Item.GetItemID(itemLoc)
    --local name = C_Item.GetItemName(itemLoc)
    --print(id, name)
    if CheckTable(fishingPoleTable, id)  then 
        if AngleurCharacter.sleeping == true then
            AngleurCharacter.sleeping = false
            Angleur_SetSleep()
            Angleur_EquipAngleurSet(true)
            if AngleurConfig.visualHidden == false then
                Angleur.visual:Show()
            end
        elseif AngleurCharacter.sleeping == false then

        end
    else
        AngleurCharacter.sleeping = true
        Angleur_SetSleep()
        Angleur_UnequipAngleurSet()
    end
end

local function isChosenKeyDown()
    if AngleurConfig.chosenMethod == "doubleClick"  then
        if not AngleurConfig.doubleClickChosenID then
            return false
        elseif IsKeyDown(angleurDoubleClick.iDtoButtonName[AngleurConfig.doubleClickChosenID]) then
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("isChosenKeyDown ") .. ": mouse held")
            return true
        end
    elseif AngleurConfig.chosenMethod == "oneKey" then
        if not AngleurConfig.angleurKey then
            return false
        end
        local keybind = AngleurConfig.angleurKey
        if AngleurConfig.angleurKey_Base then
            keybind = AngleurConfig.angleurKey_Base
        end
        if keybind == "MOUSEWHEELUP" or keybind == "MOUSEWHEELDOWN" then
            return false
        end
        if IsKeyDown(keybind) == false then 
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("isChosenKeyDown ") .. ": main key released")
            return false 
        end
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("isChosenKeyDown ") .. ": oneKey held")
        return true
    end
    return false
end
local playerDruid
local baseClassID
local _, baseClassID = UnitClassBase("player")
if baseClassID == 11 then
    playerDruid = true
end
local formsTable = {
    [29] = true, -- Flight Form
    [27] = true, -- Swift Flight Form
    [4] = true, -- Aquatic Form
    [3] = true, -- Travel Form
}
local function checkMounted()
    if IsMounted() then
        return true
    end
    if playerDruid then
        local form = GetShapeshiftFormID()
        if formsTable[form] == true then
            return true
        end
    end
    return false
end
local fishingSpellTable = AngleurVanilla_FishingSpellTable
function Angleur_LogicVariableHandler(self, event, unit, ...)
    if ang.addonLoaded == false then return end
    local arg4, arg5, arg6 = ...
    -- Needed for when player zones into dungeon while mounted. Zone changes but no reload, and mount journal change doesn"t register.
    if event == "PLAYER_ENTERING_WORLD" then
        if checkMounted() then 
            mounted = true
        else
            mounted = false
            if IsSwimming() then
                swimming = true
            else
                swimming = false
            end
        end
    elseif event == "PLAYER_SOFT_INTERACT_CHANGED" then
        if arg4 then
            local found, endo = string.find(arg4, "GameObject-\0-4458-1-54-35591-")
            if found then
                Angleur_BetaPrint(debugChannel, "the bobber is within range")
                bobberWithinRange = true
                --[[
                if string.match(arg4, "%-377944%-") then
                    iceFishing = true
                elseif string.match(arg4, "%-192631%-") or string.match(arg4, "%-197596%-")then
                    iceFishing = true
                elseif string.match(arg4, "%-35591%-") then
                    midFishing = true
                end
                
                ]]
                
            else
                Angleur_BetaPrint(debugChannel, "different soft target")
                bobberWithinRange = false
            end
        else
            bobberWithinRange = false
        end
    elseif event == "UNIT_SPELLCAST_SENT" and unit == "player" then
        if not CheckTable(fishingSpellTable, arg6) then return end
        midFishing = true
        EventRegistry:TriggerEvent("Angleur_StartFishing")
        Angleur_ActionHandler(Angleur)
    elseif event == "UNIT_SPELLCAST_CHANNEL_START" and unit == "player" then
        if not CheckTable(fishingSpellTable, arg5) then return end
        midFishing = true
        EventRegistry:TriggerEvent("Angleur_StartFishing")
        if AngleurClassicConfig.softInteract.enabled == true and AngleurClassicConfig.softInteract.warningSound == true then
            Angleur_PoolDelayer(0.2, 0, 0.1, angleurDelayers, nil, function()
                if not bobberWithinRange then
                    PlaySound(12889)
                end
            end)
        end
        if AngleurClassicConfig.softInteract.enabled == true and AngleurClassicConfig.softInteract.bobberScanner == true then
            Angleur_PoolDelayer(0.2, 0, 0.1, angleurDelayers, nil, function()
                if not bobberWithinRange then
                    Angleur_BobberScanner()
                end
            end)
        end
        Angleur_ActionHandler(Angleur)
        if AngleurConfig.ultraFocusAudioEnabled then 
            Angleur_TempCVars_ToggleUltraFocusAudio(true, "Cast/Reel")
        end
        if AngleurConfig.ultraFocusAutoLootEnabled then 
            Angleur_TempCVarHandler:Set("autoLootDefault")
        end
        if AngleurClassicConfig.softInteract.enabled == true then
            Angleur_TempCVarHandler:Set("SoftTargetInteract", "SoftTargetInteractRange", "SoftTargetInteractRangeIsHard")
        end
        Angleur_RecastReminder_Start(arg5)
    elseif event == "UNIT_SPELLCAST_FAILED" or event == "UNIT_SPELLCAST_FAILED_QUIET" then
        if unit ~= "player" then return end
        if not CheckTable(fishingSpellTable, arg5) then return end
        midFishing = false
        EventRegistry:TriggerEvent("Angleur_StopFishing")
        Angleur_ActionHandler(Angleur)
    elseif event == "UNIT_SPELLCAST_CHANNEL_STOP" and unit == "player" then
        if not CheckTable(fishingSpellTable, arg5) then return end
        Angleur_TempCVars_ToggleUltraFocusAudio(false, "Cast/Reel")
        Angleur_TempCVarHandler:Release("autoLootDefault")
        if AngleurClassicConfig.softInteract.enabled == true then
            Angleur_TempCVarHandler:Release("SoftTargetInteract", "SoftTargetInteractRange", "SoftTargetInteractRangeIsHard")
        end
        if isChosenKeyDown() == false then
            midFishing = false
            EventRegistry:TriggerEvent("Angleur_StopFishing")
        else
            Angleur_PoolDelayer(1, 0, 0.2, angleurDelayers, function()
                if isChosenKeyDown() == false then
                    midFishing = false
                    EventRegistry:TriggerEvent("Angleur_StopFishing")
                    return true
                end
            end, function()
                midFishing = false
                EventRegistry:TriggerEvent("Angleur_StopFishing")
            end)
        end
        bobberWithinRange = false
        Angleur_SetCursorForGamePad(false)
        Angleur_RecastReminder_Stop()
    elseif event == "PLAYER_MOUNT_DISPLAY_CHANGED" or event == "UPDATE_SHAPESHIFT_FORM" or event == "MIRROR_TIMER_START" then
        if checkMounted() then 
            mounted = true
        else
            mounted = false
            if IsSwimming() then
                swimming = true
            else
                swimming = false
            end
        end
    elseif event == "MOUNT_JOURNAL_USABILITY_CHANGED" or event == "MIRROR_TIMER_START" then  
        --The delay, and checking swimming here is necessary. If we constantly check on update for swimming a constant jumping bug occurs. Only happens when the AngleurKey is set to: SPACE
        Angleur_PoolDelayer(1, 0, 0.2, angleurDelayers, function()
            if IsSwimming() then
                swimming = true
            else
                swimming = false
            end
        end, nil, "swimChecker-cycle")
    elseif event == "PLAYER_EQUIPMENT_CHANGED" and unit == 16 then
        AngleurClassic_CheckFishingPoleEquipped()
        -- Also call BaitEnchant() on equipment changed in case the player has multiple fishing rods
        -- Because "UNIT_INVENTORY_CHANGED" won't always trigger when you swap rods
        Angleur_BaitEnchant()
    elseif event == "UNIT_AURA" and unit == "player" then
        --Angleur_Auras()
        Angleur_ExtraItems_Auras()
    elseif event == "UNIT_INVENTORY_CHANGED" and unit == "player" then
        Angleur_BaitEnchant()
    end
end
local logicVarFrame = CreateFrame("Frame")
logicVarFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
logicVarFrame:RegisterEvent("PLAYER_SOFT_INTERACT_CHANGED")
logicVarFrame:RegisterEvent("UNIT_SPELLCAST_SENT")
logicVarFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
logicVarFrame:RegisterEvent("UNIT_SPELLCAST_FAILED")
logicVarFrame:RegisterEvent("UNIT_SPELLCAST_FAILED_QUIET")
logicVarFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")
logicVarFrame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
logicVarFrame:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
logicVarFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
logicVarFrame:RegisterEvent("MOUNT_JOURNAL_USABILITY_CHANGED")
logicVarFrame:RegisterEvent("MIRROR_TIMER_START")
logicVarFrame:RegisterEvent("UNIT_AURA")
logicVarFrame:RegisterEvent("UNIT_INVENTORY_CHANGED")
logicVarFrame:RegisterEvent("CURSOR_CHANGED")
logicVarFrame:SetScript("OnEvent", Angleur_LogicVariableHandler)
--***********[~]**********

--***********[~]**********
--**Functions that check Auras**
--***********[~]**********

--***********[~]**********

local baitApplied = false
local baitEnchantIDTable = {
    263,
    264,
    265,
    266,
    3868,
    4225
}
function Angleur_BaitEnchant()
    if GetWeaponEnchantInfo() then
        local _, _, _, enchantID = GetWeaponEnchantInfo()
        if CheckTable(baitEnchantIDTable, enchantID) then
            baitApplied = true
        else
            baitApplied = false
        end
    else
        baitApplied = false
    end
end
--***********[~]**********
--**Decides which action to perform**
--***********[~]**********
-- action = "cast" | "reel" | "clear" | "raft" | "oversized" | "crate" | "randomCrate" | "extraToy" | "extraItem"
local function performAction(self, assignKey, action, recast, oobIcon, gPad)
    if action == "cast" then
        SetOverrideBindingSpell_Custom(self, true, assignKey, PROFESSIONS_FISHING)
        self.visual.texture:SetTexture("Interface/AddOns/Angleur/imagesClassic/UI_Profession_Fishing")
    elseif action == "reel" then
        SetOverrideBinding_Custom(self, true, assignKey, "INTERACTMOUSEOVER")
        self.visual.texture:SetTexture("Interface/AddOns/Angleur/imagesClassic/misc_arrowlup")
    elseif action == "clear" then
        ClearOverrideBindings(self)
        self.visual.texture:SetTexture("")
    elseif action == "bait" then
        SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
        self.toyButton:SetAttribute("macrotext", "/cast " .. angleurItems.selectedBaitTable.name .. "\n/use 16")
        self.visual.texture:SetTexture(angleurItems.selectedBaitTable.icon)
    elseif action == "raft" then
        SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
        self.toyButton:SetAttribute("macrotext", "/cast " .. angleurToys.selectedRaftTable.name)
        self.visual.texture:SetTexture(angleurToys.selectedRaftTable.icon)
    elseif action == "extraItem" then
        -- already handled within the other function
    end
    if recast then
        SetOverrideBindingSpell_Custom(self, true, AngleurConfig.recastKey, PROFESSIONS_FISHING)
    end
    if oobIcon then
        self.visual.texture:SetTexture("Interface/ICONS/Achievement_BG_returnXflags_def_WSG.blp")
    end
    if gPad then
        Angleur_SetCursorForGamePad(true)
    end
end
function Angleur_ActionHandler(self)
    --print("WorldFrame Dragging: ", WorldFrame:IsDragging())
    if InCombatLockdown() then return end
    Angleur_ExtraItems_UpdateItemsCountDown(false)
    local assignKey = nil
    local chosenMethod = AngleurConfig.chosenMethod
    if chosenMethod == "oneKey" then
        if not AngleurConfig.angleurKey then
            ClearOverrideBindings(self)
            self.visual.texture:SetTexture("")
            return 
        end
        assignKey = AngleurConfig.angleurKey
        --                !!!! VERY IMPORTANT !!!!
        -- _____ Do not change the bind while it is held down ______
        -- It is what caused the Raft Jump Bug, and can cause others
        --__________________________________________________________
        if IsKeyDown(assignKey) then return end
        --__________________________________________________________
    elseif chosenMethod == "doubleClick" then
        if angleurDoubleClick.watching then 
            assignKey = angleurDoubleClick.iDtoButtonName[AngleurConfig.doubleClickChosenID]
        end
    end
    
    ClearOverrideBindings(self)

    local action
    local recast = false
    local oobIcon = false
    local gPad = false
    if UnitIsDeadOrGhost("player") then
        action = "clear"
        performAction(self, assignKey, action)
        return
    end

    if midFishing then
        if AngleurClassicConfig.softInteract.enabled then
            if bobberWithinRange == false then
                oobIcon = true
                if AngleurClassicConfig.softInteract.recastWhenOOB then
                    action = "cast"
                else
                    action = "reel"
                end 
            else
                action = "reel"
            end
        else
            --Always set doubleClick to recast on Classic(When soft interact is off)
            if chosenMethod == "doubleClick" then
                action = "cast"
            else
                action = "reel"
                gPad = true
            end
        end
        if AngleurConfig.recastEnabled and AngleurConfig.recastKey then
            recast = true
        end
        performAction(self, assignKey, action, recast, oobIcon, gPad)
        return
    end

    if mounted and Angleur_TinyOptions.allowDismount == false then
        action =  "clear"
        performAction(self, assignKey, action, recast, oobIcon, gPad)
        return
    end
    
    local baitCount = C_Item.GetItemCount(AngleurConfig.chosenBait.itemID)
    local baitReady = angleurItems.selectedBaitTable.hasItem == true and AngleurConfig.baitEnabled and angleurItems.selectedBaitTable.loaded and baitApplied == false and baitCount > 0
    if baitReady then
        action = "bait"
        performAction(self, assignKey, action, recast, oobIcon, gPad)
        return
    end

    if Angleur_ActionHandler_ExtraItems(self, assignKey) then
        -- HANDLED WITHIN THE FUNCTION
        action =  "extraItems"
        performAction(self, assignKey, action, recast, oobIcon, gPad)
        return
    end
    
    action = "cast"
    performAction(self, assignKey, action, recast, oobIcon, gPad)
end

local cursorControlEnabled = false
function Angleur_SetCursorForGamePad(activate)
    if C_GamePad.IsEnabled() == false then return end
    if activate == true then
        if IsGamePadFreelookEnabled() == false then return end
        SetGamePadCursorControl(true)
        cursorControlEnabled = true 
    elseif activate == false then
        if cursorControlEnabled == false then return end
        SetGamePadCursorControl(false)
        cursorControlEnabled = false
    end
end
--***********[~]**********

function Angleur_SetSleep()
    if AngleurCharacter.sleeping == true then
        --no need to do combat delay, angleur clears override bindings when entering combat anyway
        if not InCombatLockdown() then ClearOverrideBindings(Angleur) end
        Angleur.visual.texture:SetTexture("Interface/AddOns/Angleur/imagesClassic/UI_Profession_Fishing")
        Angleur.visual.texture:SetDesaturated(true)
        Angleur.configPanel.tab1:DesaturateHierarchy(1)
        Angleur.configPanel.tab2:DesaturateHierarchy(1)
        Angleur.configPanel.wakeUpButton:Show()
        Angleur.configPanel.decoration:Hide()
        Angleur_TempCVarHandler:Release("SoftTargetInteract", "SoftTargetInteractRange", "SoftTargetInteractRangeIsHard")
        Angleur_TempCVars_ToggleUltraFocusAudio(false, "Sleep/Wake")
        if AngleurConfig.ultraFocusAudioEnabled == true then
            Angleur_TempCVarHandler:Release("Sound_EnableSoundWhenGameIsInBG")
        end
        EventRegistry:TriggerEvent("Angleur_Sleep")
    elseif AngleurCharacter.sleeping == false then
        Angleur.visual.texture:SetDesaturated(false)
        Angleur.configPanel.tab1:DesaturateHierarchy(0)
        Angleur.configPanel.tab2:DesaturateHierarchy(0)
        Angleur.configPanel.wakeUpButton:Hide()
        Angleur.configPanel.decoration:Show()
        Angleur_TempCVars_ToggleUltraFocusAudio(true, "Sleep/Wake")
        if AngleurConfig.ultraFocusAudioEnabled == true and AngleurAudio.checkboxes.toggleBG == true then
            Angleur_TempCVarHandler:Set("Sound_EnableSoundWhenGameIsInBG")
        end
        EventRegistry:TriggerEvent("Angleur_Wake")
    end
    Angleur_SetMinimapSleep()
end
