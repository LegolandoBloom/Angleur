local T = Angleur_Translate
local colorDebug = CreateColor(0.68, 0, 1) -- purple

AngleurToysCata = {}
local cata = AngleurToysCata

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
        Angleur_SetSelectedToy(angleurToys.selectedRaftTable, angleurToys.ownedRafts, AngleurConfig.chosenRaft.toyID)
        --WHY? WHY HAVE I PUT THIS IN? CHECK LATER, SEEMS POINTLESS
        Angleur.toyButton:SetAttribute("macrotext", "/cast " .. angleurToys.selectedRaftTable.name)
    else
        Angleur.configPanel.tab1.contents.raftEnable:greyOut()
    end
end