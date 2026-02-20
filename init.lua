local T = Angleur_Translate

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorGreen = CreateColor(0, 1, 0)

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
    if AngleurClassic_CVars == nil then
        AngleurClassic_CVars = {}
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
    if Angleur_TinyOptions.debugLevel == nil then
        Angleur_TinyOptions.debugLevel = 0
    end
    ang.debugLevel = Angleur_TinyOptions.debugLevel
    
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

-- 1 : Retail | 2 : MoP(Or Cata)(Or Titan Reforged) | 3 : Vanilla | (0: None, fail)
function Angleur_CheckVersion()
    if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
        return 1
    elseif WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC or WOW_PROJECT_ID == 19 or WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC then
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

function Angleur_BetaPrint(debugChannel, text, ...)
    if type(ang.debugLevel) == "table" then
        local matched = false
        for i, v in pairs(ang.debugLevel) do
            if v == debugChannel then
                matched = true
            end
        end
        if matched == false then return end
    elseif ang.debugLevel ~= 0 and ang.debugLevel ~= debugChannel then
        return
    end
    if Angleur_TinyOptions.errorsDisabled == false then
        print(text, ...)
    end
end

function Angleur_BetaDump(debugChannel, dump)
    if type(ang.debugLevel) == "table" then
        local matched = false
        for i, v in pairs(ang.debugLevel) do
            if v == debugChannel then
                matched = true
            end
        end
        if matched == false then return end
    elseif ang.debugLevel ~= 0 and ang.debugLevel ~= debugChannel then
        return
    end
    if Angleur_TinyOptions.errorsDisabled == false then
        DevTools_Dump(dump)
    end
end

function Angleur_BetaTableToString(debugChannel, tbl)
    if type(ang.debugLevel) == "table" then
        local matched = false
        for i, v in pairs(ang.debugLevel) do
            if v == debugChannel then
                matched = true
            end
        end
        if matched == false then return end
    elseif ang.debugLevel ~= 0 and ang.debugLevel ~= debugChannel then
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



--**************************[1]****************************
--**           Loading & Unloading of Angleur            **
--**************************[1]****************************
function Angleur_OnLoad(self)
    self.toyButton:SetAttribute("type", "macro")
    self.toyButton:RegisterForClicks("AnyDown", "AnyUp")
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("PLAYER_LOGOUT")
    self:RegisterEvent("ADDONS_UNLOADING")
    self:RegisterEvent("PLAYER_STARTED_MOVING")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
    self:RegisterEvent("PLAYER_DEAD")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:SetScript("OnEvent", Angleur_EventLoader)
    self:SetScript("OnUpdate", Angleur_OnUpdate)
end


