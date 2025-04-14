local T = Angleur_Translate
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

AngleurTinyPanelCata = {}
local cata = AngleurTinyPanelCata

function cata:SetDefaultsButtonScript(tab3_contents)
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