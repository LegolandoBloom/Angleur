local T = Angleur_Translate

local debugChannel = 5

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.retail.tinyTab = {}
local retailTinyTab = ang.retail.tinyTab

function retailTinyTab:ExtraButtons(tab3_contents)
    tab3_contents.swimRelease.text:SetText(T["Release When Swimming"])
    --tab3_contents.swimRelease.text:SetFontObject(SpellFont_Small)
    tab3_contents.swimRelease.text.tooltip = T["If checked, the only action your OneKey/DoubleClick will perform while swimming will be casting rafts.\n(If you already have one, the key will be released.)"] 
    .. T["\n\nChecked by default, uncheck if you want to use Extra Toys, Items, Spells while submerged in water."]
    
    tab3_contents.swimRelease.checkbox:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print(T["Can't change in combat."])
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.swimRelease = true
            print(T["Angleur will only have you cast rafts while swimming, then release the key afterward."])
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.swimRelease = false
            print(T["Angleur will no longer release your keybind while swimming."])
        end
    end)
    if Angleur_TinyOptions.swimRelease == true then
        tab3_contents.swimRelease.checkbox:SetChecked(true)
    end


    tab3_contents.offInteract.text:SetText(T["Disable Soft Interact"])
    --tab3_contents.offInteract.text:SetFontObject(SpellFont_Small)
    tab3_contents.offInteract.text.tooltip = T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n" 
    .. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")]
    tab3_contents.offInteract.checkbox:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print(T["Can't change in combat."])
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.turnOffSoftInteract = true
            Angleur_TempCVarHandler:Release("SoftTargetInteract")
            print(T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."])
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.turnOffSoftInteract = false
            Angleur_TempCVarHandler:Set("SoftTargetInteract")
        end
    end)
    if Angleur_TinyOptions.turnOffSoftInteract == true then
        tab3_contents.offInteract.checkbox:SetChecked(true)
    end

    tab3_contents.softIconOff.text:SetText(T["Disable Soft Icon"])
    --tab3_contents.softIconOff.text:SetFontObject(SpellFont_Small)
    tab3_contents.softIconOff.text.tooltip = T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."]
    tab3_contents.softIconOff.checkbox:SetScript("OnClick", function(self)
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
            self:GetParent().disabledTexture:Show()
            print(T["Soft target icon for game objects disabled."])
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.softIconOff = false
            C_CVar.SetCVar("SoftTargetIconGameObject", "1")
            self:GetParent().disabledTexture:Hide()
            print(T["Soft target icon for game objects re-enabled."])
        end
    end)
    if Angleur_TinyOptions.softIconOff == true then
        tab3_contents.softIconOff.checkbox:SetChecked(true)
        tab3_contents.softIconOff.disabledTexture:Show()
    end
end

function retailTinyTab:SetDefaultsButtonScript(tab3_contents)
    tab3_contents.defaults:SetScript("OnClick", function()
        Angleur_TinyOptions.turnOffSoftInteract = false
        Angleur_TinyOptions.allowDismount = false
        Angleur_TinyOptions.swimRelease = true
        Angleur_TinyOptions.softIconOff = false
        Angleur_TinyOptions.doubleClickWindow = 0.4
        Angleur_TinyOptions.visualScale = 1
        Angleur_TinyOptions.ultraFocusMaster = 1
        Angleur_TempCVars["Sound_MasterVolume"].setTo = Angleur_TinyOptions.ultraFocusMaster
        Angleur_TinyOptions.loginDisabled = false
        Angleur_TinyOptions.errorsDisabled = true
        Angleur_TinyOptions.debugLevel = 0
        ang.debugLevel = 0
        tab3_contents.offInteract.checkbox:SetChecked(false)
        tab3_contents.dismount.checkbox:SetChecked(false)
        tab3_contents.swimRelease.checkbox:SetChecked(true)
        tab3_contents.softIconOff.checkbox:SetChecked(false)
        tab3_contents.doubleClickWindow:SetValue(4)
        tab3_contents.visualSize:SetValue(10)
        tab3_contents.ultraFocusMaster:SetValue(100)
        tab3_contents.loginMessages.checkbox:SetChecked(true)
        tab3_contents.debugMode.checkbox:SetChecked(false)
        tab3_contents.debugMode.dropdown:Hide()
        print(T["Default tiny settings restored"])
    end)
end