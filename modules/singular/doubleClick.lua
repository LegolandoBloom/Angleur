local T = Angleur_Translate

local debugChannel = 6
local colorDebug = CreateColor(0.9, 0.47, 1) -- lily

local addonName, ang = ...
local gameVersion = ang.gameVersion

angleurDoubleClick = {
    watching = false,
    heldDown = false,
    ignoreNextMouseUp = false,
}

local enum_idToButtonName = {
    [1] = "title(aka useless)",
    [2] = "BUTTON2",
    [3] = "BUTTON1",
}
local enum_idToLeftRight = {
    [1] = "title(aka useless)",
    [2] = "RightButton",
    [3] = "LeftButton",
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
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_StuckFix ") .. ": Mouse look force released")
        end
    end
end

local function _isClickValid()
    local bobberScanner
    if gameVersion ~= 1 then bobberScanner = AngleurClassicConfig.softInteract.enabled and AngleurClassicConfig.softInteract.bobberScanner end
    --print("Mouseover UIParent: ", UIParent:IsMouseOver())
    if not WorldFrame:IsMouseMotionFocus() and GetMouseFoci()[1] ~= nil then
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("isClickValid ") .. ": Not over WorldFrame, checking...")
        if 
            bobberScanner 
            or ang.otherAddons.opie 
        then
            -- DO NOTHING
            -- to allow double-click fishing over other frames when:
            -- Bobber Scanner is being used
            -- OPie is loaded
        else
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("isClickValid ") .. ": Mouse is over a UI Frame. Don't trigger Double-Click Fishing.")
            return false
        end
    end
    return true
end
function Angleur_DoubleClickWatcher(self, event, button)
    if AngleurConfig.chosenMethod ~= "doubleClick" then return end
    if AngleurCharacter.sleeping then return end
    local chosenButton = enum_idToLeftRight[AngleurConfig.doubleClickChosenID]
    if button ~= chosenButton then return end
    if _isClickValid() == false then return end

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
            end)
        else
            angleurDoubleClick.watching = false
            --print("Watch ended manually")
            Angleur_ActionHandler(Angleur)
        end
    elseif event == "GLOBAL_MOUSE_DOWN" then
        if angleurDoubleClick.watching == true then
            if IsMouseButtonDown(chosenButton) then
                MouselookStart()
            else
                MouselookStop()
            end
        end
        angleurDoubleClick.heldDown = true
        Angleur_PoolDelayer(0.2, 0, 0.05, angleurDelayers, function()
            if angleurDoubleClick.heldDown then
                if not IsMouseButtonDown(chosenButton) then
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