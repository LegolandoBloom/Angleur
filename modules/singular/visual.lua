local T = Angleur_Translate

local debugChannel = 5
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

Angleur_VisualMixin = {}

function Angleur_VisualMixin:OnClick(button, down)
    if button ~= "RightButton" or down == false then return end
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
end

function Angleur_VisualMixin:OnDoubleClick(button, down)
    if button ~= "LeftButton" then return end 
    self:GetParent().configPanel:Show() 
end

function Angleur_VisualMixin:OnEnter()
    self.closeButton:Show()
    if not self:IsDragging() then
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT", 45)
        if AngleurCharacter.sleeping == false then
            local colorBlu = CreateColor(0.61, 0.85, 0.92)
            local colorWhite = CreateColor(1, 1, 1)
            GameTooltip:AddLine(T["Angleur Visual Button"], 0.6, 0.85, 0.91)
            GameTooltip:AddLine(T["Shows what your next key press\nwill do. Not meant to be clicked."], 1, 1, 1, true)
            GameTooltip:AddLine(" ")
            if AngleurConfig.chosenMethod == "doubleClick" then
                GameTooltip:AddLine(T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("Double Click\n")], 1, 1, 1)
            elseif AngleurConfig.chosenMethod == "oneKey" then
                GameTooltip:AddLine(T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("One Key")], 1, 1, 1)
                if AngleurConfig.angleurKey then
                    GameTooltip:AddLine(colorWhite:WrapTextInColorCode(T["Key set to "]) .. AngleurConfig.angleurKey .. "\n ")
                else
                    GameTooltip:AddLine(T["One-Key NOT SET! To set,\nopen config menu with:"], 1, 0, 0, true)
                    GameTooltip:AddLine("/angleur")
                    GameTooltip:AddLine(T[" or\n"], 1, 1, 1, true)
                    GameTooltip:AddLine("/angang\n ")
                end
            end
            GameTooltip:AddLine(T["Right Click to temporarily put Angleur to sleep. zzz..."], 0.8, 0.8, 0.8, true)
        elseif AngleurCharacter.sleeping == true then
            GameTooltip:AddLine(T["Sleeping. Zzz...\n"], 1, 1, 1, true)
            GameTooltip:AddLine(T["\nRight-Click"])
            GameTooltip:AddLine(T["\nto wake Angleur!"], 1, 1, 1, true)
            self.sleep:SetPoint("TOPRIGHT", "GameTooltip", "TOPRIGHT", -15, 0)
            self.sleep:Show()
        end
        GameTooltip:Show()
    end
end

function Angleur_VisualMixin:OnLeave()
    if not self:IsMouseOver() then
        self.closeButton:Hide()
    end
    GameTooltip:Hide()
    if self.sleep:IsShown() then
        self.sleep:Hide()
    end
end

function Angleur_VisualMixin:AdjustScale(number)
    DevTools_Dump(self:GetOrigin())
end

function Angleur_VisualMixin:Reset(anchorFrame, offsetX, offsetY, showDragText)
    AngleurConfig.visualLocation = nil
    AngleurConfig.visualHidden = false
    self:ClearAllPoints()
    self:SetPoint("CENTER", anchorFrame, "CENTER", offsetX, offsetY)
    self:Raise()
    self:Show()
    Angleur.configPanel.tab1.contents.returnButton:Hide()
    if showDragText then
        self.dragText:Show()
    end
end

function Angleur_VisualHideHookScript()
    AngleurConfig.visualHidden = true
    print(T[colorBlu:WrapTextInColorCode("Angleur visual ") .. "is now hidden."])
    print(T["You can re-enable it from the"]) 
    print(T[colorYello:WrapTextInColorCode("Config Menu ") .. "accessed by: " .. colorYello:WrapTextInColorCode("/angleur ") .. " or  " .. colorYello:WrapTextInColorCode("/angang")])
    Angleur_ConfigPanel_Tab1_Contents_ReturnButton:Show()
    AngleurConfig.visualLocation = nil
    Angleur.visual:ClearAllPoints()
end

function Angleur_VisualMixin:Init()
    self:RegisterForClicks("AnyDown", "AnyUp")
    self:SetMovable(true)
    self:RegisterForDrag("LeftButton")
    self.dragText:SetText(T["You can drag and place this anywhere on your screen"])
    self:SetScript("OnDragStart", function(self, button)
        self:StartMoving()
        self.dragText:Hide()
        GameTooltip:Hide()
        if self.sleep:IsShown() then
            self.sleep.anim:Stop()
            self.sleep:Hide()
        end
    end)
    self:SetScript("OnDragStop", function(self)
        AngleurConfig.visualLocation = {self:GetPoint()}
        self:StopMovingOrSizing()
    end)

    self:ClearHighlightTexture()
    self:ClearPushedTexture()
    if AngleurConfig.visualHidden then
        self:Hide()
        Angleur.configPanel.tab1.contents.returnButton:Show()
    elseif AngleurConfig.visualLocation then
        local location = AngleurConfig.visualLocation
        self:ClearAllPoints()
        self:SetPoint(location[1], location[2], location[3], location[4], location[5])
    end
    self:Raise()

    self:SetScale(Angleur_TinyOptions.visualScale)
end


Angleur_Visual_ReturnButtonMixin = {}

function Angleur_Visual_ReturnButtonMixin:OnClick()
    if AngleurConfig.visualHidden == true then
        Angleur.visual:Reset(self, -75, -2, true)
        Angleur_CreateWeaponSwapFrames()
        self:Hide()
    end    
end

