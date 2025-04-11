if (GAME_LOCALE or GetLocale()) ~= "deDE" then
  return
end

local T = Angleur_Translate


--Angleur.xml
T["Ultra Focus:"] = "Aufmerksamkeitmodus"
T["Sie können diese "] = "You can drag and place this anywhere on your screen"
T["FISHING METHOD:"] = "ANGELMETHODE:"
T["One Key"] = "Einzige Taste"
T["The next key you press\nwill be set as Angleur Key"] = "Die nächste Taste, die Sie drücken,\nwird als Angleur-Taste festgelegt"
T["Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"] = "Bitte legen Sie eine\nTastenkombination fest mit Hilfe des obenen Kastens"
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
T["Having Problems?"] = "Gibt's Probleme?"
T["Angleur Warning: Plater"] = "Angleur Warning: Plater"
T["Okay"] = "Okay"
    --Angleur.xml->Tooltips
    T["Angleur Visual Button"] = "Angleur Visual Button"
    T["Shows what your next key press\nwill do. Not meant to be clicked."] = "Shows what your next key press\nwill do. Not meant to be clicked."
    T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("Double Click\n")] = "Fishing Mode: " .. colorBlu:WrapTextInColorCode("Double Click\n")
    T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("One Key")] = "Fishing Mode: " .. colorBlu:WrapTextInColorCode("One Key")
    T["One-Key NOT SET! To set,\nopen config menu with:"] = "One-Key NOT SET! To set,\nopen config menu with:"
    T[" or\n"] = " or\n"
    T["Right Click to temporarily put Angleur to sleep. zzz..."] = "Right Click to temporarily put Angleur to sleep. zzz..."
    T["Sleeping. Zzz...\n"] = "Sleeping. Zzz...\n"
    T["\nRight-Click"] = "\nRight-Click"
    T["\nto wake Angleur!"] = "\nto wake Angleur!"
    T["One-Key Fishing Mode"] = "One-Key Fishing Mode"
    T["Fish, reel, cast toys using \none button!\n"] = "Fish, reel, cast toys using \none button!\n"
    T["Set your desired key by: "] = "Set your desired key by: "
    T["Clicking on the button\nthat appears below\nonce this option is selected."] = "Clicking on the button\nthat appears below\nonce this option is selected."
    T["Double-Click Fishing Mode"] = "Double-Click Fishing Mode"
    T["Fish, reel, cast toys using double mouse clicks!\n"] = "Fish, reel, cast toys using double mouse clicks!\n"
    T["Select which mouse button by:"] = "Select which mouse button by:"
    T["Clicking on the box that appears below once this option is selected.\n"] = "Clicking on the box that appears below once this option is selected.\n"
    T["Not every toy will work!"] = "Not every toy will work!"
    T["Extra Toys is a feature meant to provide flexible user customization, but not every toy is" 
    .. " created the same. Targeted toys, toys that silence you, remote controlled toys etc might mess with your fishing routine."
    .. " Test them out, experiment and have fun!\n"] = "Extra Toys is a feature meant to provide flexible user customization, but not every toy is" 
    .. " created the same. Targeted toys, toys that silence you, remote controlled toys etc might mess with your fishing routine."
    .. " Test them out, experiment and have fun!\n"
    T["Fun toy recommendations from mod author, Legolando:"] = "Fun toy recommendations from mod author, Legolando:"
    T["1) Tents such as Gnoll Tent to protect yourself from the sun as you fish."
    .. "\n2) Transformation toys such as Burning Defender's Medallion.\n3) Seating items like pillows so you can fish comfortably."
    .. "\n4) Darkmoon whistle if you want to be annoying.\nAnd other whacky combinations!"] = "1) Tents such as Gnoll Tent to protect yourself from the sun as you fish."
    .. "\n2) Transformation toys such as Burning Defender's Medallion.\n3) Seating items like pillows so you can fish comfortably."
    .. "\n4) Darkmoon whistle if you want to be annoying.\nAnd other whacky combinations!"
    T["Beta: " .. colorWhite:WrapTextInColorCode("If you are having trouble,\ntry resetting the set by clicking\nthe reset button then refreshing\nthe UI with ") 
    .. "/reload."] = "Beta: " .. colorWhite:WrapTextInColorCode("If you are having trouble,\ntry resetting the set by clicking\nthe reset button then refreshing\nthe UI with ") 
    .. "/reload."
    T["Reset Angleur Set"] = "Reset Angleur Set"
    --Cata
    T[colorWhite:WrapTextInColorCode("\nEquip a ") .. "Fishing Pole\n")] = colorWhite:WrapTextInColorCode("\nEquip a ") .. "Fishing Pole\n")
    T["\nor"] = "\nor"
    T["Note for Cata:"] = "Note for Cata:"
    T["Mouseover the bobber\nto reel consistently."] = "Mouseover the bobber\nto reel consistently."
    T["(If it lands too far, the\nsoft-interact will miss it.)"] = "(If it lands too far, the\nsoft-interact will miss it.)"


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