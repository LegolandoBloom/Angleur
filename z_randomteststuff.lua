--Demonstrates the nature of toys loading asynchronously
local toysCountedLast = 0
local enteredWorld = false
local enterTime
local learnedToys

function TestLoadToys(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        enteredWorld = true
        print("entered world")
        print("Max ownable toys: ", C_ToyBox.GetNumTotalDisplayedToys())
        learnedToys = C_ToyBox.GetNumLearnedDisplayedToys()
        print("Toys you own: ", learnedToys)
        enterTime = GetTimePreciseSec()
        C_AddOns.LoadAddOn("Blizzard_Collections")
        ToyBox_UpdateProgressBar(ToyBox)
        ToyBox_UpdatePages()
        print(PlayerHasToy(142528), PlayerHasToy(147307), PlayerHasToy(202019), PlayerHasToy(202207))
        local _, namae = C_ToyBox.GetToyInfo(142528)
        print("NAME IS: ", namae)
    elseif enteredWorld and event == "TOYS_UPDATED" then
        local counter = 0
        local lastToyName
        local toyNotFound = false
        ToyBox_UpdateProgressBar(ToyBox)
        ToyBox_UpdatePages()
        for i = 1, learnedToys, 1 do
            local toy = C_ToyBox.GetToyFromIndex(i)
            local id, name = C_ToyBox.GetToyInfo(toy)
            if name then
                counter = counter + 1 
                lastToyName = name
            else
                toyNotFound = true 
            end
        end
        if counter > 0 and counter > toysCountedLast and counter % 10 == 0 then 
                print("Detected toy count: ", counter) 
                print("Last loaded toy: ", lastToyName)
                print("Time: " , GetTimePreciseSec() - enterTime)
                print(learnedToys - C_ToyBox.GetNumFilteredToys(), "Toys left to load: ")
        end
        toysCountedLast = counter
        if learnedToys == C_ToyBox.GetNumFilteredToys() then print("it should technically be over: ", GetTimePreciseSec()) end
        if toyNotFound == false then
            print("TOY LOADING IS DONE, IT TOOK: ", GetTimePreciseSec())
            self:SetScript("OnEvent", nil)
        end
    end
end
local toyCountFrame = CreateFrame("Frame")
toyCountFrame:RegisterEvent("TOYS_UPDATED")
toyCountFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
toyCountFrame:SetScript("OnEvent", TestLoadToys)




--OUTDATED CYCLICAL DELAYER
--[[
function Delayer_EachCycle(delay, timeElapsed, elapsedThreshhold, delayFrame, cycleFunk)
    delayFrame:SetScript("OnUpdate", function(self, elapsed)
        timeElapsed = timeElapsed + elapsed
        if timeElapsed > elapsedThreshhold then
            delay = delay - timeElapsed
            timeElapsed = 0
            cycleFunk()
        end
        
        if delay <= 0 then
            self:SetScript("OnUpdate", nil)
            return
        end
    end)
end
--]]

--OLD VERSION SWIMMING CHECKER
--[[
function Angleur_CheckSwimming(self)
    if not AngleurConfig.angleurKey then return end
    if IsSwimming() then
        swimming = true
        if raftedAuraHolder then
            --ClearOverrideBindings(self)
            --self.visual.texture:SetTexture("")
        elseif AngleurConfig.raftEnabled then
            --SetOverrideBindingClick(self, true, AngleurConfig.angleurKey, "Angleur_ToyButton")
            --self.visual.texture:SetTexture(angleurToys.selectedRaftTable.icon)
        end

    else
        swimming = false
        if not IsMounted() then
            --//To only change the binding when not falling, otherwise you get stuck in a bug where you constantly keep jumping in place//
            if not IsFalling()  then
                --SetOverrideBindingSpell(self, true, AngleurConfig.angleurKey, PROFESSIONS_FISHING) 
                --self.visual.texture:SetTexture("Interface/ICONS/UI_Profession_Fishing")
            else

            end
        end
    end
end
]]--

PlayerFrame:HookScript("OnEnter", function()
    GameTooltip:SetOwner(PlayerFrame, "ANCHOR_BOTTOMLEFT", 45)
    GameTooltip:AddLine("poop")
    GameTooltip:AddLine(C_TooltipInfo.GetItemByID(202019).lines)
    GameTooltip:AppendText(C_TooltipInfo.GetItemByID(202019).lines)
    GameTooltip:Show()
end)
PlayerFrame:HookScript("OnLeave", function()
    GameTooltip:Hide()
end)


/dump 
