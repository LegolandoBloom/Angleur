--Translator: Crazyyoungs

if (GAME_LOCALE or GetLocale()) ~= "koKR" then
  return
end

local T = Angleur_Translate

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorWhite = CreateColor(1, 1, 1)
local colorGreen = CreateColor(0, 1, 0)
local colorPurple = CreateColor(0.64, 0.3, 0.71)
local colorBrown = CreateColor(0.67, 0.41, 0)
local colorRed = CreateColor(1, 0, 0)
local colorUnderlight = CreateColor(0.9, 0.8, 0.5)
local colorDarkRed = CreateColor(0.68, 0, 0)
local colorDarkBlu = CreateColor(0.12, 0.5, 1)

--Angleur.xml
T["Ultra Focus:"] = "집중 모드:"
T["You can drag and place this anywhere on your screen"] = "이 항목을 원하는 위치로 드래그하여 배치할 수 있습니다."
T["FISHING METHOD:"] = "낚시 방법:"
T["One Key"] = "단일 키"
T["The next key you press\nwill be set as Angleur Key"] = "The next key you press\nwill be set as Angleur Key"
T["Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"] = "Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"
T["Return\nAngleur Visual"] = "재시작 버튼\n 행동단축바 버튼 "
T["Double Click"] = "더블 클릭"
T["Redo Tutorial"] = "튜토리얼 다시하기"
T["Wake!"] = "활성화!"
T["Create\n  Add"] = "제작\n  추가"
T["Update"] = "업데이트"
T["Please select a toy using Left Mouse Click"] = "Please select a toy using Left Mouse Click"
T["Make sure this box is checked!"] = "Make sure this box is checked!"
T["Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."] = "Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."
T["Angleur Configuration"] = "낚시꾼 구성"
T["Having Problems?"] = "문제가 있나요?"
T["Angleur Warning: Plater"] = "낚시꾼 경고: 플레이터"
T["Okay"] = "확인"
T["  Extra  "] = "추가/매크로"
T["  Tiny  "] = "기타"
T["Standard"] = "기본"
    --Angleur.xml->Tooltips
    T["Angleur Visual Button"] = "낚시꾼 행동단축바 버튼"
    T["Shows what your next key press\nwill do. Not meant to be clicked."] = "다음으로 누를 키를 표시\n클릭할 필요 없음.그대로 유지"
    T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("Double Click\n")] = "낚시 모드: " .. colorBlu:WrapTextInColorCode("더블 클릭\n")
    T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("One Key")] = "낚시 모드: " .. colorBlu:WrapTextInColorCode("단일 키")
    T["One-Key NOT SET! To set,\nopen config menu with:"] = "One-Key NOT SET! To set,\nopen config menu with:"
    T[" or\n"] = " or\n"
    T["Right Click to temporarily put Angleur to sleep. zzz..."] = "오른쪽 클릭하면 낚시꾼가 잠시 비활성화. zzz..."
    T["Sleeping. Zzz...\n"] = "비활성화.\n"
    T["\nRight-Click"] = "\n오른쪽-클릭"
    T["\nto wake Angleur!"] = "\n낚시꾼 활성화!"
    T["One-Key Fishing Mode"] = "단일 키 낚시모드"
    
    T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") 
    .. ", use " .. colorPurple:WrapTextInColorCode("Toys") .. ", " .. colorBlu:WrapTextInColorCode(" Items and Configured Macros ") 
    .. "using \none button."] = colorBlu:WrapTextInColorCode("시전 ") .. ", " .. colorBlu:WrapTextInColorCode("릴 ") 
    .. ",사용" .. colorPurple:WrapTextInColorCode("장난감") .. ", " .. colorBlu:WrapTextInColorCode(" 항목 및 구성된 매크로 ") 
    .. "사용중 \n버튼 없음."
    
    T["Set your desired key by: "] = "원하는 키를 설정: "
    T["Clicking on the button\nthat appears below\nonce this option is selected."] = "버튼을 클릭하면\n아래에 나타나는\n단일 키 선택 해주세요."
    T["Double-Click Fishing Mode"] = "더블 클릭 낚시 모드"
    T["Fish, Reel, cast Toys, Items and Macros using double mouse clicks!\n"] = "물고기, 릴, 더블 마우스 클릭을 사용하여 장난감, 아이템 및 매크로를 캐스팅합니다!\n"
    T["Select which mouse button by:"] = "Select which mouse button by:"
    T["Not every toy will work!"] = "Not every toy will work!"
    T["Extra Toys is a feature meant to provide flexible user customization, but not every toy is" 
    .. " created the same. Targeted toys, toys that silence you, remote controlled toys etc might mess with your fishing routine."
    .. " Test them out, experiment and have fun!\n"] = "Extra Toys is a feature meant to provide flexible user customization, but not every toy is" 
    .. " created the same. Targeted toys, toys that silence you, remote controlled toys etc might mess with your fishing routine."
    .. " Test them out, experiment and have fun!\n"
    T["Fun toy recommendations from mod author, Legolando:"] = "Fun toy recommendations from mod author, Legolando:"
    T["1) Tents such as Gnoll Tent to protect yourself from the sun as you fish."
    .. "\n2) Transformation toys such as Burning Defender's Medallion.\n3) Seating items like pillows so you can fish comfortably."
    .. "\n4) Darkmoon whistle if you want to be annoying.\nAnd other whacky combinations!"] = "1) Tents such as Gnoll Tent to protect yourself from the sun as you fish."
    .. "\n2) Transformation toys such as Burning Defender's Medallion.\n3) Seating items like pillows so you can fish comfortably."
    .. "\n4) Darkmoon whistle if you want to be annoying.\nAnd other whacky combinations!"
    T["Beta: " .. colorWhite:WrapTextInColorCode("If you are having trouble,\ntry resetting the set by clicking\nthe reset button then refreshing\nthe UI with ") 
    .. "/reload."] = "베타: " .. colorWhite:WrapTextInColorCode("문제가 있는 경우,\n클릭하여 설정을 재설정해보세요\n재설정 버튼을 누른 후 새로 고침\nUI와 함께 ") 
    .. "/reload [재시작]."
    T["Reset Angleur Set"] = "낚시꾼 설정 초기화"
    --Cata
    T[colorWhite:WrapTextInColorCode("\nEquip a ") .. "Fishing Pole\n"] = colorWhite:WrapTextInColorCode("\nEquip a ") .. "Fishing Pole\n"
    T["\nor"] = "\nor"
    T["Note for Cata:"] = "Note for Cata:"
    T["Mouseover the bobber\nto reel consistently."] = "Mouseover the bobber\nto reel consistently."
    T["(If it lands too far, the\nsoft-interact will miss it.)"] = "(If it lands too far, the\nsoft-interact will miss it.)"
    T["Key set to "] = "Key set to "
    T["Fish, cast Toys, Items and Macros using double mouse clicks!\n"] = "Fish, cast Toys, Items and Macros using double mouse clicks!\n"
    --Vanilla
    T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") 
    .. "and " .. colorBlu:WrapTextInColorCode("use Items and Configured Macros ") 
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Cast ") .. ", "
    .. colorBlu:WrapTextInColorCode("Reel ") .. "and " 
    .. colorBlu:WrapTextInColorCode("use Items and Configured Macros ") .. "using \none button."

    T["Note for Classic:"] = "Note for Classic:"
    T[colorBlu:WrapTextInColorCode("Cast ") .. "your rod and " .. colorBlu:WrapTextInColorCode("use Items/Macros ") 
    .. "using\ndouble mouse clicks!\n"] = colorBlu:WrapTextInColorCode("Cast ") .. "your rod and "
    .. colorBlu:WrapTextInColorCode("use Items/Macros ") .. "using\ndouble mouse clicks!\n"

