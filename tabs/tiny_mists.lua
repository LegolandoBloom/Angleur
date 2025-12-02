local T = Angleur_Translate

-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.mists.tinyTab = {}
local mistsTinyTab = ang.mists.tinyTab

function mistsTinyTab:SetDefaultsButtonScript(tab3_contents)
    tab3_contents.defaults:SetScript("OnClick", function()
        Angleur_TinyOptions.turnOffSoftInteract = false
        Angleur_TinyOptions.allowDismount = false
        Angleur_TinyOptions.softIconOff = false
        Angleur_TinyOptions.doubleClickWindow = 0.4
        Angleur_TinyOptions.visualScale = 1
        Angleur_TinyOptions.ultraFocusMaster = 1
        Angleur_TinyOptions.loginDisabled = false
        Angleur_TinyOptions.errorsDisabled = true
        tab3_contents.dismount:SetChecked(false)
        tab3_contents.doubleClickWindow:SetValue(4)
        tab3_contents.visualSize:SetValue(10)
        tab3_contents.ultraFocusMaster:SetValue(100)
        tab3_contents.loginMessages:SetChecked(true)
        tab3_contents.debugMode:SetChecked(false)
        print(T["Default tiny settings restored"])
    end)
end