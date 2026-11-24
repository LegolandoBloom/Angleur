local version = 1.1
if LegolandoUtil and LegolandoUtil.currentVersion and LegolandoUtil.currentVersion >= version then 
    return
end

LegolandoUtil = {}
LegolandoUtil.currentVersion = version

local LU = LegolandoUtil

function LU.SingleDelayer(delay, timeElapsed, elapsedThreshhold, delayFrame, cycleFunk, endFunk)
    delayFrame:SetScript("OnUpdate", function(self, elapsed)
        timeElapsed = timeElapsed + elapsed
        if timeElapsed > elapsedThreshhold then
			delay = delay - timeElapsed
			timeElapsed = 0
            if cycleFunk then
                if cycleFunk(delay) == true then
                    -- If cycleFunk returns true the delayer is stopped, and the script set to nil. endFunk is not executed..
                    self:SetScript("OnUpdate", nil)
                    return
                end
            end
        end
        
        if delay <= 0 then
            self:SetScript("OnUpdate", nil)
            if endFunk then endFunk() end
            return
        end
    end)
end


function LU.PoolDelayer(delay, timeElapsed, elapsedThreshhold, delayFramePool, cycleFunk, endFunk, uniqueIdentifier)
    -- ______________________________________________________________________________________________________
    -- ____________________________________ (Optional) OVERRIDE SYSTEM ______________________________________
    -- ______________________________________________________________________________________________________
    -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ unique Identifier --> optional argument ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    -- If optional argument is provided, there will only be a SINGLE INSTANCEe of that type of delayer
    -- running at one time, and any calls of Camper_PoolDelayer with that specific 'uniqueIdentifier' 
    -- argument will release the one beforehand, overriding it.
    -- ______________________________________________________________________________________________________
    if uniqueIdentifier then
        for poolFrame in delayFramePool:EnumerateActive() do
            if poolFrame.uniqueIdentifier and poolFrame.uniqueIdentifier == uniqueIdentifier then
                -- print("overriding same type delayer", uniqueIdentifier)
                delayFramePool:Release(poolFrame)
            end
        end
    end
    local delayFrame = delayFramePool:Acquire()
    delayFrame.uniqueIdentifier = uniqueIdentifier
    delayFrame:Show()
    delayFrame:SetScript("OnUpdate", function(self, elapsed)
        timeElapsed = timeElapsed + elapsed
        if timeElapsed > elapsedThreshhold then 
            if cycleFunk then 
                if cycleFunk() == true then
                    delayFramePool:Release(self)
                    return
                end
            end
            delay = delay - timeElapsed
            timeElapsed = 0
        end
        if delay <= 0 then
            if endFunk then endFunk() end
            delayFramePool:Release(self)
            return
        end
    end)
    -- Keep this part commented
    -- local count = 0
    -- local uniques = {}
    -- local uniqCount = 0
    -- for delayFrame in delayFramePool:EnumerateActive() do
    --     count = count + 1
    --     local uniqID = delayFrame.uniqueIdentifier
    --     if uniqID then
    --         for i, v in pairs(uniques) do
    --             if v == uniqID then
    --                 print("ERROR: More than one widget with the same unique identifier detected. This isn't supposed to happen.")
    --                 return
    --             end
    --         end
    --         table.insert(uniques, uniqID)
    --         uniqCount = uniqCount + 1
    --     end
    -- end
    -- print("Total number of widgets: ", count)
    -- print("Widgets with different uniqueIdentifiers: ", uniqCount)
    -- print("Table of active unique identifiers:")
    -- DevTools_Dump(uniques)
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

-- anchorPoint is the point on the unclipped frame you are offsetting the clipped texture's anchorPoint(SAME) by
-- Shown below is a visual example of 2 calls, (1) & (2) for getting the clipped offsets for TOPLEFT & BOTTOMRIGHT respectively
-- ________________________________________________________________________________________________________________________________________________________________________          
--  "TOPLEFT"                                                                                                                                                             |          
-- anchorPoint                                                                                                                                                            |          
--     ┌───┐                                                                                                                                                              |          
--     │[A]│────────────────────────────────────────────────────────────────┐                                                                                             |          
--     └─|─┘                         ───                                    │                                                                                             |          
--      │|                   clipTop  |                                     │                                                                                             |          
--      │|                            |                                     │                                                                                             |          
--      │|   (1)        [B]          ───                                    │                                                                       "TOPLEFT"             |          
--      │└--------------►┌─────────────────────────┐                        │                                                                           ▲                 |          
--      │                │                         │                        │    (1) offsetsForB = LU.GetOffsetsForActualTextureSizeForFrameAnchorPoint(A , clips...)     |          
--      │    clipLeft    │                         │       clipRight        │                                                                                             |          
--      │|──────────────|│     Clipped Texture     │|──────────────────────|│                                                                                             |          
--      │                │                         │                        │                                                                     "BOTTOMRIGHT"           |          
--      │                │                         │         (2)            │                                                                           ▲                 |          
--      │                └─────────────────────────┘◄----------------------┐│    (2) offsetsForD = LU.GetOffsetsForActualTextureSizeForFrameAnchorPoint(C , clips...)     |          
--      │                            ───           [D]                     |│                                                                                             |          
--      │                 clipBottom  |                                    |│                                                                                             |          
--      │                            ───                                 ┌─|┴┐                                                                                            |          
--      └────────────────────────────────────────────────────────────────┤[C]│                                                                                            |          
--                                                                       └───┘                                                                                            |          
--                                                                    anchorPoint                                                                                         |          
--                                                                   "BOTTOMRIGHT"                                                                                        |          
-- _______________________________________________________________________________________________________________________________________________________________________|          

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

-- Before returning the number with n decimal places, first rounds the part starting from (n+1)th decimal place.
function LU.SimplifyFloat(number, desiredDecimalPlaces)
	local formatString = "%." .. desiredDecimalPlaces .. "f"
    return tonumber(string.format(formatString, number))
end


function LU.TableToString(tbl)
    local tableToString = ""
    for i, v in pairs(tbl) do
        local element = "[" .. tostring(i) .. ":" .. tostring(v) .. "]"
        tableToString = tableToString .. "  " .. element
    end
    return tableToString
end

function LU.ScanTablesInsideTableForFieldValue_AndReturnFoundInnerTable(outerTable, field, value)
    for i, innerTable in pairs(outerTable) do
        if innerTable[field] and innerTable[field] == value then
            return true, innerTable
        end
    end
    return false
end