--extra.lua
T["Extra Toys"] = "추가 장난감"
T["   " .. colorYello:WrapTextInColorCode("Click ") .. "any of the buttons above\nthen select a toy with left click from\nthe " 
.. colorYello:WrapTextInColorCode("Toy Box ") .. "that pops up."] = "   " .. colorYello:WrapTextInColorCode("클릭 ") .. "위의 버튼 중 하나를 선택\n그런 다음 왼쪽 클릭으로 장난감을 선택.\n" 
    .. colorYello:WrapTextInColorCode("장난감 상자 ") .. "팝업되는 장난감을 선택."

T["Extra Items / Macros"] = "추가 아이템 / 매크로"

T["   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " .. 
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes above."] = "   " .. colorYello:WrapTextInColorCode("드래그 ") .. "사용 가능한 " .. colorYello:WrapTextInColorCode("아이템 ") .. "또는" .. 
    colorYello:WrapTextInColorCode("매크로 ") .. "위의 상자 중 하나에 넣어주세요."

T["Set Timer"] = "시간 설정"
T["Toggle Equipment"] = "장비 변경"
T["Toggle Bags"] = "가방 열고 닫기"
T["Open Macros"] = "매크로 열기"



--standard.lua
T["Raft"] = "땟목"
T["Couldn't find any rafts \n in toybox, feature disabled"] = "Couldn't find any rafts \n in toybox, feature disabled"
T["Oversized Bobber"] = "초대형 낚시찌"
T["Couldn't find \n Oversized Bobber in \n toybox, feature disabled"] = "Couldn't find \n Oversized Bobber in \n toybox, feature disabled"
T["Crate of Bobbers"] = "낚시찌 상자"
T["Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"] = "\nCouldn't find \n any Crate Bobbers \n in toybox, feature disabled"
T["Crate Bobbers"] = "낚시찌 상자"
T["Ultra Focus:"] = "집중 모드:"
T["Audio"] = "오디오"
T["Temp. Auto Loot "] = "임시 자동 전리품 "
T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot") 
.. ", then turn it back off after you reel.\n\n" .. colorGrae:WrapTextInColorCode("If you have ")
.. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")] = "If checked, Angleur will temporarily turn on " 
.. colorYello:WrapTextInColorCode("Auto-Loot") .. ", then turn it back off after you reel.\n\n" 
.. colorGrae:WrapTextInColorCode("If you have ") .. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")
T["(Already on)"] = "[이미 활성화됨]"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a " 
.. colorYello:WrapTextInColorCode("/reload") .. " to fix it."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "If you experience stiffness with the Double-Click, do a " .. colorYello:WrapTextInColorCode("/reload") .. " to fix it."
T["Rafts"] = "땟목"
T["Random Bobber"] = "무작위 찌"
T["Preferred Mouse Button"] = "선호하는 마우스 버튼"
T["Right Click"] = "오른쪽 클릭"


--tabs-general.lua
T[colorBlu:WrapTextInColorCode("Angleur visual ") .. "is now hidden."] = colorBlu:WrapTextInColorCode("낚시꾼 비주얼 ") .. "이 비활성화."
T["You can re-enable it from the"] = "여기에서 다시 활성화"
T[colorYello:WrapTextInColorCode("Config Menu ") .. "accessed by: " 
.. colorYello:WrapTextInColorCode("/angleur ") .. " or  " 
.. colorYello:WrapTextInColorCode("/angang")] = colorYello:WrapTextInColorCode("설정 메뉴 ") 
.. "명령어: " .. colorYello:WrapTextInColorCode("/angleur ") 
.. " 또는  " .. colorYello:WrapTextInColorCode("/angang")



--tiny.lua
T["Disable Soft Interact"] = "블리자드 상호작용 끄기"

T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n" 
.. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")] = "이 옵션을 선택하면 낚시가 끝난 후 " 
.. colorYello:WrapTextInColorCode("블리자드 상호작용 ") .. "기능을 비활성화합니다\n\n" 
.. colorGrae:WrapTextInColorCode("일반 플레이어 중에 블리자드 상호작용 기능을 비활성화 상태로 유지하려는 사람들을 위한 설정입니다.")

T["Can't change in combat."] = "전투 중에는 변경할 수 없습니다."

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off " 
.. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."] = colorBlu:WrapTextInColorCode("낚시꾼 ") 
.. "낚시를 하지 않을 때 " .. colorYello:WrapTextInColorCode("블리자드 상호작용 ") .. "기능을 자동으로 끕니다."

T["Dismount With Key"] = "키로 탈것 해제"

T["If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ") 
.. "when you use OneKey/DoubleClick.\n\n" 
.. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")] = "탈것에 탑승하면 키가 더 이상 해제되지 않습니다" 
.. colorYello:WrapTextInColorCode("단일키/더블 클릭") .. "사용하면 탈것에서 내립니다.\n\n" 
.. colorGrae:WrapTextInColorCode("탈것하면 더 이상 키가 해제되지 않습니다.")

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now " 
.. colorYello:WrapTextInColorCode("dismount ") .. "you"] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "will now " .. colorYello:WrapTextInColorCode("dismount ") .. "you"

T["Disable Soft Icon"] = "블리자드 아이콘 끄기"

T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."] = "찌 위에 갈고리 아이콘이 표시되는지 여부를 결정합니다. 참고로, 이 설정은 다른 블리자드 상호작용 아이콘에도 영향을 줍니다."

T["Soft target icon for game objects disabled."] = "게임 오브젝트의 블리자드 상호작용 아이콘이 비활성화."
T["Soft target icon for game objects re-enabled."] = "게임 오브젝트의 블리자드 상호작용 아이콘이 활성화."
T["Double Click Window"] = "더블 클릭 창"
T["Visual Size"] = "행동단축바 크기"
T["Master Volume(Ultra Focus)"] = "전체 음량[집중 모드]"
T["Login Messages"] = "로그인 메세지"
T["Debug Mode"] = "디버그 모드"
T["Defaults"] = "기본값"


--firstInstall
T["Angleur Warning"] = "Angleur Warning"
T["Are you sure you want to abandon the tutorial?"] = "Are you sure you want to abandon the tutorial?"
T["(You can redo it later by clicking the Redo Button\nin the Tiny Panel)"] = "(You can redo it later by clicking the Redo Button\nin the Tiny Panel)"
T["Yes"] = "Yes"
T["No"] = "No"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ")
.. "detected."] = colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ") .. "detected."

T["Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ") .. "General Settings" 
.. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"] = "Plater " .. colorYello:WrapTextInColorCode("-> ") 
.. "Advanced " .. colorYello:WrapTextInColorCode("-> ") .. "General Settings" .. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to function properly."] = "Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to function properly."

T[colorYello:WrapTextInColorCode("To Get Started:\n\n") .. "Choose your desired\n"
.. colorBlu:WrapTextInColorCode("Fishing Method") .. " by\nclicking one of these buttons.\n\n"] = colorYello:WrapTextInColorCode("To Get Started:\n\n") 
.. "Choose your desired\n" .. colorBlu:WrapTextInColorCode("Fishing Method") .. " by\nclicking one of these buttons.\n\n"

