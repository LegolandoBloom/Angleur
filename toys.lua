angleurToys = {
    --the 111111's are a placeholder to make sure the check works
    --the last one has priority!!
    raftPossibilities = {
        {toyID = 111111, spellID = 111111},
        {name= "Tuskarr Dinghy", toyID = 198428, spellID = 383268, icon = 236574},
        {toyID = 222222, spellID = 222222},
        {name = "Anglers Fishing Raft", icon = 774121, toyID = 85500, spellID = 124036},
        {name = "Gnarlwood Waveboard", icon = 133798, toyID = 166461, spellID = 288758},
        {toyID = 333333, spellID = 333333}
    },
    --raftPossibilities = {{toyID = 111111, spellID = 111111}, {toyID = 222222, spellID = 222222}, {toyID = 333333, spellID = 333333}} --filled with fake toys for testing purposes, normally quoted out
    ownedRafts = {},
    selectedRaftTable = {name = 0, toyID = 0, spellID = 0, icon = 0, hasToy = false, loaded = false},
    
    oversizedBobberPossibilities = {
        {toyID = 444444, spellID = 444444}, 
        {toyID = 555555, spellID = 555555}, 
        {name = "Reusable Oversized Bobber", toyID = 202207, spellID = 397827, icon = 236576}, 
        {toyID = 666666, spellID = 666666}
    },
    --local oversizedBobberPossibilities = {{toyID = 444444, spellID = 444444}, {toyID = 555555, spellID = 555555}, {toyID = 666666, spellID = 666666}}
    ownedOversizedBobbers = {},
    selectedOversizedBobberTable = {name = 0, toyID = 0, spellID = 0, icon = 0, hasToy = false, loaded = false},
    
    crateBobberPossibilities = {
        {name = "Crate of Bobbers: Can of Worms", toyID = 142528, spellID = 231291, icon = 236197},
        {name = "Crate of Bobbers: Carved Wooden Helm", toyID = 147307, spellID = 240803, icon = 463008},
        {name = "Crate of Bobbers: Cat Head", toyID = 142529, spellID = 231319, icon = 454045},
        {name = "Crate of Bobbers: Demon Noggin", toyID = 147312, spellID = 240801, icon = 236292},
        {name = "Crate of Bobbers: Enchanted Bobber", toyID = 147308, spellID = 240800, icon = 236449},
        {name = "Crate of Bobbers: Face of the Forest", toyID = 147309, spellID = 240806, icon = 236157},
        {name = "Crate of Bobbers: Floating Totem", toyID = 147310, spellID = 240802, icon = 310733},
        {name = "Crate of Bobbers: Murloc Head", toyID = 142532, spellID = 231349, icon = 134169},
        {name = "Crate of Bobbers: Replica Gondola", toyID = 147311, spellID = 240804, icon = 517162},
        {name = "Crate of Bobbers: Squeaky Duck", toyID = 142531, spellID = 231341, icon = 1369786},
        {name = "Crate of Bobbers: Tugboat", toyID = 142530, spellID = 231338, icon = 1126431},
        {name = "Crate of Bobbers: Wooden Pepe", toyID = 143662, spellID = 232613, icon = 1044996},
        {name = "Bat Visage Bobber", toyID = 180993, spellID = 335484, icon = 132182},
        {name = "Limited Edition Rocket Bobber", toyID = 237345, spellID = 1222880, icon = 6383563},
        {name = "Artisan Beverage Goblet Bobber", toyID = 237346, spellID = 1222884, icon = 6383561},
        {name = "Organically-Sourced Wellington Bobber", toyID = 237347, spellID = 1222888, icon = 6383562},
        {name = "Templatename", toyID = 1111111, spellID = 222222, icon = 3333333},
    },
    --local crateBobberPossibilities = {{toyID = 444444, spellID = 444444}, {toyID = 555555, spellID = 555555}, {toyID = 666666, spellID = 666666}}
    ownedCrateBobbers = {},
    selectedCrateBobberTable = {name = 0, icon = 0, toyID = 0, spellID = 0, hasToy = false, loaded = false},
    nextRandomCrateBobber = {name = 0, icon = 0, toyID = 0, spellID = 0, hasToy = false, loaded = false, last = nil},

    --Outdated implementation, not used
    extraToys = {
        --{name = "Insulated Dancing Insoles", toyID = 188699, spellID = 45416, icon = 132577},
        {name = "Golden Dragon Goblet", toyID = 202019, spellID = 396172, icon = 454051},
        {name = "Gnoll Tent", toyID = 193476, spellID = 398159, icon = 4624631}
    },
    --extraToys = {{name = "Fire-Eater's Vial", toyID = 122129, spellID = 179950, icon = 463534}},

    toyBoxButtonsHookSet = false,
    toyBoxHookActive = false,
    toyBoxCloseHookSet = false,
    extraToyEventWatcher = CreateFrame("Frame"),
    extraToySlotHolder = nil,
}

