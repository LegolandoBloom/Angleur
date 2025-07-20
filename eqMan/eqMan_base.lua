local T = Angleur_Translate
local colorDebug1 = CreateColor(1, 0.84, 0) -- yellow
local colorDebug2 = CreateColor(1, 0.91, 0.49) -- pale yellow
local colorDebug3 = CreateColor(1, 1, 0) -- lemon yellow
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorRed = CreateColor(1, 0, 0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)

local retail = AngleurEqManRetail


local function getItemLinkID(itemID)
    local _, link = C_Item.GetItemInfo(itemID)
    return link
end

local itemLocation = ItemLocation:CreateEmpty()
local function getItemLinkBag(bagID, slotIndex)
    itemLocation:SetBagAndSlot(bagID, slotIndex)
    local link = C_Item.GetItemLink(itemLocation)
    itemLocation:Clear()
    return link
end
local function getItemLinkEquipped(equipmentSlotIndex)
    itemLocation:SetEquipmentSlot(equipmentSlotIndex)
    local link = C_Item.GetItemLink(itemLocation)
    itemLocation:Clear()
    return link
end
local function getItemGUIDEquiped(equipmentSlotIndex)
    itemLocation:SetEquipmentSlot(equipmentSlotIndex)
    local guid = C_Item.GetItemLink(itemLocation)
    itemLocation:Clear()
    return guid
end

SLASH_ANGSAVEDITEMS1 = "/angsaved"
SlashCmdList["ANGSAVEDITEMS"] = function()
    print(colorDebug3:WrapTextInColorCode("Swapout items:"))
    for i, v in pairs(Angleur_SwapoutItemsSaved) do
        print(v)
    end
end
SLASH_ANGTEST1 = "/angtest"
SlashCmdList["ANGTEST"] = function()
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    DevTools_Dump(C_EquipmentSet.GetItemIDs(setID))
    DevTools_Dump(C_EquipmentSet.GetIgnoredSlots(setID))
end

function Angleur_ForceDeleteSet()
    local setButton = Angleur_CreateSetAndAdd
    AngleurCharacter.angleurSet = false
    Angleur_CreateSetAndAdd_UpdateState()
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    if setID then
        C_EquipmentSet.DeleteEquipmentSet(setID)
    end
    setButton:Enable()
    setButton:ClearPushedTexture()
end

function Angleur_IsEquipItemValid(itemInfo)
    if C_Item.IsEquippableItem(itemInfo) == false then return false end
    if C_Item.GetItemCount(itemInfo) < 1 then return false end
    return true
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

local function checkSlottedExtraItems()
    for i, slot in pairs(Angleur_SlottedExtraItems) do
        if slot.itemID ~= 0 then
            if C_Item.IsEquippableItem(slot.itemID) then 
                ---------------------------
                --Needed for Classic(Era)--
                ---------------------------
                if not (C_Item.GetItemCount(slot.itemID) >= 1) then
                    Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("checkSlottedExtraItems ") .. ": not in bags")
                else
                    return true
                end
                ---------------------------
                ---------------------------
                ---------------------------
            end
        elseif slot.macroItemID ~= 0 then
            if C_Item.IsEquippableItem(slot.macroItemID) then
                ---------------------------
                --Needed for Classic(Era)--
                ---------------------------
                if not (C_Item.GetItemCount(slot.macroItemID) >= 1) then
                    Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("checkSlottedExtraItems ") .. ": not in bags")
                else
                    return true
                end
                ---------------------------
                ---------------------------
                ---------------------------
            end
        end
    end
    return false