T[colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Visual:\n\n") .. "Shows what your next input will do.\n" 
.. "Drag and place it anywhere you might like.\n\n" .. "You can also hide it by clicking its close button."] = colorBlu:WrapTextInColorCode("Angleur ") 
.. colorYello:WrapTextInColorCode("Visual:\n\n") .. "Shows what your next input will do.\n" 
.. "Drag and place it anywhere you might like.\n\n" .. "You can also hide it by clicking its close button."

T["Angleur works on a " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. "“시스템이 UI를 다시 로드할 필요 없이 낚시가 끝난 후에도 유지.\n\n"
.. colorBlu:WrapTextInColorCode("Right Click ")
.. "to put Angleur to sleep, and wake it up if it is. You can also Right Click the minimap button."] = "Angleur works on a " 
.. colorYello:WrapTextInColorCode("Sleep/Wake ") .. "시스템이므로 낚시를 마친 후 UI를 다시 로드할 필요가 없습니다.\n\n"
.. colorBlu:WrapTextInColorCode("Right Click ") .. "to put Angleur to sleep, and wake it up if it is. You can also Right Click the minimap button."

T["You can enable\n\nRafts,\n\nBobbers,\n\nand Ultra Focus(Audio/Temporary Auto Loot)\n\nby checking these boxes."] = "You can enable\n\nRafts,\n\nBobbers,\n\nand Ultra Focus(Audio/Temporary Auto Loot)\n\nby checking these boxes."