Angleur_SlottedExtraToys = {
    first = {name = 0, toyID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false},
    second = {name = 0, toyID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false},
    third = {name = 0, toyID = 0, spellID = 0, icon = 0, auraActive = false, loaded = false}
}
local function initializeSavedToys()
    for i, slot in pairs(Angleur_SlottedExtraToys) do
        if not slot.name then slot.name = 0 end
        if not slot.toyID then slot.toyID = 0 end
        if not slot.spellID then slot.spellID = 0 end
        if not slot.icon then slot.icon = 0 end
        if not slot.auraActive then slot.auraActive = false end
        if not slot.loaded then slot.loaded = false end
    end
end

--If player has at least one toy in the category, initiate load. Otherwise, disable the checkbox and dropdown menus
function Angleur_LoadToys(self)
    initializeSavedToys()
    GetTimePreciseSec()
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

    Angleur_LoadExtraToys(Angleur.configPanel.tab2.contents.extraToys)
end

function Angleur_CheckOwnedToys(selectedToyTable, ownedToysTable, possibilityTable)
    local foundUsableToy = false
    for i, toy in pairs(possibilityTable) do
        if PlayerHasToy(toy.toyID) then
            table.insert(ownedToysTable, toy)
            foundUsableToy = true
        end
    end
    return foundUsableToy
end

--If it doesn't find that a toy already chosen from the previous session, picks the last one from the owned toys table.
local function setTableToSelectedTable(inputTable, selectedToyTable)
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
function Angleur_SetSelectedToy(selectedToyTable, ownedToysTable, chosenByPlayer)
    local selection = {}
    for i, ownedToy in pairs(ownedToysTable) do
        selection = ownedToy
        if chosenByPlayer == ownedToy.toyID then
            break
        end
    end
    setTableToSelectedTable(selection, selectedToyTable)
end

function Angleur_LoadExtraToys(extraToyButtons)
    for i, slot in pairs(Angleur_SlottedExtraToys) do
        Angleur_SlottedExtraToys[i].loaded = false
        --extraToyButtons[i].name = Angleur_SlottedExtraToys[i].name
        --extraToyButtons[i].spellID = Angleur_SlottedExtraToys[i].spellID
        extraToyButtons[i].toyID = Angleur_SlottedExtraToys[i].toyID
        extraToyButtons[i].icon:SetTexture(Angleur_SlottedExtraToys[i].icon)
        if Angleur_SlottedExtraToys[i].name ~= 0 then
            extraToyButtons[i].closeButton:Show()
            local item = Item:CreateFromItemID(Angleur_SlottedExtraToys[i].toyID)
            item:ContinueOnItemLoad(function(self)
                Angleur_SlottedExtraToys[i].loaded = true
                --print("Extra toy loaded: ", item:GetItemLink())
            end)
        end
    end
end


