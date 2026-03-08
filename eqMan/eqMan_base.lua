local T = Angleur_Translate

-- 'ang' is the angleur namespace
local addonName, ang = ...

local retailEqMan = ang.retail.eqMan

local debugChannel = 4
local colorDebug1 = CreateColor(1, 0.84, 0) -- yellow
local colorDebug2 = CreateColor(1, 0.91, 0.49) -- pale yellow
local colorDebug3 = CreateColor(1, 1, 0) -- lemon yellow

local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorRed = CreateColor(1, 0, 0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)

local EQUIP_DELAY = 1
local EQUIP_ELAPSETHRESHOLD = 0.2

local gameVersion = Angleur_CheckVersion()

local updatingSet = false

local fishingPoleTableMoP = AngleurMoP_FishingPoleTable
local fishingPoleTableVanilla = AngleurVanilla_FishingPoleTable

-- _____________________________________________________________ General Functions__________________________________________________________________________________________
-- _________________________________________________________Used many times throughout eqMan________________________________________________________________________________
local function CheckTable(teeburu, itemID)
    local matchFound = false
    for i, value in pairs(teeburu) do
        if itemID == value then
            matchFound = true
            break
        end
    end
    return matchFound
end

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
    local inventoryItemID = GetInventoryItemID("player", equipmentSlotIndex)
    if not inventoryItemID then return nil end
    itemLocation:SetEquipmentSlot(equipmentSlotIndex)
    local link = C_Item.GetItemLink(itemLocation)
    itemLocation:Clear()
    return link
end
local function getItemGUIDEquiped(equipmentSlotIndex)
    local inventoryItemID = GetInventoryItemID("player", equipmentSlotIndex)
    if not inventoryItemID then return nil end
    itemLocation:SetEquipmentSlot(equipmentSlotIndex)
    local guid = C_Item.GetItemGUID(itemLocation)
    itemLocation:Clear()
    return guid
end
function Angleur_ToggleLockInventory(slot)
    local guid = getItemGUIDEquiped(slot)
    if IsInventoryItemLocked(slot) then
        C_Item.UnlockItemByGUID(guid)
    else
        C_Item.LockItemByGUID(guid)
    end
end
SLASH_ANGSAVEDITEMS1 = "/angsaved"
SlashCmdList["ANGSAVEDITEMS"] = function()
    print(colorDebug3:WrapTextInColorCode("Swapout items:"))
    for i, v in pairs(Angleur_SwapoutItemsSaved) do
        print(v)
    end
end

SLASH_ANGSAVEDRESET1 = "/angsavedres"
SlashCmdList["ANGSAVEDRESET"] = function()
    print(colorDebug3:WrapTextInColorCode("Reset swapout items"))
    Angleur_SwapoutItemsSaved = {}
end

SLASH_ANGTEST1 = "/angtest"
SlashCmdList["ANGTEST"] = function()
    -- local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    -- DevTools_Dump(C_EquipmentSet.GetItemIDs(setID))
    -- DevTools_Dump(C_EquipmentSet.GetIgnoredSlots(setID))
    Angleur_ToggleLockInventory(16)
end
function Angleur_ForceDeleteSet()
    local setButton = Angleur_CreateSetAndAdd
    AngleurCharacter.angleurSet = false
    Angleur_CreateSetAndAdd_UpdateState()
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    if setID then
        C_EquipmentSet.DeleteEquipmentSet(setID)
    end
    Angleur_SwapoutItemsSaved = {}
    setButton:Enable()
    setButton:ClearPushedTexture()
end
function Angleur_IsEquipItemValid(itemInfo)
    if C_Item.IsEquippableItem(itemInfo) == false then return false end
    if C_Item.GetItemCount(itemInfo) < 1 then return false end
    return true
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
    Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("setIgnores "), ": ", Debug_Ignores, " are ignored")
end
local function isSetEquipped(setID)
    if next(C_EquipmentSet.GetItemIDs(setID)) == nil then
        Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("isSetEquipped ") .. ": EMPTY SET")
        return true
    end
    local _, _, _, equipped = C_EquipmentSet.GetEquipmentSetInfo(setID)
    Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("isSetEquipped ") .. ": EQUIPPED: ", equipped)
    return equipped