T["Now, let's move to the " .. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Click here."] = "Now, let's move to the " 
.. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Click here."

T[colorPurple:WrapTextInColorCode("Extra Toys\n\n")  .. "You can select a toy from the " .. colorYello:WrapTextInColorCode("Toy Box ") 
.. "to add it to your Angleur rotation.\n\n Click on an empty slot to open toy selection, or click next to move on.\n\n"
.. "Note: Not every toy will work, some silence you so you can't fish etc. Experiment around!"] = colorPurple:WrapTextInColorCode("Extra Toys\n\n")  
.. "You can select a toy from the " .. colorYello:WrapTextInColorCode("Toy Box ") 
.. "to add it to your Angleur rotation.\n\n Click on an empty slot to open toy selection, or click next to move on.\n\n"
.. "Note: Not every toy will work, some silence you so you can't fish etc. Experiment around!"

T[colorBrown:WrapTextInColorCode("Extra Items/Macros\n\n")  .. "You can " .. colorYello:WrapTextInColorCode("Drag ") 
.. "items or macros here to add them to your Angleur rotation.\n\n" .. "These can be fishing hats, throwable fish, spells...\n\n" 
.. "You can even set custom timers for them by clicking the " .. colorYello:WrapTextInColorCode("stopwatch ") 
.. "icon that appears once you slot an item/macro.\n\nClick " 
.. colorYello:WrapTextInColorCode("Okay ") .. "to move on."] = colorBrown:WrapTextInColorCode("Extra Items/Macros\n\n")  
.. "You can " .. colorYello:WrapTextInColorCode("Drag ") .. "items or macros here to add them to your Angleur rotation.\n\n" 
.. "These can be fishing hats, throwable fish, spells...\n\n" .. "You can even set custom timers for them by clicking the "
.. colorYello:WrapTextInColorCode("stopwatch ") .. "icon that appears once you slot an item/macro.\n\nClick "
.. colorYello:WrapTextInColorCode("Okay ") .. "to move on."

T["Click here if you need an example & explanation of use of macros for Angleur!"] = "Click here if you need an example & explanation of use of macros for Angleur!"

T["And lastly, the " .. colorYello:WrapTextInColorCode("Create & Add ") .. "button Creates an item set for you and automatically adds your " 
.. "slotted items to it.\n\nNow, Angleur will automatically equip your slotted items when you " 
.. colorYello:WrapTextInColorCode("wake ") .."it up, and restore previous items when you put it back to " 
.. colorYello:WrapTextInColorCode("sleep.")] = "And lastly, the " .. colorYello:WrapTextInColorCode("Create & Add ") 
.. "button Creates an item set for you and automatically adds your " 
.. "slotted items to it.\n\nNow, Angleur will automatically equip your slotted items when you " 
.. colorYello:WrapTextInColorCode("wake ") .."it up, and restore previous items when you put it back to " 
.. colorYello:WrapTextInColorCode("sleep.")

--thanks
T["You can support the project\nby donating on " .. colorYello:WrapTextInColorCode("Ko-Fi ")
.. "or " .. colorYello:WrapTextInColorCode("Patreon!")] = "You can support the project\nby donating on " 
.. colorYello:WrapTextInColorCode("Ko-Fi ") .. "or " .. colorYello:WrapTextInColorCode("Patreon!")

T["THANK YOU!"] = "감사합니다!"


--advancedAngling
T["HOW?"] = "어떻게?"
T["Advanced Angling"] = "고급 낚시"

T[colorBlu:WrapTextInColorCode("Angleur ") 
.. "will have you cast the dragged item/macro\nif all of their below listed conditions are met."] = colorBlu:WrapTextInColorCode("낚시꾼 ") 
.. "아래 조건이 만족되면 드래그한 아이템이나 매크로가\n실행됩니다."

T[colorYello:WrapTextInColorCode("Items:\n") .. 
"- Any usable item from your bags or character equipment. " .. "\n\n Whenever:\n\n   1) "
.. colorYello:WrapTextInColorCode("Off-Cooldown\n") .. "   2) " .. colorYello:WrapTextInColorCode("Aura Inactive") 
.. " (if present)\n" .. colorYello:WrapTextInColorCode("\nMacros:\n") 
.. "- Any valid macro that contains a spell or a usable item - /cast or /use. " 
.. "\n\n Whenever:\n\n   1) ".. colorYello:WrapTextInColorCode("Macro Conditions ") 
.. "are met\n" .. "   2) Spell/Item is " .. colorYello:WrapTextInColorCode("Off-Cooldown\n") 
.. "                    and their\n   3) " .. colorYello:WrapTextInColorCode("Auras Inactive") 
.. " (if present)\n\n" .. colorYello:WrapTextInColorCode("IMPORTANT: ") 
.. "If you are using Macro Conditionals, they need to be ACTIVE when you drag the macro to the slot.\n" 
.. "_____________________________________________"] = colorYello:WrapTextInColorCode("Items:\n") .. 
"- Any usable item from your bags or character equipment. " .. "\n\n Whenever:\n\n   1) "
.. colorYello:WrapTextInColorCode("Off-Cooldown\n") .. "   2) " .. colorYello:WrapTextInColorCode("Aura Inactive") 
.. " (if present)\n" .. colorYello:WrapTextInColorCode("\nMacros:\n") 
.. "- Any valid macro that contains a spell or a usable item - /cast or /use. " 
.. "\n\n Whenever:\n\n   1) ".. colorYello:WrapTextInColorCode("Macro Conditions ") 
.. "are met\n" .. "   2) Spell/Item is " .. colorYello:WrapTextInColorCode("Off-Cooldown\n")
.. "                    and their\n   3) " .. colorYello:WrapTextInColorCode("Auras Inactive") 
.. " (if present)\n\n" .. colorYello:WrapTextInColorCode("IMPORTANT: ") 
.. "If you are using Macro Conditionals, they need to be ACTIVE when you drag the macro to the slot.\n" 
.. "_____________________________________________"

T["Spell/Item has no Cooldown/Aura?\n" 
.. "Click " .. colorYello:WrapTextInColorCode("the Stopwatch ") .. "to set a manual timer.\n" 
.. colorYello:WrapTextInColorCode("                                                 (minutes:seconds)")] = "Spell/Item has no Cooldown/Aura?\n" 
.. "Click " .. colorYello:WrapTextInColorCode("the Stopwatch ") .. "to set a manual timer.\n" 
.. colorYello:WrapTextInColorCode("                                                 (minutes:seconds)")



T["Angleur Warning"] = "Angleur Warning"
T["This will restart the tutorial, are you sure?"] = "This will restart the tutorial, are you sure?"
T["First install tutorial restarting."] = "First install tutorial restarting."
T["/angsleep"] = "/angsleep"
T["/angleur"] = "/angleur"
T["/angang"] = "/angang"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "cannot open " 
.. colorYello:WrapTextInColorCode("Config Panel ") .. "in combat."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "cannot open " .. colorYello:WrapTextInColorCode("Config Panel ") .. "in combat."

T["Please try again after combat ends."] = "Please try again after combat ends."
T["login messages disabled"] = "login messages disabled"
T["login messages re-enabled"] = "login messages re-enabled"
T["debug mode active"] = "debug mode active"
T["debug mode deactivated"] = "debug mode deactivated"
T["Can't change in combat."] =  "Can't change in combat."


--minimap
T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Awake."] = colorBlu:WrapTextInColorCode("낚시꾼: ") .. "활성화."
T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping."] = colorBlu:WrapTextInColorCode("낚시꾼: ") .. "비활성화."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Minimap Icon hidden, " 
.. colorYello:WrapTextInColorCode("/angmini ") .. "to show."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "미니맵 아이콘 비활성화, " 
.. colorYello:WrapTextInColorCode("/angmini ") .. "표시."

T["Left Click: " .. colorYello:WrapTextInColorCode("Config Panel")] = "왼쪽 클릭: " .. colorYello:WrapTextInColorCode("설정 메뉴")
T["Right Click: " .. colorYello:WrapTextInColorCode("Sleep/Wake")] = "오른쪽 클릭: " .. colorYello:WrapTextInColorCode("비활성화/활성화")
T["Middle Button: " .. colorYello:WrapTextInColorCode("Hide Minimap Icon")] = "가운데 버튼: " .. colorYello:WrapTextInColorCode("미니맵 비활성")

T["/angmini"] = "/angmini"

T["Can't change sleep state in combat."] = "Can't change sleep state in combat."

--onekey
T["The next key you press\nwill be set as Angleur Key"] = "The next key you press\nwill be set as Angleur Key"
T["OneKey set to: "] = "OneKey set to: "

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Modifier Keys ") 
.. "won't be recognized when the game is in the " .. colorGrae:WrapTextInColorCode("background. ") 
.. "If you are using the scroll wheel for that purpose. Just bind the wheel alone instead, without modifiers."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. colorYello:WrapTextInColorCode("Modifier Keys ") .. "won't be recognized when the game is in the " .. colorGrae:WrapTextInColorCode("background. ") 
.. "If you are using the scroll wheel for that purpose. Just bind the wheel alone instead, without modifiers."

T["Modifier key "] = "Modifier key "
T["down,\nawaiting additional key press."] = "down,\nawaiting additional key press."
T[", with modifier "] = ", with modifier "
T["OneKey removed"] = "OneKey removed"


--eqMan
T["Can't create Equipment Set without any equippable slotted items. Slot a usable and equippable item to your Extra Items slots first."] = "Can't create Equipment Set without any equippable slotted items. Slot a usable and equippable item to your Extra Items slots first."
T["This is a limitation of Classic(not the case for Cata and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."] = "This is a limitation of Classic(not the case for Cata and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."
T["Created equipment set for " .. colorBlu:WrapTextInColorCode("Angleur" ) .. ". ID is : "] = "Created equipment set for " .. colorBlu:WrapTextInColorCode("Angleur" ) .. ". ID is : "
T["All unslotted items in the set have been set to <ignore slot>."] = "All unslotted items in the set have been set to <ignore slot>."

T["For passive items you'd like to add to your fishing gear, you can use the game's " 
.. colorYello:WrapTextInColorCode("Equipment Manager ") .. "to add them to the " 
.. colorBlu:WrapTextInColorCode("Angleur ") .. "set"] = "For passive items you'd like to add to your fishing gear, you can use the game's " 
.. colorYello:WrapTextInColorCode("Equipment Manager ") .. "to add them to the " 
.. colorBlu:WrapTextInColorCode("Angleur ") .. "set"

T["Couldn't equip slotted item in time before combat"] = "Couldn't equip slotted item in time before combat"

T["Slotted items successfully updated for your " 
.. colorYello:WrapTextInColorCode("Angleur Equipment Set.")] = "Slotted items successfully updated for your " 
.. colorYello:WrapTextInColorCode("Angleur Equipment Set.")

T["   The " .. colorYello:WrapTextInColorCode("Update/Create Set ") .. "Button automatically adds equippable items in your " 
.. colorYello:WrapTextInColorCode"Extra Items " .. "slots to your " .. colorBlu:WrapTextInColorCode("Angleur Set") 
.. ", and creates one if there isn't already.\n\nIf you want to " .. colorRed:WrapTextInColorCode("remove ") 
.. "previously saved slotted items, you need to click the " .. colorRed:WrapTextInColorCode("Delete ") 
.. "Button to the top right, and then re-create the set - or manually change the item set.\n\nYou may also assign " 
.. colorGrae:WrapTextInColorCode("- Passive Items - ") .. "to your ".. colorBlu:WrapTextInColorCode("Angleur Set ") 
.. "manually, and Angleur will swap them in and out like the rest."] = "   The " .. colorYello:WrapTextInColorCode("Update/Create Set ") 
.. "Button automatically adds equippable items in your " .. colorYello:WrapTextInColorCode"Extra Items " 
.. "slots to your " .. colorBlu:WrapTextInColorCode("Angleur Set") .. ", and creates one if there isn't already.\n\nIf you want to " 
.. colorRed:WrapTextInColorCode("remove ") .. "previously saved slotted items, you need to click the " 
.. colorRed:WrapTextInColorCode("Delete ") .. "Button to the top right, and then re-create the set - or manually change the item set.\n\nYou may also assign " 
.. colorGrae:WrapTextInColorCode("- Passive Items - ") .. "to your ".. colorBlu:WrapTextInColorCode("Angleur Set ") 
.. "manually, and Angleur will swap them in and out like the rest."

T["ITEM NOT FOUND IN BAGS. TO USE FOR EQUIPMENT SWAP, EITHER ADD IT MANUALLY TO ANGLEUR SET OR RE-DRAG THE MACRO."] = "ITEM NOT FOUND IN BAGS. TO USE FOR EQUIPMENT SWAP, EITHER ADD IT MANUALLY TO ANGLEUR SET OR RE-DRAG THE MACRO."
T["Equipping of the Angleur set disrupted due to sudden combat"] = "Equipping of the Angleur set disrupted due to sudden combat"


--items
T["Unslotted " .. colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Equipment Set ") 
.. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it."] = "Unslotted " 
.. colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Equipment Set ") 
.. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Fishing Hat") 
.. " detected."] = colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Fishing Hat") .. " detected."

T["For it to work properly, please make sure to add it as a macro like so: "] = "For it to work properly, please make sure to add it as a macro like so: "

T["Otherwise, you will have to manually target your fishing rod every time."
.. "If you want to see an example of how to slot macros, click the " 
..  colorRed:WrapTextInColorCode("[HOW?] ") .. "button on the " 
.. colorYello:WrapTextInColorCode("Extra Tab")] = "Otherwise, you will have to manually target your fishing rod every time."
.. "If you want to see an example of how to slot macros, click the " 
..  colorRed:WrapTextInColorCode("[HOW?] ") .. "button on the " 
.. colorYello:WrapTextInColorCode("Extra Tab")

T["Can't drag item in combat."] = "Can't drag item in combat."
T["Please select a usable item."] = "Please select a usable item."
T["This item does not have a castable spell."] = "This item does not have a castable spell."
T["Can't drag macro in combat."] = "Can't drag macro in combat."
T["link of macro spell: "] = "link of macro spell: "
T["link of macro item: "] = "link of macro item: "

T[colorYello:WrapTextInColorCode("Can't use Macro: ") 
.. "The item used in this macro doesn't have a trackable spell/aura."] = colorYello:WrapTextInColorCode("Can't use Macro: ") 
.. "The item used in this macro doesn't have a trackable spell/aura."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Failed to get macro spell/item. If you are using " 
.. colorYello:WrapTextInColorCode("macro conditions \n") 
.. "you need to drag the macro into the button frame when the conditions are met."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Failed to get macro spell/item. If you are using " .. colorYello:WrapTextInColorCode("macro conditions \n") 
.. "you need to drag the macro into the button frame when the conditions are met."

T["Failed to get macro index"] = "Failed to get macro index"

T["Macro empty"] = "Macro empty"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Macro successfully slotted. If you make changes to it, you need to " 
.. colorYello:WrapTextInColorCode("re-drag ") 
.. "the new version to the slot. You can also delete the macro to save space, Angleur will remember it."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Macro successfully slotted. If you make changes to it, you need to " .. colorYello:WrapTextInColorCode("re-drag ") 
.. "the new version to the slot. You can also delete the macro to save space, Angleur will remember it."

T["Timer set to: "] = "Timer set to: "
T[" minutes, "] = " minutes, "
T[" seconds"] = " seconds"


--tiny_mists
T["Default tiny settings restored"] = "Default tiny settings restored"


--Angleur
T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Thank you for using Angleur!"] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Thank you for using Angleur!"
T["or "] = "or "
T["To access the configuration menu, type "] = "To access the configuration menu, type "

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping. To continue using, type " 
.. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"] = colorBlu:WrapTextInColorCode("Angleur: ")
.. "Sleeping. To continue using, type " .. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"

T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."] = "or "
.. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Is awake. To temporarily disable, type " 
.. colorYello:WrapTextInColorCode("/angsleep ")] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Is awake. To temporarily disable, type " .. colorYello:WrapTextInColorCode("/angsleep ")

