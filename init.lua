local T = Angleur_Translate

angleurDelayers = CreateFramePool("Frame", angleurDelayers, nil, function(framePool, frame)
    frame:ClearAllPoints()
    frame:SetScript("OnUpdate", nil)
    frame:Hide()
end)

AngleurConfig = {
    angleurKey,
    angleurKey_Base,
    raftEnabled,
    chosenRaft = {toyID = 0, name = 0, dropDownID = 0},
    baitEnabled,
    chosenBait = {itemID = 0, name = 0, dropDownID = 0},
    oversizedEnabled,
    crateEnabled,
    chosenCrateBobber = {toyID = 0, name = 0, dropDownID = 0},
    chosenMethod,
    doubleClickChosenID = 2,
    recastEnabled,
    recastKey,
    visualHidden,
    visualLocation,
    ultraFocusAudioEnabled,
    ultraFocusAutoLootEnabled,
    ultraFocusTurnOffInteract,
    ultraFocusingAudio,
    ultraFocusingAutoLoot,
}

AngleurClassicConfig = {
    softInteract = {
        enabled = false,
        bobberScanner = false,
        warningSound = false,
        recastWhenOOB = false,
    },
}

AngleurCharacter = {
    sleeping = false,
    angleurSet = false
}

Angleur_CVars = {
    ultraFocus = {musicOn, ambienceOn, dialogOn, effectsOn,  effectsVolume, masterOn, masterVolume, backgroundOn},
    autoLoot
}
AngleurClassic_CVars = {
    softInteract,
}

AngleurMinimapButton = {
    hide
}

Angleur_TinyOptions = {
    turnOffSoftInteract = false,
    allowDismount = false,
    doubleClickWindow = 0.4,
    visualScale = 1,
    ultraFocusMaster = 1,
    loginDisabled = false,
    errorsDisabled = true,
    softIconOff = false,
}

function Init_AngleurSavedVariables()
    if AngleurConfig.ultraFocusAudioEnabled == nil then
        AngleurConfig.ultraFocusAudioEnabled = false
    end
    if AngleurConfig.ultraFocusAutoLootEnabled == nil then
        AngleurConfig.ultraFocusAutoLootEnabled = false
    end
    if AngleurConfig.chosenBait == nil then
        AngleurConfig.chosenBait = {itemID = 0, name = 0, dropDownID = 0}
    end
    if AngleurConfig.recastEnabled == nil then
        AngleurConfig.recastEnabled = false
    end

    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 2 or gameVersion == 3 then
        if AngleurClassicConfig == nil then
            AngleurClassicConfig = {}
        end
        if AngleurClassicConfig.softInteract == nil then
            AngleurClassicConfig.softInteract = {}
        end
        if AngleurClassicConfig.softInteract.enabled == nil then
            AngleurClassicConfig.softInteract.enabled = false
        end
        if AngleurClassicConfig.softInteract.bobberScanner == nil then
            AngleurClassicConfig.softInteract.bobberScanner = false
        end
        if AngleurClassicConfig.softInteract.bobberScanner == nil then
            AngleurClassicConfig.softInteract.bobberScanner = false
        end
        if AngleurClassicConfig.softInteract.recastWhenOOB == nil then
            AngleurClassicConfig.softInteract.recastWhenOOB = false
        end
    end
    

    if AngleurCharacter.sleeping == nil then
        AngleurCharacter.sleeping = false
    end

    if Angleur_TinyOptions.turnOffSoftInteract == nil then
        Angleur_TinyOptions.turnOffSoftInteract = false
    end
    if Angleur_TinyOptions.allowDismount == nil then
        Angleur_TinyOptions.allowDismount = false
    end
    if Angleur_TinyOptions.softTargetIcon == nil then
        Angleur_TinyOptions.softTargetIcon = true
    end
    if Angleur_TinyOptions.doubleClickWindow == nil then
        Angleur_TinyOptions.doubleClickWindow = 0.4
    end
    if Angleur_TinyOptions.visualScale == nil then
        Angleur_TinyOptions.visualScale = 1
    end
    if Angleur_TinyOptions.ultraFocusMaster == nil then
        Angleur_TinyOptions.ultraFocusMaster = 1
    end
    if Angleur_TinyOptions.loginDisabled == nil then
        Angleur_TinyOptions.loginDisabled = false
    end
    if Angleur_TinyOptions.errorsDisabled == nil then
        Angleur_TinyOptions.errorsDisabled = true
    end

    if AngleurMinimapButton.hide == nil then
        AngleurMinimapButton.hide = false
    end

    if AngleurTutorial.part == nil then
        AngleurTutorial.part = 1
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    -- cleanup for older version's saved variables, may delete in a month
    --|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    if AngleurConfig.angleurKeyModifier then
        AngleurConfig.angleurKeyModifier = nil
        AngleurConfig.angleurKeyMain = nil
        AngleurConfig.angleurKey = nil
        print(T["Angleur: VERSION UPDATED. Please re-set your \'OneKey\' from the Config Panel."])
    end
    --|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

    
    Angleur_AngleurKey.savedVarTable = AngleurConfig
    Angleur_AngleurKey.keybindRef = "angleurKey"
    Angleur_AngleurKey.baseRef = "angleurKey_Base"

    Angleur_RecastKey.savedVarTable = AngleurConfig
    Angleur_RecastKey.keybindRef = "recastKey"
