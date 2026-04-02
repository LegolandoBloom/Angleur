---@diagnostic disable: cast-local-type, param-type-mismatch
local T = Angleur_Translate

-- 'ang' is the angleur namespace
local addonName, ang = ...
local retail = ang.retail

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
local iceFishing = false
local mounted = false
local swimming = false
local midFishing = false
local compressedOceanFishing = false

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
local firstCast = true
local fishingSpellTable = AngleurRetail_FishingSpellTable
function Angleur_LogicVariableHandler(self, event, unit, ...)
    local arg4, arg5 = ...
    -- Needed for when player zones into dungeon while mounted. Zone changes but no reload, and mount journal change doesn"t register
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
        if issecretvalue(arg4) then return end
        iceFishing = false
        compressedOceanFishing = false
        if arg4 then
            local subbed = string.gsub(arg4, "%-0%-3767%-2444%-2424%-", "")
            if subbed then
                --print("found first pattern")
                if string.match(arg4, "%-377944%-") then
                    iceFishing = true
                elseif string.match(arg4, "%-192631%-") or string.match(arg4, "%-197596%-")then
                    iceFishing = true
                elseif string.match(arg4, "%-35591%-") then
                    midFishing = true
                    EventRegistry:TriggerEvent("Angleur_StartFishing")
                end
            end
            local compressedOcean = string.gsub(arg4, "%-0%-4211%-870%-18037-", "")
            if compressedOcean then
                if string.match(arg4, "%-152121%-") then
                    compressedOceanFishing = true
                end
            end
            -- print(UnitNameFromGUID(arg4))
            local oceanicVortex = string.gsub(arg4, "%-0%-1471%-2771%-136997%-", "")
            if oceanicVortex then
                if string.match(arg4, "%-240236%-") then
                    compressedOceanFishing = true
                end
            end
        end
    elseif event == "UNIT_SPELLCAST_CHANNEL_START" and not issecretvalue(unit) and unit == "player" then
        if issecretvalue(arg5) then return end
        if not CheckTable(fishingSpellTable, arg5) then return end
        midFishing = true
        EventRegistry:TriggerEvent("Angleur_StartFishing")
        Angleur_ActionHandler(Angleur)
        --__________________________________________________________________________________________________________________________________
        --                                                  ! PLATER MEASURE !
        -- Plater somehow turns off softInteract AFTER everything loads which is why I have to forcibly enable it on the FIRST FISHING CAST
        --                  using Angleur_TempCVarHandler. On PLAYER_LOGOUT I call it again to restore default values
        --                                     Also tell the player about the Plater interaction
        --__________________________________________________________________________________________________________________________________
        if firstCast then
            Angleur_FixPlater()
            Angleur_TempCVarHandler:Set("SoftTargetInteract", "SoftTargetInteractRange", "SoftTargetInteractRangeIsHard")
            firstCast = false
        end
        if AngleurConfig.ultraFocusAudioEnabled then 
            Angleur_TempCVarHandler:Set("Sound_EnableMusic", "Sound_EnableAmbience", "Sound_EnableDialog", "Sound_EnableSFX", "Sound_EnableAllSound")
            Angleur_TempCVarHandler:Set("Sound_MasterVolume", "Sound_SFXVolume", "Sound_MusicVolume", "Sound_DialogVolume", "Sound_AmbienceVolume")
        end
        if AngleurConfig.ultraFocusAutoLootEnabled then
            Angleur_TempCVarHandler:Set("autoLootDefault")
        end
        if Angleur_TinyOptions.turnOffSoftInteract then Angleur_TempCVarHandler:Set("SoftTargetInteract", "SoftTargetInteractRange", "SoftTargetInteractRangeIsHard") end
    elseif event == "UNIT_SPELLCAST_CHANNEL_STOP" and not issecretvalue(unit) and unit == "player" then
        if issecretvalue(arg5) then return end
        if not CheckTable(fishingSpellTable, arg5) then return end
        Angleur_TempCVarHandler:Release("Sound_EnableMusic", "Sound_EnableAmbience", "Sound_EnableDialog", "Sound_EnableSFX", "Sound_EnableAllSound")
        Angleur_TempCVarHandler:Release("Sound_MasterVolume", "Sound_SFXVolume", "Sound_MusicVolume", "Sound_DialogVolume", "Sound_AmbienceVolume")
        Angleur_TempCVarHandler:Release("autoLootDefault")
        if Angleur_TinyOptions.turnOffSoftInteract then Angleur_TempCVarHandler:Release("SoftTargetInteract", "SoftTargetInteractRange", "SoftTargetInteractRangeIsHard") end
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
    elseif event == "PLAYER_MOUNT_DISPLAY_CHANGED" or event == "UPDATE_SHAPESHIFT_FORM" then
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
    elseif event == "MOUNT_JOURNAL_USABILITY_CHANGED" then
        -- We NEED the delay. When the event triggers, IsSwimming() sometimes isn't updated yet
        Angleur_PoolDelayer(0.25, 0, 0.05, angleurDelayers, function()
            if IsSwimming() then
                swimming = true
            else
                swimming = false
            end
        end, nil, "swimChecker-cycle")
    elseif event == "UNIT_AURA" and not issecretvalue(unit) and unit == "player" then
        Angleur_Auras()
        Angleur_ExtraToyAuras()
        Angleur_ExtraItemAuras()
    end