T["Angleur unexpected error: Modifier exists, but main key doesn't. Please let the author know."] = "Angleur unexpected error: Modifier exists, but main key doesn't. Please let the author know."

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to " 
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] = "Must be " 
.. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to " 
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "You are running an addon that interferes with" 
.. colorYello:WrapTextInColorCode("Soft-Interact.")] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "You are running an addon that interferes with" .. colorYello:WrapTextInColorCode("Soft-Interact.")

T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) "
.. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact"] = "Angleur Config Panel " 
.. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) "
.. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to reel properly."] = "Must be " 
.. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to reel properly."




T["Nat's Hat"] = "Nat's Hat"
T["Nat's Drinking Hat"] = "Nat's Drinking Hat"
T["Weather-Beaten Fishing Hat"] = "Weather-Beaten Fishing Hat"


T["please choose the toy with left click so that angleur can function properly"] = "please choose the toy with left click so that angleur can function properly"
T["you do not own this toy. please select another"] = "you do not own this toy. please select another"
T["Selected extra toy: "] = "Selected extra toy: "
T["Toy selection deactivated"] = "Toy selection deactivated"

--Cata extra lines
T["Bait"] = "Bait"
T["Couldn't find any bait \n in your bags, feature disabled"] = "Couldn't find any bait \n in your bags, feature disabled"



--Eq set bug fixes
T["Swapback item not found in bags, cannot re-equip."] = "Swapback item not found in bags, cannot re-equip."
T["A bug with the Angleur Set has occurred, where it is set to unequip all gear. " 
.. "Therefore, it has been deleted. If this keeps happening, please contact the Author."] = "A bug with the Angleur Set has occurred, where it is set to unequip all gear. " 
.. "Therefore, it has been deleted. If this keeps happening, please contact the Author."


T["Tuskarr Dinghy"] = "투스카르 나룻배"
T["Anglers Fishing Raft"] = "강태공 낚시 뗏목"
T["Gnarlwood Waveboard"] = "옹이나무 물결타기널"
T["Personal Fishing Barge"] = "개인용 낚싯배"

T["Crate of Bobbers: Can of Worms"] = "낚시찌 상자: 벌레가 든 깡통"
T["Crate of Bobbers: Carved Wooden Helm"] = "낚시찌 상자: 조각한 나무 투구"
T["Crate of Bobbers: Cat Head"] = "낚시찌 상자: 고양이 머리"
T["Crate of Bobbers: Demon Noggin"] = "낚시찌 상자: 악마 머리"
T["Crate of Bobbers: Enchanted Bobber"] = "낚시찌 상자: 마력 깃든 찌"
T["Crate of Bobbers: Face of the Forest"] = "낚시찌 상자: 숲의 얼굴"
T["Crate of Bobbers: Floating Totem"] = "낚시찌 상자: 둥둥 뜨는 토템"
T["Crate of Bobbers: Murloc Head"] = "낚시찌 상자: 멀록 머리"
T["Crate of Bobbers: Replica Gondola"] = "낚시찌 상자: 모형 배"
T["Crate of Bobbers: Squeaky Duck"] = "낚시찌 상자: 고무 오리"
T["Crate of Bobbers: Tugboat"] = "낚시찌 상자: 끌배"
T["Crate of Bobbers: Wooden Pepe"] = "낚시찌 상자: 나무 피프"
T["Bat Visage Bobber"] = "박쥐 얼굴 낚시찌"
T["Limited Edition Rocket Bobber"] = "한정판 로켓 낚시찌"
T["Artisan Beverage Goblet Bobber"] = "장인 음료잔 낚시찌"
T["Organically-Sourced Wellington Bobber"] = "유기적인 웰링턴 낚시찌"

T["Shiny Bauble"] = "반짝이는 미끼"
T["Nightcrawlers"] = "큰지렁이"
T["Bright Baubles"] = "화려한 미끼"
T["Flesh Eating Worm"] = "왕구더기"
T["Aquadynamic Fish Attractor"] = "액체역학 물고기 유인기"
T["Feathered Lure"] = "깃털장식 미끼"
T["Sharpened Fish Hook"] = "날카로운 낚싯바늘"
T["Glow Worm"] = "빛나는 벌레"
T["Heat-Treated Spinning Lure"] = "열처리 회전 미끼"




--________________
--  UNTRANSLATED:
--________________

