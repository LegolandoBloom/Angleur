local T = Angleur_Translate
local colorDebug = CreateColor(0.68, 0, 1) -- purple

AngleurToysRetail = {}
local retail = AngleurToysRetail

function retail:setTableToSelectedTable(inputTable, selectedToyTable)
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

function retail:LoadToysExtra()
    if Angleur_CheckOwnedToys(angleurToys.selectedRaftTable, angleurToys.ownedRafts, angleurToys.raftPossibilities) then
        Angleur_SetSelectedToy(angleurToys.selectedRaftTable, angleurToys.ownedRafts, AngleurConfig.chosenRaft.toyID)
        --WHY? WHY HAVE I PUT THIS IN? CHECK LATER, SEEMS POINTLESS
        Angleur.toyButton:SetAttribute("macrotext", "/cast " .. angleurToys.selectedRaftTable.name)
    else
        Angleur.configPanel.tab1.contents.raftEnable:greyOut()
    end

    if Angleur_CheckOwnedToys(angleurToys.selectedOversizedBobberTable, angleurToys.ownedOversizedBobbers, angleurToys.oversizedBobberPossibilities) then
        Angleur_SetSelectedToy(angleurToys.selectedOversizedBobberTable, angleurToys.ownedOversizedBobbers, nil)
    else
        Angleur.configPanel.tab1.contents.oversizedBobberEnable:greyOut()
    end
        
    if Angleur_CheckOwnedToys(angleurToys.selectedCrateBobberTable, angleurToys.ownedCrateBobbers, angleurToys.crateBobberPossibilities) then
        Angleur_SetSelectedToy(angleurToys.selectedCrateBobberTable, angleurToys.ownedCrateBobbers, AngleurConfig.chosenCrateBobber.toyID)
    else
        Angleur.configPanel.tab1.contents.crateBobberEnable:greyOut()
    end
end


function retail:PickRandomBobber()
    --angleurToys.selectedCrateBobberTable
    if AngleurConfig.chosenCrateBobber.name ~= "Random Bobber" then return end
    if next(angleurToys.ownedCrateBobbers) == nil then return end
    if #angleurToys.ownedCrateBobbers == 1 then return end
    local randomToyTable = angleurToys.ownedCrateBobbers[math.random( #angleurToys.ownedCrateBobbers )]
    Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_PickRandomBobber ") .. ": Next random bobber: ")
    Angleur_BetaTableToString(randomToyTable)
    if angleurToys.selectedCrateBobberTable.name ~= 0 then 
        while randomToyTable.name == angleurToys.selectedCrateBobberTable.name do
            randomToyTable = angleurToys.ownedCrateBobbers[math.random( #angleurToys.ownedCrateBobbers )]
            Angleur_BetaPrint(colorDebug:WrapTextInColorCode("Angleur_PickRandomBobber ") .. ": Same bobber detected, next attempt: ")
            Angleur_BetaTableToString(randomToyTable)
        end
    end
    self:setTableToSelectedTable(randomToyTable, angleurToys.selectedCrateBobberTable)
end
local randomBobberEventFrame = CreateFrame("Frame")
randomBobberEventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
randomBobberEventFrame:SetScript("OnEvent", function(self, event, unit, ...)
    if AngleurConfig.chosenCrateBobber.name ~= "Random Bobber" then return end
    local arg4, arg5 = ...
    if event == "UNIT_SPELLCAST_SUCCEEDED" and arg5 == angleurToys.selectedCrateBobberTable.spellID then
        retail:PickRandomBobber()
    end
end)