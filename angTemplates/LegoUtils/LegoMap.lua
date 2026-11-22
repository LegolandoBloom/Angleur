if not LegolandoUtil then return end
if LegolandoUtil.Map then return end

LegolandoUtil.Map = {}
local LM = LegolandoUtil.Map


function LM:GetCurrentPositionWaypointLink()
	local currentMapID = C_Map.GetBestMapForUnit("player")
	local coords = C_Map.GetPlayerMapPosition(currentMapID, "player")
	if not coords then return nil end
	local x, y = coords:GetXY()
	C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(currentMapID, x, y))
	local hyperlink = C_Map.GetUserWaypointHyperlink()
	C_Map.ClearUserWaypoint()
	return hyperlink
end