-- Other addon promotion
T["My Other Addons!"] = "My Other Addons!"
T["Automatic Aquatic Form for ALL CLASSES, ALL THE TIME!\n\nEquip Underlight_Angler when swimming, re-equip your \'Main\' Fishing Rod when not."] = "Automatic Aquatic Form for ALL CLASSES, ALL THE TIME!\n\n"
.. "Equip " .. colorUnderlight:WrapTextInColorCode("Underlight_Angler ") .. "when swimming, re-equip your \'Main\' Fishing Rod when not."
T["Pickpocket overhaul for Rogues!\n\nSingle player RPG-like Pickpocket Prompt System with dynamic keybind(released back when not pick pocketing)."] = "Pickpocket overhaul for Rogues!\n\nSingle player RPG-like Pickpocket Prompt System with dynamic keybind(released back when not pick pocketing)."
T["Two-Way Transformations to Worgens when you cast abilities or use items!\n\nFeatures a built-in drag&drop Macro Maker."] = "Two-Way Transformations to Worgens when you cast abilities or use items!\n\nFeatures a built-in drag&drop " 
.. colorYello:WrapTextInColorCode("Macro Maker.")



-- Major rework to eqMan
T["The following slotted items could not be added to your Angleur Equipment Set: "] = "The following slotted items could not be added to your " .. colorYello:WrapTextInColorCode("Angleur Equipment Set ") .. ":"



