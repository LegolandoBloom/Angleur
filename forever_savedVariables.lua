--_________ DO NOT TOUCH THIS PART _________
local ENABLED = true
local DISABLED = false
--__________________________________________



-- _______________________________ You can change these _______________________________
-- ___ UI Placement ___
local Visual_Shown = ENABLED
local Visual_XAxis = 400 -- Higher values move the Angleur Visual to the right - Lower to the left. Can be Negative.
local Visual_YAxis = 250 -- Higher values move the Angleur Visual to the top - Lower to the bottom. Can be Negative.
local Minimap_Shown = ENABLED
-- ____________________

local Fishing_Method = "doubleClick" -- set to: "oneKey"  for keybind fishing
local Keybind_Base = "SPACE" -- Can be set to any key OTHER than modifier keys: "SHIFT", "CTRL", "ALT"
local Keybind_Modifier = "SHIFT" -- "SHIFT", "CTRL", "ALT" | If you DON'T WANT a Modifier Key, leave empty: ""

-- ______ Recast ______
local Recast = DISABLED
local Recast_Keybind = "SPACE" -- Can be set to any key OTHER than modifier keys: SHIFT, CTRL, ALT
local Recast_Modifier = "CTRL" -- "SHIFT", "CTRL", "ALT" | If you DON'T WANT a Modifier Key, leave empty: ""
-- ____________________

-- ____ Ultra Focus ____
local UltraFocus_Audio = ENABLED
local UltraFocus_TemporaryAutoLoot = DISABLED
-- _____________________

-- ____ Bobber Scanner ____
local BobberScanner = ENABLED
local WarningSound = ENABLED
-- ____________________________________________________________________________________





--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
-- DO NOT CHANGE ANYTHING PAST THIS POINT --
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
-- DO NOT CHANGE ANYTHING PAST THIS POINT --
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
-- DO NOT CHANGE ANYTHING PAST THIS POINT --
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------
--------------------------------------------








local angleurKey_fullKeybind
local angleurKey_fullKeybind_base
if not Keybind_Base or Keybind_Base == "" then
    angleurKey_fullKeybind = "E"
    angleurKey_fullKeybind_base = "E"
elseif not Keybind_Modifier or Keybind_Modifier == "" then
    angleurKey_fullKeybind = Keybind_Base
    angleurKey_fullKeybind_base = angleurKey_fullKeybind
else
    angleurKey_fullKeybind = Keybind_Modifier .. "-" .. Keybind_Base
    angleurKey_fullKeybind_base = Keybind_Base
end


local recastKey_fullKeybind
local recastKey_fullKeybind_base
if not Recast_Keybind or Recast_Keybind == "" then
    recastKey_fullKeybind = "SHIFT-E"
    recastKey_fullKeybind_base = "E"
elseif not Recast_Modifier or Recast_Modifier == "" then
    recastKey_fullKeybind = Recast_Keybind
    recastKey_fullKeybind_base = recastKey_fullKeybind
else
    recastKey_fullKeybind = Recast_Modifier .. "-" .. Recast_Keybind
    recastKey_fullKeybind_base = Recast_Keybind
end




local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)
print(colorBlu:WrapTextInColorCode("Angleur Forever:") .. " Loaded.\nDue to a Blizzard Bug, saved variables for AddOns aren't working in the moment."
.. "\nA predetermined set of default settings have been loaded for Angleur, so that testing can go on without problem.\n"
.. "Please refer to the " .. colorYello:WrapTextInColorCode("FOREVER_README.txt ") .. "located in the addon's folder(Interface/AddOns/Angleur) for instructions on"
.. "how to change these settings.")




AngleurConfig = {
    angleurKey = angleurKey_fullKeybind,
    angleurKey_Base = angleurKey_fullKeybind_base,
    baitEnabled = nil,
    chosenBait = {itemID = 0, name = 0, dropDownID = 0},
    oversizedEnabled = nil,
    chosenMethod = Fishing_Method,
    doubleClickChosenID = 2,
    recastEnabled = Recast,
    recastKey = recastKey_fullKeybind,
    visualHidden = not Visual_Shown,
    visualLocation = {[1]="CENTER", [2]=nil, [3]="CENTER", [4]=Visual_XAxis, [5]=Visual_YAxis},
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
    show = Minimap_Shown
}

AngleurTutorial = {
    part = 10
}