end
local logicVarFrame = CreateFrame("Frame")
logicVarFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
logicVarFrame:RegisterEvent("PLAYER_SOFT_INTERACT_CHANGED")
logicVarFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
logicVarFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")
logicVarFrame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
logicVarFrame:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
logicVarFrame:RegisterEvent("MOUNT_JOURNAL_USABILITY_CHANGED")
logicVarFrame:RegisterEvent("UNIT_AURA")
logicVarFrame:SetScript("OnEvent", Angleur_LogicVariableHandler)
--***********[~]**********

--***********[~]**********
--**Functions that check Auras**
--***********[~]**********

local auraIDHolders = {
    raft = nil,
    oversizedBobber = nil,
    crateBobber = nil,
}

local rafted = false
local oversizedBobbered = false
local crateBobbered = false
function Angleur_Auras()
    --Checks for raft aura
    rafted = false
    auraIDHolders.raft = nil
    for i, raft in pairs(angleurToys.raftPossibilities) do
        if C_UnitAuras.GetPlayerAuraBySpellID(raft.spellID) then 
            rafted = true
            auraIDHolders.raft = raft.spellID
            --print("Raft is applied")
            break
        end
    end
    --Checks for oversized bobber aura
    oversizedBobbered = false
    auraIDHolders.oversizedBobber = nil
    if C_UnitAuras.GetPlayerAuraBySpellID(397827) then
        oversizedBobbered = true
        auraIDHolders.oversizedBobber = 397827
        --print("OVERSIZED is applied")
    end
    --Checks for Crate Bobber aura
    crateBobbered = false
    auraIDHolders.crateBobber = nil
    for i, crateBobber in pairs(angleurToys.crateBobberPossibilities) do
        if C_UnitAuras.GetPlayerAuraBySpellID(crateBobber.spellID) then 
            crateBobbered = true
            auraIDHolders.crateBobber = crateBobber.spellID
            --print("Crate bobber is applied")
            break
        end
    end
end
function Angleur_ExtraToyAuras()
    --Checks for Extra Toy Auras
    for i, slottedToy in pairs(Angleur_SlottedExtraToys) do
        slottedToy.auraActive = false
        if C_UnitAuras.GetPlayerAuraBySpellID(slottedToy.spellID) then
            slottedToy.auraActive = true
            --print("Slotted toy aura is active")
        end
    end
end
--***********[~]**********
function Angleur_ExtraItemAuras()
    --Checks for Extra Toy Auras
    for i=1, ang.extraItems.slotCount, 1 do
        local slot = Angleur_SlottedExtraItems[i]
        slot.auraActive = false
        local spellAuraID
        if slot.spellID ~= 0 then
            spellAuraID = slot.spellID
        elseif slot.macroSpellID ~= 0 then
            spellAuraID = slot.macroSpellID
        end
        if spellAuraID then
            local name = C_Spell.GetSpellInfo(spellAuraID).name
            --doesn't work
            --print("Non passive: ", C_UnitAuras.GetPlayerAuraBySpellID(spellAuraID))
            if C_UnitAuras.GetAuraDataBySpellName("player", name) then
                slot.auraActive = true
                local link = C_Spell.GetSpellLink(spellAuraID)
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_ExtraItemAuras ") .. ": Slotted item/macro aura is active:", link)
            end
        end
    end
