local T = Angleur_Translate

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorGreen = CreateColor(0, 1, 0)
local colorPurple = CreateColor(0.64, 0.3, 0.71)
local colorBrown = CreateColor(0.67, 0.41, 0)

AngleurTutorial = {
    part = 1
}

--[[
	Legolando_HelpTipTemplateMixin.parts[i] = {
		text,									-- also acts as a key for various API, MUST BE SET
		textColor = HIGHLIGHT_FONT_COLOR,
		textJustifyH = "LEFT",
		buttonStyle = HelpTip.ButtonStyle.None	--> [None|Close|Okay|GotIt|Next]

		targetPoint = HelpTip.Point.BottomEdgeCenter, --> [TopEdgeLeft|TopEdgeCenter|TopEdgeRight|BottomEdgeLeft|BottomEdgeCenter|BottomEdgeRight]
								   						  [RightEdgeTop|RightEdgeCenter|RightEdgeBottom|LeftEdgeTop|LeftEdgeCenter|LeftEdgeBottom]

		alignment = HelpTip.Alignment.Center,	--> [Left|Center|Right|Top|Bottom] (Left = Top and Right = Bottom, ie actually 3 values in total)
        
		hideArrow = false,						
		offsetX = 0,
		offsetY	= 0,
		hideHighlightTexture = false
        highlightTextureSizeMultiplierX = 1,
        highlightTextureSizeMultiplierY = 1,
		onHideCallback, callbackArg,			-- callback whenever the helptip is closed:  onHideCallback(acknowledged, callbackArg)
		autoEdgeFlipping = false,				-- on: will flip helptip to opposite edge based on relative region's center vs helptip's center during OnUpdate
		autoHorizontalSlide = false,			-- on: will change the alignment to fit helptip on screen during OnUpdate
		useParentStrata	= false,				-- whether to use parent framestrata
		systemPriority = 0,						-- if a system and a priority is specified, higher priority helptips will close another helptip in that system
		extraRightMarginPadding = 0,			--  extra padding on the right side of the helptip
		appendFrame = nil,						-- if a helptip needs a custom display you can append your own frame to the text
		appendFrameYOffset = nil,				-- the offset for the vertical anchor for appendFrame
		autoHideWhenTargetHides = false,		-- if the target frame hides, the helptip will hide if this is set and call the onHideCallback with an apprpropriate reason
	}
]]--

