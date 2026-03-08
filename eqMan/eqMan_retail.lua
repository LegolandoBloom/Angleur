local T = Angleur_Translate

local debugChannel = 4
local colorDebug1 = CreateColor(1, 0.84, 0) -- yellow
local colorDebug2 = CreateColor(1, 0.91, 0.49) -- pale yellow
local colorDebug3 = CreateColor(1, 1, 0) -- lemon yellow

-- 'ang' is the angleur namespace
local addonName, ang = ...

ang.retail.eqMan = {}
local retailEqMan = ang.retail.eqMan

local closeHooked = false
function retailEqMan:showShiny()
    local setID = C_EquipmentSet.GetEquipmentSetID("Angleur")
    if not setID then return end
    if not PaperDollFrame.EquipmentManagerPane.ScrollBox.ScrollTarget then return end
    local scrollTargets = {PaperDollFrame.EquipmentManagerPane.ScrollBox.ScrollTarget:GetChildren()}
    local angleurSetFrame
    for i, v in pairs(scrollTargets) do
        if v.setID == setID then 
            Angleur_BetaPrint(debugChannel, colorDebug1:WrapTextInColorCode("showAndPlayAnimation ") .. ": Found Angleur Set")
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