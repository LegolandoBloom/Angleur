if not LegolandoUtil then return end
if LegolandoUtil.Secret then return end

LegolandoUtil.Secret = {}
local LSec = LegolandoUtil.Secret


local gameVersion
if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
	-- ___ temporary measure for FOREVER ___
	if LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_MIDNIGHT then
		gameVersion = 1
	elseif LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_CLASSIC then
		gameVersion = 4
	end
	-- _____________________________________
elseif WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC or WOW_PROJECT_ID == 19 then
	gameVersion = 2
elseif WOW_PROJECT_ID == WOW_PROJECT_CLASSIC or WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
	gameVersion = 3
end


local VERSION_RETAIL = 1
local VERSION_FOREVER = 4
function LSec.IsSecret(value)
    if gameVersion == VERSION_RETAIL or gameVersion == VERSION_FOREVER then
        if issecretvalue(value) then return true end
    end
    return false
end
function LSec.ScrubSecret(...)
    if gameVersion == VERSION_RETAIL or gameVersion == VERSION_FOREVER then
        return scrubsecretvalues(...)
    end
    return ...
end

