local T = Angleur_Translate

local colorDebug = CreateColor(0.24, 0.76, 1) -- angleur blue
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorGreen = CreateColor(0, 1, 0)
local colorRed = CreateColor(1, 0, 0)

local firstCast = false
function Angleur_FixPlater()
    if firstCast then return end
    if Angleur_TinyOptions.turnOffSoftInteract == true then
        
    elseif C_CVar.GetCVar("SoftTargetInteract") == "3" then
        firstCast = true
    else
        --__________________________________________________________________________________________________________________________________
        --                                                  ! PLATER MEASURE !
        -- Plater somehow turns off softInteract AFTER everything loads which is why I have to forcibly enable it on the FIRST FISHING CAST
        --                  using HandeTempCVars. On PLAYER_LEAVING_WORLD I call it again to restore default values
        --                                     Also tell the player about the Plater interaction
        --__________________________________________________________________________________________________________________________________
        if not Angleur_TinyOptions.loginDisabled then
            if C_AddOns.IsAddOnLoaded("Plater") then
                print("----------------------------------------------------------------------------------------------------------------------------------")
                print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ") .. "detected."])
                print(T["Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ") 
                .. "General Settings" .. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"])
                print(T["Has been " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to be able to " .. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] .. "\n\n")
                print(T["If you want Soft-Interact to be " .. colorRed:WrapTextInColorCode("TURNED OFF ") .. "when not fishing, go to:\n" 
                .. "Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact\nand check it " 
                .. colorGreen:WrapTextInColorCode("ON.")])
                print("----------------------------------------------------------------------------------------------------------------------------------")
                print(T["To stop seeing these messages, go to:"])
                print(T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") 
                .. "Tiny tab(tab 3),  and disable \'Login Messages\'"])
            else
                print("----------------------------------------------------------------------------------------------------------------------------------")
                print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Soft Interact has been turned " .. colorGreen:WrapTextInColorCode("ON ") .. "for you to be able to "
                .. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches. The previous values will be restored upon logout, so that if you uninstall Angleur you will have them back to normal."])
                print(T["If you want Soft-Interact to be " .. colorRed:WrapTextInColorCode("TURNED OFF ") .. "when not fishing, go to:\n" 
                .. "Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact\nand check it " 
                .. colorGreen:WrapTextInColorCode("ON.")])
                print("----------------------------------------------------------------------------------------------------------------------------------")
                print(T["To stop seeing these messages, go to:"])
                print(T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") 
                .. "Tiny tab(tab 3),  and disable \'Login Messages\'"])
            end
        end
        firstCast = true
    end
end