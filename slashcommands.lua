SLASH_ANGLEURHELPTIPFIND1 = "/anghelptip"
SlashCmdList["ANGLEURHELPTIPFIND"] = function()
    for frame in HelpTip.framePool:EnumerateActive() do
        --AngleurConfig.savedText = frame.info.text
        local parent = frame:GetParent()
        print(frame.info.text)
    end
end

SLASH_ENUMERATEPOOL1 = "/angenum"
SlashCmdList["ENUMERATEPOOL"] = function()
    for frame in angleurDelayers:EnumerateActive() do
        print(frame:GetDebugName(), "IS ACTIVE")
    end
    for index, frame in angleurDelayers:EnumerateInactive() do
        print(frame:GetDebugName(), "IS INACTIVE")
    end
end

SLASH_ANGLEURRESET1 = "/angres"
SlashCmdList["ANGLEURRESET"] = function()
    AngleurTutorial.part = 1
    print("First install tutorial reset.")
    Angleur_FirstInstall()
end

SLASH_ANGLEURSLEEP1 = "/angsleep"
SlashCmdList["ANGLEURSLEEP"] = function()
    if InCombatLockdown() then
        print("Can't change sleep state in combat.")
        return
    end
    local colorBlu = CreateColor(0.61, 0.85, 0.92)
    if AngleurCharacter.sleeping == false then
        AngleurCharacter.sleeping = true
        print(colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping.")
        Angleur_SetSleep()
        Angleur_EquipAngleurSet(true)
    elseif AngleurCharacter.sleeping == true then
        AngleurCharacter.sleeping = false
        print(colorBlu:WrapTextInColorCode("Angleur: ") .. "Awake.")
        Angleur_SetSleep()
        Angleur_UnequipAngleurSet(true)
    end
end

SLASH_ANGLEURSETTINGS1 = "/angleur"
SLASH_ANGLEURSETTINGS2 = "/angang"
SlashCmdList["ANGLEURSETTINGS"] = function() 
    if InCombatLockdown() then
        local color1 = CreateColor(1.0, 0.82, 0.0)
        local color2 = CreateColor(0.61, 0.85, 0.92)
        print(color2:WrapTextInColorCode("Angleur: ") .. "cannot open " .. color1:WrapTextInColorCode("Config Panel ") .. "in combat.")
        print("Please try again after combat ends.")
        return
    end
    if not Angleur.configPanel:IsShown() then 
        Angleur.configPanel:Show()
    end
end

--[[
    SLASH_ANGLEURDEBUG1 = "/angdebug"
    SlashCmdList["ANGLEURDEBUG"] = function()
        if not Angleur_TinyOptions.errorsDisabled then
            Angleur_TinyOptions.errorsDisabled = true
            print("glitch hunt messages disabled")
        else
            Angleur_TinyOptions.errorsDisabled = false
            print("glitch hunt messages re-enabled")
        end
    end
]]--
    