end
local function checkSlottedExtraItems()
    for i=1, ang.extraItems.slotCount, 1 do
        local slot = Angleur_SlottedExtraItems[i]
        if slot.itemID ~= 0 then
            if C_Item.IsEquippableItem(slot.itemID) then 
                ---------------------------
                --Needed for Classic(Era)--
                ---------------------------
                if not (C_Item.GetItemCount(slot.itemID) >= 1) then
                    Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("checkSlottedExtraItems ") .. ": not in bags")
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
                    Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("checkSlottedExtraItems ") .. ": not in bags")
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
local function showAndPlayAnimation()
    local gameVersion = Angleur_CheckVersion()
    if gameVersion == 3 then return end
    if not CharacterFrame:IsShown() then
        ToggleCharacter("PaperDollFrame")
    end
    PaperDollFrame_SetSidebar(PaperDollFrame, 3)
    if gameVersion == 1 then retailEqMan:showShiny() end
end
--____________________________________________________________________________________________________________________________________________________________________________



-- _____________________________________________________________ Cycle/End Functions__________________________________________________________________________________________
-- ________________________________________________Used in Equip/Unequip functions throughout eqMan___________________________________________________________________________
-- used when automatically adding slottted extra items to the Angleur Set
local wantToEquip = {}
local equipFrame = CreateFrame("Frame")
local function End_AttemptEquip()
    local unequippedTable = {}
    for location, itemID in pairs(wantToEquip) do
        if itemID then
            if IsInventoryItemLocked(location) then 
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("End_AttemptEquip ") .. ": TIMEOUT, item: " .. "[" .. itemID .. "] is still locked. Removing from swapout table")
                Angleur_SwapoutItemsSaved[location] = nil
                unequippedTable[location] = getItemLinkID(itemID)
            elseif not Angleur_IsEquipItemValid(itemID) then
                Angleur_SwapoutItemsSaved[location] = nil
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("End_AttemptEquip ") .. ": TIMEOUT, item: " .. "[" .. itemID .. "] has somehow become invalid afterward. Removing from swapout table")
                unequippedTable[location] = getItemLinkID(itemID)
            elseif not C_Item.IsEquippedItem(itemID) then
                Angleur_SwapoutItemsSaved[location] = nil
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("End_AttemptEquip ") .. ": TIMEOUT, item: " .. "[" .. itemID .. "] hasn't been equipped successfully. Removing from swapout table")
                unequippedTable[location] = getItemLinkID(itemID)
            end
        else
            Angleur_SwapoutItemsSaved[location] = nil
        end
    end
    wantToEquip = {}
    updatingSet = false
    Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("End_AttemptEquip ") .. ": TIMED OUT")
    Angleur_CreateSetAndAdd_UpdateState()
    if AngleurCharacter.sleeping == true then
        Angleur_UnequipAngleurSet()
    end
    print(T["The following slotted items could not be added to your Angleur Equipment Set:"])
    Angleur_BetaTableToString(debugChannel, unequippedTable)
end
local function Cycle_AttemptEquip()
    if InCombatLockdown() then
        wantToEquip = {}
        print(T["Couldn't equip slotted item in time before combat"])
        return true
    end
    if UnitIsDeadOrGhost("player") then
        wantToEquip = {}
        print(T["Item equip interrupted by death/ghost-form"])
        return true
    end
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    if not setID then
        AngleurCharacter.angleurSet = false
        Angleur_CreateSetAndAdd_UpdateState()
        return true
    end
    Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_AttemptEquip ") .. ": Item IDs from Set ID:")
    Angleur_BetaTableToString(debugChannel, C_EquipmentSet.GetItemIDs(setID))
    if not isSetEquipped(setID) then
        -- empty for now
    end
    -- Repeatedly checks for each item in 'wantToEquip' if they are equipped until 'wantToEquip' is empty.
    for location, itemID in pairs(wantToEquip) do
        Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_AttemptEquip ") .. ": Location:", location, ", itemID:", itemID, ", link:", getItemLinkID(itemID))
        if itemID then
            if not Angleur_IsEquipItemValid(itemID) then
                wantToEquip[location] = nil
                Angleur_SwapoutItemsSaved[location] = nil
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_AttemptEquip ") .. ": item isn't valid, removing from wantToEquip.")
            elseif C_Item.IsEquippedItem(itemID) then
                C_EquipmentSet.UnignoreSlotForSave(location)
                C_EquipmentSet.SaveEquipmentSet(setID)
                wantToEquip[location] = nil
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_AttemptEquip ") .. ": Item equipped succesfully, saving to equipment set")
            elseif not IsInventoryItemLocked(location) then
                C_Item.EquipItemByName(itemID)
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_AttemptEquip ") .. ": Set equipped, trying to equip item")
            else
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_AttemptEquip ") .. ": LOCKEDLOCKEDLOCKEDLOCKED")
            end
        else
            wantToEquip[location] = nil
            Angleur_SwapoutItemsSaved[location] = nil
        end
    end
    -- 'wantToEquip' empty, equipping process is complete. Finish up.
    if next(wantToEquip) == nil then
        if AngleurCharacter.sleeping == true then
            Angleur_UnequipAngleurSet()
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
        Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_AttemptEquip ") .. ": item table empty, removing script")
        AngleurCharacter.angleurSet = true
        Angleur_CreateSetAndAdd_UpdateState()
        updatingSet = false
        showAndPlayAnimation()
        return true
    end