end

AngleurVanilla_FishingPoleTable = {
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
AngleurVanilla_FishingSpellTable = {
    7620,
    7731,
    7732,
    18248,
    33095,
    51294,
    88868
}
AngleurMoP_FishingPoleTable = {
    6256, --Fishing Pole
    6365, --Strong Fishing Pole
    6366, --Darkwood Fishing Pole
    6367, --Big Iron Fishing Pole
    12225, --Blump Family Fishing Pole
    19022, --Nat Pagle's Extreme Angler FC-5000
    19970, --Arcanite Fishing Pole
    25978, --Seth's Graphite Fishing Pole
    44050, --Mastercraft Kalu'ak Fishing Pole
    45120, --Basic Fishing Pole
    45858, --Nat's Lucky Fishing Pole
    45991, --Bone Fishing Pole
    45992, --Jeweled Fishing Pole
    46337, --Staat's Fishing Pole
    52678, --Jonathan's Fishing Pole
    -----------------
    --MoP Additions--
    -----------------
    84661, --Dragon Fishing Pole  
    84660, --Pandaren Fishing Pole
}
AngleurMoP_FishingSpellTable = {
    7620,
    7731,
    7732,
    18248,
    33095,
    51294,
    88868,
    --MoP Additions
    110410,
    131474,
    131476,
    131490,
    --Skumblade Spear Fishing
    139505,
    --MoP Uncategorized
    62734,
    131475,
    131477,
    131478,
    131479,
    131480,
    131481,
    131482,
    131483,
    131484,
    131491,
    --MoP NPC Abilities
    63275,
}

-- 1 : Retail, 2 : Cata Classic, 3 : Classic 19 : MoP Classic    (0: None, fail)
function Angleur_CheckVersion()
    if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
        return 1
    elseif WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC or WOW_PROJECT_ID == 19 then
        return 2
    elseif WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
        return 3
    end
    return 0
end

-- USE TO CHECK VERSIONS
-- /run print(WOW_PROJECT_ID == WOW_PROJECT_MAINLINE and "Retail" 
-- or WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC and "Cata" 
-- or WOW_PROJECT_ID == WOW_PROJECT_CLASSIC and "Vanilla" or "I don't know")

function Angleur_SingleDelayer(delay, timeElapsed, elapsedThreshhold, delayFrame, cycleFunk, endFunk)
    delayFrame:SetScript("OnUpdate", function(self, elapsed)
        timeElapsed = timeElapsed + elapsed
        if timeElapsed > elapsedThreshhold then
            if cycleFunk then
                if cycleFunk() == true then
                    -- If cycleFunk returns true the delayer is stopped, and the script set to nil. endFunk is not executed..
                    self:SetScript("OnUpdate", nil)
                    return
                end
            end
            delay = delay - timeElapsed
            timeElapsed = 0
        end
        
        if delay <= 0 then
            self:SetScript("OnUpdate", nil)
            if endFunk then endFunk() end
            return
        end
    end)
end

angleurCombatDelayFrame = CreateFrame("Frame")
angleurCombatDelayFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
angleurFunctionsQueueTable = {}
function Angleur_CombatDelayer(funk)
    if InCombatLockdown() then
        --print("triggered")
        table.insert(angleurFunctionsQueueTable, funk)
        angleurCombatDelayFrame:SetScript("OnEvent", function()
            for i, funktion in pairs(angleurFunctionsQueueTable) do
                funktion()
                --print("executed: ", funktion)
            end
            angleurFunctionsQueueTable = {}
            angleurCombatDelayFrame:SetScript("OnEvent", nil)
        end)
    else
        funk()
    end
end

function Angleur_PoolDelayer(delay, timeElapsed, elapsedThreshhold, delayFramePool, cycleFunk, endFunk)
    local delayFrame = delayFramePool:Acquire()
    delayFrame:Show()
    delayFrame:SetScript("OnUpdate", function(self, elapsed)
        timeElapsed = timeElapsed + elapsed
        if timeElapsed > elapsedThreshhold then 
            if cycleFunk then 
                if cycleFunk() == true then
                    delayFramePool:Release(self)
                    return
                end
            end
            delay = delay - timeElapsed
            timeElapsed = 0
        end
        if delay <= 0 then
            if endFunk then endFunk() end
            delayFramePool:Release(self)
            return
        end
    end)
end

function Angleur_BetaPrint(text, ...)
    if Angleur_TinyOptions.errorsDisabled == false then
        print(text, ...)
    end
end

function Angleur_BetaDump(dump)
    if Angleur_TinyOptions.errorsDisabled == false then
        DevTools_Dump(dump)
    end
end

function Angleur_BetaTableToString(tbl)
    if Angleur_TinyOptions.errorsDisabled == false then
        local tableToString = ""
        for i, v in pairs(tbl) do
            local element = "[" .. tostring(i) .. ":" .. tostring(v) .. "]"
            tableToString = tableToString .. "  " .. element
        end
        print(tableToString)
    end
end