end
function Angleur_CreateEquipmentSet()
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 3 then
        if checkSlottedExtraItems() == false then
            print(T["Can't create Equipment Set without any equippable slotted items. Slot a usable and equippable item to your Extra Items slots first."])
            print(T["This is a limitation of Classic(not the case for Cata and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."])
            Angleur_ForceDeleteSet()
            return
        end
    end

    local setID 
    if not C_EquipmentSet.GetEquipmentSetID("Angleur") then
        local iconID
        if gameVersion == 1 then
            iconID = 4620674
        elseif gameVersion == 2 or gameVersion == 3 then
            iconID = 136245
        end
        C_EquipmentSet.CreateEquipmentSet("Angleur", iconID)
        for i = 1, 19, 1 do
            C_EquipmentSet.IgnoreSlotForSave(i)
        end
        setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
        C_EquipmentSet.SaveEquipmentSet(setID)
        C_EquipmentSet.ClearIgnoredSlotsForSave()
        Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("Angleur_CreateEquipmentSet ") .. ": Ignored Slots:")
        Angleur_BetaTableToString(C_EquipmentSet.GetIgnoredSlots(setID))
        print(T["Created equipment set for " .. colorBlu:WrapTextInColorCode("Angleur" ) .. ". ID is : "], setID)
        print(T["All unslotted items in the set have been set to <ignore slot>."])
        print(T["For passive items you'd like to add to your fishing gear, you can use the game's " 
        .. colorYello:WrapTextInColorCode("Equipment Manager ") .. "to add them to the " .. colorBlu:WrapTextInColorCode("Angleur ") .. "set"])
        AngleurCharacter.angleurSet = true
    end
    if gameVersion == 3 then
        Angleur_AddToEquipmentSet()
    end
end

-- Sets all item slots in the Equipment Manager to ignore
local function setIgnores(setID)
    local isIgnored = C_EquipmentSet.GetIgnoredSlots(setID)
    if not isIgnored then
        print("setIgnores: Angleur error: Equip set ID not found")
        return
    end
    local Debug_Ignores = ""
    for i, ignore in pairs(isIgnored) do
        if ignore == true then
            C_EquipmentSet.IgnoreSlotForSave(i)
            Debug_Ignores = Debug_Ignores .. " | " .. i
        end
    end
    Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("setIgnores "), ": ", Debug_Ignores, " are ignored")
end

local function isSetEquipped(setID)
    if next(C_EquipmentSet.GetItemIDs(setID)) == nil then
        Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("isSetEquipped ") .. ": EMPTY SET")
        return true
    end
    local _, _, _, equipped = C_EquipmentSet.GetEquipmentSetInfo(setID)
    Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("isSetEquipped ") .. ": EQUIPPED: ", equipped)
    return equipped
end



--**********************[1]************************
--* Automatically adding slotted items to the set *
--**********************[1]************************

local function showAndPlayAnimation()
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 3 then return end
    if not CharacterFrame:IsShown() then
        ToggleCharacter("PaperDollFrame")
    end
    PaperDollFrame_SetSidebar(PaperDollFrame, 3)
    if gameVersion == 1 then retail:showShiny() end
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
                Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("EquipmentChangeTrack ") .. ": No set counterpart in the slot, not overwriting")
                return
            end
            Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("EquipmentChangeTrack ") .. ": Newly Equipped Item: ", getItemLinkEquipped(slot))
            Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("EquipmentChangeTrack ") .. ": Angleur Set Counterpart: ", getItemLinkID(setItem))
            if newItem == setItem then
                Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("EquipmentChangeTrack ") .. ": The new item is the set item...")
            elseif updatingSet == false then
                Angleur_SwapoutItemsSaved[slot] = getItemLinkEquipped(slot)
                Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("EquipmentChangeTrack ") .. ": OVERWRITTEN: ", Angleur_SwapoutItemsSaved[slot])
            end
        end
    end
