local T = Angleur_Translate

local debugChannel = 2
local colorDebug = CreateColor(0.68, 0, 1) -- purple

-- 'ang' is the angleur namespace
local addonName, ang = ...

ang.retail.toys = {}
local retailToys = ang.retail.toys


--________________________________________
--____________SAME AS CATA______________
--________________________________________
function retailToys:setTableToSelectedTable(inputTable, selectedToyTable)
    selectedToyTable.toyID = inputTable.toyID
    selectedToyTable.hasToy = true
    local item = Item:CreateFromItemID(inputTable.toyID)
    item:ContinueOnItemLoad(function(self)
        selectedToyTable.loaded = true
        --Must get name from here for localisation reasons
        selectedToyTable.name = item:GetItemName()
        --print("Loaded: ", selectedToyTable.name, " - ", GetTimePreciseSec())
        --We can get the rest from the table
        selectedToyTable.spellID = inputTable.spellID
        selectedToyTable.icon = inputTable.icon
    end)
end

function retailToys:SetSelectedToy(selectedToyTable, ownedToysTable, chosenByPlayer)
    local selection = {}
    for i, ownedToy in pairs(ownedToysTable) do
        selection = ownedToy
        if chosenByPlayer == ownedToy.toyID then
            break
        end
    end
    self:setTableToSelectedTable(selection, selectedToyTable)
end
--________________________________________
--________________________________________

function retailToys:ToysStandardTab()
    if Angleur_CheckOwnedToys(angleurToys.selectedRaftTable, angleurToys.ownedRafts, angleurToys.raftPossibilities) then
        self:SetSelectedToy(angleurToys.selectedRaftTable, angleurToys.ownedRafts, AngleurConfig.chosenRaft.toyID)
        --WHY? WHY HAVE I PUT THIS IN? CHECK LATER, SEEMS POINTLESS
        Angleur.toyButton:SetAttribute("macrotext", "/cast " .. angleurToys.selectedRaftTable.name)
    else
        Angleur.configPanel.tab1.contents.raftEnable:greyOut()
    end

    if Angleur_CheckOwnedToys(angleurToys.selectedOversizedBobberTable, angleurToys.ownedOversizedBobbers, angleurToys.oversizedBobberPossibilities) then
        self:SetSelectedToy(angleurToys.selectedOversizedBobberTable, angleurToys.ownedOversizedBobbers, nil)
    else
        Angleur.configPanel.tab1.contents.oversizedBobberEnable:greyOut()
    end
        
    if Angleur_CheckOwnedToys(angleurToys.selectedCrateBobberTable, angleurToys.ownedCrateBobbers, angleurToys.crateBobberPossibilities) then
        self:SetSelectedToy(angleurToys.selectedCrateBobberTable, angleurToys.ownedCrateBobbers, AngleurConfig.chosenCrateBobber.toyID)
    else
        Angleur.configPanel.tab1.contents.crateBobberEnable:greyOut()
    end
end

-- Iterate through the table and place them into an indexed table
local function reorderTable(teeburu)
    local i = 1
    local newTeeburu = {}
    for noIndex, v in pairs(teeburu) do
        newTeeburu[i] = v
        i = i + 1
    end
    return newTeeburu
