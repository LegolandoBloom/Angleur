local T = Angleur_Translate
local colorDebug = CreateColor(0.24, 0.76, 1) -- angleur blue
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

local helpTipCloseText = "|cnHIGHLIGHT_FONT_COLOR:The |r|cnNORMAL_FONT_COLOR:Interact Key|r|cnHIGHLIGHT_FONT_COLOR: allows you to interact with NPCs and objects using a keypress|n|n|r|cnRED_FONT_COLOR:Assign an Interact Key binding under Control options|r"

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

function Angleur_OnLoad(self)
    self.toyButton:SetAttribute("type", "macro")
    self.toyButton:RegisterForClicks("AnyDown", "AnyUp")
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("PLAYER_LOGOUT")
    self:RegisterEvent("ADDONS_UNLOADING")
    self:RegisterEvent("PLAYER_STARTED_MOVING")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:SetScript("OnEvent", Angleur_EventLoader)
    self:SetScript("OnUpdate", Angleur_OnUpdate)
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

--**************************[1]****************************
--**Events Relating to the Loading and unloading of stuff**
--**************************[1]****************************
function Angleur_EventLoader(self, event, unit, ...)
    local arg4, arg5 = ...
    if event == "ADDON_LOADED" and unit == "Angleur" then
        Angleur_SetTab1(self.configPanel.tab1.contents)
        Angleur_SetTab3(self.configPanel.tab3.contents)
        self.visual.texture:SetTexture("Interface/AddOns/Angleur/imagesClassic/UI_Profession_Fishing")
    elseif event == "PLAYER_ENTERING_WORLD" then
        if unit == false and arg4 == false then return end
        if unit == true then
            if AngleurCharacter.sleeping == false then
                Angleur_EquipAngleurSet(false)
            end
            if not Angleur_TinyOptions.loginDisabled then
                print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Thank you for using Angleur!"])
                --print("Please report any bugs and issues you run into on the AddOn's curseforge page, or message me there directly.")
                print(T["To access the configuration menu, type "] .. colorYello:WrapTextInColorCode("/angleur ") .. T["or "] .. colorYello:WrapTextInColorCode("/angang") .. ".")
                if AngleurCharacter.sleeping == true then
                    print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping. To continue using, type " .. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"])
                    print(T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."])    
                elseif AngleurCharacter.sleeping == false then
                    print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Is awake. To temporarily disable, type " .. colorYello:WrapTextInColorCode("/angsleep ")])
                    print(T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."])
                end
            end
        elseif arg4 == true then
            if AngleurCharacter.sleeping == true then
                if not Angleur_TinyOptions.loginDisabled then
                    print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping. To continue using, type " .. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"])
                    print(T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."])
                end
            end
        end
        if AngleurConfig.ultraFocusingAudio then Angleur_UltraFocusAudio(false) end
        if AngleurConfig.ultraFocusingAutoLoot then Angleur_UltraFocusAutoLoot(false) end
        Init_AngleurSavedVariables()
        if GetCVar("autoLootDefault") == "1" then
            Angleur.configPanel.tab1.contents.ultraFocus.autoLoot:greyOut()
            AngleurConfig.ultraFocusAutoLootEnabled = false
        end
        Init_AngleurVisual()
        --Angleur_HandleCVars()
        HelpTip:Hide(UIParent, helpTipCloseText)
        Angleur_LoadItems()
        Angleur_LoadExtraItems(Angleur.configPanel.tab2.contents.extraItems)
        --Angleur_Auras()
        Angleur_ExtraItemAuras()
        if AngleurMinimapButton.hide == false then
            Angleur_InitMinimapButton()
        end
        Angleur_BaitEnchant()
        Angleur_EquipmentManager()
        AngleurClassic_CheckFishingPoleEquipped()
        Angleur_SetSleep()
        if AngleurTutorial.part > 1 and AngleurConfig.chosenMethod == "oneKey" and not AngleurConfig.angleurKey then
            Angleur.configPanel:Show()
            Angleur.configPanel.tab1.contents.fishingMethod.oneKey.contents.angleurKey.warning:Show()
        end
        Angleur_FirstInstall()
    elseif event == "PLAYER_LOGOUT" then
        if AngleurConfig.ultraFocusAudioEnabled == true and AngleurCharacter.sleeping == false then
            Angleur_UltraFocusBackground(false)
        end
    elseif event == "PLAYER_REGEN_DISABLED" then
        ClearOverrideBindings(self)
        Angleur_AdvancedAnglingPanel:Hide()
    elseif event == "PLAYER_REGEN_ENABLED" then
    end
end

--***********[~]**********
--**Events watcher that determines logic variables**
--***********[~]**********
local iceFishing = false
local mounted = false
local swimming = false
local midFishing = false
local fishingSpellTable = {
    7620,
    7731,
    7732,
    18248,
    33095,
    51294,
    88868
}
local fishingPoleTable = {
    6256,
    6365,
    6366,
    6367,
    12225,
    19022,
    19970,
    25978,
    44050,
    45120,
    45858,
    45991,
    45992,
    46337,
    52678
}
local function CheckTable(table ,spell)
    matchFound = false
    for i, value in pairs(table) do
        if spell == value then
            matchFound = true
            break
        end
    end
    return matchFound
end

function AngleurClassic_CheckFishingPoleEquipped()
    local itemLoc = ItemLocation:CreateFromEquipmentSlot(16)
    if not C_Item.DoesItemExist(itemLoc) then 
        AngleurCharacter.sleeping = true
        Angleur_SetSleep()
        Angleur_UnequipAngleurSet(true)
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
        Angleur_UnequipAngleurSet(true)
    end
end

local function isChosenKeyDown()
    if AngleurConfig.chosenMethod == "doubleClick"  then
        if not AngleurConfig.doubleClickChosenID then
            return false
        elseif IsKeyDown(angleurDoubleClick.iDtoButtonName[AngleurConfig.doubleClickChosenID]) then
            Angleur_BetaPrint(colorDebug:WrapTextInColorCode("isChosenKeyDown ") .. ": mouse held")
            return true
        end
    elseif AngleurConfig.chosenMethod == "oneKey" then
        if not AngleurConfig.angleurKey then
            return false
        end
        local keybind = AngleurConfig.angleurKey
        if AngleurConfig.angleurKeyModifier then
            if AngleurConfig.angleurKeyMain then
                keybind = AngleurConfig.angleurKeyMain
            else
                print(T["Angleur unexpected error: Modifier exists, but main key doesn't. Please let the author know."])
            end
        end
        if keybind == "MOUSEWHEELUP" or keybind == "MOUSEWHEELDOWN" then
            return false
        end
        if IsKeyDown(keybind) == false then 
            Angleur_BetaPrint(colorDebug:WrapTextInColorCode("isChosenKeyDown ") .. ": main key released")
            return false 
        end
        Angleur_BetaPrint(colorDebug:WrapTextInColorCode("isChosenKeyDown ") .. ": oneKey held")
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
function Angleur_LogicVariableHandler(self, event, unit, ...)
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
            local subbed = string.gsub(arg4, "%-0%-3767%-2444%-2424%-", "")
            if subbed then
                --print("found first pattern")
                if string.match(arg4, "%-377944%-") then
                    iceFishing = true
                elseif string.match(arg4, "%-192631%-") or string.match(arg4, "%-197596%-")then
                    iceFishing = true
                elseif string.match(arg4, "%-35591%-") then
                    midFishing = true
                end
            end
        elseif iceFishing == true then
            iceFishing = false
        end
    elseif event == "UNIT_SPELLCAST_SENT" and unit == "player" then
        if not CheckTable(fishingSpellTable, arg6) then return end
        midFishing = true
        Angleur_ActionHandler(Angleur)
    elseif event == "UNIT_SPELLCAST_CHANNEL_START" and unit == "player" then
        if not CheckTable(fishingSpellTable, arg5) then return end
        midFishing = true
        Angleur_ActionHandler(Angleur)
        if AngleurConfig.ultraFocusAudioEnabled then Angleur_UltraFocusAudio(true) end
        if AngleurConfig.ultraFocusAutoLootEnabled then Angleur_UltraFocusAutoLoot(true) end
        if Angleur_TinyOptions.turnOffSoftInteract then Angleur_UltraFocusInteractOff(true) end
    elseif event == "UNIT_SPELLCAST_FAILED" or event == "UNIT_SPELLCAST_FAILED_QUIET" then
        if unit ~= "player" then return end
        if not CheckTable(fishingSpellTable, arg5) then return end
        midFishing = false
        Angleur_ActionHandler(Angleur)
    elseif event == "UNIT_SPELLCAST_CHANNEL_STOP" and unit == "player" then
        if not CheckTable(fishingSpellTable, arg5) then return end
        if AngleurConfig.ultraFocusingAudio then Angleur_UltraFocusAudio(false) end
        if AngleurConfig.ultraFocusingAutoLoot then Angleur_UltraFocusAutoLoot(false) end
        if Angleur_TinyOptions.turnOffSoftInteract then Angleur_UltraFocusInteractOff(false) end
        if isChosenKeyDown() == false then
            midFishing = false
        else
            Angleur_PoolDelayer(1, 0, 0.2, angleurDelayers, function()
                if isChosenKeyDown() == false then
                    midFishing = false
                    return true
                end
            end, function()
                midFishing = false
            end)
        end
        Angleur_SetCursorForGamePad(false)
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
        --The delay, and checking swimming here is necessary. If we constantly check on update for swimming a constant jumping bug occurs. Only happens when the AngleurKey is set to: SPACE
        Angleur_PoolDelayer(1, 0, 0.2, angleurDelayers, function()
            if IsSwimming() then
                swimming = true
            else
                swimming = false
            end
        end)
    elseif event == "PLAYER_EQUIPMENT_CHANGED" and unit == 16 then
        AngleurClassic_CheckFishingPoleEquipped()
    elseif event == "UNIT_AURA" and unit == "player" then
        --Angleur_Auras()
        Angleur_ExtraItemAuras()
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
logicVarFrame:RegisterEvent("UNIT_AURA")
logicVarFrame:RegisterEvent("UNIT_INVENTORY_CHANGED")
logicVarFrame:RegisterEvent("CURSOR_CHANGED")
logicVarFrame:SetScript("OnEvent", Angleur_LogicVariableHandler)
--***********[~]**********

--***********[~]**********
--**Functions that check Auras**
--***********[~]**********

local auraIDHolders = {
    raft,
    oversizedBobber,
    crateBobber
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


function Angleur_ExtraItemAuras()
    for i, slottedItem in pairs(Angleur_SlottedExtraItems) do
        slottedItem.auraActive = false
        local spellAuraID
        if slottedItem.spellID ~= 0 then
            spellAuraID = slottedItem.spellID
        elseif slottedItem.macroSpellID ~= 0 then
            spellAuraID = slottedItem.macroSpellID
        end
        if spellAuraID then
            local name = GetSpellInfo(spellAuraID)
            --doesn't work
            --print("Non passive: ", C_UnitAuras.GetPlayerAuraBySpellID(spellAuraID))
            if C_UnitAuras.GetAuraDataBySpellName("player", name) then
                slottedItem.auraActive = true
                local link = C_Spell.GetSpellLink(spellAuraID)
                Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_ExtraItemAuras ") .. ": Slotted item/macro aura is active:", link)
            end
        end
    end
end
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
function Angleur_ActionHandler(self)
    --print("WorldFrame Dragging: ", WorldFrame:IsDragging())
    if InCombatLockdown() then return end
    Angleur_UpdateItemsCountdown(false)
    local assignKey = nil
    if AngleurConfig.chosenMethod == "oneKey" then
        if not AngleurConfig.angleurKey then
            ClearOverrideBindings(self)
            self.visual.texture:SetTexture("")
        return end
        assignKey = AngleurConfig.angleurKey
    elseif AngleurConfig.chosenMethod == "doubleClick" then
        if angleurDoubleClick.watching then 
            assignKey = angleurDoubleClick.iDtoButtonName[AngleurConfig.doubleClickChosenID]
        end
    end
    
    ClearOverrideBindings(self)
    if midFishing then
        SetOverrideBinding_Custom(self, true, assignKey, "INTERACTMOUSEOVER")
        self.visual.texture:SetTexture("Interface/AddOns/Angleur/imagesClassic/misc_arrowlup")
        Angleur_SetCursorForGamePad(true)
    elseif swimming then
        --print("I am swimming")
        if mounted and Angleur_TinyOptions.allowDismount == false then
            ClearOverrideBindings(self)
            self.visual.texture:SetTexture("")
        else
            ClearOverrideBindings(self)
            self.visual.texture:SetTexture("")
        end
    elseif not swimming then
        if mounted and Angleur_TinyOptions.allowDismount == false then
            ClearOverrideBindings(self)
            self.visual.texture:SetTexture("")
        else
            local baitCount = C_Item.GetItemCount(AngleurConfig.chosenBait.itemID)
            if angleurItems.selectedBaitTable.hasItem == true and AngleurConfig.baitEnabled and angleurItems.selectedBaitTable.loaded and baitApplied == false and baitCount > 0 then
                SetOverrideBindingClick_Custom(self, true, assignKey, "Angleur_ToyButton")
                self.toyButton:SetAttribute("macrotext", "/cast " .. angleurItems.selectedBaitTable.name .. "\n/use 16")
                self.visual.texture:SetTexture(angleurItems.selectedBaitTable.icon)
            elseif Angleur_ActionHandler_ExtraItems(self, assignKey) then
                --ALREADY HANDLED WITHIN THE FUNCTION
            elseif iceFishing then
                SetOverrideBinding_Custom(self, true, assignKey, "INTERACTMOUSEOVER")
                self.visual.texture:SetTexture("Interface/AddOns/Angleur/imagesClassic/misc_arrowlup")
                Angleur_SetCursorForGamePad(true)
            else
                SetOverrideBindingSpell_Custom(self, true, assignKey, PROFESSIONS_FISHING)
                self.visual.texture:SetTexture("Interface/AddOns/Angleur/imagesClassic/UI_Profession_Fishing")
            end
        end
    end
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
        if slot.macroSpellID ~= 0 and C_Spell.DoesSpellExist(slot.macroSpellID) and IsUsableSpell(slot.macroSpellID) then
            local _, spellCooldown = GetSpellCooldown(slot.macroSpellID)
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
    for i, slot in pairs(Angleur_SlottedExtraItems) do
       if checkConditions(self, slot, assignKey) == true then return true end
    end
    return returnValue
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
        if Angleur_TinyOptions.turnOffSoftInteract == true then
            Angleur_UltraFocusInteractOff(false)
        end
        if AngleurConfig.ultraFocusAudioEnabled == true then
            Angleur_UltraFocusBackground(false)
        end
    elseif AngleurCharacter.sleeping == false then
        Angleur.visual.texture:SetDesaturated(false)
        Angleur.configPanel.tab1:DesaturateHierarchy(0)
        Angleur.configPanel.tab2:DesaturateHierarchy(0)
        Angleur.configPanel.wakeUpButton:Hide()
        Angleur.configPanel.decoration:Show()
        if AngleurConfig.ultraFocusAudioEnabled == true then
            Angleur_UltraFocusBackground(true)
        end
    end
    Angleur_SetMinimapSleep()
end

function Angleur_UltraFocusBackground(activate)
    if activate == true then
        Angleur_CVars.ultraFocus.backgroundOn = GetCVar("Sound_EnableSoundWhenGameIsInBG")
        SetCVar("Sound_EnableSoundWhenGameIsInBG", 1)
        Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_UltraFocusBackground ") .. ": BG Sound set to: ", GetCVar("Sound_EnableSoundWhenGameIsInBG"))
    elseif activate == false then
        if Angleur_CVars.ultraFocus.backgroundOn ~= nil then SetCVar("Sound_EnableSoundWhenGameIsInBG", Angleur_CVars.ultraFocus.backgroundOn) end
        Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_UltraFocusBackground ") .. ": BG Sound restored to previous value, which was: ", Angleur_CVars.ultraFocus.backgroundOn)
    end
end

function Angleur_UltraFocusAudio(activate)
    if activate == true then
        Angleur_CVars.ultraFocus.musicOn = GetCVar("Sound_EnableMusic")
        SetCVar("Sound_EnableMusic", 0)
        Angleur_CVars.ultraFocus.ambienceOn = GetCVar("Sound_EnableAmbience")
        SetCVar("Sound_EnableAmbience", 0)
        Angleur_CVars.ultraFocus.dialogOn = GetCVar("Sound_EnableDialog")
        SetCVar("Sound_EnableDialog", 0)
        Angleur_CVars.ultraFocus.effectsOn = GetCVar("Sound_EnableSFX")
        SetCVar("Sound_EnableSFX", 1)
        Angleur_CVars.ultraFocus.effectsVolume = GetCVar("Sound_SFXVolume")
        SetCVar("Sound_SFXVolume", 1.0)
        Angleur_CVars.ultraFocus.masterOn = GetCVar("Sound_EnableAllSound")
        SetCVar("Sound_EnableAllSound", 1)
        Angleur_CVars.ultraFocus.masterVolume = GetCVar("Sound_MasterVolume")
        SetCVar("Sound_MasterVolume", Angleur_TinyOptions.ultraFocusMaster)
        AngleurConfig.ultraFocusingAudio = true
        --[[
            print("Music: " , Angleur_CVars.ultraFocus.musicOn)
            print("Ambience: " , Angleur_CVars.ultraFocus.ambienceOn)
            print("Dialog: " , Angleur_CVars.ultraFocus.dialogOn)
            print("SFX: " , Angleur_CVars.ultraFocus.effectsOn)
            print("SFX-Volume: " , Angleur_CVars.ultraFocus.effectsVolume)
        ]]--
    elseif activate == false then
        if Angleur_CVars.ultraFocus.musicOn ~= nil then SetCVar("Sound_EnableMusic", Angleur_CVars.ultraFocus.musicOn) end
        if Angleur_CVars.ultraFocus.ambienceOn ~= nil then SetCVar("Sound_EnableAmbience", Angleur_CVars.ultraFocus.ambienceOn) end
        if Angleur_CVars.ultraFocus.dialogOn ~= nil then SetCVar("Sound_EnableDialog", Angleur_CVars.ultraFocus.dialogOn) end
        if Angleur_CVars.ultraFocus.effectsOn ~= nil then SetCVar("Sound_EnableSFX", Angleur_CVars.ultraFocus.effectsOn) end
        if Angleur_CVars.ultraFocus.effectsVolume ~= nil then SetCVar("Sound_SFXVolume", Angleur_CVars.ultraFocus.effectsVolume) end
        if Angleur_CVars.ultraFocus.masterOn ~= nil then SetCVar("Sound_EnableAllSound", Angleur_CVars.ultraFocus.masterOn) end
        if Angleur_CVars.ultraFocus.masterVolume ~= nil then SetCVar("Sound_MasterVolume", Angleur_CVars.ultraFocus.masterVolume) end
        AngleurConfig.ultraFocusingAudio = false
        --print("Ultra Focus Disabled")
    end
end

function Angleur_UltraFocusAutoLoot(activate)
    if activate == true then
        local autoLootBefore = GetCVar("autoLootDefault")
        if autoLootBefore == 1 then return end
        AngleurConfig.ultraFocusingAutoLoot = true
        Angleur_CVars.autoLoot = autoLootBefore
        SetCVar("autoLootDefault", 1)
    elseif activate == false then
        AngleurConfig.ultraFocusingAutoLoot = false
        if Angleur_CVars.autoLoot ~= nil then
            SetCVar("autoLootDefault", Angleur_CVars.autoLoot) 
            Angleur_CVars.autoLoot = false
        end
    end
end

function Angleur_UltraFocusInteractOff(activate)
    if activate == true then
        C_CVar.SetCVar("SoftTargetInteract", 3)
    elseif activate == false then
        C_CVar.SetCVar("SoftTargetInteract", 1)
    end
end

--[[ Disabled for Classic
    function Angleur_HandleCVars()
        Angleur_UltraFocusInteractOff(not Angleur_TinyOptions.turnOffSoftInteract)
    end
]]--