Angleur_TinyOptions = {
    turnOffSoftInteract = false,
    allowDismount = false,
    doubleClickWindow = 0.4,
    visualScale = 1,
    ultraFocusMaster = 1,
    loginDisabled = false,
    errorsDisabled = true,
}

function Angleur_SetTab3(self)
    local colorYello = CreateColor(1.0, 0.82, 0.0)
    local colorGrae = CreateColor(0.85, 0.85, 0.85)
    local colorBlu = CreateColor(0.61, 0.85, 0.92)
    self.offInteract.text:SetText("Disable Soft Interact")
    --self.offInteract.text:SetFontObject(SpellFont_Small)
    self.offInteract.text.tooltip = "If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n" 
    .. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")
    self.offInteract:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print("Can't change in combat.")
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.turnOffSoftInteract = true
            Angleur_UltraFocusInteractOff(false)
            print(colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing.")
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.turnOffSoftInteract = false
            Angleur_UltraFocusInteractOff(true)
        end
    end)
    if Angleur_TinyOptions.turnOffSoftInteract == true then
        self.offInteract:SetChecked(true)
    end

    self.dismount.text:SetText("Dismount With Key")
    --self.dismount.text:SetFontObject(SpellFont_Small)
    self.dismount.text.tooltip = "If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ") .. "when you use OneKey/DoubleClick.\n\n" 
    .. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")
    self.dismount:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print("Can't change in combat.")
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.allowDismount = true
            print(colorBlu:WrapTextInColorCode("Angleur ") .. "will now " .. colorYello:WrapTextInColorCode("dismount ") .. "you")
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.allowDismount = false
        end
    end)
    if Angleur_TinyOptions.allowDismount == true then
        self.dismount:SetChecked(true)
    end

    self.doubleClickWindow.ValueBox:SetNumericFullRange()
    self.doubleClickWindow:SetupSlider(1, 20, 4, 1, colorYello:WrapTextInColorCode("Double Click Window"))
    self.doubleClickWindow:SetCallback(function(value, isUserInput)
        Angleur_TinyOptions.doubleClickWindow = value/10
    end)
    
    self.visualSize.ValueBox:SetNumericFullRange()
    self.visualSize:SetupSlider(1, 20, Angleur_TinyOptions.visualScale*10, 1, colorYello:WrapTextInColorCode("Visual Size"))
    self.visualSize:SetCallback(function(value, isUserInput)
        Angleur_TinyOptions.visualScale = value/10
        Angleur_VisualReset(self.visualSize.buttonHolder, 0, 0)
        Angleur.visual:SetScale(Angleur_TinyOptions.visualScale)
        Angleur.visual:Raise()
        --DevTools_Dump({Angleur.visual:GetPoint(1)})
    end)

    self.ultraFocusMaster.ValueBox:SetNumericFullRange()
    self.ultraFocusMaster:SetupSlider(1, 100, 100, 1, colorYello:WrapTextInColorCode("Master Volume(Ultra Focus)"))
    self.ultraFocusMaster:SetCallback(function(value, isUserInput)
        Angleur_TinyOptions.ultraFocusMaster = value/100
    end)

    self.loginMessages.text:SetText("Login Messages")
    --self.loginMessages.text:SetFontObject(SpellFont_Small)
    self.loginMessages:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print("Can't change in combat.")
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.loginDisabled = false
            print("login messages re-enabled")
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.loginDisabled = true
            print("login messages disabled")
        end
    end)
    if Angleur_TinyOptions.loginDisabled == false then
        self.loginMessages:SetChecked(true)
    end


    self.debugMode.text:SetText("Debug Mode")
    --self.debugMode.text:SetFontObject(SpellFont_Small)
    self.debugMode:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print("Can't change in combat.")
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.errorsDisabled = false
            print("debug mode active")
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.errorsDisabled = true
            print("debug mode deactivated")
        end
    end)
    if Angleur_TinyOptions.errorsDisabled == false then
        self.debugMode:SetChecked(true)
    end


    self.defaults.text = self.defaults:CreateFontString("Angleur_AdvancedButton_Text", "ARTWORK", "Game12Font_o1")
    self.defaults.text:SetPoint("CENTER", self.defaults, "CENTER", 2, -2)
    self.defaults.text:SetText(colorYello:WrapTextInColorCode("Defaults"))
    self.defaults:SetScript("OnClick", function()
        Angleur_TinyOptions.turnOffSoftInteract = false
        Angleur_TinyOptions.allowDismount = false
        Angleur_TinyOptions.doubleClickWindow = 0.4
        Angleur_TinyOptions.visualScale = 1
        Angleur_TinyOptions.ultraFocusMaster = 1
        Angleur_TinyOptions.loginDisabled = false
        Angleur_TinyOptions.errorsDisabled = true
        self.offInteract:SetChecked(false)
        self.dismount:SetChecked(false)
        self.doubleClickWindow:SetValue(4)
        self.visualSize:SetValue(10)
        self.ultraFocusMaster:SetValue(100)
        self.loginMessages:SetChecked(true)
        self.debugMode:SetChecked(false)
        print("Default tiny settings restored")
    end)

    self.redoTutorial.icon:SetTexture("Interface/BUTTONS/UI-RefreshButton")
    self.redoTutorial.icon:SetTexCoord(0, 1, 0, 1)
    self.redoTutorial.icon:SetSize(16, 16)
    local warningFrame = CreateFrame("Frame", "Angleur_RedoTutorial_WarningFrame", self.redoTutorial, "Angleur_WarningFrame")
    warningFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
    warningFrame:SetSize(320, 96)
    warningFrame.TitleText:SetText("Angleur Warning")
    warningFrame.mainText:SetText("This will restart the tutorial, are you sure?")
    warningFrame.yesButton:SetText(colorYello:WrapTextInColorCode("Yes"))
    warningFrame.yesButton:SetScript("OnClick", function()
        warningFrame:Hide()
        AngleurTutorial.part = 1
        print("First install tutorial restarting.")
        Angleur_BetaPrint(AngleurTutorial.part)
        Angleur_FirstInstall()
    end)
    warningFrame.noButton:SetText(colorYello:WrapTextInColorCode("No"))
    warningFrame.noButton:SetScript("OnClick", function()
        warningFrame:Hide()
    end)
    self.redoTutorial:RegisterForClicks("AnyUp")
    self.redoTutorial:SetScript("OnClick", function() 
        warningFrame:Show()
    end)
end