end

-- Attempts to unequip until the swapout table is emptied
local function End_SwapoutSet()
    Angleur_BetaTableToString(debugChannel, Angleur_SwapoutItemsSaved)
    Angleur_SwapoutItemsSaved = {}
end
local function Cycle_SwapoutSet()
    if InCombatLockdown() then 
        Angleur_BetaPrint(debugChannel, colorDebug3:WrapTextInColorCode("Cycle_SwapoutSet ") .. ": Couldn't re-equip all items before combat in time.")
        Angleur_BetaTableToString(debugChannel, Angleur_SwapoutItemsSaved)
        return true
    end
    if UnitIsDeadOrGhost("player") then 
        Angleur_BetaPrint(debugChannel, colorDebug3:WrapTextInColorCode("Cycle_SwapoutSet ") .. ": Couldn't re-equip all items before death/ghost-form happened.")
        Angleur_BetaTableToString(debugChannel, Angleur_SwapoutItemsSaved)
        return true
    end
    for location, itemID in pairs(Angleur_SwapoutItemsSaved) do
        if itemID then
            if not Angleur_IsEquipItemValid(itemID) then
                Angleur_SwapoutItemsSaved[location] = nil
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_SwapoutSet ") .. ": item isn't valid, removing from swapout table.")
            elseif C_Item.IsEquippedItem(itemID) then
                Angleur_SwapoutItemsSaved[location] = nil
                Angleur_BetaPrint(debugChannel, colorDebug3:WrapTextInColorCode("Cycle_SwapoutSet ") .. ": " , itemID, "equipped back successfully")
            elseif IsInventoryItemLocked(location) then
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_SwapoutSet ") .. ": LOCKEDLOCKEDLOCKEDLOCKED")
            else
                C_Item.EquipItemByName(itemID)
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Cycle_SwapoutSet ") .. ": Attempting to swapout item")
            end
        else
            Angleur_SwapoutItemsSaved[location] = nil
        end
    end
    if next(Angleur_SwapoutItemsSaved) == nil then
        Angleur_BetaPrint(debugChannel, colorDebug3:WrapTextInColorCode("Cycle_SwapoutSet ") .. ": swapback complete, removing script")
        return true
    end
end

local combatSwapped = false
local swapWepTable = {}
local function Cycle_SwapWeaponsCombat()
    if InCombatLockdown() then 
        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("Cycle_SwapWeaponsCombat ") .. ": Couldn't equip combat weapon in time")
        return true
    end
    if UnitIsDeadOrGhost("player") then 
        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("Cycle_SwapWeaponsCombat ") .. ": Couldn't equip combat weapon in time(player)")
        return true
    end
    for location, itemID in pairs(swapWepTable) do
        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("Cycle_SwapWeaponsCombat ") .. ": Weapon Location ", location)
        if C_Item.IsEquippedItem(itemID) then
            Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("Cycle_SwapWeaponsCombat ") .. ": equipped weapon slot successfully: ", itemID)
            swapWepTable[location] = nil
        elseif not IsInventoryItemLocked(location) then
            C_Item.EquipItemByName(itemID, location)
            Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("Cycle_SwapWeaponsCombat ") .. ": trying to equip item")
            Angleur_BetaPrint(debugChannel, itemID, location)
        end
    end
    if next(swapWepTable) == nil then
        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("Cycle_SwapWeaponsCombat ") .. ": weapon swap complete, removing script")
        return true
    end
