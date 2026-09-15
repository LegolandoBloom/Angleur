local T = Angleur_Translate

local debugChannel = 1
local colorDebug = CreateColor(0.9, 0.47, 1) -- TODO: CHANGE

local addonName, ang = ...
local logicVars = ang.logicVars

local AUTOLOOT_TIMEOUT = 2
local MANUAL_TIMEOUT = 4

-- _____________________________________________________ IMPORTANT: _________________________________________________________
-- Decided NOT to start protection after "Angleur_StopFishing", because we can't tell if it was stopped due to looting or not
-- This might cause a tiny period where loot is unprotected, but it is much worse to cause unwanted delays for non-loot cases 
--              _________________________________________________________________________________________
--              EventRegistry:RegisterCallback("Angleur_StopFishing", function() end) --> DECIDED AGAINST
--                                    Instead we start on "LOOT_OPENED" or "LOOT READY"
-- __________________________________________________________________________________________________________________________

local function lootProtection_Events(self, event, unit, ...)
    if ang.addonLoaded == false then return end
    local arg4, arg5 = ...
    event, unit, arg4, arg5 = Angleur_ScrubSecret(event, unit, arg4, arg5)
    -- it seems the calling order is: OPENED -> READY -> OPENED
    -- BUT STILL, for now, writing code to to kick-off protection whichever comes first(return early if already set to true)
    if event == "LOOT_OPENED" or event == "LOOT_READY" then
        if logicVars.shouldProtectLoot == true then return end
        local timeoutDelay
        if unit == true then
            timeoutDelay = AUTOLOOT_TIMEOUT
        else
            timeoutDelay = MANUAL_TIMEOUT
        end
        logicVars.shouldProtectLoot = true
        Angleur_BetaPrint(debugChannel, "Loot Protection:", event, "Starting Protection. Auto-Loot:", unit)
        -- Call |ActionHandler| right after "shouldProtectLoot" changes to override the regular onUpdate threshold for SNAPPY CASTING right after
        Angleur_ActionHandler(Angleur)
        Angleur_SingleDelayer(timeoutDelay, 0, 0.1, self, nil, function()
            logicVars.shouldProtectLoot = false
            Angleur_BetaPrint(debugChannel, "Loot Protection: Timed out after:", timeoutDelay)
            -- Call |ActionHandler| right after "shouldProtectLoot" changes to override the regular onUpdate threshold for SNAPPY CASTING right after
            Angleur_ActionHandler(Angleur)
        end)
    elseif event == "LOOT_SLOT_CLEARED" then
        -- empty for not (not even registered)
    elseif event == "LOOT_CLOSED" then
        logicVars.shouldProtectLoot = false
        self:SetScript("OnUpdate", nil)
        Angleur_BetaPrint(debugChannel, "Loot Protection: Loot closed. Removing Protection.")
        -- Call |ActionHandler| right after "shouldProtectLoot" changes to override the regular onUpdate threshold for SNAPPY CASTING right after
        Angleur_ActionHandler(Angleur)
    end
end
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("LOOT_OPENED")
eventFrame:RegisterEvent("LOOT_READY")
eventFrame:RegisterEvent("LOOT_CLOSED")
eventFrame:SetScript("OnEvent", lootProtection_Events)