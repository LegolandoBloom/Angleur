local T = Angleur_Translate

local debugChannel = 6
local colorDebug = CreateColor(0.9, 0.47, 1) -- lily

local addonName, ang = ...

angleurDoubleClick = {
    watching = false,
    heldDown = false,
    ignoreNextMouseUp = false,
    iDtoButtonName = {"title(aka useless)", "BUTTON2", "BUTTON1"},
    iDtoLeftRight = {"title(aka useless)", "RightButton", "LeftButton"},
}

-- !!!! AS OF UNDERMINED, WORLD FRAME NO LONGER RECEIVES DRAG !!!!
-- function Angleur_RegisterAndHook()
--     if angleurDoubleClick.hookedregistered == true then return end
--     WorldFrame:RegisterForDrag("RightButton")
--     WorldFrame:HookScript("OnDragStart", function(self, button)
--         if IsMouseButtonDown("RightButton") then
--             MouselookStart()
--         end
--     end)
--     angleurDoubleClick.hookedregistered = true
-- end

function Angleur_StuckFix()
    if AngleurConfig.chosenMethod ~= "doubleClick" then return end
    if IsMouselooking() then
        if IsMouseButtonDown("RightButton") then

        else
            MouselookStop()
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_StuckFix ") .. ": Double Click mouse look released")
        end
    end
end

function Angleur_DoubleClickWatcher(self, event, button)
    if AngleurConfig.chosenMethod ~= "doubleClick" then return end
    if AngleurCharacter.sleeping then return end
    if button ~= angleurDoubleClick.iDtoLeftRight[AngleurConfig.doubleClickChosenID] then return end
    local bobberScanner = AngleurClassicConfig.softInteract.enabled and AngleurClassicConfig.softInteract.bobberScanner
    --print("Mouseover UIParent: ", UIParent:IsMouseOver())
    if not WorldFrame:IsMouseMotionFocus() then
        local focus = GetMouseFoci()[1]
        if focus then
            local objType = focus.GetObjectType and focus:GetObjectType()
            if objType == "Button" or objType == "EditBox" or objType == "CheckButton" or objType == "Slider" then
                if
                    bobberScanner
                    or ang.otherAddons.opie
                then
                    -- DO NOTHING
                    -- to allow double-click fishing over other frames when:
                    -- Bobber Scanner is being used
                    -- OPie is loaded
                else
                    Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("DoubleClick ") .. ": Mouse is over an interactive UI Frame. Don't trigger Double-Click Fishing.")
                    return
                end
            end
        end
    end
    if event == "GLOBAL_MOUSE_UP" then
        Angleur_StuckFix()
        if InCombatLockdown() then return end
        if UnitIsDeadOrGhost("player") then return end
        if angleurDoubleClick.ignoreNextMouseUp then angleurDoubleClick.ignoreNextMouseUp = false return end
        if not angleurDoubleClick.watching then
            angleurDoubleClick.watching = true
            --print("double click watching")
            Angleur_ActionHandler(Angleur)
            Angleur_PoolDelayer(Angleur_TinyOptions.doubleClickWindow, 0, 0.05, angleurDelayers, nil, function()
                angleurDoubleClick.watching = false
                --print("no longer watching")
                Angleur_ActionHandler(Angleur)
            end, "doubleClickWatch")
        else
            angleurDoubleClick.watching = false
            -- Cancel the watching timer so it doesn't fire a spurious third ActionHandler call
            for poolFrame in angleurDelayers:EnumerateActive() do
                if poolFrame.uniqueIdentifier == "doubleClickWatch" then
                    angleurDelayers:Release(poolFrame)
                    break
                end
            end
            --print("Watch ended manually")
            Angleur_ActionHandler(Angleur)
        end
    elseif event == "GLOBAL_MOUSE_DOWN" then
        angleurDoubleClick.heldDown = true
        Angleur_PoolDelayer(0.2, 0, 0.05, angleurDelayers, function()
            if angleurDoubleClick.heldDown then
                if not IsMouseButtonDown(angleurDoubleClick.iDtoLeftRight[AngleurConfig.doubleClickChosenID]) then
                    angleurDoubleClick.heldDown = false
                else
                    --print("Still being held")
                end
            end
        end,
        function()
            if angleurDoubleClick.heldDown then
                --print("held too long, ignoring MOUSEUP")
                angleurDoubleClick.ignoreNextMouseUp = true
            end
        end)
    end
end

local doubleClickFrame = CreateFrame("Frame")
doubleClickFrame:RegisterEvent("GLOBAL_MOUSE_UP")
doubleClickFrame:RegisterEvent("GLOBAL_MOUSE_DOWN")
doubleClickFrame:RegisterEvent("PLAYER_STARTED_LOOKING")
doubleClickFrame:RegisterEvent("PLAYER_STOPPED_LOOKING")
doubleClickFrame:SetScript("OnEvent", Angleur_DoubleClickWatcher)