end
--____________________________________________________________________________________________________________________________________________________________________________



-- _____________________________________________________________ MANUAL EQUIP TRACKER__________________________________________________________________________________________
-- When player manually changes items, regardless of sleep state, add the EQUIPPED items to 'Angleur_SwapoutItemsSaved' (if they have a counterpart in the Angleur Set)
local function handleEquip2HanderAndOffhand(setsMainhandItem, slot)
    if slot == INVSLOT_OFFHAND then
        --                                                                                                      17 is INVTYPE_2HWEAPON for C_Item.GetItemInventoryTypeByID
        if setsMainhandItem and setsMainhandItem ~= -1 and C_Item.GetItemInventoryTypeByID(setsMainhandItem) == 17 then
            local itemLink = getItemLinkEquipped(INVSLOT_OFFHAND)
            Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("ManualEquipTracker ") .. ": The new item, " .. itemLink .. " is equipped to offhand, and the Set Main Hand is a 2-Hander. Adding to Swapout Table.")
            Angleur_SwapoutItemsSaved[INVSLOT_OFFHAND] = itemLink
        end
    end
end
local ManualEquipTracker = CreateFrame("Frame")
ManualEquipTracker:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
ManualEquipTracker:SetScript("OnEvent", function(self, event, slot, empty)
    if AngleurCharacter.angleurSet == false then return end
    if event == "PLAYER_EQUIPMENT_CHANGED" then
        if empty == true then

        elseif empty == false then
            local newItem = GetInventoryItemID("player", slot)
            local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
            if not setID then return end
            local angleurSetItemIDs = C_EquipmentSet.GetItemIDs(setID)
            local setItem = angleurSetItemIDs[slot]
            if not setItem or setItem == -1 then
                local setsMainhandItem = angleurSetItemIDs[INVSLOT_MAINHAND]
                handleEquip2HanderAndOffhand(setsMainhandItem, slot)
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("ManualEquipTracker ") .. ": No set counterpart in the slot, not overwriting")
                return
            end
            Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("ManualEquipTracker ") .. ": Newly Equipped Item: ", getItemLinkEquipped(slot))
            Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("ManualEquipTracker ") .. ": Angleur Set Counterpart: ", getItemLinkID(setItem))
            if newItem == setItem then
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("ManualEquipTracker ") .. ": The new item is the set item...")
            elseif updatingSet == false then
                if gameVersion == 2 and CheckTable(fishingPoleTableMoP, newItem) then
                    Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("ManualEquipTracker(MoP) ") .. ": Swapout item is a fishing rod. Not adding.")
                elseif gameVersion == 3 and CheckTable(fishingPoleTableVanilla, newItem) then
                    Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("ManualEquipTracker(Vanilla) ") .. ": Swapout item is a fishing rod. Not adding.")
                else
                    Angleur_SwapoutItemsSaved[slot] = getItemLinkEquipped(slot)
                    Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("ManualEquipTracker ") .. ": OVERWRITTEN: ", Angleur_SwapoutItemsSaved[slot])
                end
            end
        end
    end
end)
--____________________________________________________________________________________________________________________________________________________________________________



-- _____________________________________________________________ Creation/Initialisation _____________________________________________________________________________________
-- ________________________________________________Functions relating to initialising variables, creating frames etc__________________________________________________________
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
    Angleur.configPanel.tab2.contents.createSetAndAdd:Enable()
end

function Angleur_CreateEquipmentSet()
    if gameVersion == 3 then
        if checkSlottedExtraItems() == false then
            print(T["Can't create Equipment Set without any equippable slotted items. Slot a usable and equippable item to your Extra Items slots first."])
            print(T["This is a limitation of Classic(not the case for Mists and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."])
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
        Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("Angleur_CreateEquipmentSet ") .. ": Ignored Slots:")
        Angleur_BetaTableToString(debugChannel, C_EquipmentSet.GetIgnoredSlots(setID))
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
--____________________________________________________________________________________________________________________________________________________________________________





