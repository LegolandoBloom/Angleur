local isRetail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
local function template_IsSecret(value)
    if isRetail then
        if issecretvalue(value) then return true end
    end
    return false
end
local function template_ScrubSecret(...)
    if isRetail then
        return scrubsecretvalues(...)
    end
    return ...
end


Legolando_AuraStackAdjusterFrameMixin_Angleur = {}

local colorYello = CreateColor(1.0, 0.82, 0.0)
function Legolando_AuraStackAdjusterFrameMixin_Angleur:OnLeave()
    if not self.tooltipText then return end
    GameTooltip:Hide()
end
function Legolando_AuraStackAdjusterFrameMixin_Angleur:OnEnter()
    if not self.tooltipText then return end
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT");
    if self.tooltipTitle then
        GameTooltip:AddLine(colorYello:WrapTextInColorCode(self.tooltipTitle))
    end
    GameTooltip:AddLine(colorYello:WrapTextInColorCode(self.tooltipText))
end

local function _setVisualsByAuraType(self, auraType)
	if auraType == "Buff" then
		self.DebuffBorder:Hide();
		self.TempEnchantBorder:Hide();
	elseif auraType == "Debuff" or auraType == "DeadlyDebuff" then
		self.DebuffBorder:Show();
		self.TempEnchantBorder:Hide();
	elseif auraType == "TempEnchant" then
		self.DebuffBorder:Hide();
		self.TempEnchantBorder:Show();
	end
end
function Legolando_AuraStackAdjusterFrameMixin_Angleur:SetToAuraAndReAdjust(auraType, spellID, min, max)
    self.auraType = auraType
    _setVisualsByAuraType(self, auraType)
    local iconID, _, _ = template_ScrubSecret(C_Spell.GetSpellTexture(spellID))
    if iconID then
        self.icon:SetTexture(iconID)       
    end
    self.increaseDecrease:ReAdjust(min, max)
    self:Update()
end
-- Call when changing value from external sources
function Legolando_AuraStackAdjusterFrameMixin_Angleur:Update()
    local teeburu = self.savedVarTable
	local reference = self.reference
    local count = teeburu[reference]
    self.Count:SetText(count)
end

function Legolando_AuraStackAdjusterFrameMixin_Angleur:SaveToTable(value)
    -- Doesn't have a way to set any value by itself
    -- It will be done by the childFrame IncreaseDecreaseButtons
end


function Legolando_AuraStackAdjusterFrameMixin_Angleur:Init(min, max)
	local teeburu = self.savedVarTable
	local reference = self.reference
	if not teeburu or not reference or not teeburu[reference] then
		print("Table or Reference missing for IncreaseDecrease Buttons")
		return
	end
    local privateRegistry = self.privateRegistry
	local privateRegistryString = self.privateRegistryString
    -- __________________________________________ Special Case __________________________________________
    --                AuraStackAdjuster MUST communicate with childframe IncreaseDecreaseButtons 
    --                      Thus requires an arbitrary registry and eventString 
    --                even if there is no external frame they need to work together with
    --                                     --------------------------
    --         If a private registry and/or string is not given, create one and set the string to
    --  the frame's debug name(if not given during creation it will have a unique string of random chars)
    --___________________________________________________________________________________________________
    if not privateRegistry then
        privateRegistry = CreateFromMixins(CallbackRegistryMixin)
        privateRegistry:OnLoad()
        privateRegistry:SetUndefinedEventsAllowed(true)
        self.privateRegistry = privateRegistry
    end
    if not privateRegistryString then
        privateRegistryString = self:GetDebugName() .. "AuraStackAdjuster Count Changed"
        self.privateRegistryString = privateRegistryString
    end
    --___________________________________________________________________________________________________

	if privateRegistry and privateRegistryString then
		privateRegistry:RegisterCallback(privateRegistryString, function(_, caller)
			if caller and caller == self then return end
			self:Update()
		end)
	end
    self:Update()
    ------------------------------------------------
    -- Init() process of IncreaseDecrease Buttons --
    ------------------------------------------------
    self.increaseDecrease.savedVarTable = teeburu
    self.increaseDecrease.reference = reference
    self.increaseDecrease.privateRegistry = privateRegistry
    self.increaseDecrease.privateRegistryString = privateRegistryString
    self.increaseDecrease:Init(min, max)
    ------------------------------------------------
end