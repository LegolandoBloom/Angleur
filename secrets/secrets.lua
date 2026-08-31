-- 'ang' is the angleur namespace
local addonName, ang = ...
ang.secrets = {}
local secrets = ang.secrets

local VERSION_RETAIL = 1
local gameVersion = ang.gameVersion

local debugChannel = 10
local colorDebug = CreateColor(1, 0, 0) -- red

secrets.restrictionsActive = {
    Combat = false,
    Encounter = false,
    ChallengeModes = false,
    PvPMatch = false,
    Map = false,
    Chat = false,
}


function Angleur_IsSecret(value)
    if gameVersion == VERSION_RETAIL then
        if issecretvalue(value) then return true end
    end
    return false
end
function Angleur_ScrubSecret(...)
    if gameVersion == VERSION_RETAIL then
        return scrubsecretvalues(...)
    end
    return ...
end

-- Why start index at 0? Wow restriction type goes from 0->5
local enum_RestrictionType = {
    [0] = "Combat",
    [1] = "Encounter",
    [2] = "ChallengeModes",
    [3] = "PvPMatch",
    [4] = "Map",
    [5] = "Chat",
}
local enum_RestrictionState = {
    [0] = "Inactive",
    [1] = "Activating",
    [2] = "Active",
}

-- Returns true if any of the types given as arguments is restricted
function Angleur_IsAddonSecretRestrictedForTypes(...)
    if gameVersion ~= VERSION_RETAIL then return false end
    local argTable = {...}
    local isRestricted = false
    local restrictedTypesFromArguments = {}
    for i, v in pairs(argTable) do
        local type = secrets.restrictionsActive[v]
        if type == nil then geterrorhandler()("Angleur: Wrong Restriction Type")end
        if type == true then 
            isRestricted = true
            table.insert(restrictedTypesFromArguments, v)
        end
    end
    return isRestricted, restrictedTypesFromArguments
end

local function secrets_Events(self, event, unit, ...)
    local arg4, arg5 = ...
    if event == "ADDON_RESTRICTION_STATE_CHANGED" then
        local restrictionType = enum_RestrictionType[unit]
        local restrictionState = enum_RestrictionState[arg4]
        -- print(restrictionType, "=", enum_RestrictionState[arg4])
        if restrictionState == "Activating" or restrictionState == "Active" then
            secrets.restrictionsActive[restrictionType] = true
        elseif restrictionState == "Inactive" then
            secrets.restrictionsActive[restrictionType] = false
        end
        local isRestricted, restrictedTypeTable = Angleur_IsAddonSecretRestrictedForTypes("Combat", "Encounter", "ChallengeModes", "PvPMatch", "Map")
        if isRestricted == true then
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Secrets:") .. " I am restricted by:")
            DevTools_Dump(restrictedTypeTable)
        else
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Secrets:") .. " I am not restricted")
        end
    end
end

local secretsFrame = CreateFrame("Frame")
secretsFrame:RegisterEvent("ADDON_RESTRICTION_STATE_CHANGED")
secretsFrame:SetScript("OnEvent", secrets_Events)
