local T = Angleur_Translate
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

AngleurTinyPanelRetail = {}
local retail = AngleurTinyPanelRetail

function retail:ExtraButtons(tab3_contents)
    tab3_contents.offInteract.text:SetText(T["Disable Soft Interact"])
    tab3_contents.offInteract:reposition()
    --tab3_contents.offInteract.text:SetFontObject(SpellFont_Small)
    tab3_contents.offInteract.text.tooltip = T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n" 
    .. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")]
    tab3_contents.offInteract:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print(T["Can't change in combat."])
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.turnOffSoftInteract = true
            Angleur_UltraFocusInteractOff(false)
            print(T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."])
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.turnOffSoftInteract = false
            Angleur_UltraFocusInteractOff(true)
        end
    end)
    if Angleur_TinyOptions.turnOffSoftInteract == true then
        tab3_contents.offInteract:SetChecked(true)
    end

    tab3_contents.softIconOff.text:SetText(T["Disable Soft Icon"])
    tab3_contents.softIconOff:reposition()
    --tab3_contents.softIconOff.text:SetFontObject(SpellFont_Small)
    tab3_contents.softIconOff.text.tooltip = T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."]
    tab3_contents.softIconOff:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print(T["Can't change in combat."])
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.softIconOff = true
            if C_CVar.GetCVar("SoftTargetIconGameObject") == "1" then
                C_CVar.SetCVar("SoftTargetIconGameObject", "0")
            end
            self.disabledTexture:Show()
            print(T["Soft target icon for game objects disabled."])
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.softIconOff = false
            C_CVar.SetCVar("SoftTargetIconGameObject", "1")
            self.disabledTexture:Hide()
            print(T["Soft target icon for game objects re-enabled."])
        end
    end)
    if Angleur_TinyOptions.softIconOff == true then
        tab3_contents.softIconOff:SetChecked(true)
        tab3_contents.softIconOff.disabledTexture:Show()
    end
end

function retail:SetDefaultsButtonScript(tab3_contents)
    tab3_contents.defaults:SetScript("OnClick", function()
        Angleur_TinyOptions.turnOffSoftInteract = false
        Angleur_TinyOptions.allowDismount = false
        Angleur_TinyOptions.softIconOff = false
        Angleur_TinyOptions.doubleClickWindow = 0.4
        Angleur_TinyOptions.visualScale = 1
        Angleur_TinyOptions.ultraFocusMaster = 1
        Angleur_TinyOptions.loginDisabled = false
        Angleur_TinyOptions.errorsDisabled = true
        tab3_contents.offInteract:SetChecked(false)
        tab3_contents.dismount:SetChecked(false)
        tab3_contents.softIconOff:SetChecked(false)
        tab3_contents.doubleClickWindow:SetValue(4)
        tab3_contents.visualSize:SetValue(10)
        tab3_contents.ultraFocusMaster:SetValue(100)
        tab3_contents.loginMessages:SetChecked(true)
        tab3_contents.debugMode:SetChecked(false)
        print(T["Default tiny settings restored"])
    end)
end