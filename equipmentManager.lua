local function getItemLink(itemID)
    if not itemID then return end
    local name, link = C_Item.GetItemInfo(itemID)
    return link
end

function Angleur_EquipmentManager()
    if not Angleur_SwapoutItemsSaved then
        Angleur_SwapoutItemsSaved = {}
    end
    if not AngleurCharacter.angleurSet then
        AngleurCharacter.angleurSet = false
    end
    Angleur_CreateSetAndAdd_UpdateState()
    
    Angleur_CreateWeaponSwapFrames()
end

function Angleur_CreateSetAndAdd_UpdateState()
    if AngleurCharacter.angleurSet == true then
        Angleur.configPanel.tab2.contents.createSetAndAdd.defaultTexture:Hide()
        Angleur.configPanel.tab2.contents.createSetAndAdd.defaultText:Hide()
        Angleur.configPanel.tab2.contents.createSetAndAdd.checkedTexture:Show()
        Angleur.configPanel.tab2.contents.createSetAndAdd.checkedText:Show()
        Angleur.configPanel.tab2.contents.createSetAndAdd.disableAndDelete:Show()
    elseif AngleurCharacter.angleurSet == false then
        Angleur_SwapoutItemsSaved = {}
        Angleur.configPanel.tab2.contents.createSetAndAdd.checkedTexture:Hide()
        Angleur.configPanel.tab2.contents.createSetAndAdd.checkedText:Hide()
        Angleur.configPanel.tab2.contents.createSetAndAdd.defaultTexture:Show()
        Angleur.configPanel.tab2.contents.createSetAndAdd.defaultText:Show()
        Angleur.configPanel.tab2.contents.createSetAndAdd.disableAndDelete:Hide()
    end
end

function Angleur_CreateEquipmentSet()
    local setID 
    if not C_EquipmentSet.GetEquipmentSetID("Angleur") then
        C_EquipmentSet.CreateEquipmentSet("Angleur", 4620674)
        for i = 1, 19, 1 do
            C_EquipmentSet.IgnoreSlotForSave(i)
        end
        setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
        C_EquipmentSet.SaveEquipmentSet(setID)
        C_EquipmentSet.ClearIgnoredSlotsForSave()
        Angleur_BetaDump(C_EquipmentSet.GetIgnoredSlots(setID))
        local colorBlu = CreateColor(0.61, 0.85, 0.92)
        local colorYellow = CreateColor(1.0, 0.82, 0.0)
        print("Created equipment set for " .. colorBlu:WrapTextInColorCode("Angleur" ) .. ". ID is : ", setID)
        print("All unslotted items in the set have been set to <ignore slot>.")
        print("For passive items you'd like to add to your fishing gear, you can use the game's " 
        .. colorYellow:WrapTextInColorCode("Equipment Manager ") .. "to add them to the " .. colorBlu:WrapTextInColorCode("Angleur ") .. "set")
        AngleurCharacter.angleurSet = true
    end
end

-- Sets all item slots in the Equipment Manager to ignore
local function setIgnores(setID)
    local isIgnored = C_EquipmentSet.GetIgnoredSlots(setID)
    if not isIgnored then
        print("setIgnores: Angleur error: Equip set ID not found")
        return
    end
    for i, ignore in pairs(isIgnored) do
        if ignore == true then
            C_EquipmentSet.IgnoreSlotForSave(i)
            Angleur_BetaPrint("setIgnores: ", i, " is ignored")
        end
    end
end

local function isSetEquipped(setID)
    if next(C_EquipmentSet.GetItemIDs(setID)) == nil then
        Angleur_BetaPrint("isSetEquipped: EMPTY SET")
        return true
    end
    local _, _, _, equipped = C_EquipmentSet.GetEquipmentSetInfo(setID)
    Angleur_BetaPrint("isSetEquipped: EQUIPPED: ", equipped)
    return equipped
end



