local T = Angleur_Translate
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

local retail = AngleurTinyPanelRetail
local cata = AngleurTinyPanelCata

function Angleur_SetTab3(self)
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 1 then
        retail:ExtraButtons(self)
    elseif gameVersion == 2 or gameVersion == 3 then
        --nothing
    end
    
    self.dismount.text:SetText(T["Dismount With Key"])
    self.dismount:reposition()
    --self.dismount.text:SetFontObject(SpellFont_Small)
    self.dismount.text.tooltip = T["If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ")
    .. "when you use OneKey/DoubleClick.\n\n" .. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")]
    self.dismount:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print(T["Can't change in combat."])
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.allowDismount = true
            print(T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now " .. colorYello:WrapTextInColorCode("dismount ") .. "you"])
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.allowDismount = false
        end
    end)
    if Angleur_TinyOptions.allowDismount == true then
        self.dismount:SetChecked(true)
    end


    self.doubleClickWindow.ValueBox:SetNumericFullRange()
    self.doubleClickWindow:SetupSlider(1, 20, 4, 1, colorYello:WrapTextInColorCode(T["Double Click Window"]))
    self.doubleClickWindow:SetCallback(function(value, isUserInput)
        Angleur_TinyOptions.doubleClickWindow = value/10
    end)
    
    self.visualSize.ValueBox:SetNumericFullRange()
    self.visualSize:SetupSlider(1, 20, Angleur_TinyOptions.visualScale*10, 1, colorYello:WrapTextInColorCode(T["Visual Size"]))
    self.visualSize:SetCallback(function(value, isUserInput)
        Angleur_TinyOptions.visualScale = value/10
        Angleur_VisualReset(self.visualSize.buttonHolder, 0, 0)
        Angleur.visual:SetScale(Angleur_TinyOptions.visualScale)
        Angleur.visual:Raise()
        --DevTools_Dump({Angleur.visual:GetPoint(1)})
    end)

    self.ultraFocusMaster.ValueBox:SetNumericFullRange()
    self.ultraFocusMaster:SetupSlider(1, 100, 100, 1, colorYello:WrapTextInColorCode(T["Master Volume(Ultra Focus)"]))
    self.ultraFocusMaster:SetCallback(function(value, isUserInput)
        Angleur_TinyOptions.ultraFocusMaster = value/100
    end)


    self.loginMessages.text:SetText(T["Login Messages"])
    self.loginMessages:reposition()
    --self.loginMessages.text:SetFontObject(SpellFont_Small)
    self.loginMessages:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print(T["Can't change in combat."])
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.loginDisabled = false
            print(T["login messages re-enabled"])
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.loginDisabled = true
            print(T["login messages disabled"])
        end
    end)
    if Angleur_TinyOptions.loginDisabled == false then
        self.loginMessages:SetChecked(true)
    end


    self.debugMode.text:SetText(T["Debug Mode"])
    self.debugMode:reposition()
    --self.debugMode.text:SetFontObject(SpellFont_Small)
    self.debugMode:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print(T["Can't change in combat."])
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.errorsDisabled = false
            print(T["debug mode active"])
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.errorsDisabled = true
            print(T["debug mode deactivated"])
        end
    end)
    if Angleur_TinyOptions.errorsDisabled == false then
        self.debugMode:SetChecked(true)
    end


    self.defaults.text = self.defaults:CreateFontString("Angleur_AdvancedButton_Text", "ARTWORK", "Game12Font_o1")
    self.defaults.text:SetPoint("CENTER", self.defaults, "CENTER", 2, -2)
    self.defaults.text:SetText(colorYello:WrapTextInColorCode(T["Defaults"]))
    if gameVersion == 1 then
        retail:SetDefaultsButtonScript(self)
    elseif gameVersion == 2 or gameVersion == 3 then
        cata:SetDefaultsButtonScript(self)
    end
    
    self.redoTutorial.title:SetText(T["Redo Tutorial"])
    self.redoTutorial.icon:SetTexture("Interface/BUTTONS/UI-RefreshButton")
    self.redoTutorial.icon:SetTexCoord(0, 1, 0, 1)
    self.redoTutorial.icon:SetSize(16, 16)
    local warningFrame = CreateFrame("Frame", "Angleur_RedoTutorial_WarningFrame", self.redoTutorial, "Angleur_WarningFrame")
    warningFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
    warningFrame:SetSize(320, 96)
    warningFrame.TitleText:SetText(T["Angleur Warning"])
    warningFrame.mainText:SetText(T["This will restart the tutorial, are you sure?"])
    warningFrame.yesButton:SetText(colorYello:WrapTextInColorCode(T["Yes"]))
    warningFrame.yesButton:SetScript("OnClick", function()
        warningFrame:Hide()
        AngleurTutorial.part = 1
        print(T["First install tutorial restarting."])
        Angleur_BetaPrint(AngleurTutorial.part)
        Angleur_FirstInstall()
    end)
    warningFrame.noButton:SetText(colorYello:WrapTextInColorCode(T["No"]))
    warningFrame.noButton:SetScript("OnClick", function()
        warningFrame:Hide()
    end)
    self.redoTutorial:RegisterForClicks("AnyUp")
    self.redoTutorial:SetScript("OnClick", function() 
        warningFrame:Show()
    end)
end