function Angleur_ToyBoxOverlay_OnLoad(self)
    SLASH_ANGLEUROVERLAYTEST1 = "/alol"
    Angleur_ExtraToys_First:SetScript("OnClick", Angleur_ToyBoxOverlay_Activate)
    Angleur_ExtraToys_Second:SetScript("OnClick", Angleur_ToyBoxOverlay_Activate)
    Angleur_ExtraToys_Third:SetScript("OnClick", Angleur_ToyBoxOverlay_Activate)
end

function Angleur_ToyBoxOverlay_Activate(self, overlay)
    if InCombatLockdown() then return end
    
    angleurToys.extraToySlotHolder = self
    if not CollectionsJournal then
        C_AddOns.LoadAddOn("Blizzard_Collections")
        CollectionsJournal:Show()
    elseif not CollectionsJournal:IsShown() then
        CollectionsJournal:Show()
    end
    CollectionsJournal_SetTab(CollectionsJournal, 3)

    if C_AddOns.IsAddOnLoaded("ToyBoxEnhanced") then
        if not ToyBox.EnhancedLayer then return end
        ToyBox.EnhancedLayer:Hide()
    end

    Angleur.toyBoxOverlay.texture:SetAllPoints(ToyBox.iconsFrame.BackgroundTile)
    Angleur.toyBoxOverlay.textBackground:ClearAllPoints()
    Angleur.toyBoxOverlay.textBackground:SetPoint("TOPLEFT", ToyBox, "TOPLEFT", 29, -30)
    Angleur.toyBoxOverlay.text:SetPoint("CENTER", Angleur.toyBoxOverlay.textBackground, "CENTER", -15, 9)
    Angleur.toyBoxOverlay:Show()
    
    if angleurToys.toyBoxCloseHookSet == false then
        ToyBox:HookScript("OnHide", function()
            Angleur.toyBoxOverlay:Hide()
            if C_AddOns.IsAddOnLoaded("ToyBoxEnhanced") then
                if not ToyBox.EnhancedLayer then return end
                if ToyBox.EnhancedLayer:IsShown() then return end
                ToyBox.EnhancedLayer:Show()
            end
        end)
        angleurToys.toyBoxCloseHookSet = true
    end

    Angleur_ToyBoxOverlay_SetWatch(self)
end

function Angleur_ToyBoxOverlay_SetWatch(self)
    local children = {ToyBox.iconsFrame:GetChildren()}
    if not angleurToys.toyBoxButtonsHookSet then
        for i, button in pairs(children) do
            if button:GetObjectType() == "CheckButton" then
                button:HookScript("OnMouseUp", Angleur_ToyBoxOverlay_Watch)
            end
        end
        angleurToys.toyBoxButtonsHookSet = true
    end
    angleurToys.toyBoxHookActive = true
end

function Angleur_ToyBoxOverlay_Watch(self, button)
    if button ~= "LeftButton" then
        print("please choose the toy with left click so that angleur can function properly")
        return
    end

    if angleurToys.toyBoxHookActive then
        if not PlayerHasToy(self.itemID) then
            print("you do not own this toy. please select another")
            return
        end
        
        print("Selected extra toy: ", C_ToyBox.GetToyLink(self.itemID))
        local toyInfo = {C_ToyBox.GetToyInfo(self.itemID)}
        -- [1]itemID [2]toyName [3]icon
        
        local parentKey = angleurToys.extraToySlotHolder:GetParentKey()
        --Cant get spellID here
        Angleur_SlottedExtraToys[parentKey].toyID = toyInfo[1]
        Angleur_SlottedExtraToys[parentKey].name = toyInfo[2]
        Angleur_SlottedExtraToys[parentKey].icon = toyInfo[3]
        local _
        _, Angleur_SlottedExtraToys[parentKey].spellID = C_Item.GetItemSpell(toyInfo[1])
        Angleur_BetaPrint("New method: ", Angleur_SlottedExtraToys[parentKey].spellID)

        --We get the spellID using the "Angleur_ToyBoxOverlay_CaptureSpellID" here
        angleurToys.extraToyEventWatcher:RegisterEvent("UNIT_SPELLCAST_SENT")
        angleurToys.extraToyEventWatcher:RegisterEvent("UNIT_SPELLCAST_FAILED")
        angleurToys.extraToyEventWatcher:SetScript("OnEvent", Angleur_ToyBoxOverlay_CaptureSpellID)
        Angleur_SingleDelayer(0.2, 0, 0.1, angleurToys.extraToyEventWatcher, nil, function()
            angleurToys.extraToyEventWatcher:SetScript("OnEvent", nil)
            Angleur_LoadExtraToys(angleurToys.extraToySlotHolder:GetParent())
            angleurToys.extraToySlotHolder = nil
            CollectionsJournal:Hide()
        end)
        print("Toy selection deactivated")
        Angleur_ToyBoxOverlay_Deactivate(self)
    end