--**********************[1]************************
--* Automatically adding slotted items to the set *
--**********************[1]************************
local closeHooked = false
local function showAndPlayAnimation()
    if not CharacterFrame:IsShown() then
        ToggleCharacter("PaperDollFrame")
    end
    PaperDollFrame_SetSidebar(PaperDollFrame, 3)
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    if not setID then return end
    if not PaperDollFrame.EquipmentManagerPane.ScrollBox.ScrollTarget then return end
    scrollTargets = {PaperDollFrame.EquipmentManagerPane.ScrollBox.ScrollTarget:GetChildren()}
    local angleurSetFrame
    for i, v in pairs(scrollTargets) do
        if v.setID == setID then 
            Angleur_BetaPrint("showAndPlayAnimation: Found Angleur Set")
            angleurSetFrame = v
        end
    end
    local frameW, frameH = angleurSetFrame:GetSize()
    AngleurSet_AlertAnim:ClearAllPoints()
    AngleurSet_AlertAnim:SetSize(frameW * 1.5, frameH  * 1.5)
    AngleurSet_AlertAnim:SetPoint("CENTER", angleurSetFrame, "CENTER", 0, -1)
    AngleurSet_AlertAnim:Show()
    AngleurSet_AlertAnim.ProcStartAnim:Play()
    if not closeHooked then 
        PaperDollFrame.EquipmentManagerPane:HookScript("OnHide", function()
            AngleurSet_AlertAnim:Hide()
        end)
        closeHooked = true
    end
end

-- When player manually changes items, add them to the 'Angleur_SwapoutItemsSaved' regardless of sleep state
local updatingSet = false
local equipmentChangeTrackFrame = CreateFrame("Frame")
equipmentChangeTrackFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
equipmentChangeTrackFrame:SetScript("OnEvent", function(self, event, slot, empty)
    if AngleurCharacter.angleurSet == false then return end
    if event == "PLAYER_EQUIPMENT_CHANGED" then
        if empty == true then

        elseif empty == false then
            local newItem = GetInventoryItemID("player", slot)
            local angleurSetItemIDs = C_EquipmentSet.GetItemIDs(C_EquipmentSet.GetEquipmentSetID("Angleur"))
            local setItem = angleurSetItemIDs[slot]
            if not setItem or setItem == -1 then
                Angleur_BetaPrint("EquipmentChangeTrack: No set counterpart in the slot, not overwriting")
                return
            end
            Angleur_BetaPrint("EquipmentChangeTrack: Newly Equipped Item: ", getItemLink(newItem))
            Angleur_BetaPrint("EquipmentChangeTrack: Angleur Set Counterpart: ", getItemLink(setItem))
            if newItem == setItem then
                Angleur_BetaPrint("EquipmentChangeTrack: The new item is the set item...")
            elseif updatingSet == false then
                Angleur_SwapoutItemsSaved[slot] = newItem
                Angleur_BetaPrint("EquipmentChangeTrack: OVERWRITTEN: ", getItemLink(Angleur_SwapoutItemsSaved[slot]))
            end
        end
    end
end)


local function checkSlottedExtraItems()
    for i, slot in pairs(Angleur_SlottedExtraItems) do
        if slot.itemID ~= 0 then
            if C_Item.IsEquippableItem(slot.itemID) then 
                return true 
            end
        elseif slot.macroItemID ~= 0 then
            if C_Item.IsEquippableItem(slot.macroItemID) then 
                return true
            end
        end
    end
    return false
end

