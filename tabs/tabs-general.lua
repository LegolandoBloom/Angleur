function Angleur_TabSystem(self)
    local tabsMain = self:GetParent()
    local tabButtons = {tabsMain:GetChildren()}
    for i, button in pairs(tabButtons) do
        local pKey = button:GetParentKey()
        if pKey == "CloseButton" or pKey == "wakeUpButton" then
            --DON'T INCLUDE
            --THE CLOSE BUTTON + Angleur WakefromSleep Frame
        elseif self ~= button and (pKey == "tab1" or pKey == "tab2" or pKey == "tab3") then
            button:SetSelected(false)
            button.contents:Hide()
            button:Enable()
        end
    end
    if self:IsSelected() then
        self.contents:Show()
        local parent = self:GetParent()
        self:Disable()
    else
        self.contents:Hide()
    end
end

function Init_AngleurVisual()
    Angleur.visual:RegisterForClicks("AnyDown", "AnyUp")
    Angleur.visual:SetMovable(true)
    Angleur.visual:RegisterForDrag("LeftButton")
    Angleur.visual:SetScript("OnDragStart", function(self, button)
        self:StartMoving()
        self.dragText:Hide()
        GameTooltip:Hide()
        if self.sleep:IsShown() then
            self.sleep.anim:Stop()
            self.sleep:Hide()
        end
    end)
    Angleur.visual:SetScript("OnDragStop", function(self)
        AngleurConfig.visualLocation = {self:GetPoint()}
        self:StopMovingOrSizing()
    end)

    Angleur.visual:ClearHighlightTexture()
    Angleur.visual:ClearPushedTexture()
    if AngleurConfig.visualHidden then
        Angleur.visual:Hide()
        Angleur.configPanel.tab1.contents.returnButton:Show()
    elseif AngleurConfig.visualLocation then
        local location = AngleurConfig.visualLocation
        Angleur.visual:ClearAllPoints()
        Angleur.visual:SetPoint(location[1], location[2], location[3], location[4], location[5])
    end
    Angleur.visual:Raise()

    Angleur.visual:SetScale(Angleur_TinyOptions.visualScale)
end

function Angleur_ScaleVisual(number)
    DevTools_Dump(Angleur.visual:GetOrigin())
end

function Angleur_VisualReset(anchorFrame, offsetX, offsetY, showDragText)
    AngleurConfig.visualLocation = nil
    AngleurConfig.visualHidden = false
    Angleur.visual:ClearAllPoints()
    Angleur.visual:SetPoint("CENTER", anchorFrame, "CENTER", offsetX, offsetY)
    Angleur.visual:Raise()
    Angleur.visual:Show()
    Angleur.configPanel.tab1.contents.returnButton:Hide()
    if showDragText then
        Angleur.visual.dragText:Show()
    end
end

function Angleur_VisualHideHookScript()
    AngleurConfig.visualHidden = true
    local color = CreateColor(0.6, 0.85, 0.91)
    print(color:WrapTextInColorCode("Angleur visual"), "is now hidden.")
    local color = CreateColor(1.0, 0.82, 0.0)
    print("You can re-enable it from the") 
    print(color:WrapTextInColorCode("Config Menu"), "accessed by:", color:WrapTextInColorCode("/angleur"), " or ", color:WrapTextInColorCode("/angang"))
    Angleur_ConfigPanel_Tab1_Contents_ReturnButton:Show()
    AngleurConfig.visualLocation = nil
    Angleur.visual:ClearAllPoints()
end

