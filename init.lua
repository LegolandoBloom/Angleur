local T = Angleur_Translate

-- 'ang' is the angleur namespace
local addonName, ang = ...

ang.retail = {}
ang.mists = {}
ang.vanilla = {}
ang.loadedPlugins = {}
ang.loadedPlugins.undang = false
ang.loadedPlugins.niche = false

angleurDelayers = CreateFramePool("Frame", angleurDelayers, nil, function(framePool, frame)
    frame:ClearAllPoints()
    frame:SetScript("OnUpdate", nil)
    frame:Hide()
end)

AngleurConfig = {
    angleurKey = nil,
    angleurKey_Base = nil,
    raftEnabled = nil,
    chosenRaft = {toyID = 0, name = 0, dropDownID = 0},
    baitEnabled = nil,
    chosenBait = {itemID = 0, name = 0, dropDownID = 0},
    oversizedEnabled = nil,
    crateEnabled = nil,
    chosenCrateBobber = {toyID = 0, name = 0, dropDownID = 0},
    chosenMethod = nil,
    doubleClickChosenID = 2,
    recastEnabled = nil,
    recastKey = nil,
    visualHidden = nil,
    visualLocation = nil,
    ultraFocusAudioEnabled = nil,
    ultraFocusAutoLootEnabled = nil,
    ultraFocusTurnOffInteract = nil,
    ultraFocusingAudio = nil,
    ultraFocusingAutoLoot = nil,
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
    ultraFocus = {musicOn = nil, ambienceOn = nil, dialogOn = nil, effectsOn = nil,  effectsVolume = nil, masterOn = nil, masterVolume = nil, backgroundOn = nil},
    autoLoot = nil
}
AngleurClassic_CVars = {
    softInteract = nil,
}

AngleurMinimapButton = {
    hide = nil
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
    if Angleur_TinyOptions.swimRelease == nil then
        Angleur_TinyOptions.swimRelease = true
    end
    if Angleur_TinyOptions.softTargetIcon == nil then
        Angleur_TinyOptions.softTargetIcon = true
    end
    if Angleur_TinyOptions.poleSleep == nil then
        Angleur_TinyOptions.poleSleep = true
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

AngleurRetail_FishingSpellTable = {
    -- MAIN Main Fishing Spells
    7620, 131476,
    -- Other Basic Fishing Spells
    51294, 18248, 131474, 33095, 7732, 7731, 158743, 110410, 88868, 131490,
    -- Compressed Ocean Fishing
    295727,
    -- Skumblade Spear Fishing
    139505,
    -- Ice Fishing
    377895,
    -- Disgusting Vat Fishing
    405274,
    -- [DNT] Fishing (Brain channel version)
    1252746,
    -- Hot-Spring Gulper Fishing
    301092,
}

-- 1 : Retail | 2 : MoP(Or Cata) | 3 : Vanilla | (0: None, fail)
function Angleur_CheckVersion()
    if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
        return 1
    elseif WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC or WOW_PROJECT_ID == 19 then
        return 2
    elseif WOW_PROJECT_ID == WOW_PROJECT_CLASSIC or WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
        return 3
    end
    return 0
end
ang.gameVersion = Angleur_CheckVersion()

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

function Angleur_PoolDelayer(delay, timeElapsed, elapsedThreshhold, delayFramePool, cycleFunk, endFunk, uniqueIdentifier)
    -- ______________________________________________________________________________________________________
    -- ____________________________________ (Optional) OVERRIDE SYSTEM ______________________________________
    -- ______________________________________________________________________________________________________
    -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ unique Identifier --> optional argument ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    -- If optional argument is provided, there will only be a SINGLE INSTANCEe of that type of delayer
    -- running at one time, and any calls of Angleur_PoolDelayer with that specific 'uniqueIdentifier' 
    -- argument will release the one beforehand, overriding it.
    -- ______________________________________________________________________________________________________
    if uniqueIdentifier then
        for poolFrame in delayFramePool:EnumerateActive() do
            if poolFrame.uniqueIdentifier and poolFrame.uniqueIdentifier == uniqueIdentifier then
                -- print("overriding same type delayer", uniqueIdentifier)
                delayFramePool:Release(poolFrame)
            end
        end
    end
    local delayFrame = delayFramePool:Acquire()
    delayFrame.uniqueIdentifier = uniqueIdentifier
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
    -- Keep this part commented
    -- local count = 0
    -- local uniques = {}
    -- local uniqCount = 0
    -- for delayFrame in delayFramePool:EnumerateActive() do
    --     count = count + 1
    --     local uniqID = delayFrame.uniqueIdentifier
    --     if uniqID then
    --         for i, v in pairs(uniques) do
    --             if v == uniqID then
    --                 print("ERROR: More than one widget with the same unique identifier detected. This isn't supposed to happen.")
    --                 return
    --             end
    --         end
    --         table.insert(uniques, uniqID)
    --         uniqCount = uniqCount + 1
    --     end
    -- end
    -- print("Total number of widgets: ", count)
    -- print("Widgets with different uniqueIdentifiers: ", uniqCount)
    -- print("Table of active unique identifiers:")
    -- DevTools_Dump(uniques)
end

local debugLevel = ang.debugLevel
function Angleur_BetaPrint(debugChannel, text, ...)
    if type(debugLevel) == "table" then
        local matched = false
        for i, v in pairs(debugLevel) do
            if v == debugChannel then
                matched = true
            end
        end
        if matched == false then return end
    elseif debugLevel ~= 0 and debugLevel ~= debugChannel then
        return
    end
    if Angleur_TinyOptions.errorsDisabled == false then
        print(text, ...)
    end
end

function Angleur_BetaDump(debugChannel, dump)
    if type(debugLevel) == "table" then
        local matched = false
        for i, v in pairs(debugLevel) do
            if v == debugChannel then
                matched = true
            end
        end
        if matched == false then return end
    elseif debugLevel ~= 0 and debugLevel ~= debugChannel then
        return
    end
    if Angleur_TinyOptions.errorsDisabled == false then
        DevTools_Dump(dump)
    end
end

function Angleur_BetaTableToString(debugChannel, tbl)
    if type(debugLevel) == "table" then
        local matched = false
        for i, v in pairs(debugLevel) do
            if v == debugChannel then
                matched = true
            end
        end
        if matched == false then return end
    elseif debugLevel ~= 0 and debugLevel ~= debugChannel then
        return
    end
    if Angleur_TinyOptions.errorsDisabled == false then
        local tableToString = ""
        for i, v in pairs(tbl) do
            local element = "[" .. tostring(i) .. ":" .. tostring(v) .. "]"
            tableToString = tableToString .. "  " .. element
        end
        print(tableToString)
    end
end