--**********************[1]************************
--* Automatically adding slotted items to the set *
--**********************[1]************************
-- Play a glow animation around the "Angleur" Equipment Set in the Equipment Manager menu


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
    for i=1, ang.extraItems.slotCount, 1 do
        local slot = Angleur_SlottedExtraItems[i]
        local itemID
        if slot.itemID ~= 0 and slot.itemID ~= nil then
            itemID = slot.itemID
        elseif slot.macroItemID ~= 0 and slot.macroItemID ~= nil then
            itemID = slot.macroItemID
        end
        if itemID and isEligible(itemID) == true and slot.equipLoc ~= 0 and slot.equipLoc ~= nil then
            local location = slot.equipLoc
            if type(location) == "table" then location = location[1] end
            if C_EquipmentSet.IsSlotIgnoredForSave(location) then
                C_EquipmentSet.UnignoreSlotForSave(location)
            end
            Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": Slotted item detected: ", C_Item.GetItemNameByID(itemID))
            wantToEquip[location] = itemID
            local currentlyEquipped = GetInventoryItemID("player", location)
            if itemID ~= currentlyEquipped then
                if gameVersion == 2 and CheckTable(fishingPoleTableMoP, currentlyEquipped) then
                    Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("Angleur_AddToEquipmentSet(MoP) ") .. ": Swapout item is a fishing rod. Not adding.")
                elseif gameVersion == 3 and CheckTable(fishingPoleTableVanilla, currentlyEquipped) then
                    Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("Angleur_AddToEquipmentSet(Vanilla) ") .. ": Swapout item is a fishing rod. Not adding.")
                else
                    Angleur_SwapoutItemsSaved[location] = getItemLinkEquipped(location)
                    Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": This is the item to re-equip(swapout list): ", Angleur_SwapoutItemsSaved[location])
                end
            else
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": Equipped item same as new, not overwriting Swapout.")
            end
        end
    end
    Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": The items that will be equipped:")
    Angleur_BetaTableToString(debugChannel, wantToEquip)
    local _, _, _, equipped = C_EquipmentSet.GetEquipmentSetInfo(setID)
    -- Will kick off the perpetual calling of 'Cycle_AttemptEquip' after making sure the Set is active
    if not equipped then
        Angleur_EquipAngleurSet(AngleurCharacter.sleeping)
        equipFrame:RegisterEvent("EQUIPMENT_SWAP_FINISHED")
        equipFrame:SetScript("OnEvent", function(self, event, result, listenedSetID)
            if event == "EQUIPMENT_SWAP_FINISHED" and result == true and listenedSetID == setID then
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": Set equip finished.")
                Angleur_BetaTableToString(debugChannel, C_EquipmentSet.GetItemIDs(setID))
                equipFrame:SetScript("OnEvent", nil)
                Angleur_SingleDelayer(EQUIP_DELAY, 0, EQUIP_ELAPSETHRESHOLD, equipFrame, Cycle_AttemptEquip, End_AttemptEquip)
            elseif event == "EQUIPMENT_SWAP_FINISHED" and result == false then
                Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("AddToEquipmentSet ") .. ": Failed to equip set: ", listenedSetID)
            end
        end)
    else
        Angleur_SingleDelayer(EQUIP_DELAY, 0, EQUIP_ELAPSETHRESHOLD, equipFrame, Cycle_AttemptEquip, End_AttemptEquip)
    end
end
--**********************[1]************************
--|||||||||||||||||||||||||||||||||||||||||||||||||
--**********************[1]************************



