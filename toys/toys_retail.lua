local T = Angleur_Translate
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
local lastRandomed
local alreadyRandomed
function retailToys:PickRandomBobber(forceClear)
    if AngleurConfig.chosenCrateBobber.name ~= "Random Bobber" then return false end
    if next(angleurToys.ownedCrateBobbers) == nil then return false end
    if #angleurToys.ownedCrateBobbers == 0 then return false end
    if forceClear then alreadyRandomed = nil end
    if alreadyRandomed and angleurToys.selectedCrateBobberTable.name and angleurToys.selectedCrateBobberTable.name ~= 0 then 
        return true 
    end
    local indexedOwnedBobbers = angleurToys.ownedCrateBobbers
    -- angleurToys.ownedCrateBobbers is initially unindexed, so we index it as 1,2,3,4... so we can use math.random()
    indexedOwnedBobbers = reorderTable(indexedOwnedBobbers)
    local bufferBobber 
    local newRandomToy
    while next(indexedOwnedBobbers) ~= nil do
        local i = math.random(#indexedOwnedBobbers)
        local randomToyCandidate = indexedOwnedBobbers[i]
        local _, cooldownOfBobber = C_Container.GetItemCooldown(randomToyCandidate.toyID)
        if cooldownOfBobber == 0 then
            if #indexedOwnedBobbers > 1 and lastRandomed == randomToyCandidate.name then
                -- Same bobber has been randomed, remove it from the indexed table
                -- and put it in the 'buffer' to reuse laters in case everything else is in cooldown
                bufferBobber = randomToyCandidate
                indexedOwnedBobbers[i] = nil
                -- Need to re-index table after any element is removed
                indexedOwnedBobbers = reorderTable(indexedOwnedBobbers)
                Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_PickRandomBobber: ") .. "previous bobber picked, TRY TO ROLL AGAIN")
            else
                indexedOwnedBobbers = {}
                newRandomToy = randomToyCandidate
            end
        else
            Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_PickRandomBobber: ") .. "Picked Random Bobber is on Cooldown: ", randomToyCandidate.name, "index: ", i)
            -- the 'randomed bobber' is on cooldown, remove it from the indexed table
            indexedOwnedBobbers[i] = nil
            -- after removing the bobber in cooldown from the table, we re-index it with reorderTable() so we can do math.random() with the remaining elements
            indexedOwnedBobbers = reorderTable(indexedOwnedBobbers)
        end
    end
    if newRandomToy then
        -- An off-cooldown, previously not picked bobber has been randomed
        -- great success!
        lastRandomed = newRandomToy.name
        alreadyRandomed = true
        self:setTableToSelectedTable(newRandomToy, angleurToys.selectedCrateBobberTable)
        Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_PickRandomBobber: ") .. "Random selection complete. Chosen Bobber: ", newRandomToy.name)
        return true
    elseif bufferBobber then
        -- Although no 'new' randomable bobber has been found, 
        -- we have an off cooldown one in the buffer, use that
        lastRandomed = bufferBobber.name
        alreadyRandomed = true
        self:setTableToSelectedTable(bufferBobber, angleurToys.selectedCrateBobberTable)
        Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_PickRandomBobber: ") .. "A single off-cooldown bobber found, but it's the same as the previously picked", bufferBobber.name)
        return true
    else
        -- Nothing usable, return false 
        alreadyRandomed = false
        Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_PickRandomBobber: ") .. "Couldn't pick random. All of the owned bobbers were on cooldown.")
        return false
    end
end

local randomBobberEventFrame = CreateFrame("Frame")
randomBobberEventFrame:RegisterEvent("UNIT_SPELLCAST_START")
randomBobberEventFrame:SetScript("OnEvent", function(self, event, unit, ...)
    if AngleurConfig.chosenCrateBobber.name ~= "Random Bobber" then return end
    local arg4, arg5 = ...
    if event == "UNIT_SPELLCAST_START" then
        local isBobberSpell = false
        for i, v in pairs(angleurToys.ownedCrateBobbers) do
            if v.spellID == arg5 then
                Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_PickRandomBobber: ") .. "BOBBER SPELLCAST")
                isBobberSpell = true
            end
        end
        if isBobberSpell then
            alreadyRandomed = false
            Angleur_BetaPrint("RESETTING RANDOMED STATUS")
        end
    end
end)