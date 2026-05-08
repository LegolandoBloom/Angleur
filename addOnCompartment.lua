--[[
	This Lua is for the AddOnCompartment Display
--]]
local addonName, ns = ...                                              -- Get the AddOn Raw Name & NameSpace
local T = Angleur_Translate                                            -- Get the Translations

if (WOW_PROJECT_ID == WOW_PROJECT_MAINLINE) then                       -- If on Retail (this is only supported on 10.x and up
    local raw, properName, note, _ = C_AddOns.GetAddOnInfo(addonName)  -- Get the properly formatted name and title note
    -- if ns.db.profile.showinaddoncomparment then                     -- Optional check against a setting to enable this
        AddonCompartmentFrame:RegisterAddon({                          -- start adding to the addon compartment
            text = properName,                                         -- text in addon compartment
            icon = "Interface/AddOns/Angleur/images/angminimap.png",   -- icon in addon compartment
            notCheckable = true,
            func = function(button, menuInputData, menu)
				if menuInputData.buttonName == "LeftButton" then
					if InCombatLockdown() then
						print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "cannot open " .. colorYello:WrapTextInColorCode("Config Panel ") .. "in combat."])
						print(T["Please try again after combat ends."])
						return
					end
					if not Angleur.configPanel:IsShown() then 
						Angleur.configPanel:Show()
					end
				elseif button == "RightButton" then
					if InCombatLockdown() then
						print(T["Can't change sleep state in combat."])
						return
					end
					if UnitIsDeadOrGhost("player") then
						print(T["Can't change sleep state while in ghost form."])
						return
					end
					if AngleurCharacter.sleeping == true then
						AngleurCharacter.sleeping = false
						Angleur_SetSleep()
						Angleur_EquipAngleurSet(true)
						print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Awake."])
					elseif AngleurCharacter.sleeping == false then
						AngleurCharacter.sleeping = true
						Angleur_SetSleep()
						Angleur_UnequipAngleurSet()
						print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping."])
					end
				end
            end,
            funcOnEnter = function(button)
                MenuUtil.ShowTooltip(button, function(tooltip)
                    tooltip:SetText(properName .. "\n" .. note)        -- Set mouse scroll over text
                end)
            end,
            funcOnLeave = function(button)
                MenuUtil.HideTooltip(button)
            end,
        })
    -- end
end