--**********************[2]************************
--************** Combat Weapon Swap ***************
--**********************[2]************************
local function wepSwapFrame_OnEvent(self, event, unit, ...)
    if AngleurCharacter.sleeping == true then return end
    local arg4, arg5 = ...
    local children = {self:GetChildren()}
    if event == "PLAYER_REGEN_DISABLED" then
        swapWepTable[INVSLOT_MAINHAND] = Angleur_SwapoutItemsSaved[INVSLOT_MAINHAND]
        swapWepTable[INVSLOT_OFFHAND] = Angleur_SwapoutItemsSaved[INVSLOT_OFFHAND]
        if next(swapWepTable) == nil then return end
        Angleur_RepositionWeaponSwapFrames()
        for i, child in pairs(children) do
            child:setMacro(swapWepTable)
        end
        self:Show()
    elseif event == "PLAYER_REGEN_ENABLED" then
        if self.minimap then self.minimap:Hide() end
        if self.visual then self.visual:Hide() end
        self:Hide()
        local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
        if not setID then 
            return
        end
        local setItems = C_EquipmentSet.GetItemIDs(setID)
        if setItems[INVSLOT_MAINHAND] and setItems[INVSLOT_MAINHAND] ~= -1 then
            swapWepTable[INVSLOT_MAINHAND] = setItems[INVSLOT_MAINHAND]
        end
        if setItems[INVSLOT_OFFHAND] and setItems[INVSLOT_OFFHAND] ~= -1 then
            swapWepTable[INVSLOT_OFFHAND] = setItems[INVSLOT_OFFHAND]
        end
        Cycle_SwapWeaponsCombat()
        if next(swapWepTable) ~= nil then
            Angleur_SingleDelayer(0.5, 0, 0.05, self, Cycle_SwapWeaponsCombat, nil)
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
    if weaponSwapFrames.visual == nil then Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("CreateWeaponSwapFrames ") .. ": it do be nil") end
    if Angleur.visual:IsShown() and weaponSwapFrames.visual == nil then
        weaponSwapFrames.visual = CreateFrame("Button", "Angleur_WeaponSwapFrame1", weaponSwapFrames, "CombatWeaponSwapButtonTemplate")
    end
    if weaponSwapFrames.minimap == nil then Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("CreateWeaponSwapFrames ") .. ": it do be nil") end
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
        weaponSwapFrames.visual:Show()
    else
        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("RepositionWeaponSwapFrames ") .. ": it do be nil")
    end
    if weaponSwapFrames.minimap ~= nil and LibDBIcon10_AngleurMap and LibDBIcon10_AngleurMap:IsShown() and LibDBIcon10_AngleurMap:IsVisible() then 
        local frameX, frameY = LibDBIcon10_AngleurMap:GetSize()
        local selfX, selfY = weaponSwapFrames.minimap:GetSize()
        local minimapScaler = 0.7
        weaponSwapFrames.minimap:SetScale(LibDBIcon10_AngleurMap:GetEffectiveScale() * minimapScaler)
        weaponSwapFrames.minimap:ClearAllPoints()
        weaponSwapFrames.minimap:SetPoint("BOTTOMLEFT", UIParent, LibDBIcon10_AngleurMap:GetLeft() / minimapScaler, LibDBIcon10_AngleurMap:GetBottom() / minimapScaler)
        weaponSwapFrames.minimap:Show()
    else
        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("RepositionWeaponSwapFrames ") .. ": it do be nil")
    end
end
--**********************[2]************************
--|||||||||||||||||||||||||||||||||||||||||||||||||
--**********************[2]************************



--**********************[3]************************
--****************** Equip Set ********************
--**********************[3]************************
local function handleOffhandSwapout(itemIDs)
    if not itemIDs[INVSLOT_OFFHAND] or itemIDs[INVSLOT_OFFHAND] == -1 then
        local setsMainhandItem = itemIDs[INVSLOT_MAINHAND]
        -- 17 is INVTYPE_2HWEAPON for C_Item.GetItemInventoryTypeByID, == 17 means the weapon in the set is a 2 hander
        if setsMainhandItem and setsMainhandItem ~= -1 and C_Item.GetItemInventoryTypeByID(setsMainhandItem) == 17 then
            local itemLink = getItemLinkEquipped(INVSLOT_OFFHAND)
            if itemLink then
                Angleur_SwapoutItemsSaved[INVSLOT_OFFHAND] = itemLink
                Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("fillSwapoutTable ") .. "Angleur Set has 2-Handed Weapon, adding equipped offhand " .. "[" .. itemLink .. "]" .. " to Swapout Table")
            end
        end
    end
