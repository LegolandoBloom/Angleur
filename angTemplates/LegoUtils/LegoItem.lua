if not LegolandoUtil then return end
if LegolandoUtil.Item then return end

LegolandoUtil.Item = {}
local LI = LegolandoUtil.Item


local LOAD_RETRY_ATTEMPTS = 5

-- __ ! DO NOT call with COLON ! __
--  LI.CreateDebugHandler 🗸(GOOD)
--  LI:CreateDebugHandler ✗(BAD)
-- ________________________________
function LI.CreateItemLoader()
    local itemLoader = {}
    itemLoader.addedItems = {}
    function itemLoader:AppendItemID(...)
        local candidates = {...}
        if not candidates or next(candidates) == nil then
            print("LegoItem->AppendItemID: no candidates")
            return
        end
        for i, itemID in ipairs(candidates) do
            local validID = C_Item.GetItemInfoInstant(itemID)
            if validID and self.addedItems[validID] == nil then
                -- false upon adding, true when loaded
                self.addedItems[validID] = {}
                self.addedItems[validID].loaded = false
                self.addedItems[validID].retriesRemaining = LOAD_RETRY_ATTEMPTS
            end
        end
        self:RequestLoadAddedItems()
    end

    function itemLoader:RequestLoadAddedItems()
        for validID, loadTable in ipairs(self.addedItems) do
            if loadTable.loaded == false then
                C_Item.RequestLoadItemDataByID(validID)
            end
        end
    end

    itemLoader.eventFrame = CreateFrame("Frame")
    local eventFrame = itemLoader.eventFrame
    eventFrame:RegisterEvent("ITEM_DATA_LOAD_RESULT")
    eventFrame:SetScript("OnEvent", function(self, event, itemID, success)
        if event ~= "ITEM_DATA_LOAD_RESULT" then return end
        if not itemID then return end
        local addedItems = itemLoader.addedItems
        if next(addedItems) == nil then return end
        local lookupItem = addedItems[itemID]
        if lookupItem and lookupItem.loaded == false then
            if success then
                lookupItem.loaded = true
                if itemLoader.onLoadCallback then
                    itemLoader.onLoadCallback(itemID)
                end
            elseif lookupItem.retriesRemaining > 0 then
                C_Item.RequestLoadItemDataByID(itemID)
                lookupItem.retriesRemaining = lookupItem.retriesRemaining - 1
            end
        end
    end)

    function itemLoader:SetOnLoadCallback(callback)
        if not callback then return end
        itemLoader.onLoadCallback = callback
    end

    function itemLoader:GetLoaded()
        local loadedItems = {}
        for itemID, loadTable in ipairs(self.addedItems) do
            if loadTable.loaded == true then
                loadedItems[itemID] = true
            end
        end
        return loadedItems
    end

    function itemLoader:GetPending()
        local pendingItems = {}
        for itemID, loadTable in ipairs(self.addedItems) do
            if loadTable.loaded == false then
                pendingItems[itemID] = true
            end
        end
        return pendingItems
    end

    function itemLoader:PrintAll()
        for itemID, loadTable in ipairs(self.addedItems) do
            print("itemID:", itemID, " loaded:", loadTable.loaded, " retries remaining:", loadTable.retriesRemaining)
        end
    end

	return itemLoader;
end