local function onLogin()
    if AngleurCharacter.sleeping == false then
        Angleur_EquipAngleurSet(false)
    end
    if not Angleur_TinyOptions.loginDisabled then
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Thank you for using Angleur!"])
        print(T["To access the configuration menu, type "] .. colorYello:WrapTextInColorCode("/angleur ") .. T["or "] .. colorYello:WrapTextInColorCode("/angang") .. ".")
        if AngleurCharacter.sleeping == true then
            print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping. To continue using, type " .. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"])
            print(T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."])    
        elseif AngleurCharacter.sleeping == false then
            print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Is awake. To temporarily disable, type " .. colorYello:WrapTextInColorCode("/angsleep ")])
            print(T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."])
        end
    end
end
local function onReload()
    if AngleurCharacter.sleeping == true then
        if not Angleur_TinyOptions.loginDisabled then
            print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping. To continue using, type " .. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"])
            print(T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."])
        end
    end
end




local function load_not_retail()
    if ang.gameVersion == 1 then return end
    -- Order: Anywhere in PLAYER_ENTERING_WORLD
    Angleur_BobberScanner_HandleGamepad(false, T["Angleur Bobber Scanner: Gamepad Detected! Cast fishing once to trigger cursor mode, then place it in the indicated box."])
    -- Order: LoadItems & BaitEnchant back-to-back
    Angleur_LoadItems()
    Angleur_BaitEnchant()
end

local function load_retail()
    if ang.gameVersion ~= 1 then return end
    -- Order: CombatDelayer(LoadToys) & ExtraToyAuras back-to-back
    Angleur_CombatDelayer(function()Angleur_LoadToys()end)
    Angleur_ExtraToyAuras()

    -- Order: After LoadToys()
    Angleur_Auras()
end
local function load_mists()
    if ang.gameVersion ~= 2 then return end  
    -- Order: CombatDelayer(LoadToys) & ExtraToyAuras back-to-back
    Angleur_CombatDelayer(function()Angleur_LoadToys()end)
    Angleur_ExtraToyAuras()
end


-- Angleur_TempCVarHandler:Release("autoLootDefault")
Angleur_TempCVars = {
    SoftTargetInteract = {
        active = false, cached = nil, setTo = "3", updating = false,
    },
    -- Ultra Focus Temp Auto Loot
    autoLootDefault = {
        active = false, cached = nil, setTo = "1", updating = false,
    },
    -- Ultra Focus Background
    Sound_EnableSoundWhenGameIsInBG = {
        active = false, cached = nil, setTo = "1", updating = false,
    },
    -- Ultra Focus Audio Regular
    Sound_EnableMusic = {
        active = false, cached = nil, setTo = "0", updating = false,
    },
    Sound_EnableAmbience = {
        active = false, cached = nil, setTo = "0", updating = false,
    },
    Sound_EnableDialog = {
        active = false, cached = nil, setTo = "0", updating = false,
    },
    Sound_EnableSFX = {
        active = false, cached = nil, setTo = "1", updating = false,
    },
    Sound_SFXVolume = {
        active = false, cached = nil, setTo = "1.0", updating = false,
    },
    Sound_EnableAllSound = {
        active = false, cached = nil, setTo = "1", updating = false,
    },
    -- Angleur_TempCVars["Sound_MasterVolume"].setTo =  Angleur_TinyOptions.ultraFocusMaster --> must be assigned every time ultraFocusMaster is changed
    Sound_MasterVolume = {
        active = false, cached = nil, setTo = Angleur_TinyOptions.ultraFocusMaster, updating = false,
    },
}
Angleur_TempCVarHandler = CreateFrame("Frame", "Example_CVarHandler", UIParent, "Legolando_TempCVarHandlerTemplate_Angleur")
Angleur_TempCVarHandler.tempCVarsTable = Angleur_TempCVars
Angleur_TempCVarHandler:Init()
local function cvars_load()
    -- Need to re-assign here because when table is first created Saved Vars haven't loaded yet
    Angleur_TempCVars["Sound_MasterVolume"].setTo =  Angleur_TinyOptions.ultraFocusMaster

    -- Order: Anywhere in PLAYER_ENTERING_WORLD
    if Angleur_TinyOptions.softIconOff == true and 	C_CVar.GetCVar("SoftTargetIconGameObject") == "1" then
        C_CVar.SetCVar("SoftTargetIconGameObject", "0")
    end


    if GetCVar("autoLootDefault") == "1" then
        Angleur.configPanel.tab1.contents.ultraFocus.autoLoot:greyOut()
        AngleurConfig.ultraFocusAutoLootEnabled = false
    end
end

local helpTipCloseText = "|cnHIGHLIGHT_FONT_COLOR:The |r|cnNORMAL_FONT_COLOR:Interact Key|r|cnHIGHLIGHT_FONT_COLOR: allows you to interact with NPCs and objects using a keypress|n|n|r|cnRED_FONT_COLOR:Assign an Interact Key binding under Control options|r"
function Angleur_EventLoader(self, event, unit, ...)
    local arg4, arg5 = ...
    if event == "ADDON_LOADED" and unit == "Angleur" then
        Init_AngleurSavedVariables()
        Angleur_SetTab1(self.configPanel.tab1.contents)
        Angleur_SetTab3(self.configPanel.tab3.contents)
        self.visual.texture:SetTexture("Interface/AddOns/Angleur/imagesClassic/UI_Profession_Fishing")
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- return if zone change
        if unit == false and arg4 == false then return end
        if unit == true then
            onLogin()
        elseif arg4 == true then
            onReload()
        end

        --Check if the Plugins of Angleur have loaded
        ang.loadedPlugins.undang = C_AddOns.IsAddOnLoaded("Angleur_Underlight")
        ang.loadedPlugins.niche = C_AddOns.IsAddOnLoaded("Angleur_NicheOptions")

        --__________________________________________________________________________
        -- Can't set Tab 2 on "ADDON_LOADED" because we need data from NicheOptions
        --      for CreateSlots, and we need CreateSlots to be before SetTab2
        --__________________________________________________________________________
        Angleur_ExtraItems_CreateSlots(Angleur.configPanel.tab2.contents.extraItems)
        Angleur_SetTab2(self.configPanel.tab2)
        --__________________________________________________________________________
        -- We also need CreateSlots Before ExtraItems_Load
        Angleur_ExtraItems_Load(Angleur.configPanel.tab2.contents.extraItems)
        
        -- Version based load functions
        load_retail()
        load_not_retail()
        load_mists()

        cvars_load()

        Init_AngleurVisual()
        HelpTip:Hide(UIParent, helpTipCloseText)
        Angleur_ExtraItemAuras()
        if AngleurMinimapButton.hide == false then
            Angleur_InitMinimapButton()
        end

        ---------------------------------------------------------
        Angleur_EquipmentManager()
        if ang.gameVersion ~= 1 then
            -- MUST load BETWEEN EquipmentManager() & SetSleep() 
            AngleurClassic_CheckFishingPoleEquipped()
        end
        Angleur_SetSleep()
        ---------------------------------------------------------
        
        if AngleurTutorial.part > 1 and AngleurConfig.chosenMethod == "oneKey" and not AngleurConfig.angleurKey then
            Angleur.configPanel:Show()
            Angleur.configPanel.tab1.contents.fishingMethod.oneKey.contents.angleurKey.warning:Show()
        end
        Angleur_FirstInstall()
    elseif event == "PLAYER_LOGOUT" then
        Angleur_Unload()
    elseif event == "PLAYER_REGEN_DISABLED" then
        ClearOverrideBindings(self)
        if ang.gameVersion == 1 or ang.gameVerson == 2 then
            Angleur_ToyBoxOverlay_Deactivate()
        end
        Angleur_AdvancedAnglingPanel:Hide()
    elseif event == "PLAYER_DEAD" then
        if ang.gameVersion == 1 or ang.gameVerson == 2 then
            Angleur_ToyBoxOverlay_Deactivate()
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
    end
end

function Angleur_Unload()
    Angleur_TempCVarHandler:ReleaseAll()
end