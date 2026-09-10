local T = Angleur_Translate
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorWhite = CreateColor(1, 1, 1)
local colorYello = CreateColor(1.0, 0.82, 0.0)

function Angleur_AddonCompartment_OnClick(addonName, clickButton)
    if clickButton == "RightButton" then
        if InCombatLockdown() then
            print(T["Can't change sleep state in combat."])
            return
        end
        if UnitIsDeadOrGhost("player") then
            print(T["Can't change sleep state while in ghost form."])
            return
        end
        if AngleurCharacter.sleeping == true then
            AngleurCharacter.sleeping = false
            Angleur_SetSleep()
            Angleur_EquipAngleurSet(true)
            print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Awake."])
        elseif AngleurCharacter.sleeping == false then
            AngleurCharacter.sleeping = true
            Angleur_SetSleep()
            Angleur_UnequipAngleurSet()
            print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping."])
        end
    else
        Angleur.configPanel:Show()
    end
end

function Angleur_AddonCompartment_OnEnter(addonName, compartmentButton)
    GameTooltip:SetOwner(compartmentButton, "ANCHOR_BOTTOMLEFT", 45)
    GameTooltip:AddLine(colorBlu:WrapTextInColorCode("Angleur"))
    GameTooltip:AddLine(T["Left Click: " .. colorYello:WrapTextInColorCode("Config Panel")], 1, 1, 1)
    GameTooltip:AddLine(T["Right Click: " .. colorYello:WrapTextInColorCode("Sleep/Wake")], 1, 1, 1)
    GameTooltip:Show()
end

function Angleur_AddonCompartment_OnLeave()
    GameTooltip:Hide()
end