-- Will periodically call 'Equip Item' for items in wantToEquip until it's empty(all items have been equipped)
local wantToEquip = {}
local equipFrame = CreateFrame("Frame")
local erapusuThreshold = 0.3
local erapusuCounter = 0
local function OnUpdate_AttemptEquip(self, elapsed)
    erapusuCounter = erapusuCounter + elapsed
    if erapusuCounter < erapusuThreshold then
        return
    end
    if InCombatLockdown() then
        wantToEquip = {}
        self:SetScript("OnUpdate", nil)
        print("Couldn't equip slotted item in time before combat")
        return
    end
    erapusuCounter = 0
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    if not setID then
        self:SetScript("OnUpdate", nil)
        AngleurCharacter.angleurSet = false
        Angleur_CreateSetAndAdd_UpdateState()
        Angleur.configPanel.tab2.contents.createSetAndAdd:Enable()
        return
    end
    Angleur_BetaPrint("OnUpdate_AttemptEquip: Item IDs from Set ID:")
    Angleur_BetaDump(C_EquipmentSet.GetItemIDs(setID))
    if not isSetEquipped(setID) then
        -- empty for now
    end
    -- Checks for each item in 'wantToEquip' if they are equipped. If not, call 'C_Item.EquipItemByName()' again.
    for location, itemID in pairs(wantToEquip) do
        Angleur_BetaPrint("OnUpdate_AttemptEquip: Location ", location)
        Angleur_BetaPrint("OnUpdate_AttemptEquip: itemID: ", itemID)
        Angleur_BetaPrint("OnUpdate_AttemptEquip: link: ", getItemLink(itemID))
        if itemID then
            if C_Item.IsEquippedItem(itemID) then
                C_EquipmentSet.UnignoreSlotForSave(location)
                C_EquipmentSet.SaveEquipmentSet(setID)
                wantToEquip[location] = nil
                Angleur_BetaPrint("OnUpdate_AttemptEquip: Item equipped succesfully, saving to equipment set")
            else
                C_Item.EquipItemByName(itemID)
                Angleur_BetaPrint("OnUpdate_AttemptEquip: Set equipped, trying to equip item")
            end
        else
            wantToEquip[location] = nil
        end
    end
    -- Equipping process is complete, finish up
    if next(wantToEquip) == nil then
        self:SetScript("OnUpdate", nil)
        if AngleurCharacter.sleeping == true then
            Angleur_UnequipAngleurSet(true)
        end
        local colorBlu = CreateColor(0.61, 0.85, 0.92)
        local colorYellow = CreateColor(1.0, 0.82, 0.0)
        local colorRed = CreateColor(1, 0, 0)
        local colorGrae = CreateColor(0.85, 0.85, 0.85)
        if checkSlottedExtraItems() == true then
            print("Slotted items successfully updated for your " .. colorYellow:WrapTextInColorCode("Angleur Equipment Set."))
        elseif checkSlottedExtraItems() == false then
            print(colorBlu:WrapTextInColorCode("----------------------------------------------------------------------------------------------------"))
            print("   The " .. colorYellow:WrapTextInColorCode("Update/Create Set ") .. "Button automatically adds equippable items in your " 
            .. colorYellow:WrapTextInColorCode"Extra Items " .. "slots to your " .. colorBlu:WrapTextInColorCode("Angleur Set") 
            .. ", and creates one if there isn't already.\n\nIf you want to " .. colorRed:WrapTextInColorCode("remove ") 
            .. "previously saved slotted items, you need to click the " .. colorRed:WrapTextInColorCode("Delete ") 
            .. "Button to the top right, and then re-create the set - or manually change the item set.\n\nYou may also assign " 
            .. colorGrae:WrapTextInColorCode("- Passive Items - ") .. "to your "
            .. colorBlu:WrapTextInColorCode("Angleur Set ") .. "manually, and Angleur will swap them in and out like the rest.")
            print(colorBlu:WrapTextInColorCode("----------------------------------------------------------------------------------------------------"))
        end
        Angleur_BetaPrint("OnUpdate_AttemptEquip: item table empty, removing script")
        AngleurCharacter.angleurSet = true
        Angleur_CreateSetAndAdd_UpdateState()
        Angleur.configPanel.tab2.contents.createSetAndAdd:Enable()
        updatingSet = false
        showAndPlayAnimation()
    end
end


local function isEligible(itemID)
    if not C_Item.IsEquippableItem(itemID) then return false end
    if not (C_Item.GetItemCount(itemID) >= 1) then
        print("ITEM NOT FOUND IN BAGS. TO USE FOR EQUIPMENT SWAP, EITHER ADD IT MANUALLY TO ANGLEUR SET OR RE-DRAG THE MACRO.")
        return false
    end
    return true