end
--***********[~]**********

--***********[~]**********
--**Decides which action to perform**
--***********[~]**********
-- action = "cast" | "reel" | "clear" | "raft" | "oversized" | "crate" | "extraToy" | "extraItem"
local function performAction(self, assignKey, action)
    if action == "cast" then
        SetOverrideBindingSpell_Custom(self, true, assignKey, PROFESSIONS_FISHING)
        self.visual.texture:SetTexture("Interface/ICONS/UI_Profession_Fishing")
    elseif action == "recast" then
        SetOverrideBinding_Custom(self, true, assignKey, "INTERACTTARGET")
        self.visual.texture:SetTexture("Interface/ICONS/misc_arrowlup")
        SetOverrideBindingSpell_Custom(self, true, AngleurConfig.recastKey, PROFESSIONS_FISHING)
    elseif action == "reel" then
        SetOverrideBinding_Custom(self, true, assignKey, "INTERACTTARGET")
        self.visual.texture:SetTexture("Interface/ICONS/misc_arrowlup")
    elseif action == "clear" then
        ClearOverrideBindings(self)
        self.visual.texture:SetTexture("")
    elseif action == "raft" then
        if AngleurConfig.chosenRaft.name == "Random Raft" then
            retail.toys:PickRandomToy("raft", angleurToys.ownedRafts, angleurToys.selectedRaftTable, false)
        end
        SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
        self.toyButton:SetAttribute("macrotext", "/cast " .. angleurToys.selectedRaftTable.name)
        self.visual.texture:SetTexture(angleurToys.selectedRaftTable.icon)
    elseif action == "oversized" then
        SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
        self.toyButton:SetAttribute("macrotext", "/cast " .. angleurToys.selectedOversizedBobberTable.name)
        self.visual.texture:SetTexture(angleurToys.selectedOversizedBobberTable.icon)
    elseif action == "crate" then
        SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
        self.toyButton:SetAttribute("macrotext", "/cast " .. angleurToys.selectedCrateBobberTable.name)
        self.visual.texture:SetTexture(angleurToys.selectedCrateBobberTable.icon)
    elseif action == "extraToys" then
        -- already handled within the other function
    elseif action == "extraItems" then
        -- already handled within the other function
    end