end)




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
        print(T["Couldn't equip slotted item in time before combat"])
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
    Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("OnUpdate_AttemptEquip ") .. ": Item IDs from Set ID:")
    Angleur_BetaTableToString(C_EquipmentSet.GetItemIDs(setID))
    if not isSetEquipped(setID) then
        -- empty for now
    end
    -- Checks for each item in 'wantToEquip' if they are equipped. If not, call 'C_Item.EquipItemByName()' again.
    for location, itemID in pairs(wantToEquip) do
        Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("OnUpdate_AttemptEquip ") .. ": Location:", location, ", itemID:", itemID, ", link:", getItemLinkID(itemID))
        if itemID then
            if C_Item.IsEquippedItem(itemID) then
                C_EquipmentSet.UnignoreSlotForSave(location)
                C_EquipmentSet.SaveEquipmentSet(setID)
                wantToEquip[location] = nil
                Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("OnUpdate_AttemptEquip ") .. ": Item equipped succesfully, saving to equipment set")
            else
                C_Item.EquipItemByName(itemID)
                Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("OnUpdate_AttemptEquip ") .. ": Set equipped, trying to equip item")
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
        if checkSlottedExtraItems() == true then
            print(T["Slotted items successfully updated for your " .. colorYello:WrapTextInColorCode("Angleur Equipment Set.")])
        elseif checkSlottedExtraItems() == false then
            print(colorBlu:WrapTextInColorCode("----------------------------------------------------------------------------------------------------"))
            print(T["   The " .. colorYello:WrapTextInColorCode("Update/Create Set ") .. "Button automatically adds equippable items in your " 
            .. colorYello:WrapTextInColorCode"Extra Items " .. "slots to your " .. colorBlu:WrapTextInColorCode("Angleur Set") 
            .. ", and creates one if there isn't already.\n\nIf you want to " .. colorRed:WrapTextInColorCode("remove ") 
            .. "previously saved slotted items, you need to click the " .. colorRed:WrapTextInColorCode("Delete ") 
            .. "Button to the top right, and then re-create the set - or manually change the item set.\n\nYou may also assign " 
            .. colorGrae:WrapTextInColorCode("- Passive Items - ") .. "to your "
            .. colorBlu:WrapTextInColorCode("Angleur Set ") .. "manually, and Angleur will swap them in and out like the rest."])
            print(colorBlu:WrapTextInColorCode("----------------------------------------------------------------------------------------------------"))
        end
        Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("OnUpdate_AttemptEquip ") .. ": item table empty, removing script")
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
        print(T["ITEM NOT FOUND IN BAGS. TO USE FOR EQUIPMENT SWAP, EITHER ADD IT MANUALLY TO ANGLEUR SET OR RE-DRAG THE MACRO."])
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
            Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": Slotted item detected: ", C_Item.GetItemNameByID(itemID))
            wantToEquip[location] = itemID
            local currentlyEquipped = GetInventoryItemID("player", location)
            if itemID ~= currentlyEquipped then
                Angleur_SwapoutItemsSaved[location] = getItemLinkEquipped(location)
                Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": This is the item to re-equip(swapout list): ", getItemLinkID(Angleur_SwapoutItemsSaved[location]))
            else
                Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": Equipped item same as new, not overwriting Swapout.")
            end
        end
    end
    Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": The items that will be equipped:")
    Angleur_BetaTableToString(wantToEquip)
    local _, _, _, equipped = C_EquipmentSet.GetEquipmentSetInfo(setID)
    -- Will kick off the perpetual calling of 'OnUpdate_AttemptEquip' after making sure the Set is active
    if not equipped then
        Angleur_EquipAngleurSet(AngleurCharacter.sleeping)
        equipFrame:RegisterEvent("EQUIPMENT_SWAP_FINISHED")
        equipFrame:SetScript("OnEvent", function(self, event, result, listenedSetID)
            if event == "EQUIPMENT_SWAP_FINISHED" and result == true and listenedSetID == setID then
                Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": Set equip finished.")
                Angleur_BetaTableToString(C_EquipmentSet.GetItemIDs(setID))
                equipFrame:SetScript("OnEvent", nil)
                equipFrame:SetScript("OnUpdate", OnUpdate_AttemptEquip)
            elseif event == "EQUIPMENT_SWAP_FINISHED" and result == false then
                Angleur_BetaPrint(colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": Failed to equip set: ", listenedSetID)
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
        Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("swapCombatWeapons_OnUpdate ") .. ": Couldn't equip combat weapon in time")
        return 
    end
    for location, itemID in pairs(swapWepTable) do
        Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("swapCombatWeapons_OnUpdate ") .. ": Weapon Location ", location)
        if C_Item.IsEquippedItem(itemID) then
            Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("swapCombatWeapons_OnUpdate ") .. ": equipped weapon slot successfully: ", itemID)
            swapWepTable[location] = nil
        elseif not IsInventoryItemLocked(location) then
            C_Item.EquipItemByName(itemID, location)
            Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("swapCombatWeapons_OnUpdate ") .. ": trying to equip item")
            Angleur_BetaPrint(itemID, location)
        end
    end
    if next(swapWepTable) == nil then
        self:SetScript("OnUpdate", nil)
        Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("swapCombatWeapons_OnUpdate ") .. ": weapon swap complete, removing script")
    end
