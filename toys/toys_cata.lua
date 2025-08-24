local T = Angleur_Translate
local colorDebug = CreateColor(0.68, 0, 1) -- purple

AngleurToysCata = {}
local cata = AngleurToysCata

--________________________________________
--____________SAME AS RETAIL______________
--________________________________________
function cata:setTableToSelectedTable(inputTable, selectedToyTable)
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

function cata:SetSelectedToy(selectedToyTable, ownedToysTable, chosenByPlayer)
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

local done = false
function cata:AdjustCloseButton(extraToysFrame)
    if done then return end
    extraToysFrame.first.closeButton:SetSize(29, 31)
    extraToysFrame.first.closeButton:AdjustPointsOffset(3, 4)
    extraToysFrame.second.closeButton:SetSize(29, 31)
    extraToysFrame.second.closeButton:AdjustPointsOffset(3, 4)
    extraToysFrame.third.closeButton:SetSize(29, 31)
    extraToysFrame.third.closeButton:AdjustPointsOffset(3, 4)
    done = true
end

function cata:ToysStandardTab()
    if Angleur_CheckOwnedToys(angleurToys.selectedRaftTable, angleurToys.ownedRafts, angleurToys.raftPossibilities) then
        self:SetSelectedToy(angleurToys.selectedRaftTable, angleurToys.ownedRafts, AngleurConfig.chosenRaft.toyID)
        --WHY? WHY HAVE I PUT THIS IN? CHECK LATER, SEEMS POINTLESS
        Angleur.toyButton:SetAttribute("macrotext", "/cast " .. angleurToys.selectedRaftTable.name)
    else
        Angleur.configPanel.tab1.contents.raftEnable:greyOut()
    end
end