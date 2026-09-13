local T = Angleur_Translate

local debugChannel = 5
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

Angleur_VisualMixin = {}

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



Angleur_Visual_ReturnButtonMixin = {}

function Angleur_Visual_ReturnButtonMixin:OnClick()
    if AngleurConfig.visualHidden == true then
        Angleur.visual:Reset(self, -75, -2, true)
        Angleur_CreateWeaponSwapFrames()
        self:Hide()
    end    
end

