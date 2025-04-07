if (GAME_LOCALE or GetLocale()) ~= "ruRU" then
  return
end

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

local T = Angleur_Translate

--Angleur.xml

T["Ultra Focus:"] = "Ultra Focus:"
T["You can drag and place this anywhere on your screen"] = "You can drag and place this anywhere on your screen"
T["FISHING METHOD:"] = "FISHING METHOD:"
T["One Key"] = "One Key"
T["The next key you press\nwill be set as Angleur Key"] = "The next key you press\nwill be set as Angleur Key"
T["Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"] = "Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"
T["Return\nAngleur Visual"] = "Return\nAngleur Visual"
T["Double Click"] = "Double Click"
T["Redo Tutorial"] = "Redo Tutorial"
T["Wake!"] = "Wake!"
T["Create\n  Add"] = "Create\n  Add"
T["Update"] = "Update"
T["Please select a toy using Left Mouse Click"] = "Please select a toy using Left Mouse Click"
T["Make sure this box is checked!"] = "Make sure this box is checked!"
T["Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."] = "Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."
T["Angleur Configuration"] = "Angleur Configuration"
T["The next key you press\nwill be set as Angleur Key"] = "The next key you press\nwill be set as Angleur Key"
T["Having Problems?"] = "Having Problems?"
T["Angleur Warning: Plater"] = "Angleur Warning: Plater"
T["Okay"] = "Okay"


--extra.lua

T["Extra Toys"] = "Extra Toys"
T["   " .. colorYello:WrapTextInColorCode("Click ") .. "any of the buttons above\nthen select a toy with left click from\nthe " 
.. colorYello:WrapTextInColorCode("Toy Box ") .. "that pops up."] = "   " .. colorYello:WrapTextInColorCode("Click ") .. "any of the buttons above\nthen select a toy with left click from\nthe " 
    .. colorYello:WrapTextInColorCode("Toy Box ") .. "that pops up."

T["Extra Items / Macros"] = "Extra Items / Macros"

T["   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " .. 
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes below."] = "   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " .. 
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes below."


--standard.lua

T["Raft"] = "Raft"
T["Couldn't find any rafts \n in toybox, feature disabled"] = "Couldn't find any rafts \n in toybox, feature disabled"
T["Oversized Bobber"] = "Oversized Bobber"
T["Couldn't find \n Oversized Bobber in \n toybox, feature disabled"] = "Couldn't find \n Oversized Bobber in \n toybox, feature disabled"
T["Crate of Bobbers"] = "Crate of Bobbers"
T["Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"] = "Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"
T["Crate Bobbers"] = "Crate Bobbers"
T["Ultra Focus:"] = "Ultra Focus:"
T["Audio"] = "Audio"
T["Temp. Auto Loot "] = "Temp. Auto Loot "
T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot") 
.. ", then turn it back off after you reel.\n\n" .. colorGrae:WrapTextInColorCode("If you have ")
.. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")] = "If checked, Angleur will temporarily turn on " 
.. colorYello:WrapTextInColorCode("Auto-Loot") .. ", then turn it back off after you reel.\n\n" 
.. colorGrae:WrapTextInColorCode("If you have ") .. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")
T["(Already on)"] = "(Already on)"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a " 
.. colorYello:WrapTextInColorCode("/reload") .. " to fix it."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "If you experience stiffness with the Double-Click, do a " .. colorYello:WrapTextInColorCode("/reload") .. " to fix it."
T["Rafts"] = "Rafts"
T["Random Bobber"] = "Random Bobber"
T["Preferred Mouse Button"] = "Preferred Mouse Button"
T["Right Click"] = "Right Click"


--tabs-general.lua

T[colorBlu:WrapTextInColorCode("Angleur visual ") .. "is now hidden."] = colorBlu:WrapTextInColorCode("Angleur visual ") .. "is now hidden."
T["You can re-enable it from the"] = "You can re-enable it from the"
T[colorYello:WrapTextInColorCode("Config Menu ") .. "accessed by: " 
.. colorYello:WrapTextInColorCode("/angleur ") .. " or  " 
.. colorYello:WrapTextInColorCode("/angang")] = colorYello:WrapTextInColorCode("Config Menu ") 
.. "accessed by: " .. colorYello:WrapTextInColorCode("/angleur ") 
.. " or  " .. colorYello:WrapTextInColorCode("/angang")



--tiny.lua

T["Disable Soft Interact"] = "Disable Soft Interact"

T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n" 
.. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")] = "If checked, Angleur will disable " 
.. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n" 
.. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")

T["Can't change in combat."] = "Can't change in combat."

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off " 
.. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "will now turn off " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."

T["Dismount With Key"] = "Dismount With Key"

T["If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ") 
.. "when you use OneKey/DoubleClick.\n\n" 
.. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")] = "If checked, Angleur will make you " 
.. colorYello:WrapTextInColorCode("dismount ") .. "when you use OneKey/DoubleClick.\n\n" 
.. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now " 
.. colorYello:WrapTextInColorCode("dismount ") .. "you"] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "will now " .. colorYello:WrapTextInColorCode("dismount ") .. "you"

T["Disable Soft Icon"] = "Disable Soft Icon"

T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."] = "Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."

T["Soft target icon for game objects disabled."] = "Soft target icon for game objects disabled."
T["Soft target icon for game objects re-enabled."] = "Soft target icon for game objects re-enabled."
T["Double Click Window"] = "Double Click Window"
T["Visual Size"] = "Visual Size"
T["Master Volume(Ultra Focus)"] = "Master Volume(Ultra Focus)"
T["Login Messages"] = "Login Messages"