end
-- First called when player clicks the 'Create/Update Set' button
function Angleur_AddToEquipmentSet()
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    setIgnores(setID)
    updatingSet = true
    for index, item in pairs(Angleur_SlottedExtraItems) do
        local itemID
        if item.itemID ~= 0 and item.itemID ~= nil then
            itemID = item.itemID
        elseif item.macroItemID ~= 0 and item.macroItemID ~= nil then
            itemID = item.macroItemID
        end
        if itemID and isEligible(itemID) == true and item.equipLoc ~= 0 and item.equipLoc ~= nil then
            local location = item.equipLoc
            if type(location) == "table" then location = location[1] end
            if C_EquipmentSet.IsSlotIgnoredForSave(location) then
                C_EquipmentSet.UnignoreSlotForSave(location)
            end
            Angleur_BetaPrint("AddToEquipmentSet: Slotted item detected: ", C_Item.GetItemNameByID(itemID))
            wantToEquip[location] = itemID
            local currentlyEquipped = GetInventoryItemID("player", location)
            if itemID ~= currentlyEquipped then
                Angleur_SwapoutItemsSaved[location] = currentlyEquipped
                Angleur_BetaPrint("AddToEquipmentSet: This is the item to re-equip(swapout list): ", getItemLink(Angleur_SwapoutItemsSaved[location]))
            else
                Angleur_BetaPrint("AddToEquipmentSet: Equipped item same as new, not overwriting Swapout.")
            end
        end
    end
    Angleur_BetaPrint("AddToEquipmentSet: The items that will be equipped:")
    Angleur_BetaDump(wantToEquip)
    local _, _, _, equipped = C_EquipmentSet.GetEquipmentSetInfo(setID)
    -- Will kick off the perpetual calling of 'OnUpdate_AttemptEquip' after making sure the Set is active
    if not equipped then
        Angleur_EquipAngleurSet(AngleurCharacter.sleeping)
        equipFrame:RegisterEvent("EQUIPMENT_SWAP_FINISHED")
        equipFrame:SetScript("OnEvent", function(self, event, result, listenedSetID)
            if event == "EQUIPMENT_SWAP_FINISHED" and result == true and listenedSetID == setID then
                Angleur_BetaPrint("AddToEquipmentSet: Set equip finished.")
                Angleur_BetaDump(C_EquipmentSet.GetItemIDs(setID))
                equipFrame:SetScript("OnEvent", nil)
                equipFrame:SetScript("OnUpdate", OnUpdate_AttemptEquip)
            elseif event == "EQUIPMENT_SWAP_FINISHED" and result == false then
                Angleur_BetaPrint("AddToEquipmentSet: failed to equip set: ", listenedSetID)
            end
        end)
    else
        equipFrame:SetScript("OnUpdate", OnUpdate_AttemptEquip)
    end
end
--**********************[1]************************
--|||||||||||||||||||||||||||||||||||||||||||||||||
--**********************[1]************************



--**********************[2]************************
--************** Combat Weapon Swap ***************
--**********************[2]************************
local combatSwapped = false
local swapWepTable = {}
local erapusuThreshold3 = 0.05
local erapusuCounter3 = 0
local function swapCombatWeapons_OnUpdate(self, elapsed)
    erapusuCounter3 = erapusuCounter3 + elapsed
    if erapusuCounter3 < erapusuThreshold3 then
        return
    end
    erapusuCounter3 = 0
    if InCombatLockdown() then 
        self:SetScript("OnUpdate", nil)
        Angleur_BetaPrint("swapCombatWeapons_OnUpdate: Couldn't equip combat weapon in time")
        return 
    end
    for location, itemID in pairs(swapWepTable) do
        Angleur_BetaPrint("swapCombatWeapons_OnUpdate: Weapon Location ", location)
        if C_Item.IsEquippedItem(itemID) then
            Angleur_BetaPrint(itemID, "swapCombatWeapons_OnUpdate: equipped weapon slot successfully")
            swapWepTable[location] = nil
        elseif not IsInventoryItemLocked(location) then
            C_Item.EquipItemByName(itemID, location)
            Angleur_BetaPrint("swapCombatWeapons_OnUpdate: trying to equip item")
            Angleur_BetaPrint(itemID, location)
        end
    end
    if next(swapWepTable) == nil then
        self:SetScript("OnUpdate", nil)
        Angleur_BetaPrint("swapCombatWeapons_OnUpdate: weapon swap complete, removing script")
    end
