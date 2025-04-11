local T = Angleur_Translate
local colorDebug = CreateColor(0.68, 0, 1) -- purple

AngleurToysCata = {}
local cata = AngleurToysCata

function cata:AdjustCloseButton(extraToysFrame)
    extraToysFrame.first.closeButton:SetSize(29, 31)
    extraToysFrame.first.closeButton:AdjustPointsOffset(2, 2)
    extraToysFrame.second.closeButton:SetSize(29, 31)
    extraToysFrame.second.closeButton:AdjustPointsOffset(2, 2)
    extraToysFrame.third.closeButton:SetSize(29, 31)
    extraToysFrame.third.closeButton:AdjustPointsOffset(2, 2)
end
