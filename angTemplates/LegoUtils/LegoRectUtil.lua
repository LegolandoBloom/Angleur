-- 				                 RectFrames | AnchoredFrames - Handling
-- _____________________________________________________________________________________________________________
-- RectFrames: The frames that the Rect Calculations in LegolandoUtil.Rect will use
-- AnchoredFrames: The frames that will use the result of these calculations and be anchored/sized accordingly
                                                        
--    ┌────────────────────────────┐   
--    │ GetRect() vs GetScaledRect │   
--    └────────────────────────────┘   
-- 1) AnchoredFrame and ALL RectFrames are CHILDREN of the same parent(or one of them is the parent)
--   - Use "GetRect()" for ALL RectFrames
-- 2) AnchoredFrame is a CHILD of ONE of the RectFrames:
--   - Use "GetScaledRect()" for ALL RectFrames
--   - :SetIgnoreParentScale(true) on AnchorFrame
-- 3) AnchoredFrame is NOT a CHILD of either:
--   - Use "GetScaledRect()" for ALL RectFrames
--   - :SetIgnoreParentScale(true) on AnchorFrame
-- _____________________________________________________________________________________________________________

if not LegolandoUtil then return end
if LegolandoUtil.Rect then return end

LegolandoUtil.Rect = {}
local LR = LegolandoUtil.Rect

local BlizzRect_enum = {
	LEFT = 1,
	BOTTOM = 2,
	width = 3,
	height = 4,
}

function LR.GetIntersectionRectFromRects(rect1, rect2)
    local b = BlizzRect_enum
	local left = max(rect1[b.LEFT], rect2[b.LEFT]) 
	-- Unlike "left", we don't return with "right" in our table instead just use it to calculate width which we'll save instead(reason: Blizzard Rect Structure Parity)
	local right = min(rect1[b.LEFT] + rect1[b.width], rect2[b.LEFT] + rect2[b.width])
	local width = right - left
	local bottom = max(rect1[b.BOTTOM], rect2[b.BOTTOM])
	-- Unlike "bottom", we don't return with "top" in our table instead just use it to calculate height which we'll save instead(reason: Blizzard Rect Structure Parity)
	local top = min(rect1[b.BOTTOM] + rect1[b.height], rect2[b.BOTTOM] + rect2[b.height])
	local height = top - bottom
	if left >= right or bottom >= top then 
		--print("EMPTY INTERSECTION")
		return nil
	end
	return {left, bottom, width, height}
end

function LR.GetClippedFrameRectForActualTextureSize(rect, clipFromLeft, clipFromRight, clipFromTop, clipFromBottom)
	local b = BlizzRect_enum
	local trueLeft = rect[b.LEFT] + clipFromLeft
	local trueBottom = rect[b.BOTTOM] + clipFromBottom
	local trueWidth = rect[b.width] - clipFromLeft - clipFromRight
	local trueHeight = rect[b.height] - clipFromTop - clipFromBottom
	if trueHeight <= 0 or trueWidth <= 0 then return nil end
	return {trueLeft, trueBottom, trueWidth, trueHeight}
end



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
function LR.GetPointCoordsFromRect(rect, desiredPoint)
	local b = BlizzRect_enum
	local pointCoords = {}
	if lookup_X.Left[desiredPoint] then
		pointCoords.x = rect[b.LEFT]
	elseif lookup_X.Right[desiredPoint] then
		pointCoords.x = rect[b.LEFT] + rect[b.width]
	elseif lookup_X.Middle[desiredPoint] then
		pointCoords.x = rect[b.LEFT] + rect[b.width]/2
	end
	if lookup_Y.Top[desiredPoint] then
		pointCoords.y = rect[b.BOTTOM] + rect[b.height]
	elseif lookup_Y.Bottom[desiredPoint] then
		pointCoords.y = rect[b.BOTTOM]
	elseif lookup_Y.Middle[desiredPoint] then
		pointCoords.y = rect[b.BOTTOM] + rect[b.height]/2
	end
	return pointCoords
end

local function relateP1ToP2(p1, p2)
	return {x = p1.x - p2.x, y = p1.y - p2.y}
end

-- Relates: Rect1 to -- > Rect2 and returns the X and Y Offsets you'd need to add if you were to 
-- do either:
--    1) Frame1:SetPoint("TOPLEFT", Frame2, anchorPoint, return1.x, return1.y)
--    2) Frame1:SetPoint("BOTTOMRIGHT", Frame2, anchorPoint, return2.x, return2.y)
-- or BOTH if you want to size the frame as well by setting 2 points
function LR.GetOffsetFromRelateRect1ToRect2(rect1, rect2, point1, point2)
	local r1_point = LR.GetPointCoordsFromRect(rect1, point1)
	local r2_point = LR.GetPointCoordsFromRect(rect2, point2)
	local relativePointOffsets = relateP1ToP2(r1_point, r2_point)
	return relativePointOffsets
end