end

local function swapCombatWeapons_Single()
    Angleur_BetaPrint("swapCombatWeapons_Single: STARTING COMBAT WEP SWAP")
    for location, itemID in pairs(swapWepTable) do
        Angleur_BetaPrint("swapCombatWeapons_Single: Weapon Location ", location)
        if C_Item.IsEquippedItem(itemID) then
            Angleur_BetaPrint(itemID, "swapCombatWeapons_Single: equipped weapon slot successfully")
            swapWepTable[location] = nil
        elseif not IsInventoryItemLocked(location) then
            local GUID = C_TooltipInfo.GetOwnedItemByID(itemID).guid
            if GUID then
                local lokasyon = C_Item.GetItemLocation(GUID)
                C_Item.UnlockItem(lokasyon)
            end
            C_Item.EquipItemByName(itemID, location)
            Angleur_BetaPrint("swapCombatWeapons_Single: trying to equip item")
        else
            Angleur_BetaPrint("swapCombatWeapons_Single: LOCKEDLOCKEDLOCKEDLOCKED")
        end
    end
end



local function wepSwapFrame_OnEvent(self, event, unit, ...)
    if AngleurCharacter.sleeping == true then return end
    local arg4, arg5 = ...
    local children = {self:GetChildren()}
    if event == "PLAYER_REGEN_DISABLED" then
        swapWepTable[16] = Angleur_SwapoutItemsSaved[16]
        swapWepTable[17] = Angleur_SwapoutItemsSaved[17]
        Angleur_RepositionWeaponSwapFrames()
        for i, child in pairs(children) do
            child:setMacro(swapWepTable) 
        end
        self:Show()
    elseif event == "PLAYER_REGEN_ENABLED" then
        self:Hide()
        local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
        if not setID then 
            return 
        end
        local setItems = C_EquipmentSet.GetItemIDs(setID)
        if setItems[16] and setItems[16] ~= -1 then
            swapWepTable[16] = setItems[16]
        end
        if setItems[17] and setItems[17] ~= -1 then
            swapWepTable[17] = setItems[17]
        end
        swapCombatWeapons_Single()
        if next(swapWepTable) ~= nil then
            self:SetScript("OnUpdate", swapCombatWeapons_OnUpdate)
        end
    elseif event == "PLAYER_EQUIPMENT_CHANGED" then
        if next(swapWepTable) == nil then return end
        if swapWepTable[unit] then
            if C_Item.IsEquippedItem(swapWepTable[unit]) then
                swapWepTable[unit] = nil
            end
        end
        if next(swapWepTable) == nil then
            for i, child in pairs(children) do
                child.icon:SetTexture(nil)
                child.equipArrow:Hide()
                child.success:Show()
            end
        end
    end
end
local weaponSwapFrames = CreateFrame("Frame")
weaponSwapFrames:SetFrameStrata("HIGH")
weaponSwapFrames:RegisterEvent("PLAYER_REGEN_ENABLED")
weaponSwapFrames:RegisterEvent("PLAYER_REGEN_DISABLED")
weaponSwapFrames:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
weaponSwapFrames:SetScript("OnEvent", wepSwapFrame_OnEvent)


-- Creates hidden overlay force-equip macro secureactionbuttons onto the minimap button and visual
function Angleur_CreateWeaponSwapFrames()
    if weaponSwapFrames.visual == nil then Angleur_BetaPrint("CreateWeaponSwapFrames: it do be nil") end
    if Angleur.visual:IsShown() and weaponSwapFrames.visual == nil then
        weaponSwapFrames.visual = CreateFrame("Button", "Angleur_WeaponSwapFrame1", weaponSwapFrames, "CombatWeaponSwapButtonTemplate")
    end
    if weaponSwapFrames.minimap == nil then Angleur_BetaPrint("CreateWeaponSwapFrames: it do be nil") end
    if LibDBIcon10_AngleurMap then
        if LibDBIcon10_AngleurMap:IsShown() then    
            weaponSwapFrames.minimap = CreateFrame("Button", "Angleur_WeaponSwapFrame2", weaponSwapFrames, "CombatWeaponSwapButtonTemplate")
        end
    end
