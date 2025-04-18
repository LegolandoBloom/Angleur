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
