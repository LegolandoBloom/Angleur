if LegolandoUtil then return end

LegolandoUtil = {}

local LU = LegolandoUtil


local lookup_X = {
	Left = {LEFT = true, TOPLEFT = true, BOTTOMLEFT = true},
	Right = {RIGHT = true, TOPRIGHT = true, BOTTOMRIGHT = true},
	Middle = {CENTER = true, BOTTOM = true, TOP = true},
}
local lookup_Y = {
	Top = {TOP = true, TOPLEFT = true, TOPRIGHT = true},
	Bottom = {BOTTOM = true, BOTTOMLEFT = true, BOTTOMRIGHT = true},
	Middle = {CENTER = true, LEFT = true, RIGHT = true},
}


function LU.GetOffsetsForActualTextureSizeForFrameAnchorPoint(anchorPoint, clipFromLeft, clipFromRight, clipFromTop, clipFromBottom)
    local clipOffsets = {x = 0, y = 0}
    -- determine clipOffsetX
	if lookup_X.Left[anchorPoint] then clipOffsets.x = clipFromLeft
    elseif lookup_X.Right[anchorPoint] then clipOffsets.x = - clipFromRight
    elseif lookup_X.Middle[anchorPoint] then clipOffsets.x = (clipFromLeft - clipFromRight)/2 end
    -- determine clipOffsetY
	if lookup_Y.Top[anchorPoint] then clipOffsets.y = - clipFromTop
    elseif lookup_Y.Bottom[anchorPoint] then clipOffsets.y = clipFromBottom
    elseif lookup_Y.Middle[anchorPoint] then clipOffsets.y = (clipFromBottom - clipFromTop)/2 end
	return clipOffsets
end