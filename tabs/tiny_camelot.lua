-- |FOREVER Bobber Scanner Removal|
-- COPIED OFF OF: tiny_vanilla -> then added offInteract parts


local T = Angleur_Translate

local debugChannel = 5

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.vanilla.tinyTab = {}
local vanillaTinyTab = ang.vanilla.tinyTab

function vanillaTinyTab:ExtraButtons(tab3_contents)
    -- ____________________________________ |FOREVER Bobber Scanner Removal| ____________________________________
    tab3_contents.offInteract.text:SetText(T["Disable Soft Interact"])
    --tab3_contents.offInteract.text:SetFontObject(SpellFont_Small)
    tab3_contents.offInteract.text.tooltip = T["If checked, Angleur will restore Soft Interact settings after you stop fishing.\n\n" 
    .. "ON by default. You can turn this toggle off if you play with Soft Interact all the time."]
    tab3_contents.offInteract.checkbox:SetScript("OnClick", function(self)
        if InCombatLockdown() then
            self:SetChecked(not self:GetChecked())
            print(T["Can't change in combat."])
            return
        end
        if self:GetChecked() then
            Angleur_TinyOptions.turnOffSoftInteract = true
            Angleur_TempCVarHandler:Release("SoftTargetInteract", "SoftTargetInteractRange", "SoftTargetInteractRangeIsHard")
            print(T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."])
        elseif self:GetChecked() == false then
            Angleur_TinyOptions.turnOffSoftInteract = false
            Angleur_TempCVarHandler:Set("SoftTargetInteract", "SoftTargetInteractRange", "SoftTargetInteractRangeIsHard")
        end
    end)
    if Angleur_TinyOptions.turnOffSoftInteract == true then
        tab3_contents.offInteract.checkbox:SetChecked(true)
    end
    -- __________________________________________________________________________________________________________

    
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

function vanillaTinyTab:SetDefaultsButtonScript(tab3_contents)
    tab3_contents.defaults:SetScript("OnClick", function()
        Angleur_TinyOptions.lootProtectionEnabled = true
        -- ______|FOREVER Bobber Scanner Removal|______
        Angleur_TinyOptions.turnOffSoftInteract = true
        -- ____________________________________________
        Angleur_TinyOptions.allowDismount = false
        Angleur_TinyOptions.poleSleep = true
        Angleur_TinyOptions.doubleClickWindow = 0.4
        Angleur_TinyOptions.visualScale = 1
        -- Minimap Button --
        AngleurMinimapButton.show = true
        Angleur_ToggleMinimapButton(true)
        --------------------
        Angleur_TinyOptions.loginDisabled = false
        Angleur_TinyOptions.errorsDisabled = true
        Angleur_TinyOptions.debugLevel = 0
        ang.debugLevel = 0
        tab3_contents.lootProtection.checkbox:SetChecked(true)
        -- _________|FOREVER Bobber Scanner Removal|________
        tab3_contents.offInteract.checkbox:SetChecked(true)
        -- _________________________________________________
        tab3_contents.dismount.checkbox:SetChecked(false)
        tab3_contents.poleSleep.checkbox:SetChecked(true)
        tab3_contents.doubleClickWindow:SetValue(4)
        tab3_contents.visualSize:SetValue(10)
        -- Minimap Button --
        tab3_contents.showMinimapButton.checkbox:SetChecked(true)
        --------------------
        tab3_contents.loginMessages.checkbox:SetChecked(true)
        tab3_contents.debugMode.checkbox:SetChecked(false)
        tab3_contents.debugMode.dropdown:Hide()
        print(T["Default tiny settings restored"])
    end)
end