end

function Angleur_ToyBoxOverlay_CaptureSpellID(self, event, unit, ...)
    local arg4, arg5, arg6 = ...

    if event == "UNIT_SPELLCAST_SENT" and unit == "player" then
        Angleur_BetaPrint("Previous method: ", arg6)
        local parentKey = angleurToys.extraToySlotHolder:GetParentKey()
        Angleur_SlottedExtraToys[parentKey].spellID = arg6
    elseif event == "UNIT_SPELLCAST_FAILED" and unit == "player" then 
        local parentKey = angleurToys.extraToySlotHolder:GetParentKey()
        Angleur_SlottedExtraToys[parentKey].spellID = arg5
    end
    self:SetScript("OnEvent", nil)
end
function Angleur_ToyBoxOverlay_Deactivate(self)
    angleurToys.toyBoxHookActive = false
    Angleur.toyBoxOverlay:Hide()
end

function Angleur_ToyBox_RemoveExtraToy(self)
    local parent = self:GetParent()
    local keyofParent = parent:GetParentKey()
    if Angleur_SlottedExtraToys[keyofParent].name == 0 then error("Angleur ERROR: Trying to remove extra toy, but it is already removed.") end
    Angleur_SlottedExtraToys[keyofParent].name = 0
    Angleur_SlottedExtraToys[keyofParent].toyID = 0
    Angleur_SlottedExtraToys[keyofParent].spellID = 0
    Angleur_SlottedExtraToys[keyofParent].icon = 0
    
    local grandParent = parent:GetParent()
    Angleur_LoadExtraToys(grandParent)
    
    self:Hide()
end


function Angleur_PickRandomBobber()
    --angleurToys.selectedCrateBobberTable
    if AngleurConfig.chosenCrateBobber.name ~= "Random Bobber" then return end
    if next(angleurToys.ownedCrateBobbers) == nil then return end
    if #angleurToys.ownedCrateBobbers == 1 then return end
    local randomToyTable = angleurToys.ownedCrateBobbers[math.random( #angleurToys.ownedCrateBobbers )]
    Angleur_BetaPrint("Next random bobber: ")
    Angleur_BetaDump(randomToyTable)
    if angleurToys.selectedCrateBobberTable.name ~= 0 then 
        while randomToyTable.name == angleurToys.selectedCrateBobberTable.name do
            randomToyTable = angleurToys.ownedCrateBobbers[math.random( #angleurToys.ownedCrateBobbers )]
            Angleur_BetaPrint("Same bobber detected, next attempt: ")
            Angleur_BetaDump(randomToyTable)
        end
    end
    setTableToSelectedTable(randomToyTable, angleurToys.selectedCrateBobberTable)
end
local randomBobberEventFrame = CreateFrame("Frame")
randomBobberEventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
randomBobberEventFrame:SetScript("OnEvent", function(self, event, unit, ...)
    if AngleurConfig.chosenCrateBobber.name ~= "Random Bobber" then return end
    local arg4, arg5 = ...
    if event == "UNIT_SPELLCAST_SUCCEEDED" and arg5 == angleurToys.selectedCrateBobberTable.spellID then
        Angleur_PickRandomBobber()
    end
end)
