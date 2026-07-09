-- This method is what I will use for handling temporary CVar changes going forward



-- local temp_CVars = {
--     colorblindSimulator = {
--         active = false, cached = nil, setTo = "3", updating = false,
--     },
--     RenderScale = {
--         active = false, cached = nil, setTo = "0.2", updating = false,
--     }
-- }

Legolando_TempCVarHandlerMixin_Angleur = {}



local afterCombat_SetOrRelease = {
    -- "someCvar" = true --> Set After combat
    -- "someCvar2" = falseSource --> Release After combat
}
local function handleCombatDelay(self)
    for key, toSet in pairs(afterCombat_SetOrRelease) do
        if toSet == true then
            self:Set(key)
        elseif toSet == false then
            self:Release(key)
        end 
        afterCombat_SetOrRelease[key] = nil
    end
    print("Combat delay done, emptied table: ")
    DevTools_Dump(afterCombat_SetOrRelease)
end


function Legolando_TempCVarHandlerMixin_Angleur:Init()
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return 
    end
    self:RegisterEvent("CVAR_UPDATE")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:SetScript("OnEvent", function(self, event, unit, ...)
        local arg4 = ...
        if event == "CVAR_UPDATE" then 
            local cVar = teeburu[unit]
            if not cVar then return end
            if cVar.updating == true then
                -- CVar updated by addon, dont overwrite
                return
            end
            -- CVar updated manually(or by another addon), overwrite
            cVar.cached = arg4
        elseif event == "PLAYER_REGEN_ENABLED" then
            print("Combat ended. Saved-up CVars Table: ")
            DevTools_Dump(afterCombat_SetOrRelease)
            handleCombatDelay(self)
        end
    end)
end

local onUpdate_FramePool = CreateFramePool("Frame", nil, nil, function(framePool, frame)
    -- print("Remaining: ", framePool:GetNumActive())
    frame:ClearAllPoints()
    frame:SetScript("OnUpdate", nil)
    frame:Hide()
end)



local function setCVar(key, cVar)
    if cVar.active == true then return end
    local _, _, _, _, _, isSecure = C_CVar.GetCVarInfo(key)
    -- print(key, "Is Secure: ", isSecure)
    if isSecure and InCombatLockdown() then
        afterCombat_SetOrRelease[key] = true
        return
    end
    cVar.cached = C_CVar.GetCVar(key)
    cVar.updating = true
    C_CVar.SetCVar(key, cVar.setTo)
    local onUpdate_Frame = onUpdate_FramePool:Acquire()
    onUpdate_Frame:Show()
    onUpdate_Frame:SetScript("OnUpdate", function(self)
        cVar.updating = false
        onUpdate_FramePool:Release(self)
    end)
    cVar.active = true
end
function Legolando_TempCVarHandlerMixin_Angleur:Set(...)
    local keys = {...}
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return
    end
    if not keys then
        print("temp CVar key(s) is missing")
        return
    end
    for i, key in ipairs(keys) do
        if not teeburu[key] then
            print("temp CVar key's referenced element is missing")
        else
            local cVar = teeburu[key]
            setCVar(key, cVar)
        end
    end
    -- print(GetTime())
end

local function releaseCVar(key, cVar)
    if cVar.active == false then return end
    local _, _, _, _, _, isSecure = C_CVar.GetCVarInfo(key)
    -- print(key, "Is Secure: ", isSecure)
    if isSecure and InCombatLockdown() then
        afterCombat_SetOrRelease[key] = false
        return
    end
    cVar.updating = true
    C_CVar.SetCVar(key, cVar.cached)
    local onUpdate_Frame = onUpdate_FramePool:Acquire()
    onUpdate_Frame:Show()
    onUpdate_Frame:SetScript("OnUpdate", function(self)
        cVar.updating = false
        onUpdate_FramePool:Release(self)
    end)
    cVar.cached = nil
    cVar.active = false
end
function Legolando_TempCVarHandlerMixin_Angleur:Release(...)
    local keys = {...}
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return
    end
    if not keys then
        print("temp CVar key(s) is missing")
        return
    end
    for i, key in ipairs(keys) do
        if not teeburu[key] then 
            print("temp CVar key's referenced element is missing")
        else
            local cVar = teeburu[key]
            releaseCVar(key, cVar)
        end
    end
    -- print(GetTime())
end

function Legolando_TempCVarHandlerMixin_Angleur:SetAll()
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return
    end
    for i, v in pairs(teeburu) do
        self:Set(i)
    end
end

function Legolando_TempCVarHandlerMixin_Angleur:ReleaseAll()
    local teeburu = self.tempCVarsTable
    if not teeburu or next(teeburu) == nil then 
        print("No valid Temp CVars Table")
        return
    end
    for i, v in pairs(teeburu) do
        self:Release(i)
    end
end

