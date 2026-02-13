local T = Angleur_Translate

local debugChannel = 5

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.mists.tinyTab = {}
local mistsTinyTab = ang.mists.tinyTab

function mistsTinyTab:ExtraButtons(tab3_contents)
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

    tab3_contents.poleSleep.text:SetText(T["Sleep Without Fishing Rod"])
    --tab3_contents.poleSleep.text:SetFontObject(SpellFont_Small)
    tab3_contents.poleSleep.text.tooltip = T["If checked, Angleur will go to Sleep when you unequip your fishing rod.\n\nUncheck if you want to fish without a rod in the main hand slot. On by default."]
    tab3_contents.poleSleep.checkbox:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print(T["Can't change in combat."])
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.poleSleep = true
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.poleSleep = false
            print(T["Angleur will no longer Sleep/Wake based on Fishing Rod equip status."])
        end
    end)
    if Angleur_TinyOptions.poleSleep == true then
        tab3_contents.poleSleep.checkbox:SetChecked(true)
    end
end

function mistsTinyTab:SetDefaultsButtonScript(tab3_contents)
    tab3_contents.defaults:SetScript("OnClick", function()
        Angleur_TinyOptions.allowDismount = false
        Angleur_TinyOptions.swimRelease = true
        Angleur_TinyOptions.poleSleep = true
        Angleur_TinyOptions.doubleClickWindow = 0.4
        Angleur_TinyOptions.visualScale = 1
        Angleur_TinyOptions.ultraFocusMaster = 1
        Angleur_TempCVars["Sound_MasterVolume"].setTo = Angleur_TinyOptions.ultraFocusMaster
        Angleur_TinyOptions.loginDisabled = false
        Angleur_TinyOptions.errorsDisabled = true
        Angleur_TinyOptions.debugLevel = 0
        ang.debugLevel = 0
        tab3_contents.dismount.checkbox:SetChecked(false)
        tab3_contents.swimRelease.checkbox:SetChecked(true)
        tab3_contents.poleSleep.checkbox:SetChecked(true)
        tab3_contents.doubleClickWindow:SetValue(4)
        tab3_contents.visualSize:SetValue(10)
        tab3_contents.ultraFocusMaster:SetValue(100)
        tab3_contents.loginMessages.checkbox:SetChecked(true)
        tab3_contents.debugMode.checkbox:SetChecked(false)
        tab3_contents.debugMode.dropdown:Hide()
        print(T["Default tiny settings restored"])
    end)
end