-- Recast Key
T["Enable Recast Key"] = "Enable Recast Key"
T["Angleur: VERSION UPDATED. Please re-set your \'OneKey\' from the Config Panel."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "VERSION UPDATED. " .. "Please re-set your " .. colorYello:WrapTextInColorCode("\'OneKey\' ") .. "from the " .. colorYello:WrapTextInColorCode("Config Panel.")


-- New soft interact system for classic
T["Enable Soft Interact"] = "Enable Soft Interact"

T["Shows a visual range indicator when the bobber lands too far for the soft interact system to capture."] = "Shows a visual range indicator when the bobber lands too far for the soft interact system to capture."

T["Warning Sound"] = "Warning Sound"
T["Plays a warning sound when the bobber lands too far for the soft interact system to capture."] = "Plays a " .. colorYello:WrapTextInColorCode("warning sound ") .. "when the bobber lands too far for the soft interact system to capture."

T["Recast When OOB"] = "Recast When OOB"
T["Sets the OneKey/Double-Click to Recast when the bobber lands too far for the soft interact system to capture."] = "Sets the " 
.. colorRed:WrapTextInColorCode("OneKey") .. " / " .. colorRed:WrapTextInColorCode("Double-Click ") .. "to " .. colorYello:WrapTextInColorCode("Recast ") .. "when the bobber lands too far for the soft interact system to capture."

T["Soft Interact in Classic:"] = "Soft Interact in Classic:"

T["Due to a limitation in Classic, the \'soft interact system\' can sometimes fail to catch the bobber when it lands too far.(Demonstrated in the picture)" 
.. "\n\nAngleur is designed to provide workarounds for this. Once enabled, please check out the options that appear below."] = "Due to a limitation in Classic,\nthe " .. colorYello:WrapTextInColorCode("\'soft interact system\' ") 
.. "can sometimes fail to catch the bobber when it lands too far." .. colorGrae:WrapTextInColorCode("\n(Demonstrated in the picture)") .. colorBlu:WrapTextInColorCode("\n\nAngleur ") 
.. "is designed to provide workarounds for this. Once enabled, please check out the " .. colorYello:WrapTextInColorCode("options that appear below.")

-- Bobber scanner for classic
T["Bobber Scanner(EXPERIMENTAL)"] = "Bobber Scanner\n" .. colorBlu:WrapTextInColorCode("(EXPERIMENTAL)")
T["Manually scans for the bobber by moving the camera in a grid.\n\nDIZZY WARNING:\nDo NOT " 
.."use this feature if you are sensitive to rapid movement or any form of fast graphical change.\n\n" 
.."This feature is still in development! With enough good feedback, it can be improved and made much smoother :)"] = "Manually " 
.. "scans for the bobber by moving the camera in a grid.\n\n" .. colorYello:WrapTextInColorCode("DIZZY WARNING:") .. colorRed:WrapTextInColorCode("\nDo NOT ") 
.. "use this feature if you are sensitive to rapid movement or any form of fast graphical change.\n\n"
.. "This feature is still in development! With enough good feedback, it can be improved and made much smoother :)"


T["Bobber Scanner - Dizzy Warning"] = "Bobber Scanner - Dizzy Warning"
T["Do not " 
.."use this feature if you are sensitive to\nrapid movement " 
.. "or any form of fast graphical\nchange. Such as but not limited " 
.. "to:\nPhotosensitive Epilepsy, Vertigo..."] = "Do not " 
.."use this feature if you are sensitive to\nrapid movement " 
.. "or any form of fast graphical\nchange. Such as but not limited " 
.. "to:\n" .. colorYello:WrapTextInColorCode("Photosensitive Epilepsy, Vertigo...")


-- gamepad support for bobber scanner

T["Angleur Bobber Scanner: Gamepad Cursor has been enabled. Please move it to the indicated area to start using."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner:") 
.. colorYello:WrapTextInColorCode(" Gamepad Cursor ") .. "has been enabled. Please move it to the " .. colorRed:WrapTextInColorCode("indicated area ") 
.. "to start using."

T["GAMEPAD MODE: After casting \'fishing\', move the cursor that appears into the box below to use."] = colorPurple:WrapTextInColorCode("GAMEPAD MODE:\n") 
.. "After casting " .. colorBlu:WrapTextInColorCode("\'fishing\'") .. ", move the cursor\nthat appears into the " 
.. colorRed:WrapTextInColorCode("box below ") .. "to use."

T["Angleur Bobber Scanner: Gamepad Detected! Cast fishing once to trigger cursor mode, then place it in the indicated box."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner: ")
.. "Gamepad Detected! " .. "Cast " .. colorYello:WrapTextInColorCode("fishing ") .. "once to trigger " 
.. colorYello:WrapTextInColorCode("cursor mode") .. ", then place it in the " .. colorRed:WrapTextInColorCode("indicated box.")


T["Angleur Bobber Scanner: Please move the Gamepad Cursor that appears into the inticated box."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner: ")
.. "Please move the Gamepad " .. colorYello:WrapTextInColorCode("Cursor ") .. "that appears into the " .. colorRed:WrapTextInColorCode("inticated box.")


-- Bobber Scanner Config

T["Bobber Scanner Configuration"] = "Bobber Scanner Configuration"
T["Shows how far the camera will move downward from the \'Centered Position\' to start the scan. " 
.. "Amount is based on your Max Zoom and chosen \'Elevation\'(Bobber Scanner Menu)"] = colorWhite:WrapTextInColorCode("Shows ") 
.. colorDarkRed:WrapTextInColorCode("how far ") .. colorWhite:WrapTextInColorCode("the camera will move ") .. colorDarkRed:WrapTextInColorCode("downward\n") 
.. colorWhite:WrapTextInColorCode("from the ") .. colorYello:WrapTextInColorCode("\'Centered Position\' ")
.. colorWhite:WrapTextInColorCode("to start the scan.\nAmount is based on your ") .. colorYello:WrapTextInColorCode("Max Zoom ") 
.. "and\nchosen" .. colorYello:WrapTextInColorCode("\'Elevation\' ") ..  colorGrae:WrapTextInColorCode("(Bobber Scanner Menu)")

T["ELEVATION:"] = colorUnderlight:WrapTextInColorCode("ELEVATION:")
T["Reset to Defaults"] = "Reset to Defaults"

T["Bobber Scan: Scan unsuccessful. Try changing the \'Elevation\' setting, "
.. "or the width of the search area in the Scanner menu by clicking the Gear icon next to the mouse drop-off box"] = colorBlu:WrapTextInColorCode("Bobber Scan: ") 
.. "Scan unsuccessful." .. " Try changing the " .. colorYello:WrapTextInColorCode("\'Elevation\' ") .. "setting, " .. "or the width of the search area in the Scanner menu by clicking the " 
.. colorYello:WrapTextInColorCode("Gear ") .. "icon next to the mouse " .. colorGreen:WrapTextInColorCode("drop") .. colorRed:WrapTextInColorCode("-off ") 
.. "box."

T["Scan Width"] = colorYello:WrapTextInColorCode("Scan Width")
T["Scan Speed"] = colorYello:WrapTextInColorCode("Scan Speed")
T["Start Delay"] = colorYello:WrapTextInColorCode("Start Delay")
T["sec"] = "sec"


T["Same Elevation"] = "Same Elevation"
T["Use this when you are on the same level as the water, or close to it."] = colorWhite:WrapTextInColorCode("Use this when you are on the same level as the water, or close to it.")

T["Lower Elevation"] = "Lower Elevation"
T["Use this when the water is lower level than you."] = colorWhite:WrapTextInColorCode("Use this when the water is lower level than you.")

T["Inside Water"] = "Inside Water"
T["Use this when you are inside the water, making the bobber land higher than you."] = colorWhite:WrapTextInColorCode("Use this when you are inside the water, making the bobber land higher than you.")

T["Both"] = "Both"
T["Use this if you are fishing in a spot where the elevation constantly changes from level to lower and vice versa." 
.. " The scan covers twice the height as usual, thus taking twice as long."] = colorWhite:WrapTextInColorCode("Use this if you are fishing in a spot where the elevation\nconstantly changes ")
.. colorWhite:WrapTextInColorCode("from ") .. "same " .. colorWhite:WrapTextInColorCode("to ") .. "lower, " .. colorWhite:WrapTextInColorCode("and vice versa.\n\n") 
.. colorWhite:WrapTextInColorCode("The scan covers twice the height as usual, thus taking twice as long.")

T["Angleur Bobber Scanner : WARNING! Camera Zoom changed during scan. "
.. "This can (and will) disrupt success of the bobber scanner, and is likely "
.. "due to a wall or some other game world object behind your character. To fix this, " 
.. "either move to a clearing, or lower the \'Max Camera Distance\' in "
.. "the Game's Options under Options->Gameplay->Controls->Camera."
.. "You can turn this warning off in the Bobber Scanner's Config Menu by clicking the gear icon next to the mouse drop-off box."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner :" )
.. colorRed:WrapTextInColorCode(" WARNING! ") .. colorYello:WrapTextInColorCode("Camera Zoom ") 
.. "changed during scan. " .. "This can (and will) disrupt success of the bobber scanner, and is likely "
.. "due to a wall or some other game world object " .. colorYello:WrapTextInColorCode("behind your character. ") .. "To fix this, " 
.. "either move to a clearing, or lower the " .. colorYello:WrapTextInColorCode("\'Max Camera Distance\' ") 
.. "in the Game's Options under " .. "Options" .. colorYello:WrapTextInColorCode("->") .. "Gameplay" .. colorYello:WrapTextInColorCode("->") 
.. "Controls" .. colorYello:WrapTextInColorCode("->") .. "Camera." .. "You can turn this warning off in the Bobber Scanner's Config Menu by clicking the " 
.. colorYello:WrapTextInColorCode("gear icon ") .. "next to the mouse drop-off box."

T["Disable Wall Warning"] = "Disable Wall Warning"
T["When unchecked, Bobber Scanner warn you with a chat message when your " 
.. "Camera Zoom changes during scan(when it's not supposed to). It's usually due to a wall that's behind you, and it is recommended to " 
.. "keep the warning \'enabled\' so you can know when a fishing spot might cause issues."] = "When unchecked, Bobber Scanner warn you with a chat message when your " 
.. colorYello:WrapTextInColorCode("Camera Zoom ") .. "changes during scan(when it's not supposed to).\n\nIt's usually due to a wall that's behind you, and it is " 
.. colorYello:WrapTextInColorCode("recommended ") .. "to " .. "keep the warning " .. colorGreen:WrapTextInColorCode("\'enabled\' ") .. "so you can know when a fishing spot might cause issues."

T["Niche functionality plugin for Angleur. Adding niche user requests through this plugin!"] = "Niche functionality plugin for Angleur. Adding niche user requests through this plugin!"





--________________________________________
-- New Plater Fix Changes for patch 2.6.1
--________________________________________
T["Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ") 
.. "General Settings" .. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"] = "Plater " 
.. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ") 
.. "General Settings" .. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"

T["Has been " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to be able to " 
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] = "Has been " .. colorGreen:WrapTextInColorCode("checked ON ") 
.. "for Angleur's keybind to be able to " .. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."


T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Soft Interact has been turned " .. colorGreen:WrapTextInColorCode("ON ") .. "for you to be able to ".. colorYello:WrapTextInColorCode("Reel/Loot ") 
.. "your catches. The previous values will be restored upon logout, so that if you uninstall Angleur you will have them back to normal."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Soft Interact has been turned " .. colorGreen:WrapTextInColorCode("ON ") .. "for you to be able to ".. colorYello:WrapTextInColorCode("Reel/Loot ")
.. "your catches. The previous values will be restored upon logout, so that if you uninstall Angleur you will have them back to normal."


T["If you want Soft-Interact to be " .. colorRed:WrapTextInColorCode("TURNED OFF ") .. "when not fishing, go to:\n" 
.. "Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact\nand check it " 
.. colorGreen:WrapTextInColorCode("ON.")] = "If you want Soft-Interact to be " .. colorRed:WrapTextInColorCode("TURNED OFF ") .. "when not fishing, go to:\n" 
.. "Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact\nand check it " 
.. colorGreen:WrapTextInColorCode("ON.")

T["To stop seeing these messages, go to:"] = "To stop seeing these messages, go to:"
T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") 
.. "Tiny tab(tab 3),  and disable \'Login Messages\'"] = "Angleur Config Panel " 
.. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3),  and disable \'Login Messages\'"


--____________________________________________
--    Dead/Ghost Form checks patch 2.6.1
--____________________________________________
T["Can't change sleep state while in ghost form."] = "Can't change sleep state while in ghost form."
T["Item equip interrupted by death/ghost-form"] = "Item equip interrupted by death/ghost-form"
T["Equipping of the Angleur set disrupted due to sudden death/ghost-form"] = "Equipping of the Angleur set disrupted due to sudden death/ghost-form"
T["Can't add toys while dead"] = "Can't add toys while dead"

-- Thing I forgot for the bobber scanner
T["Place your cursor in the box\nbelow for the scanner to work."] = "Place your cursor in the box\nbelow for the scanner to work."
T["Mouse needs to be in the indicated area for the scanner to work properly."] = "Mouse needs to be in the indicated area for the scanner to work properly."

-- Random Raft
T["Random Raft"] = "Random Raft"



-- NicheOptions Tuskarr Spear
T["Angleur: Sharpened Tuskarr Spear(MoP) detected."] = colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Sharpened Tuskarr Spear(MoP)") .. " detected."
T["Due to the fishing rod taking up the mainhand slot in Classic, this item cannot be added to the Auto-Equip System."] = "Due to the fishing rod taking up the mainhand slot in Classic, this item cannot be added to the Auto-Equip System."
T["Please download the: "] = "Please download the: "
T[" plugin from Curseforge if you want Angleur to use it for you."] = " plugin from Curseforge if you want Angleur to use it for you."


-- Sleep/Wake with Rod disable (Mists)
T["Sleep Without Fishing Rod"] = "Sleep Without Fishing Rod"

T["If checked, Angleur will go to Sleep when you unequip your fishing rod.\n\nUncheck if you want to fish without a rod in the main hand slot. On by default."] = "If checked, Angleur will go to " 
.. colorYello:WrapTextInColorCode("Sleep ") .. "when you unequip your fishing rod.\n\n" .. colorGrae:WrapTextInColorCode("Uncheck if you want to fish without a rod in the main hand slot. On by default.")

T["Angleur will no longer Sleep/Wake based on Fishing Rod equip status."] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "will no longer " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. "based on Fishing Rod equip status."



-- Swim Release Toggle
T["Release When Swimming"] = "Release When Swimming"

T["If checked, the only action your OneKey/DoubleClick will perform while swimming will be casting rafts.\n(If you already have one, the key will be released.)"] = "If checked, " .. "the only action your "
..colorYello:WrapTextInColorCode("OneKey / DoubleClick ") .. "will perform " .. colorDarkBlu:WrapTextInColorCode("while swimming ") .. "will be casting " .. colorBrown:WrapTextInColorCode("rafts.") .. "\n(If you already have one, the key will be released.)"

T["\n\nChecked by default, uncheck if you want to use Extra Toys, Items, Spells while submerged in water."] = colorGrae:WrapTextInColorCode("\n\nChecked by default, uncheck if you want to use Extra Toys, Items, Spells while submerged in water.")

T["Angleur will only have you cast rafts while swimming, then release the key afterward."] = "Angleur will only have you cast rafts while swimming, then release the key afterward."

T["Angleur will no longer release your keybind while swimming."] = "Angleur will no longer release your keybind while swimming."


-- Missing Tooltips
T["If checked, Angleur will show developer debug messages. Useful to display when submitting bug reports through discord!\n\n" 
.. "Keep unchecked during regular use."] = "If checked, Angleur will show developer debug messages.\nUseful to display when submitting bug reports through " .. colorPurple:WrapTextInColorCode("discord!\n\n") 
.. colorGrae:WrapTextInColorCode("Keep unchecked during regular use.")

T["When unchecked, Angleur will stop showing Login messages.\n\nLogin messages may contain useful tips, and can be re-enabled at any time."] = "When unchecked, Angleur will stop showing Login messages.\n\n"
.. colorGrae:WrapTextInColorCode("Login messages may contain useful tips, and can be re-enabled at any time.")

T["If checked, Angleur will adjust your audio settings for you when you cast your rod, and restore them to the previous values when you reel/loot.\n\n" 
.. "Ambience & Music will be muted.\nSound Effects will be turned up.\n\nWhile Angleur is awake, \'Sound in Background\' will also be enabled(restored to previous on sleep).\n\n"
.. "If you want to change the adjusted audio volume, go to Angleur->Tiny->Master Volume(Ultra Focus) and adjust from the slider."] = "If checked, Angleur will adjust your audio " 
.. "settings for you when you cast your rod, and restore them to the previous values when you reel/loot.\n\n" 
.. colorYello:WrapTextInColorCode("Ambience & Music ") .. "will be " .. colorRed:WrapTextInColorCode("muted.")
.. colorYello:WrapTextInColorCode("\nSound Effects ") .. "will be " .. colorGreen:WrapTextInColorCode("turned up.") .. "\n\nWhile Angleur is awake, " .. colorYello:WrapTextInColorCode("\'Sound in Background\' ") 
.. "will also be enabled(restored to previous on sleep).\n\n" .. "If you want to " .. colorUnderlight:WrapTextInColorCode("change ")
.. "the adjusted audio volume, go to " .. colorBlu:WrapTextInColorCode("Angleur ") .. "-> " .. colorBlu:WrapTextInColorCode("Tiny ") .. "-> " 
.. colorBlu:WrapTextInColorCode("Master Volume(Ultra Focus) ") .. "and adjust from the slider."


T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)\n\n" 
.. "Pick \'Random Raft\' to get a different one every time!"] = "Pick a " .. colorBrown:WrapTextInColorCode("Raft") .. ", and Angleur will have you use it when you are in " 
.. colorDarkBlu:WrapTextInColorCode("water") .. "!\n"  .. "(Also keep the buff going afterwards)\n\n" .. "Pick " .. colorYello:WrapTextInColorCode("\'Random Raft\' ") 
.. "to get a different one every time!"

T["If checked, Angleur will have you keep \'Reusable Oversized Bobber\' applied."] = "If checked, Angleur will have you keep " 
.. colorYello:WrapTextInColorCode("\'Reusable Oversized Bobber\' ") .. "applied."

T["Pick a Bobber from the Crate of Bobbers, and Angleur will have you keep it applied!\n\n" 
.. "Pick \'Random Bobber\' to get a different one every time!"] = "Pick a Bobber from the " .. colorYello:WrapTextInColorCode("Crate of Bobbers") 
.. ", and Angleur will have you keep it applied!\n\n" .. "Pick " .. colorYello:WrapTextInColorCode("\'Random Bobber\' ") .. "to get a different one every time!"


T["Let Angleur take care of Audio & Loot settings for you."] = "Let Angleur take care of " .. colorYello:WrapTextInColorCode("Audio") .. " & " 
.. colorYello:WrapTextInColorCode("Loot ") .. "settings for you."

T["Bind a dedicated \'Re-Cast Key\'.\n\nWill be released back to you when not fishing."] = "Bind a dedicated " .. colorYello:WrapTextInColorCode("\'Re-Cast Key\'.\n\n")
.. colorGrae:WrapTextInColorCode("Will be released back to you when not fishing.")

T["\n(Released BACK in Combat!)"] = colorGrae:WrapTextInColorCode("\n(Released BACK in Combat!)\n")

T["Note for Mists:"] = "Note for Mists:"
T["Pick a Bait Item from the ones in your bags, and Angleur will keep it applied!\n\nMake sure you pick one whose level isn't higher than yours."] = "Pick a " 
.. colorYello:WrapTextInColorCode("Bait Item ") .."from the ones in your bags, and Angleur will keep it applied!" 
.. colorGrae:WrapTextInColorCode("\n\nMake sure you pick one whose level isn't higher than yours.")

T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)"] = "Pick a " .. colorBrown:WrapTextInColorCode("Raft") .. ", and Angleur " 
.. "will have you use it when you are in " .. colorDarkBlu:WrapTextInColorCode("water") .. "!\n(Also keep the buff going afterwards)"


-- Forgotten line
T["This is a limitation of Classic(not the case for Mists and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."] = "This " 
.. "is a limitation of Classic(not the case for Mists and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."