end

local function swapCombatWeapons_Single()
    for location, itemID in pairs(swapWepTable) do
        Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("swapCombatWeapons_Single ") .. ": Weapon Location ", location)
        if C_Item.IsEquippedItem(itemID) then
            Angleur_BetaPrint(itemID, colorDebug2:WrapTextInColorCode("swapCombatWeapons_Single ") .. ": equipped weapon slot successfully")
            swapWepTable[location] = nil
        elseif not IsInventoryItemLocked(location) then
            local GUID = C_TooltipInfo.GetOwnedItemByID(itemID).guid
            if GUID then
                local lokasyon = C_Item.GetItemLocation(GUID)
                C_Item.UnlockItem(lokasyon)
            end
            C_Item.EquipItemByName(itemID, location)
            Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("swapCombatWeapons_Single ") .. ": trying to equip item")
        else
            Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("swapCombatWeapons_Single ") .. ": LOCKEDLOCKEDLOCKEDLOCKED")
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
    if weaponSwapFrames.visual == nil then Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("CreateWeaponSwapFrames ") .. ": it do be nil") end
    if Angleur.visual:IsShown() and weaponSwapFrames.visual == nil then
        weaponSwapFrames.visual = CreateFrame("Button", "Angleur_WeaponSwapFrame1", weaponSwapFrames, "CombatWeaponSwapButtonTemplate")
    end
    if weaponSwapFrames.minimap == nil then Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("CreateWeaponSwapFrames ") .. ": it do be nil") end
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
        Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("RepositionWeaponSwapFrames ") .. ": it do be nil")
    end

    if weaponSwapFrames.minimap ~= nil and LibDBIcon10_AngleurMap and LibDBIcon10_AngleurMap:IsShown() then 
        local frameX, frameY = LibDBIcon10_AngleurMap:GetSize()
        local selfX, selfY = weaponSwapFrames.minimap:GetSize()
        local minimapScaler = 0.7
        weaponSwapFrames.minimap:SetScale(LibDBIcon10_AngleurMap:GetEffectiveScale() * minimapScaler)
        weaponSwapFrames.minimap:ClearAllPoints()
        weaponSwapFrames.minimap:SetPoint("BOTTOMLEFT", UIParent, LibDBIcon10_AngleurMap:GetLeft() / minimapScaler, LibDBIcon10_AngleurMap:GetBottom() / minimapScaler)
    else
        Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("RepositionWeaponSwapFrames ") .. ": it do be nil")
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
    Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("fillSwapoutTable ") .. ": Table ItemIDs:")
    Angleur_BetaTableToString(itemIDs)
    for location = 1, 19 do
        if itemIDs[location] ~= nil and itemIDs[location] ~= -1 then
            Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("fillSwapoutTable ") .. ": Slot is set to equip item: ", itemIDs[location])
            local inventoryItemID = GetInventoryItemID("player", location)
            Angleur_BetaPrint(inventoryItemID)
            if inventoryItemID then
                if inventoryItemID == itemIDs[location] then
                    Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("fillSwapoutTable ") .. ": Set item was previously equipped, not overriding previous re-requip table.")
                elseif Angleur_SwapoutItemsSaved[location] ~= nil and Angleur_SwapoutItemsSaved[location] ~= -1 then
                    local _, itemLink = GetItemInfo(Angleur_SwapoutItemsSaved[location])
                    Angleur_BetaPrint(location, itemLink)
                end
            end
        end
    end
end

local function checkSetBug()
    local bugOccurred = true
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    local setItems = C_EquipmentSet.GetItemIDs(setID)
    local ignores = C_EquipmentSet.GetIgnoredSlots(setID)
    for i, v in pairs(ignores) do
        if i > 0 and i < 16 then
            if v == true then
                return false
            elseif v == false and setItems[i] then
                return false
            end
        end
    end
    return true