end
local lastRandomed = {
    ["raft"] = nil, ["bobber"] = nil,
}
local alreadyRandomed = {
    ["raft"] = false, ["bobber"] = false,
}
function retailToys:PickRandomToy(identifier, ownedTable, selectedTable, forceClear)
    if next(ownedTable) == nil then return false end
    if #ownedTable == 0 then return false end
    if forceClear then alreadyRandomed[identifier] = false end
    if alreadyRandomed[identifier] then
        return true
    end
    local indexedOwnedToys = ownedTable
    -- ownedTable is initially unindexed, so we index it as 1,2,3,4... so we can use math.random()
    indexedOwnedToys = reorderTable(indexedOwnedToys)
    local bufferToy
    local newRandomToy
    local leastRemainingCooldown = 0
    while next(indexedOwnedToys) ~= nil do
        local i = math.random(#indexedOwnedToys)
        local randomToyCandidate = indexedOwnedToys[i]
        local startTime, cooldownOfToy = C_Container.GetItemCooldown(randomToyCandidate.toyID)
        if not cooldownOfToy or not startTime then
            indexedOwnedToys[i] = nil
            indexedOwnedToys = reorderTable(indexedOwnedToys)
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. identifier ..  " cooldown could not be accessed")
        elseif cooldownOfToy == 0 then
            if #indexedOwnedToys > 1 and lastRandomed[identifier] == randomToyCandidate.name then
                -- Same toy has been randomed, remove it from the indexed table
                -- and put it in the 'buffer' to reuse laters in case everything else is in cooldown
                bufferToy = randomToyCandidate
                indexedOwnedToys[i] = nil
                -- Need to re-index table after any element is removed
                indexedOwnedToys = reorderTable(indexedOwnedToys)
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. "previous " .. identifier .. " picked, TRY TO ROLL AGAIN")
            else
                indexedOwnedToys = {}
                newRandomToy = randomToyCandidate
            end
        else
            --_____________________________________________________________
            -- Needed for PoolDelayer() below in case ALL toys are found to 
            -- be on cooldown. Find the toy with the shortest remaining 
            -- cooldown among the owned toys (not 0)
            --_____________________________________________________________
            local thisCooldown = (startTime + cooldownOfToy) - GetTime()
            if thisCooldown and thisCooldown > 0 then
                if leastRemainingCooldown == 0 or thisCooldown < leastRemainingCooldown then
                    leastRemainingCooldown = thisCooldown
                end
            end
            --_____________________________________________________________
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. "Picked random " .. identifier .. " is on cooldown: ", randomToyCandidate.name, "index: ", i)
            -- the 'randomed toy' is on cooldown, remove it from the indexed table
            indexedOwnedToys[i] = nil
            -- after removing the toy in cooldown from the table, we re-index it with reorderTable() so we can do math.random() with the remaining elements
            indexedOwnedToys = reorderTable(indexedOwnedToys)
        end
    end
    if newRandomToy then
        -- An off-cooldown, previously not picked toy has been randomed
        -- great success!
        lastRandomed[identifier] = newRandomToy.name
        alreadyRandomed[identifier] = true
        self:setTableToSelectedTable(newRandomToy, selectedTable)
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. "Random selection complete. Chosen " .. identifier .. ": ", newRandomToy.name)
        return true
    elseif bufferToy then
        -- Although no 'new' randomable toy has been found, 
        -- we have an off cooldown one in the buffer, use that
        lastRandomed[identifier] = bufferToy.name
        alreadyRandomed[identifier] = true
        self:setTableToSelectedTable(bufferToy, selectedTable)
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. "A single off-cooldown " .. identifier .. " found, but it's the same as the previously picked", bufferToy.name)
        return true
    else
        -- Nothing usable, return false after:
        Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. "Couldn't pick random. All of the owned " .. identifier .. "s were on cooldown.")
        if leastRemainingCooldown < 5 then
            -- All on cooldown, but about to run out. Keep rolling, don't set a delayer.
            alreadyRandomed[identifier] = false
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. "Very short cooldown or GCD, keep rolling ")
        else
            alreadyRandomed[identifier] = true
            --_____________________________________________________________________________________
            --  All on cooldown. Stop rolling until the 'LOWEST COOLDOWN of the toy type' runs out
            --                      using a PoolDelayer with the identifier
            --_____________________________________________________________________________________
            Angleur_PoolDelayer(leastRemainingCooldown, 0, 1, angleurDelayers, nil, function()
                alreadyRandomed[identifier] = false
            end, identifier)
            --_____________________________________________________________________________________
            Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. "Setting " .. identifier .. " reset timer for lowest cooldown: ", leastRemainingCooldown)
        end
        return false
    end
end

local randomToyEventFrame = CreateFrame("Frame")
randomToyEventFrame:RegisterEvent("UNIT_SPELLCAST_START")
randomToyEventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
-- No need for SPELLCAST_INTERRUPTED, SPELLCAST_STOP also triggers then
-- Also triggers for SPELLCAST_SUCCEEDED for non instant-cast spells,
-- But we'll keep that one in for future additions to random 
randomToyEventFrame:RegisterEvent("UNIT_SPELLCAST_STOP")
randomToyEventFrame:RegisterEvent("UNIT_SPELLCAST_FAILED")
randomToyEventFrame:SetScript("OnEvent", function(self, event, unit, ...)
    if AngleurConfig.chosenCrateBobber.name ~= "Random Bobber" and AngleurConfig.chosenRaft.name ~= "Random Raft" then return end
    local arg4, arg5 = ...
    if issecretvalue(unit) or issecretvalue(arg4) or issecretvalue(arg5) then return end
    if event == "UNIT_SPELLCAST_START" then
        -- Check BOBBER Spell
        for i, v in pairs(angleurToys.ownedCrateBobbers) do
            if v.spellID == arg5 then
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. "BOBBER SPELLCAST")
                alreadyRandomed["bobber"] = false
                Angleur_BetaPrint(debugChannel, "bobber: RESETTING RANDOMED STATUS")
                return
            end
        end
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" or event == "UNIT_SPELLCAST_STOP" or event == "UNIT_SPELLCAST_FAILED" then
        -- Check RAFT Spell
        for i, v in pairs(angleurToys.ownedRafts) do
            if v.spellID == arg5 then
                Angleur_BetaPrint(debugChannel, colorDebug:WrapTextInColorCode("Angleur_PickRandomToy: ") .. "RAFT SPELLCAST")
                alreadyRandomed["raft"] = false
                Angleur_BetaPrint(debugChannel, "raft: RESETTING RANDOMED STATUS")
                return
            end
        end
    end
end)