local function platerWarning()
    if C_AddOns.IsAddOnLoaded("Plater") then
        print("----------------------------------------------------------------------------")
        print(T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ") .. "detected."])
        print(T["Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ") .. "General Settings" 
        .. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"])
        print(T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to function properly."])
        print("----------------------------------------------------------------------------")
        Angleur_PlaterFrame:Show()
    end
end

local alreadySet = false
local angleurHelpTip
function Angleur_FirstInstall()
    if alreadySet == false then
        
        angleurHelpTip = CreateFrame("Frame", "Angleur_HelpTip", Angleur.configPanel, "Legolando_HelpTipTemplate_Angleur")
        
        local angleurHelpTipCloseWarning = CreateFrame("Frame", "Angleur_HelpTip_CloseWarning", UIParent, "Legolando_HelpTipCloseWarning_Angleur")
        angleurHelpTipCloseWarning.TitleText:SetText(T["Angleur Warning"])
        angleurHelpTipCloseWarning.mainText:SetText(T["Are you sure you want to abandon the tutorial?"])
        angleurHelpTipCloseWarning.otherText:SetText(T["(You can redo it later by clicking the Redo Button\nin the Tiny Panel)"])
        angleurHelpTipCloseWarning.yesButton:SetText(colorYello:WrapTextInColorCode(T["Yes"]))
        angleurHelpTipCloseWarning.noButton:SetText(colorYello:WrapTextInColorCode(T["No"]))
        angleurHelpTip:AttachWarning(angleurHelpTipCloseWarning)

        angleurHelpTip.savedVarTable = AngleurTutorial
        angleurHelpTip.reference = "part"

        angleurHelpTip.onSkipCallback = platerWarning

        angleurHelpTip.parts[1] = {
            text = T[colorYello:WrapTextInColorCode("To Get Started:\n\n") .. "Choose your desired\n"
            .. colorBlu:WrapTextInColorCode("Fishing Method") .. " by\nclicking one of these buttons.\n\n"],
            relativeRegion = Angleur.configPanel.tab1.contents.fishingMethod,
            buttonStyle = 4,
            alignment = 1,
            targetPoint = HelpTip.Point.RightEdgeCenter,
        }
        Angleur.configPanel.tab1.contents.fishingMethod.oneKey:HookScript("OnClick", function(self, button, down)
            if button == "LeftButton" and down == false then
                angleurHelpTip:CompletePartWithAction(1)
            end
        end)
        Angleur.configPanel.tab1.contents.fishingMethod.doubleClick:HookScript("OnClick", function(self, button, down)
            if button == "LeftButton" and down == false then
                angleurHelpTip:CompletePartWithAction(1)
            end
        end)

        angleurHelpTip.parts[2] = {
            text = T[colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Visual:\n\n") .. "Shows what your next input will do.\n" 
            .. "Drag and place it anywhere you might like.\n\n" .. "You can also hide it by clicking its close button."],
            relativeRegion = Angleur.visual,
            buttonStyle = 3,
            alignment = 1,
            targetPoint = HelpTip.Point.BottomEdgeCenter,
            highlightTextureSizeMultiplierX = 2,
            highlightTextureSizeMultiplierY = 2,
        }
        Angleur.visual:HookScript("OnDragStop", function()
            angleurHelpTip:CompletePartWithAction(2)
        end)
        Angleur.visual.closeButton:HookScript("OnClick", function()
            angleurHelpTip:CompletePartWithAction(2)
        end)

        angleurHelpTip.parts[3] = {
            text = T["Angleur works on a " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. "system, so you don't have to reload your UI after you're done fishing.\n\n"
            .. colorBlu:WrapTextInColorCode("Right Click ") .. "to put Angleur to sleep, and wake it up if it is. You can also Right Click the minimap button."],
            relativeRegion = Angleur.visual,
            buttonStyle = 4,
            alignment = 1,
            targetPoint = HelpTip.Point.RightEdgeCenter,
            highlightTextureSizeMultiplierX = 1.3,
            highlightTextureSizeMultiplierY = 1.3,
        }
        Angleur.visual:HookScript("OnClick", function(self, button, down)
            if button == "RightButton" and down == false then
                angleurHelpTip:CompletePartWithAction(3)
            end
        end)

        angleurHelpTip.parts[4] = {
            text = T["You can enable\n\nRafts,\n\nBobbers,\n\nand Ultra Focus(Audio/Temporary Auto Loot)\n\nby checking these boxes."],
            relativeRegion = Angleur.configPanel.tab1.contents,
            buttonStyle = 4,
            alignment = 2,
            offsetY = -110,
            targetPoint = HelpTip.Point.RightEdgeTop,
            hideHighlightTexture = true
        }

        angleurHelpTip.parts[5] = {
            text = T["Now, let's move to the " .. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Click here."],
            relativeRegion = Angleur.configPanel.tab2,
            buttonStyle = 3,
            alignment = 2,
            onHideCallback = function()
                Angleur.configPanel.tab2:SetSelected(true)
                Angleur_TabSystem(Angleur.configPanel.tab2)
            end,
            targetPoint = HelpTip.Point.TopEdgeCenter,
            highlightTextureSizeMultiplierX = 1.2,
            highlightTextureSizeMultiplierY = 1.2
        }
        Angleur.configPanel.tab2:HookScript("OnClick", function(self, button, down)
            if button == "LeftButton" and down == false then
                angleurHelpTip:CompletePartWithAction(5)
            end
        end)
        
        local index = 6
        local gameVersion = Angleur_CheckVersion()
        if gameVersion == 1 or gameVersion == 2 then
            angleurHelpTip.parts[6] = {
                text = T[colorPurple:WrapTextInColorCode("Extra Toys\n\n")  .. "You can select a toy from the " .. colorYello:WrapTextInColorCode("Toy Box ") 
                .. "to add it to your Angleur rotation.\n\n Click on an empty slot to open toy selection, or click next to move on.\n\n"
                .. "Note: Not every toy will work, some silence you so you can't fish etc. Experiment around!"],
                relativeRegion = Angleur.configPanel.tab2.contents.extraToys,
                buttonStyle = 5,
                alignment = 2,
                targetPoint = HelpTip.Point.RightEdgeCenter,
                highlightTextureSizeMultiplierX = 1,
                highlightTextureSizeMultiplierY = 1
            }
            Angleur_ExtraToys_First:HookScript("OnClick", function(self, button, down)
                if button == "LeftButton" and down == false then
                    angleurHelpTip:CompletePartWithAction(4)
                end
            end)
            Angleur_ExtraToys_Second:HookScript("OnClick", function(self, button, down)
                if button == "LeftButton" and down == false then
                    angleurHelpTip:CompletePartWithAction(4)
                end
            end)
            Angleur_ExtraToys_Third:HookScript("OnClick", function(self, button, down)
                if button == "LeftButton" and down == false then
                    angleurHelpTip:CompletePartWithAction(4)
                end
            end)
            index = index + 1
        end

        angleurHelpTip.parts[index] = {
            text = T[colorBrown:WrapTextInColorCode("Extra Items/Macros\n\n")  .. "You can " .. colorYello:WrapTextInColorCode("Drag ") 
            .. "items or macros here to add them to your Angleur rotation.\n\n" .. "These can be fishing hats, throwable fish, spells...\n\n" 
            .. "You can even set custom timers for them by clicking the " .. colorYello:WrapTextInColorCode("stopwatch ") 
            .. "icon that appears once you slot an item/macro.\n\nClick " .. colorYello:WrapTextInColorCode("Okay ") .. "to move on."],
            relativeRegion = Angleur.configPanel.tab2.contents.extraItems,
            buttonStyle = 3,
            alignment = 2,
            targetPoint = HelpTip.Point.RightEdgeCenter,
            highlightTextureSizeMultiplierX = 1,
            highlightTextureSizeMultiplierY = 1
        }
        index = index + 1

        angleurHelpTip.parts[index] = {
            text = T["Click here if you need an example & explanation of use of macros for Angleur!"],
            relativeRegion = Angleur_ConfigPanel_Tab2_Contents_AdvancedButton,
            buttonStyle = 5,
            alignment = 2,
            targetPoint = HelpTip.Point.BottomEdgeCenter,
            highlightTextureSizeMultiplierX = 1.2,
            highlightTextureSizeMultiplierY = 1.2
        }
        index = index + 1

        angleurHelpTip.parts[index] = {
            text = T["And lastly, the " .. colorYello:WrapTextInColorCode("Create & Add ") .. "button Creates an item set for you and automatically adds your " 
            .. "slotted items to it.\n\nNow, Angleur will automatically equip your slotted items when you " 
            .. colorYello:WrapTextInColorCode("wake ") .."it up, and restore previous items when you put it back to " .. colorYello:WrapTextInColorCode("sleep.")],
            relativeRegion = Angleur_CreateSetAndAdd,
            buttonStyle = 4,
            alignment = 1,
            onHideCallback = platerWarning,
            targetPoint = HelpTip.Point.RightEdgeCenter,
            highlightTextureSizeMultiplierX = 1.2,
            highlightTextureSizeMultiplierY = 1.2
        }
        alreadySet = true
    end
    
    if AngleurTutorial.part > #angleurHelpTip.parts then
        return
    elseif AngleurTutorial.part < 6 then
        Angleur.configPanel.tab1:SetSelected(true)
        Angleur_TabSystem(Angleur.configPanel.tab1)
    elseif AngleurTutorial.part <= #angleurHelpTip.parts then
        Angleur.configPanel.tab2:SetSelected(true)
        Angleur_TabSystem(Angleur.configPanel.tab2)
    end
    Angleur_ConfigPanel:Show()
    if AngleurTutorial.part < 2 then
        Angleur_VisualReset(Angleur.configPanel.tab1.contents.returnButton, 180, 180, false)
    end
    angleurHelpTip:Activate(AngleurTutorial.part)
    --angleurHelpTip:InsertPart(part1, 1)
end
