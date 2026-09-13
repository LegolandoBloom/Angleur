local T = Angleur_Translate

local debugChannel = 5

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

function Angleur_ConfigPanelGeneral()
    
end

function Angleur_TabSystem(self)
    local tabsMain = self:GetParent()
    local tabButtons = {tabsMain:GetChildren()}
    for i, button in pairs(tabButtons) do
        local pKey = button:GetParentKey()
        if pKey == "CloseButton" or pKey == "wakeUpButton" then
            --DON'T INCLUDE
            --THE CLOSE BUTTON + Angleur WakefromSleep Frame
        elseif self ~= button and (pKey == "tab1" or pKey == "tab2" or pKey == "tab3") then
            button:SetSelected(false)
            button.contents:Hide()
            button:Enable()
        end
    end
    if self:IsSelected() then
        self.contents:Show()
        local parent = self:GetParent()
        self:Disable()
    else
        self.contents:Hide()
    end
end