end
-- SetOverrideBindingClick_Custom(self, true, "SPACE", "Angleur_ToyButton")
function Angleur_ActionHandler(self)
    --print("WorldFrame Dragging: ", WorldFrame:IsDragging())
    if InCombatLockdown() then return end
    Angleur_UpdateItemsCountdown(false)
    local assignKey = nil
    if AngleurConfig.chosenMethod == "oneKey" then
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
    elseif AngleurConfig.chosenMethod == "doubleClick" then
        if angleurDoubleClick.watching then 
            assignKey = angleurDoubleClick.iDtoButtonName[AngleurConfig.doubleClickChosenID]
        end
    end
    ClearOverrideBindings(self)

    local action
    if UnitIsDeadOrGhost("player") then
        action = "clear"
        performAction(self, assignKey, action)
        return
    end
    
    if midFishing then
        action =  "reel"
        if AngleurConfig.recastEnabled and AngleurConfig.recastKey then
            action = "recast"
        end
        performAction(self, assignKey, action)
        return
    end

    if mounted and Angleur_TinyOptions.allowDismount == false then
        action =  "clear"
        performAction(self, assignKey, action)
        return
    end
    
    
    --______________________________________________________________________________________________________________________________________
    --              Interaction of Raft & Swimming - A bit more complex logic structure, hence the grouping together 
    --______________________________________________________________________________________________________________________________________
    local raftValid = angleurToys.selectedRaftTable.hasToy == true and AngleurConfig.raftEnabled and angleurToys.selectedRaftTable.loaded
    -- Execute & Return Case: Player has rafts enabled + is rafted + the active raft has less than 60 seconds remaining
    if raftValid and rafted and C_UnitAuras.GetPlayerAuraBySpellID(auraIDHolders.raft) then
        local remainingAuraDuration = C_UnitAuras.GetPlayerAuraBySpellID(auraIDHolders.raft).expirationTime - GetTime()
        if remainingAuraDuration < 60 then
            action =  "raft"
            performAction(self, assignKey, action)
            return
        end
    end
    -- Execute & Return Cases(2) for: Release key when Swim + Player Swimming
    if swimming and Angleur_TinyOptions.swimRelease == true then
        if raftValid and not rafted then
            action =  "raft"
            performAction(self, assignKey, action)
            return
        else
            action =  "clear"
            performAction(self, assignKey, action)
            return
        end
    end
    -- Execute & Return Cases(2) for: Release key when Swim + Player Swimming
    if swimming and Angleur_TinyOptions.swimRelease == false then
        if raftValid and not rafted then
            action =  "raft"
            performAction(self, assignKey, action)
            return
        end
    end
    --______________________________________________________________________________________________________________________________________


    local _, cooldownOversized = C_Container.GetItemCooldown(angleurToys.selectedOversizedBobberTable.toyID)
    local oversizedReady = angleurToys.selectedOversizedBobberTable.hasToy == true and AngleurConfig.oversizedEnabled and angleurToys.selectedOversizedBobberTable.loaded and not oversizedBobbered and cooldownOversized == 0
    if oversizedReady then
        action =  "oversized"
        performAction(self, assignKey, action)
        return
    end

    local crateIsRandom = AngleurConfig.chosenCrateBobber.name == "Random Bobber"
    -- Why can't we do Crate Bobber randoms in performAction() like with Rafts?
    -- We want to random pick before starting the if-else in case all bobbers are
    -- on cooldown. (Not an issue with Rafts because they dont have a cooldown)
    if (crateIsRandom) and (AngleurConfig.crateEnabled and not crateBobbered) then
        retail.toys:PickRandomToy("bobber", angleurToys.ownedCrateBobbers, angleurToys.selectedCrateBobberTable, false)
    end

    local _, cooldownCrate = C_Container.GetItemCooldown(angleurToys.selectedCrateBobberTable.toyID)
    local crateReady = (AngleurConfig.crateEnabled and not crateBobbered) and (angleurToys.selectedCrateBobberTable.hasToy == true and cooldownCrate == 0) and angleurToys.selectedCrateBobberTable.loaded
    if crateReady then
        action =  "crate"
        performAction(self, assignKey, action)
        return
    end

    if Angleur_ActionHandler_ExtraToys(self, assignKey) then
        -- HANDLED WITHIN THE FUNCTION
        action =  "extraToys"
        performAction(self, assignKey, action)
        return
    end

    if Angleur_ActionHandler_ExtraItems(self, assignKey) then
        -- HANDLED WITHIN THE FUNCTION
        action =  "extraItems"
        performAction(self, assignKey, action)
        return
    end

    if iceFishing or compressedOceanFishing then
        action =  "reel"
        performAction(self, assignKey, action)
        return
    end

    action =  "cast"
    performAction(self, assignKey, action)
    --________________________________________________________________________

end

function Angleur_ActionHandler_ExtraToys(self, assignKey)
    local returnValue = false
    for i, slot in pairs(Angleur_SlottedExtraToys) do
        local _, cooldown = C_Container.GetItemCooldown(slot.toyID)
        if slot.name ~= 0 and cooldown == 0 and slot.auraActive == false then
            local isUsableSpell = C_Spell.IsSpellUsable(slot.spellID)
            local isUsableToy = C_ToyBox.IsToyUsable(slot.toyID)
            if isUsableSpell and isUsableToy then
                SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
                self.toyButton:SetAttribute("macrotext", "/cast " .. slot.name)
                self.visual.texture:SetTexture(slot.icon)
                returnValue = true
                break
            end
        end
    end
    return returnValue
end

local function checkUsabilityItem(itemID)
    if not C_Item.IsUsableItem(itemID) then return false end
    local _, cooldown = C_Container.GetItemCooldown(itemID)
    if cooldown ~= 0 then return false end
    local itemCount = C_Item.GetItemCount(itemID)
    if not (itemCount > 0) then return false end
    if C_Item.IsEquippableItem(itemID) then
        if not C_Item.IsEquippedItem(itemID) then return false end
    end
    return true
end
local function parseMacroConditions(macroBody)
    local returnValue = 0
    for conditionBracket in string.gmatch (macroBody, "(%[.-%])") do
        if SecureCmdOptionParse(conditionBracket) == nil then
            if returnValue == 0 then
                returnValue = false
            end
        else
            returnValue = true
        end
    end
    if returnValue == 0 then
        returnValue = true
    end
    return returnValue
