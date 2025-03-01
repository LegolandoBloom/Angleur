function AngleurUI_AdvancedAngling()
    local advancedButton = CreateFrame("Button", "$parent_AdvancedButton", Angleur.configPanel.tab2.contents, "GameMenuButtonTemplate")
    advancedButton:SetSize(85, 45)
    advancedButton:SetPoint("BOTTOM", Angleur.configPanel.tab2.contents, "BOTTOM", -12, 20)
    advancedButton:SetScript("OnClick", function()
        Angleur_AdvancedAnglingPanel:Show()
    end)
    advancedButton.text = advancedButton:CreateFontString("Angleur_AdvancedButton_Text", "ARTWORK", "SplashHeaderFont")
    advancedButton.text:SetPoint("CENTER", advancedButton, "CENTER", 2, -2)
    advancedButton.text:SetText("HOW?")

    local advancedPanel = CreateFrame("Frame", "Angleur_AdvancedAnglingPanel", UIParent, "BasicFrameTemplateWithInset")
    tinsert(UISpecialFrames, "Angleur_AdvancedAnglingPanel")
    advancedPanel:Hide()
    advancedPanel:SetPoint("CENTER", UIParent, "CENTER")
    advancedPanel:SetSize(1100, 560)
    advancedPanel:SetMovable(true)
    advancedPanel:RegisterForDrag("LeftButton")
    advancedPanel:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    advancedPanel:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)
    advancedPanel:SetScript("OnMouseDown", function(self)
        self:Raise()
    end)
    advancedPanel.TitleText:SetText("Advanced Angling")
    advancedPanel:SetFrameStrata("HIGH")
    advancedPanel:SetToplevel(true)
    advancedPanel:SetScript("OnShow", function(self)
        self:Raise()
    end)

    local texture = advancedPanel:CreateTexture("Angleur_AdvancedAnglingPanel_Texture", "OVERLAY")
    texture:SetSize(1024, 512)
    texture:SetPoint("CENTER")
    texture:SetTexture("Interface/AddOns/Angleur/images/advancedAngling.png")

    local colorBlu = CreateColor(0.61, 0.85, 0.92)
    local colorWhite = CreateColor(1, 1, 1)
    local colorYellow = CreateColor(1.0, 0.82, 0.0)

    local title = advancedPanel:CreateFontString(nil, "OVERLAY", "Game15Font")
    title:SetPoint("TOP", advancedPanel, "TOP", 320, -50)
    title:SetWordWrap(true)
    title:SetJustifyH("LEFT")
    title:SetJustifyV("TOP")
    title:SetText(colorBlu:WrapTextInColorCode("Angleur ") .. "will have you cast the dragged item/macro\nif all of their below listed conditions are met.")

    local explanation = advancedPanel:CreateFontString(nil, "OVERLAY", "Game15Font")
    explanation:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -20)
    explanation:SetWordWrap(true)
    explanation:SetJustifyH("LEFT")
    explanation:SetJustifyV("TOP")
    explanation:SetSize(380, 1000)
    explanation:SetText(colorYellow:WrapTextInColorCode("Items:\n") .. 
    "- Any usable item from your bags or character equipment. " ..
    "\n\n Whenever:\n\n   1) ".. colorYellow:WrapTextInColorCode("Off-Cooldown\n") .. "   2) " .. colorYellow:WrapTextInColorCode("Aura Inactive") .. " (if present)\n"
     .. colorYellow:WrapTextInColorCode("\nMacros:\n") .. 
     "- Any valid macro that contains a spell or a usable item - /cast or /use. " ..
    "\n\n Whenever:\n\n   1) ".. colorYellow:WrapTextInColorCode("Macro Conditions ") .. "are met\n" .. "   2) Spell/Item is " .. colorYellow:WrapTextInColorCode("Off-Cooldown\n") 
    .. "                    and their\n   3) " .. colorYellow:WrapTextInColorCode("Auras Inactive") .. " (if present)\n\n" ..
    colorYellow:WrapTextInColorCode("IMPORTANT: ") .. "If you are using Macro Conditionals, they need to be ACTIVE when you drag the macro to the slot.\n" .. 
    "_____________________________________________")

    local clock = advancedPanel:CreateTexture("Angleur_AdvancedAnglingPanel_TimerTexture", "OVERLAY")
    clock:SetSize(64, 64)
    clock:SetPoint("BOTTOMLEFT", texture, "BOTTOMRIGHT", -390, 10)
    clock:SetTexture("Interface/AddOns/Angleur/images/timeIcon.png")

    local clockText = advancedPanel:CreateFontString(nil, "OVERLAY", "Game15Font")
    clockText:SetPoint("LEFT", clock, "RIGHT", 0, 0)
    clockText:SetWordWrap(true)
    clockText:SetJustifyH("LEFT")
    clockText:SetJustifyV("TOP")
    clockText:SetText("Spell/Item has no Cooldown/Aura?\n" ..
    "Click " .. colorYellow:WrapTextInColorCode("the Stopwatch ") .. "to set a manual timer.\n" .. colorYellow:WrapTextInColorCode("                                                 (minutes:seconds)"))

end