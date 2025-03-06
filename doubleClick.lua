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
            Angleur_BetaPrint("Angleur: Double Click mouse look released")
        end
    end
end

function Angleur_DoubleClickWatcher(self, event, button)
    if AngleurConfig.chosenMethod ~= "doubleClick" then return end
    if AngleurCharacter.sleeping then return end
    if button ~= angleurDoubleClick.iDtoLeftRight[AngleurConfig.doubleClickChosenID] then return end
    --print("Mouseover UIParent: ", UIParent:IsMouseOver())
    -- if not WorldFrame:IsMouseMotionFocus() and GetMouseFoci()[1] ~= nil then
    --     --print("Mouse on another frame, ignoring")
    --     return 
    -- end
    if event == "GLOBAL_MOUSE_UP" then
        Angleur_StuckFix()
        if InCombatLockdown() then return end
        if angleurDoubleClick.ignoreNextMouseUp then angleurDoubleClick.ignoreNextMouseUp = false return end
        if not angleurDoubleClick.watching then
            angleurDoubleClick.watching = true
            --print("double click watching")
            Angleur_ActionHandler(Angleur)
            Angleur_PoolDelayer(Angleur_TinyOptions.doubleClickWindow, 0, 0.05, angleurDelayers, nil, function()
                angleurDoubleClick.watching = false
                --print("no longer watching")
                Angleur_ActionHandler(Angleur)
            end)
        else
            angleurDoubleClick.watching = false
            --print("Watch ended manually")
            Angleur_ActionHandler(Angleur)
        end
    elseif event == "GLOBAL_MOUSE_DOWN" then
        if angleurDoubleClick.watching == true then
            if IsMouseButtonDown(angleurDoubleClick.iDtoLeftRight[AngleurConfig.doubleClickChosenID]) then
                MouselookStart()
            else
                MouselookStop()
            end
        end
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