end
local function checkConditions(self, slot, assignKey)
    if slot.delay ~= 0 and slot.delay ~= nil then
        if slot.remainingTime ~= 0 then
            return false
        end
    end
    if slot.name ~= 0 and slot.auraActive == false then
        if checkUsabilityItem(slot.itemID) == false then return false end
        SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
        self.toyButton:SetAttribute("macrotext", "/cast " .. slot.name)
        self.visual.texture:SetTexture(slot.icon)
        return true
    elseif slot.macroName ~= 0 then
        if slot.macroBody == "" then return false end
        if slot.macroItemID ~= 0 and slot.macroItemID ~= nil then
            if checkUsabilityItem(slot.macroItemID) == false then return false end
        end
        if slot.macroSpellID ~= 0 and C_Spell.DoesSpellExist(slot.macroSpellID) and C_Spell.IsSpellUsable(slot.macroSpellID) then
            local spellCooldown = C_Spell.GetSpellCooldown(slot.macroSpellID).duration
            if spellCooldown ~= 0 or slot.auraActive == true then return false end
            if parseMacroConditions(slot.macroBody) == true then
                SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
                self.toyButton:SetAttribute("macrotext", slot.macroBody)
                self.visual.texture:SetTexture(slot.macroIcon)
                return true
            end
        end
    end
end
function Angleur_ActionHandler_ExtraItems(self, assignKey)
    local returnValue = false
    for i=1, ang.extraItems.slotCount, 1 do
        if checkConditions(self, Angleur_SlottedExtraItems[i], assignKey) == true then return true end
    end
    return returnValue
end

--***********[~]**********
function Angleur_FishingForAttentionAura()
    if InCombatLockdown() then return end
    local fishingAura = C_UnitAuras.GetPlayerAuraBySpellID(394009)
    if not fishingAura then return end
    local slots = {C_UnitAuras.GetAuraSlots("player", "HELPFUL|CANCELABLE", 20)}
    if not slots then return end
    for i, v in pairs(slots) do
        local aura = C_UnitAuras.GetBuffDataByIndex("player", i)
        if aura and aura.spellId == 394009 then 
            CancelUnitBuff("player", i)
        end
    end
end


function Angleur_SetSleep()
    if AngleurCharacter.sleeping == true then
        --no need to do combat delay, angleur clears override bindings when entering combat anyway
        if not InCombatLockdown() then ClearOverrideBindings(Angleur) end
        Angleur.visual.texture:SetTexture("Interface/ICONS/UI_Profession_Fishing")
        Angleur.visual.texture:SetDesaturated(true)
        Angleur.configPanel.tab1:DesaturateHierarchy(1)
        Angleur.configPanel.tab2:DesaturateHierarchy(1)
        Angleur.configPanel.wakeUpButton:Show()
        Angleur.configPanel.decoration:Hide()
        if Angleur_TinyOptions.turnOffSoftInteract == true then
            Angleur_TempCVarHandler:Release("SoftTargetInteract", "SoftTargetInteractRange", "SoftTargetInteractRangeIsHard")
        end
        if AngleurConfig.ultraFocusAudioEnabled == true then
            Angleur_TempCVarHandler:Release("Sound_EnableSoundWhenGameIsInBG")
        end
        Angleur_FishingForAttentionAura()
        EventRegistry:TriggerEvent("Angleur_Sleep")
    elseif AngleurCharacter.sleeping == false then
        Angleur.visual.texture:SetDesaturated(false)
        Angleur.configPanel.tab1:DesaturateHierarchy(0)
        Angleur.configPanel.tab2:DesaturateHierarchy(0)
        Angleur.configPanel.wakeUpButton:Hide()
        Angleur.configPanel.decoration:Show()
        if AngleurConfig.ultraFocusAudioEnabled == true then
            Angleur_TempCVarHandler:Set("Sound_EnableSoundWhenGameIsInBG")
        end
        -- Angleur's Plugin Addon, Angleur_Underlight
        if ang.loadedPlugins.undang then
            AngleurUnderlight_AngleurWakeUpPing()
        end
        EventRegistry:TriggerEvent("Angleur_Wake")
    end
    Angleur_SetMinimapSleep()
end