end
local function fillSwapoutTable(setID)
    local itemIDs = C_EquipmentSet.GetItemIDs(setID)
    Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("fillSwapoutTable ") .. ": Table ItemIDs:")
    Angleur_BetaTableToString(debugChannel, itemIDs)
    handleOffhandSwapout(itemIDs)
    for location = 1, 19 do
        if itemIDs[location] ~= nil and itemIDs[location] ~= -1 then
            Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("fillSwapoutTable ") .. ": Slot " .. location .. " is set to equip item " .. "[" .. itemIDs[location] .. "]")
            local itemLink = getItemLinkEquipped(location)
            if itemLink then
                local inventoryItemID = GetInventoryItemID("player", location)
                Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("fillSwapoutTable ") .. ": item " .. "[" .. itemLink .. "]" .. " in Slot " .. location .. " is set to be unequipped.")
                if inventoryItemID == itemIDs[location] then
                    Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("fillSwapoutTable ") .. ": Set item was previously equipped, not overriding previous re-requip table.")
                else
                    if gameVersion == 2 and CheckTable(fishingPoleTableMoP, inventoryItemID) then
                        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("fillSwapoutTable(MoP) ") .. ": Swapout item is a fishing rod. Not adding.")
                    elseif gameVersion == 3 and CheckTable(fishingPoleTableVanilla, inventoryItemID) then
                        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("fillSwapoutTable(Vanilla) ") .. ": Swapout item is a fishing rod. Not adding.")
                    else
                        Angleur_SwapoutItemsSaved[location] = itemLink
                        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("fillSwapoutTable ") .. ": adding item " .. "[" .. itemLink .. "]" .. " to Swapouts.\n\n")
                    end
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
local equipFrameSet = CreateFrame("Frame")
equipFrameSet:RegisterEvent("EQUIPMENT_SWAP_FINISHED")
-- Starts off the periodical calling of 'Equip Set' until player enters combat or set is succesfully equipped
function Angleur_EquipAngleurSet(overrideSwapoutItems)
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    if not setID then 
        Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("EquipAngleurSet ") .. ": No Angleur set found, can't swap")
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
    Angleur_SingleDelayer(EQUIP_DELAY, 0, EQUIP_ELAPSETHRESHOLD, equipFrameSet, function()
        if InCombatLockdown() then
            print(T["Equipping of the Angleur set disrupted due to sudden combat"])
            equipFrameSet:SetScript("OnEvent", nil)
            return true
        end
        if UnitIsDeadOrGhost("player") then
            print(T["Equipping of the Angleur set disrupted due to sudden death/ghost-form"])
            equipFrameSet:SetScript("OnEvent", nil)
            return true
        end
        C_EquipmentSet.UseEquipmentSet(setID)
    end, nil)
    equipFrameSet:SetScript("OnEvent", function(self, event, result, equippedSet)
        if event == "EQUIPMENT_SWAP_FINISHED" then
            if result == true and equippedSet == setID then
                self:SetScript("OnEvent", nil)
                self:SetScript("OnUpdate", nil)
                Angleur_BetaPrint(debugChannel, colorDebug2:WrapTextInColorCode("Angleur_EquipAngleurSet ") .. ": Angleur set equipped successfully. Swapouts: ")
                Angleur_BetaTableToString(debugChannel, Angleur_SwapoutItemsSaved)
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
function Angleur_UnequipAngleurSet()
    equipFrameSet:SetScript("OnEvent", nil)
    equipFrameSet:SetScript("OnUpdate", nil)
    if next(Angleur_SwapoutItemsSaved) == nil then 
        Angleur_BetaPrint(debugChannel, colorDebug3:WrapTextInColorCode("Angleur_UnequipAngleurSet ") .. ": Swapout table already empty, not initiating swapout.")
        return 
    end
    Angleur_BetaPrint(debugChannel, colorDebug3:WrapTextInColorCode("Angleur_UnequipAngleurSet ") .. ": SwapoutItems Table remaining from first(singular) attempt:")
    Angleur_BetaTableToString(debugChannel, Angleur_SwapoutItemsSaved)
    Angleur_BetaPrint(debugChannel, colorDebug3:WrapTextInColorCode("Angleur_UnequipAngleurSet ") .. ": Starting secondary swapback process")
    Angleur_SingleDelayer(EQUIP_DELAY, 0, EQUIP_ELAPSETHRESHOLD, equipFrameSet, Cycle_SwapoutSet, End_SwapoutSet)
end
--**********************[4]************************
--|||||||||||||||||||||||||||||||||||||||||||||||||
--**********************[4]************************