end
-- Starts off the periodical calling of 'Equip Set' until player enters combat or set is succesfully equipped
function Angleur_EquipAngleurSet(overrideSwapoutItems)
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    if not setID then 
        Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("EquipAngleurSet ") .. ": No Angleur set found, can't swap")
        return
    end
    if checkSetBug() then
        print(T["A bug with the Angleur Set has occurred, where it is set to unequip all gear. " 
        .. "Therefore, it has been deleted. If this keeps happening, please contact the Author."])
        Angleur_ForceDeleteSet()
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
            print(T["Equipping of the Angleur set disrupted due to sudden combat"])
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
                Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("Angleur_EquipAngleurSet ") .. ": Angleur set equipped successfully")
                for location, itemID in pairs(Angleur_SwapoutItemsSaved) do
                    local _, itemLink = GetItemInfo(Angleur_SwapoutItemsSaved[location])
                    Angleur_BetaPrint(colorDebug2:WrapTextInColorCode("Angleur_EquipAngleurSet ") .. ": Swapout: ", location, itemLink)
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
local function checkBags(itemID)
    for i,v in pairs(Angleur_SwapoutItemsSaved) do
        if not (C_Item.GetItemCount(v) >= 1) then
            print(T["Swapback item not found in bags, cannot re-equip."])
            swapoutsTemporary[i] = nil
            Angleur_SwapoutItemsSaved[i] = nil
        end
    end
end
-- Attempts to unequip until the temporary copied table is emptied
local function unequipSet_OnUpdate(self, elapsed)
    erapusuCounter3 = erapusuCounter3 + elapsed
    if erapusuCounter3 < erapusuThreshold3 then
        return
    end
    erapusuCounter3 = 0
    checkBags()
    copyTableToTemp()
    if InCombatLockdown() then 
        Angleur_BetaPrint(colorDebug3:WrapTextInColorCode("unequipSet_OnUpdate ") .. ": Couldn't re-equip all items before combat in time.")
        Angleur_BetaTableToString(swapoutsTemporary)
        self:SetScript("OnUpdate", nil)
        return 
    end
    for location, itemID in pairs(swapoutsTemporary) do
        Angleur_BetaPrint(colorDebug3:WrapTextInColorCode("unequipSet_OnUpdate ") .. ": Location ", location)
        if C_Item.IsEquippedItem(itemID) then
            Angleur_BetaPrint(colorDebug3:WrapTextInColorCode("unequipSet_OnUpdate ") .. ": " , itemID, "equipped back successfully")
            swapoutsTemporary[location] = nil
        else
            C_Item.EquipItemByName(itemID, location)
            Angleur_BetaPrint(colorDebug3:WrapTextInColorCode("unequipSet_OnUpdate ") .. ": trying to equip item")
        end
    end
    if next(swapoutsTemporary) == nil then
        self:SetScript("OnUpdate", nil)
        Angleur_BetaPrint(colorDebug3:WrapTextInColorCode("unequipSet_OnUpdate ") .. ": swapback complete, removing script")
    end
end
local function unequipSet_Single()
    for location, itemID in pairs(swapoutsTemporary) do
        C_Item.EquipItemByName(itemID, location)
        Angleur_BetaPrint(colorDebug3:WrapTextInColorCode("unequipSet_Single ") .. ": trying to equip item(first attempt)")
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
        Angleur_BetaPrint(colorDebug3:WrapTextInColorCode("Angleur_UnequipAngleurSet ") .. ": Swapped back successfully on the first attempt")
        return 
    end
    if not secondary then return end
    Angleur_BetaPrint(colorDebug3:WrapTextInColorCode("Angleur_UnequipAngleurSet ") .. ": SwapoutItems Table remaining from first(singular) attempt:")
    Angleur_BetaTableToString(Angleur_SwapoutItemsSaved)
    Angleur_BetaPrint(colorDebug3:WrapTextInColorCode("Angleur_UnequipAngleurSet ") .. ": Starting secondary swapback process")
    equipFrameSet:SetScript("OnUpdate", unequipSet_OnUpdate)
end
--**********************[4]************************
--|||||||||||||||||||||||||||||||||||||||||||||||||
--**********************[4]************************