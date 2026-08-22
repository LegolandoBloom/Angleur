local function getFolderPath()
    local stack = debugstack()
    local _, _, luafilepath = string.find(stack, "[%[](.-)[%]]")
    -- print("lue file's path: ", luafilepath)
    local i = 1
    local lastPart
    while string.find(luafilepath, "([/].+)", i) do
        local startPoint, endPoint
        startPoint, endPoint, lastPart = string.find(luafilepath, "([/].+)", i)
        i = startPoint + 1
        -- print(s, startPoint, endPoint, "\n")
    end
    -- print("part to remove: ", lastPart)
    local afterRemoval = string.gsub(luafilepath, lastPart, "")
    -- print("After removal: ", afterRemoval)
    return afterRemoval
end
local folderPath = getFolderPath()


Legolando_SimpleArrowPopoutButtonTemplateMixin_Angleur = {}

local enum_Rotation = {
	["Up"] = 0,
	["Left"] = math.pi/2,
	["Down"] = math.pi,
	["Right"] = (math.pi*3)/2,
}
-- For Right and Left:
-- - Need to UnAnchor TopLeft&BottomRight(setAllPoints) + Anchor to CENTER to rotate
-- - Also need to resize since it will lose its setAllPoints 
local function _reAnchorAndResize(texture, newAnchor, sizeX, sizeY)
	texture:ClearAllPoints()
	texture:SetPoint("CENTER", newAnchor, "CENTER")
	texture:SetSize(sizeX, sizeY)
end
function Legolando_SimpleArrowPopoutButtonTemplateMixin_Angleur:SetRotate(facing)
	if not facing or facing == "Up" then return end
	if facing == "Left" or facing == "Right" then
		local x, y = self:GetSize()
		-- Swap x and y when facing left or right
		self:SetSize(y, x)
		-- Plug the unswapped x and y to the texture(it's already rotated)
		_reAnchorAndResize(self.highlight, self, x, y)
		_reAnchorAndResize(self.normal, self, x, y)
	end
	self.highlight:SetRotation(enum_Rotation[facing])
	self.normal:SetRotation(enum_Rotation[facing])
end

function Legolando_SimpleArrowPopoutButtonTemplateMixin_Angleur:OnLoad()
	self:GetNormalTexture():SetTexCoord(0.188, 0.828, 0.062, 0.437)
	self:GetHighlightTexture():SetTexCoord(0.188, 0.828, 0.562, 0.937)
	self.updating = false
	self.onUpdateFrame = CreateFrame("Frame")
	self.onUpdateFrame:Show()
end

function Legolando_SimpleArrowPopoutButtonTemplateMixin_Angleur:SetState(forceSet)
	-- Only set state once per update
	if self.updating == true then return end
	local setTo = not self.expanded
	if forceSet ~= nil then
		setTo = forceSet
	end
	if setTo == false then
		self:GetNormalTexture():SetTexCoord(0.188, 0.828, 0.062, 0.437)
		self:GetHighlightTexture():SetTexCoord(0.188, 0.828, 0.562, 0.937)
		self.expanded = false
	elseif setTo == true then
		self:GetNormalTexture():SetTexCoord(0.188, 0.828, 0.437, 0.062)
		self:GetHighlightTexture():SetTexCoord(0.188, 0.828, 0.937, 0.562)
		self.expanded = true
	end
	self.updating = true
    self.onUpdateFrame:SetScript("OnUpdate", function(updaterFrame)
        self.updating = false
        updaterFrame:SetScript("OnUpdate", nil)
    end)
end


Legolando_IncreaseDecreaseButtonsMixin_Angleur = {}

local plusIcon = folderPath .. "/plusicon.png"
local minusIcon = folderPath .. "/minusicon.png"


function Legolando_IncreaseDecreaseButtonsMixin_Angleur:OnLoad()
	self.decrease.icon:SetTexture(minusIcon, nil, nil, "NEAREST")
	self.increase.icon:SetTexture(plusIcon, nil, nil, "NEAREST")
end


function Legolando_IncreaseDecreaseButtonsMixin_Angleur:Update()
	local teeburu = self.savedVarTable
	local reference = self.reference
	self.unitText:SetText(teeburu[reference])
end

function Legolando_IncreaseDecreaseButtonsMixin_Angleur:SaveToTable(value)
	local teeburu = self.savedVarTable
	local reference = self.reference
	local privateRegistry = self.privateRegistry
	local privateRegistryString = self.privateRegistryString
	if not teeburu or not reference or not teeburu[reference] then
		print("Table or Reference missing for IncreaseDecrease Buttons")
		return
	end
	teeburu[reference] = value
	self:debugPrint("Value set to", teeburu[reference], "from IncreaseDecrease Buttons")
	if privateRegistry and privateRegistryString then
		privateRegistry:TriggerEvent(privateRegistryString, self)
	end
	if self.onSaveCallback then
		self.onSaveCallback(self, teeburu[reference], teeburu)
	end
end

local function _adjustLayoutAndScale(self)
	local increase = self.increase
	local decrease = self.decrease
	local unitText = self.unitText
	local width, height = self:GetSize()
	local buttonTemplateWidth, buttonTemplateHeight =  increase:GetSize()
	if self.isHorizontal then
		local scale = height / buttonTemplateHeight
		print("before truncate: ", scale)
		scale = tonumber(string.format("%.3f", scale))
		print("after truncate: ", scale)
		increase:SetScale(scale)
		decrease:SetScale(scale)
		unitText:SetScale(scale)
	else
		increase:ClearAllPoints()
		increase:SetPoint("TOP")
		decrease:ClearAllPoints()
		decrease:SetPoint("BOTTOM")
		local scale = width / buttonTemplateWidth
		print("before truncate: ", scale)
		scale = tonumber(string.format("%.3f", scale))
		print("after truncate: ", scale)
		increase:SetScale(scale)
		decrease:SetScale(scale)
		unitText:ClearAllPoints()
		unitText:SetPoint("LEFT", self, "RIGHT")
		unitText:SetScale(scale)
	end
end
function Legolando_IncreaseDecreaseButtonsMixin_Angleur:Init(min, max)
	_adjustLayoutAndScale(self)
	local teeburu = self.savedVarTable
	local reference = self.reference
	if not teeburu or not reference or not teeburu[reference] then
		print("Table or Reference missing for IncreaseDecrease Buttons")
		return
	end
	local privateRegistry = self.privateRegistry
	local privateRegistryString = self.privateRegistryString
	if privateRegistry and privateRegistryString then
		privateRegistry:RegisterCallback(privateRegistryString, function(_, caller)
			if caller and caller == self then return end
			self:Update()
		end)
	end
	self.increase:SetScript("OnClick", function(increaseButton)
		local value = teeburu[reference]
		value = value + 1
		if value > max then return end
		self:SaveToTable(value)
	end)
	self.decrease:SetScript("OnClick", function(decreaseButton)
		local value = teeburu[reference]
		value = value - 1
		if value < min then return end
		self:SaveToTable(value)
	end)
end