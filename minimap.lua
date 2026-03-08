local T = Angleur_Translate
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorWhite = CreateColor(1, 1, 1)
local colorYello = CreateColor(1.0, 0.82, 0.0)

local minimapButtonCreated = false
function Angleur_InitMinimapButton()
    local mapData = LibStub("LibDataBroker-1.1"):NewDataObject("AngleurMap", {  
        type = "launcher",  
        text = "Angleur!",
        icon = "Interface\\AddOns\\Angleur\\images\\angminimap.png",
        OnClick = function(self, b) 
            if b == "RightButton" then
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
            elseif b == "LeftButton" then
                Angleur.configPanel:Show()
            elseif b == "MiddleButton" then
                self:Hide()
                AngleurMinimapButton.hide = true
                print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Minimap Icon hidden, " .. colorYello:WrapTextInColorCode("/angmini ") .. "to show."])
            end
        end,
        OnEnter = function(self)
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT", 45)
            GameTooltip:AddLine(colorBlu:WrapTextInColorCode("Angleur"))
            GameTooltip:AddLine(T["Left Click: " .. colorYello:WrapTextInColorCode("Config Panel")], 1, 1, 1)
            GameTooltip:AddLine(T["Right Click: " .. colorYello:WrapTextInColorCode("Sleep/Wake")], 1, 1, 1)
            GameTooltip:AddLine(T["Middle Button: " .. colorYello:WrapTextInColorCode("Hide Minimap Icon")], 1, 1, 1)
            GameTooltip:Show()
        end,
        OnLeave = function(self)
            GameTooltip:Hide()
        end,
        --Interface\\Icons\\INV_Chest_Cloth_17 
    })
    local icon = LibStub("LibDBIcon-1.0")
    icon:Register("AngleurMap", mapData , AngleurMinimapButton)
    minimapButtonCreated = true
    LibDBIcon10_AngleurMap:Show()
    AngleurMinimapButton.hide = false
    Angleur_CreateWeaponSwapFrames()
    Angleur_SetMinimapSleep()
end

SLASH_ANGLEURMINIMAP1 = T["/angmini"]
SlashCmdList["ANGLEURMINIMAP"] = function()
    if minimapButtonCreated == false then 
        Angleur_InitMinimapButton()
        return
    end
    if LibDBIcon10_AngleurMap:IsShown() then
        LibDBIcon10_AngleurMap:Hide()
        AngleurMinimapButton.hide = true
    else
        LibDBIcon10_AngleurMap:Show()
        AngleurMinimapButton.hide = false
        Angleur_CreateWeaponSwapFrames()
    end
end

function Angleur_SetMinimapSleep()
    if minimapButtonCreated == false then return end
    if AngleurCharacter.sleeping == true then
        LibDBIcon10_AngleurMap:DesaturateHierarchy(1)
    else
        LibDBIcon10_AngleurMap:DesaturateHierarchy(0)
    end
end