end

function Angleur_RepositionWeaponSwapFrames()
    if weaponSwapFrames.visual ~= nil and Angleur.visual:IsShown() then
        local frameX, frameY = Angleur.visual:GetSize()
        local selfX, selfY = weaponSwapFrames.visual:GetSize()
        weaponSwapFrames.visual:SetScale(Angleur.visual:GetEffectiveScale())
        weaponSwapFrames.visual:ClearAllPoints()
        weaponSwapFrames.visual:SetPoint("BOTTOMLEFT", UIParent, Angleur.visual:GetLeft(), Angleur.visual:GetBottom())
    else
        Angleur_BetaPrint("RepositionWeaponSwapFrames: it do be nil")
    end

    if weaponSwapFrames.minimap ~= nil and LibDBIcon10_AngleurMap and LibDBIcon10_AngleurMap:IsShown() then 
        local frameX, frameY = LibDBIcon10_AngleurMap:GetSize()
        local selfX, selfY = weaponSwapFrames.minimap:GetSize()
        local minimapScaler = 0.7
        weaponSwapFrames.minimap:SetScale(LibDBIcon10_AngleurMap:GetEffectiveScale() * minimapScaler)
        weaponSwapFrames.minimap:ClearAllPoints()
        weaponSwapFrames.minimap:SetPoint("BOTTOMLEFT", UIParent, LibDBIcon10_AngleurMap:GetLeft() / minimapScaler, LibDBIcon10_AngleurMap:GetBottom() / minimapScaler)
    else
        Angleur_BetaPrint("RepositionWeaponSwapFrames: it do be nil")
    end
end


--**********************[2]************************
--|||||||||||||||||||||||||||||||||||||||||||||||||
--**********************[2]************************



--**********************[3]************************
--****************** Equip Set ********************
--**********************[3]************************
--
local equipFrameSet = CreateFrame("Frame")
equipFrameSet:RegisterEvent("EQUIPMENT_SWAP_FINISHED")
local function fillSwapoutTable(setID)
    itemIDs = C_EquipmentSet.GetItemIDs(setID)
    Angleur_BetaPrint("fillSwapoutTable: Table ItemIDs:")
    Angleur_BetaDump(itemIDs)
    for location = 1, 19 do
        if itemIDs[location] ~= nil and itemIDs[location] ~= -1 then
            Angleur_BetaPrint("fillSwapoutTable: Slot is set to equip item: ", itemIDs[location])
            local inventoryItemID = GetInventoryItemID("player", location)
            Angleur_BetaPrint(inventoryItemID)
            if inventoryItemID then
                if inventoryItemID == itemIDs[location] then
                    Angleur_BetaPrint("fillSwapoutTable: Set item was previously equipped, not overriding previous re-requip table.")
                elseif Angleur_SwapoutItemsSaved[location] ~= nil and Angleur_SwapoutItemsSaved[location] ~= -1 then
                    local _, itemLink = GetItemInfo(Angleur_SwapoutItemsSaved[location])
                    Angleur_BetaPrint(location, itemLink)
                end
            end
        end
    end
