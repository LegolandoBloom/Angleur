local ENABLED = true
local DISABLED = false

-- _______________________________ MAIN STUFF _______________________________

-- ___ UI Placement ___
local Visual_Shown = DISABLED
local Visual_XAxis = 100
local Visual_YAxis = 100
local Minimap_Shown = ENABLED
-- ____________________

local Fishing_Method = "doubleClick" -- "oneKey" for keybind fishing
local Keybind_Base = "SPACE" -- Can be set to any key
local Keybind_Modifier = "SHIFT" -- The modifier key to use

-- ______ Recast ______
local Recast = DISABLED
local Recast_Keybind = "SHIFT + SPACE"
-- ____________________

-- ____ Ultra Focus ____
local UltraFocus_Audio = ENABLED
local UltraFocus_TemporaryAutoLoot = DISABLED
-- _____________________

-- ____ Bobber Scanner ____
local BobberScanner = ENABLED
local WarningSound = ENABLED
-- __________________________________________________________________________





AngleurConfig = {
    angleurKey = Keybind_Base .. " + " .. Keybind_Modifier,
    angleurKey_Base = Keybind_Base,
    baitEnabled = nil,
    chosenBait = {itemID = 0, name = 0, dropDownID = 0},
    oversizedEnabled = nil,
    chosenMethod = Fishing_Method,
    doubleClickChosenID = 2,
    recastEnabled = Recast,
    recastKey = Recast_Keybind,
    visualHidden = not Visual_Shown,
    visualLocation = {[1]="CENTER", [2]=UIParent, [3]="CENTER", [4]=Visual_XAxis, [5]=Visual_YAxis},
    ultraFocusAudioEnabled = UltraFocus_Audio,
    ultraFocusAutoLootEnabled = UltraFocus_TemporaryAutoLoot,
    ultraFocusTurnOffInteract = nil,
}

AngleurClassicConfig = {
    softInteract = {
        enabled = true,
        bobberScanner = BobberScanner,
        warningSound = WarningSound,
        recastWhenOOB = not BobberScanner,
    },
}

AngleurCharacter = {
    sleeping = false,
    angleurSet = false
}

AngleurMinimapButton = {
    hide = not Minimap_Shown
}

AngleurTutorial = {
    part = 10
}