end
-- Starts off the periodical calling of 'Equip Set' until player enters combat or set is succesfully equipped
function Angleur_EquipAngleurSet(overrideSwapoutItems)
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    if not setID then 
        Angleur_BetaPrint("EquipAngleurSet: No Angleur set found, can't swap")
        return
    end
    if overrideSwapoutItems == true then
        setIgnores(setID)
        fillSwapoutTable(setID)
    end
    local erapusuThresholdSet = 0.3
    local erapusuCounterSet = 0
    equipFrameSet:SetScript("OnUpdate", function(self, elapsed)
        erapusuCounterSet = erapusuCounterSet + elapsed
        if erapusuCounterSet < erapusuThresholdSet then
            return
        end
        erapusuCounterSet = 0
        if InCombatLockdown() then
            print("Equipping of the Angleur set disrupted due to sudden combat")
            self:SetScript("OnUpdate", nil)
            self:SetScript("OnEvent", nil)
            return
        end
        C_EquipmentSet.UseEquipmentSet(setID)
    end)
    equipFrameSet:SetScript("OnEvent", function(self, event, result, equippedSet)
        if event == "EQUIPMENT_SWAP_FINISHED" then
            if result == true and equippedSet == setID then
                self:SetScript("OnEvent", nil)
                self:SetScript("OnUpdate", nil)
                Angleur_BetaPrint("Angleur_EquipAngleurSet: Angleur set equipped successfully")
                for location, itemID in pairs(Angleur_SwapoutItemsSaved) do
                    local _, itemLink = GetItemInfo(Angleur_SwapoutItemsSaved[location])
                    Angleur_BetaPrint("Angleur_EquipAngleurSet: Swapout: ", location, itemLink)
                end
            end
        end
    end)
end
--**********************[3]************************
--|||||||||||||||||||||||||||||||||||||||||||||||||
--**********************[3]************************



--**********************[4]************************
--***************** Unequip Set *******************
--**********************[4]************************
local erapusuThreshold3 = 0.3
local erapusuCounter3 = 0
local swapoutsTemporary = {}
local function copyTableToTemp()
    for i, v in pairs(Angleur_SwapoutItemsSaved) do
        swapoutsTemporary[i] = v
    end
end
-- Attempts to unequip until the temporary copied table is emptied
local function unequipSet_OnUpdate(self, elapsed)
    erapusuCounter3 = erapusuCounter3 + elapsed
    if erapusuCounter3 < erapusuThreshold3 then
        return
    end
    erapusuCounter3 = 0
    copyTableToTemp()
    if InCombatLockdown() then 
        Angleur_BetaPrint("unequipSet_OnUpdate: Couldn't re-equip all items for combat in time.")
        Angleur_BetaDump(swapoutsTemporary)
        self:SetScript("OnUpdate", nil)
        return 
    end
    for location, itemID in pairs(swapoutsTemporary) do
        Angleur_BetaPrint("unequipSet_OnUpdate: Location ", location)
        if C_Item.IsEquippedItem(itemID) then
            Angleur_BetaPrint("unequipSet_OnUpdate: " , itemID, "equipped back successfully")
            swapoutsTemporary[location] = nil
        else
            C_Item.EquipItemByName(itemID)
            Angleur_BetaPrint("unequipSet_OnUpdate: trying to equip item")
        end
    end
    if next(swapoutsTemporary) == nil then
        self:SetScript("OnUpdate", nil)
        Angleur_BetaPrint("unequipSet_OnUpdate: swapback complete, removing script")
    end
end
local function unequipSet_Single()
    for location, itemID in pairs(swapoutsTemporary) do
        C_Item.EquipItemByName(itemID)
        Angleur_BetaPrint("unequipSet_Single: trying to equip item(first attempt)")
        if C_Item.IsEquippedItem(itemID) then
            swapoutsTemporary[location] = nil
        end
    end
end
-- Main unequip function, kicks off periodical calling of unequipSet
function Angleur_UnequipAngleurSet(secondary)
    equipFrameSet:SetScript("OnEvent", nil)
    equipFrameSet:SetScript("OnUpdate", nil)
    unequipSet_Single()
    if next(Angleur_SwapoutItemsSaved) == nil then 
        Angleur_BetaPrint("Angleur_UnequipAngleurSet: Swapped back successfully on the first attempt")
        return 
    end
    if not secondary then return end
    Angleur_BetaPrint("Angleur_UnequipAngleurSet: SwapoutItems Table remaining from first(singular) attempt:")
    Angleur_BetaDump(Angleur_SwapoutItemsSaved)
    Angleur_BetaPrint("Angleur_UnequipAngleurSet: Starting secondary swapback process")
    equipFrameSet:SetScript("OnUpdate", unequipSet_OnUpdate)
end
--**********************[4]************************
--|||||||||||||||||||||||||||||||||||||||||||||||||
--**********************[4]************************