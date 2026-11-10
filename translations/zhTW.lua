if (GAME_LOCALE or GetLocale()) ~= "zhTW" then
  return
end

local T = Angleur_Translate

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


-- Machine-translated entries added for missing locale strings.

T["Toggle Background Audio"] = "切換背景音訊"

T["Oversized Bobber"] = "超大浮標"

T["Extra Items / Macros"] = "額外項目/宏"

T["Recast When OOB"] = "OOB 時重鑄"

T["Mouse needs to be in the indicated area for the scanner to work properly."] = "滑鼠需要位於指定區域，掃描器才能正常運作。"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Is awake. To temporarily disable, type "
.. colorYello:WrapTextInColorCode("/angsleep ")] = colorBlu:WrapTextInColorCode("Angleur：") .. " 醒了。若要暫時停用，請輸入 " .. colorYello:WrapTextInColorCode("/angsleep ")

T["(If it lands too far, the\nsoft-interact will miss it.)"] = "（如果落地太遠，\n軟交互會錯過它。 ）"

T["My Other Addons!"] = "我的其他插件！"

T["(You can redo it later by clicking the Redo Button\nin the Tiny Panel)"] = "（您可以稍後透過點擊「重做」按鈕來重做\n在小面板中）"

T["If there is an object BEHIND your character that forces your camera angle to change, try setting it to a lower value."] = colorWhite:WrapTextInColorCode("如果角色後面有一個物體迫使你的相機角度改變，請嘗試將其設定為 ") .. colorRed:WrapTextInColorCode("lower ") .. colorWhite:WrapTextInColorCode("value.")

T["Temp. Auto Loot "] = "溫度。自動掠奪"

T["Enable Recast Key"] = "啟用重鑄金鑰"

T["/angleur"] = "/角度者"

T["Use this when you are inside the water, making the bobber land higher than you."] = colorWhite:WrapTextInColorCode("当您在水中时使用此功能，使浮子着陆比您更高。 ")

T["And lastly, the " .. colorYello:WrapTextInColorCode("Create & Add ") .. "button Creates an item set for you and automatically adds your "
.. "slotted items to it.\n\nNow, Angleur will automatically equip your slotted items when you "
.. colorYello:WrapTextInColorCode("wake ") .."it up, and restore previous items when you put it back to "
.. colorYello:WrapTextInColorCode("sleep.")] = "最后，" .. colorYello:WrapTextInColorCode("创建并添加") .. "按钮为您创建一个项目集并自动将您的已开槽项目添加到其中。\n\n現在，當您 " .. colorYello:WrapTextInColorCode(" 喚醒 ") .. "it 時，Angleur 將自動裝備您的開槽物品，並在您將其放回 " .. colorYello:WrapTextInColorCode("sleep 時恢復之前的物品。 ")

T["This will restart the tutorial, are you sure?"] = "這將重新開始教程，您確定嗎？"

T["Due to a limitation in Classic, the \'soft interact system\' can sometimes fail to catch the bobber when it lands too far.(Demonstrated in the picture)"
.. "\n\nAngleur is designed to provide workarounds for this. Once enabled, please check out the options that appear below."] = "由於經典的限制，\n" .. colorYello:WrapTextInColorCode("“软交互系统”") .. "有时会在浮标落地太远时无法抓住浮标。 " .. colorGrae:WrapTextInColorCode("\n（如圖）") .. colorBlu:WrapTextInColorCode("\n\nAngleur ") .. " 旨在为此提供解决方法。启用后，请查看下面显示的 " .. colorYello:WrapTextInColorCode(" 选项。 ")

T["Weather-Beaten Fishing Hat"] = "飽經風霜的漁帽"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to "
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] = "必須在 [[/colorGreen]] 上選取 [[colorGreen]]，才能將 Angleur 的按鍵綁定到 " .. colorYello:WrapTextInColorCode(" 捲軸/掠奪 ") .. " 您的捕獲物。"

T["Bobber Scanner(EXPERIMENTAL)"] = "浮標掃描儀\n" .. colorBlu:WrapTextInColorCode("（實驗）")

T["Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ")
.. "General Settings" .. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"] = "Plater " .. colorYello:WrapTextInColorCode("-> ") .. "高級 " .. colorYello:WrapTextInColorCode("-> ") .. "常規設定" .. colorYello:WrapTextInColorCode(":") .. " 在遊戲物件上顯示軟互動*"

T["Nat's Hat"] = "納特的帽子"

T["down,\nawaiting additional key press."] = "下來，\n等待额外的按键。"

T["First install tutorial restarting."] = "首先安裝教學重啟。"

T["Left Click: " .. colorYello:WrapTextInColorCode("Config Panel")] = "Left Click: " .. colorYello:WrapTextInColorCode("Config Panel")

T["Angleur Bobber Scanner: Please move the Gamepad Cursor that appears into the inticated box."] = colorBlu:WrapTextInColorCode("Angleur Bobber 扫描仪：") .. "请将出现在 " .. colorRed:WrapTextInColorCode(" 提示框中的游戏手柄 [[colorYello]] 光标 [[/colorYello]] 移动。 ")

T["\n\nChecked by default, uncheck if you want to use Extra Toys, Items, Spells while submerged in water."] = colorGrae:WrapTextInColorCode("\n\n默认选中，如果您想在浸入水中时使用额外的玩具、物品、法术，请取消选中。 ")

T["Angleur Warning: Plater"] = "Angleur 警告：盤子"

T["This item does not have a castable spell."] = "該物品沒有可施放的法術。"

T["Flesh Eating Worm"] = "食肉蠕蟲"

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now "
.. colorYello:WrapTextInColorCode("dismount ") .. "you"] = colorBlu:WrapTextInColorCode("Angleur ") .. " 現在將 " .. colorYello:WrapTextInColorCode(" 卸載 ") .. "you"

T["Sharpened Fish Hook"] = "尖銳的魚鉤"

T["One-Key Fishing Mode"] = "一鍵釣魚模式"

T["Note for Cata:"] = "卡塔注意事項："

T["Make sure this box is checked!"] = "確保選中此框！"

T["Timer set to: "] = "定時器設定為："

T["This is a limitation of Classic(not the case for Cata and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."] = "這是 Classic 的限制（Cata 和 Retail 的情況除外），因為它缺乏適當的內建裝置管理器，允許您將被動物品插入 Angleur 套裝。"

T["Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"] = "請設定一個按鍵綁定\n使用一鍵\n釣魚方法\n使用\n上面的按鈕"

T["Crate of Bobbers: Can of Worms"] = "浮標箱：蠕蟲罐頭"

T["One-Key NOT SET! To set,\nopen config menu with:"] = "一鍵未設定！要設置，\n開啟配置選單："

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to function properly."] = "必須在 [[/colorGreen]] 上檢查 [[colorGreen]]，Angleur 才能正常運作。"

T["Feathered Lure"] = "羽毛誘餌"

T["You can re-enable it from the"] = "您可以從以下位置重新啟用它"

T["Equipping of the Angleur set disrupted due to sudden combat"] = "由於突然的戰鬥，Angler 套裝的裝備中斷"

T["Update"] = "更新"

T[colorYello:WrapTextInColorCode("Config Menu ") .. "accessed by: "
.. colorYello:WrapTextInColorCode("/angleur ") .. " or  "
.. colorYello:WrapTextInColorCode("/angang")] = colorYello:WrapTextInColorCode("設定選單 ") .. "存取方式：" .. colorYello:WrapTextInColorCode("/angleur ") .. " 或 " .. colorYello:WrapTextInColorCode("/angang")

T["If enabled, Angleur will turn on \"Sound in the Background\" when awake, and restore it to its previous value when sleeping."
.. "\n\nOnly disable if you NEVER want background sound to be on, or there is an error due to a clash with another addon."] = "若啟用，Angleur 將在 " .. colorGreen:WrapTextInColorCode("awake") .. " 時將 " .. colorGreen:WrapTextInColorCode(" 設為 ") .. colorYello:WrapTextInColorCode("「背景聲音」") .. "，並在 [[colorRed]]sleeANGLEURMARK91ANGLEURMARK91.ANGLEURMARKMARLE UR\n\n僅當您不想開啟背景聲音，或由於與另一個外掛程式衝突而出現錯誤時才停用。 [[/colorGrae]]"

T["Please select a usable item."] = "請選擇一個可用的項目。"

T["Angleur Bobber Scanner: Gamepad Detected! Cast fishing once to trigger cursor mode, then place it in the indicated box."] = colorBlu:WrapTextInColorCode("Angleur Bobber 掃描器：") .. " 偵測到遊戲手把！施放" .. colorYello:WrapTextInColorCode("钓鱼") .. "一次即可触发" .. colorYello:WrapTextInColorCode("光标模式") .. "，然后将其放入" .. colorRed:WrapTextInColorCode("指示的框中。 ")

T["Soft target icon for game objects disabled."] = "已停用遊戲物件的軟目標圖示。"

T["Right Click to temporarily put Angleur to sleep. zzz..."] = "右鍵點選可暫時讓 Angleur 進入睡眠狀態。茲茲..."

T["login messages re-enabled"] = "重新啟用登入訊息"

T["Redo Tutorial"] = "重做教程"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping. To continue using, type "
.. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"] = colorBlu:WrapTextInColorCode("Angleur：") .. "正在睡覺。若要繼續使用，請再次輸入 " .. colorYello:WrapTextInColorCode("/angsleep ") .. "，"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Minimap Icon hidden, "
.. colorYello:WrapTextInColorCode("/angmini ") .. "to show."] = colorBlu:WrapTextInColorCode("Angleur：") .. "小地圖圖示隱藏，" .. colorYello:WrapTextInColorCode("/angmini ") .. "顯示。"

T["Nightcrawlers"] = "夜行者"

T["Personal Fishing Barge"] = "私人釣魚駁船"

T["Yes"] = "是的"

T["link of macro spell: "] = "宏咒語連結："

T["Bat Visage Bobber"] = "蝙蝠臉浮標"

T["Clicking on the button\nthat appears below\nonce this option is selected."] = "點擊按鈕\n下面出現的\n一旦選擇此選項。"

T["Standard"] = "標準"

T["Release When Swimming"] = "游泳時鬆開"

T["Plays a warning sound when the bobber lands too far for the soft interact system to capture."] = "當浮標著陸距離太遠而軟互動系統無法捕捉時，會播放 " .. colorYello:WrapTextInColorCode(" 警告聲 ") .. "。"

T["Angleur Bobber Scanner: Gamepad Cursor has been enabled. Please move it to the indicated area to start using."] = colorBlu:WrapTextInColorCode("Angleur Bobber 掃描器：") .. colorYello:WrapTextInColorCode(" 遊戲手把遊標 ") .. " 已啟用。請將其移至" .. colorRed:WrapTextInColorCode("指定區域") .. "開始使用。"

T["You can enable\n\nRafts,\n\nBobbers,\n\nand Ultra Focus(Audio/Temporary Auto Loot)\n\nby checking these boxes."] = "您可以啟用\n\n木筏,\n\n浮標，\n\n和超聚焦（音訊/臨時自動戰利品）\n\n透過選取這些方塊。"

T[colorBrown:WrapTextInColorCode("Extra Items/Macros\n\n")  .. "You can " .. colorYello:WrapTextInColorCode("Drag ")
.. "items or macros here to add them to your Angleur rotation.\n\n" .. "These can be fishing hats, throwable fish, spells...\n\n"
.. "You can even set custom timers for them by clicking the " .. colorYello:WrapTextInColorCode("stopwatch ")
.. "icon that appears once you slot an item/macro.\n\nClick "
.. colorYello:WrapTextInColorCode("Okay ") .. "to move on."] = colorBrown:WrapTextInColorCode("額外項目/宏\n\n") .. "您可以將 " .. colorYello:WrapTextInColorCode(" 專案或巨集拖曳到此處，將它們新增至您的 Angleur 旋轉中。\n\n這些可以是漁帽、可投擲的魚、咒語...\n\n您甚至可以透過點擊插入項目/巨集後出現的 [[colorYello]] 秒錶 ") .. "icon 來為它們設定自訂計時器。\n\n點選 " .. colorYello:WrapTextInColorCode(" 好的 ") .. " 繼續。"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "You are running an addon that interferes with"
.. colorYello:WrapTextInColorCode("Soft-Interact.")] = colorBlu:WrapTextInColorCode("Angleur：") .. "您正在執行一個幹擾 " .. colorYello:WrapTextInColorCode("Soft-Interact.") .. " 的插件"

T["Scan Width"] = colorYello:WrapTextInColorCode("掃描寬度")

T["If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ")
.. "when you use OneKey/DoubleClick.\n\n"
.. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")] = "如果選中，當您使用 OneKey/DoubleClick 時，Angleur 將使您 " .. colorYello:WrapTextInColorCode("dismount ") .. "。\n\n" .. colorGrae:WrapTextInColorCode("安裝後您的金鑰將不再釋放。 ")

T["Shows a visual range indicator when the bobber lands too far for the soft interact system to capture."] = "當浮標著陸距離太遠而軟交互系統無法捕獲時，顯示可視範圍指示器。"

T["Place your cursor in the box\nbelow for the scanner to work."] = "將遊標放在框中\n下面讓掃描器工作。"

T["Toy selection deactivated"] = "玩具選擇已停用"

T["Crate of Bobbers: Carved Wooden Helm"] = "浮標箱：雕刻木頭盔"

T["Artisan Beverage Goblet Bobber"] = "工匠飲料高腳杯浮子"

T["Bobber Scan: Scan unsuccessful. Try changing the \'Elevation\' setting, "
.. "or the width of the search area in the Scanner menu by clicking the Gear icon next to the mouse drop-off box"] = colorBlu:WrapTextInColorCode("Bobber 掃描：") .. "掃描不成功。嘗試更改 " .. colorYello:WrapTextInColorCode("「海拔」") .. " 設置，或透過點擊滑鼠 " .. colorGreen:WrapTextInColorCode("drop") .. colorRed:WrapTextInColorCode(" 旁的 [[colorYello]]Gear [[/colorYello]]icon 關閉 ") .. "box，掃描器選單中搜尋區域的寬度。"

T[colorPurple:WrapTextInColorCode("Extra Toys\n\n")  .. "You can select a toy from the " .. colorYello:WrapTextInColorCode("Toy Box ")
.. "to add it to your Angleur rotation.\n\n Click on an empty slot to open toy selection, or click next to move on.\n\n"
.. "Note: Not every toy will work, some silence you so you can't fish etc. Experiment around!"] = colorPurple:WrapTextInColorCode("額外玩具\n\n") .. "您可以從 " .. colorYello:WrapTextInColorCode("T 玩具盒 ") .. " 中選擇一個玩具，將其加入您的 Angleur 旋轉中。\n\n 點擊空槽以開啟玩具選擇，或按一下下一步繼續。\n\n注意：不是每個玩具都能用，有些玩具會讓你安靜下來，這樣你就不能釣魚等等。嘗試一下！"

T["Spell/Item has no Cooldown/Aura?\n"
.. "Click " .. colorYello:WrapTextInColorCode("the Stopwatch ") .. "to set a manual timer.\n"
.. colorYello:WrapTextInColorCode("                                                 (minutes:seconds)")] = "法術/物品沒有冷卻時間/光環？\n點選秒錶 " .. colorYello:WrapTextInColorCode(" ") .. " 設定手動計時器。\n" .. colorYello:WrapTextInColorCode("（分：秒）")

T["Automatic Aquatic Form for ALL CLASSES, ALL THE TIME!\n\nEquip Underlight_Angler when swimming, re-equip your \'Main\' Fishing Rod when not."] = "适合所有级别、任何时间的自动水上运动！\n\n游泳時裝備 " .. colorUnderlight:WrapTextInColorCode("Underlight_Angler ") .. "，不游泳時重新裝備您的「主」釣竿。"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ")
.. "detected."] = colorBlu:WrapTextInColorCode("Angleur：偵測到 ") .. colorYello:WrapTextInColorCode(" 平板 ") .. "。"

T["Default tiny settings restored"] = "恢復預設微小設定"

T["Both"] = "兩個都"

T["All unslotted items in the set have been set to <ignore slot>."] = "集合中所有未插入槽位的項目均已設定為<忽略槽位>。"

T["Angleur will only have you cast rafts while swimming, then release the key afterward."] = "Angleur 只會讓你在游泳時投筏，然後放開鑰匙。"

T["If checked, the only action your OneKey/DoubleClick will perform while swimming will be casting rafts.\n(If you already have one, the key will be released.)"] = "如果选中，您的 " .. colorYello:WrapTextInColorCode("OneKey / DoubleClick ") .. " 将在游泳时执行 " .. colorDarkBlu:WrapTextInColorCode(" 的唯一操作 ") .. " 将投射 " .. colorBrown:WrapTextInColorCode("rafts.") .. "\n（如果您已經擁有，密鑰將被釋放。）"

T["Let Angleur take care of Audio & Loot settings for you."] = "讓 Angleur 為您處理 " .. colorYello:WrapTextInColorCode("Audio") .. " 和 " .. colorYello:WrapTextInColorCode("Loot ") .. " 設定。"

T["If checked, Angleur will go to Sleep when you unequip your fishing rod.\n\nUncheck if you want to fish without a rod in the main hand slot. On by default."] = "如果选中，当您卸下钓鱼竿时，Angleur 将进入 " .. colorYello:WrapTextInColorCode(" 睡眠 ") .. "。\n\n" .. colorGrae:WrapTextInColorCode("如果您想在主手槽中没有鱼竿的情况下钓鱼，请取消选中。預設開啟。 ")

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Thank you for using Angleur!"] = colorBlu:WrapTextInColorCode("Angleur：") .. "感謝您使用 Angleur！"

T["Select which mouse button by:"] = "透過以下方式選擇滑鼠按鈕："

T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)\n\n"
.. "Pick \'Random Raft\' to get a different one every time!"] = "選擇一個 " .. colorBrown:WrapTextInColorCode("Raft") .. "，Angleur 會讓您在 " .. colorDarkBlu:WrapTextInColorCode("water") .. " 中使用它！\n（之後也要保持buff）\n\n選擇 " .. colorYello:WrapTextInColorCode("“隨機木筏”") .. "，每次都會獲得不同的！"

T["Crate of Bobbers: Squeaky Duck"] = "浮標箱：吱吱鴨"

T["You can support the project\nby donating on " .. colorYello:WrapTextInColorCode("Ko-Fi! ")] = "您可以支持該項目\n透過在 " .. colorYello:WrapTextInColorCode("Ko-Fi 上捐款！ ")

T["Crate of Bobbers: Murloc Head"] = "浮標箱：魚人頭"

T["The following slotted items could not be added to your Angleur Equipment Set:"] = "以下開槽物品無法加入您的 " .. colorYello:WrapTextInColorCode("Angleur 設備套裝 ") .. " 中："

T["Double Click"] = "按兩下"

T["Angleur will no longer release your keybind while swimming."] = "Angleur 在游泳時將不再釋放你的按鍵綁定。"

T["Macro-Bound Key to find and mark Void Pools easily!\n\nWhen you press it, if there is a nearby Void Pool, it will be marked on your minimap & in-game with a skull marker."
    .. "\n\nAlso plays a cool sound effect and a scan animation under your mouse cursor"] = "巨集綁定鍵可輕鬆找到和標記虛空池！\n\n当您按下它时，如果附近有 " .. colorDarkBlu:WrapTextInColorCode(" 虚空池") .. "，它将在您的小地图上和游戏中用头骨标记进行标记。 " .. colorGrae:WrapTextInColorCode("\n\n还在鼠标光标下播放很酷的音效和扫描动画")

T["Soft Interact in Classic:"] = "經典中的軟互動："

T["Extra Toys"] = "額外的玩具"

T["Sleeping. Zzz...\n"] = "睡眠。茲茲..."

T["Fish, Reel, cast Toys, Items and Macros using double mouse clicks!\n"] = "使用滑鼠雙擊即可釣魚、繞線、投擲玩具、物品和巨集！"

T["Disable Soft Icon"] = "禁用軟圖示"

T["Gnarlwood Waveboard"] = "節木波浪板"

T["Okay"] = "好的"

T["Audio"] = "聲音的"

T["Angleur Warning"] = "釣魚者警告"

T[colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Visual:\n\n") .. "Shows what your next input will do.\n"
.. "Drag and place it anywhere you might like.\n\n" .. "You can also hide it by clicking its close button."] = colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("視覺：\n\n") .. "顯示您的下一個輸入將執行的操作。\n將其拖放到您想要的任何位置。\n\n您也可以透過點擊其關閉按鈕來隱藏它。"

T["Are you sure you want to abandon the tutorial?"] = "您確定要放棄本教學嗎？"

T["Reset Angleur Set"] = "重置釣魚者設置"

T["Ambience Volume"] = "環境音量"

T[", with modifier "] = ", 帶修飾符"

T["login messages disabled"] = "登入訊息已停用"

T["Beta: " .. colorWhite:WrapTextInColorCode("If you are having trouble,\ntry resetting the set by clicking\nthe reset button then refreshing\nthe UI with ")
    .. "/reload."] = "Beta：" .. colorWhite:WrapTextInColorCode("如果您遇到問題，\n嘗試透過點擊重置設定\n重置按鈕然後刷新\n使用 ") .. "/重新載入的 UI。"

T["Middle Button: " .. colorYello:WrapTextInColorCode("Hide Minimap Icon")] = "中間按鈕：" .. colorYello:WrapTextInColorCode("隱藏小地圖圖示")

T["Can't create Equipment Set without any equippable slotted items. Slot a usable and equippable item to your Extra Items slots first."] = "如果沒有任何可裝備的開槽物品，則無法建立裝備組。首先將可用且可裝備的物品放入您的額外物品插槽中。"

T["Crate Bobbers"] = "板條箱浮標"

T["debug mode deactivated"] = "調試模式已停用"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Macro successfully slotted. If you make changes to it, you need to "
.. colorYello:WrapTextInColorCode("re-drag ")
.. "the new version to the slot. You can also delete the macro to save space, Angleur will remember it."] = colorBlu:WrapTextInColorCode("Angleur：") .. "巨集已成功插入。如果您對其進行更改，則需要將 " .. colorYello:WrapTextInColorCode(" 重新將新版本 ") .. " 拖曳到插槽中。您也可以刪除巨集以節省空間，Angler 會記住它。"

T["Having Problems?"] = "有問題嗎？"

T["Click here if you need an example & explanation of use of macros for Angleur!"] = "如果您需要 Angleur 巨集的使用範例和說明，請按一下此處！"

T["Angleur: Ultra Focus will trigger on "] = colorBlu:WrapTextInColorCode("Angleur：") .. "Ultra Focus 將會觸發"

T["Adjust Audio Levels"] = "調整音訊電平"

T["A bug with the Angleur Set has occurred, where it is set to unequip all gear. "
.. "Therefore, it has been deleted. If this keeps happening, please contact the Author."] = "Angleur Set 出現了一個錯誤，它被設定為取消裝備所有裝備。因此，它已被刪除。如果這種情況持續發生，請聯絡作者。"

T[colorYello:WrapTextInColorCode("To Get Started:\n\n") .. "Choose your desired\n"
.. colorBlu:WrapTextInColorCode("Fishing Method") .. " by\nclicking one of these buttons.\n\n"] = colorYello:WrapTextInColorCode("開始：\n\n") .. "選擇您想要的\n" .. colorBlu:WrapTextInColorCode("釣魚方法") .. "\n單擊這些按鈕之一。"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Awake."] = colorBlu:WrapTextInColorCode("Angleur：") .. "醒來。"

T["Double-Click Fishing Mode"] = "雙擊釣魚模式"

T["Fish, cast Toys, Items and Macros using double mouse clicks!\n"] = "使用滑鼠雙擊來釣魚、鑄造玩具、物品和巨集！"

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
.. "_____________________________________________"] = colorYello:WrapTextInColorCode(" 项目：\n") .. "-您的包或角色装备中的任何可用物品。 \n\n 每当：\n\n   1) " .. colorYello:WrapTextInColorCode("關閉冷卻\n") .. " 2) " .. colorYello:WrapTextInColorCode("Aura 无效") .. "（如果存在）\n角标6X\n宏：\n[[/colorYello]]-任何包含咒语或可用物品的有效宏 - /cast 或 /use。 \n\n 每当：\n\n   1) 满足 " .. colorYello:WrapTextInColorCode(" 宏观条件 ") .. "\n   2) 法术/物品的冷却时间为 " .. colorYello:WrapTextInColorCode("") .. " 及其\n   3) " .. colorYello:WrapTextInColorCode("Auras 无效") .. "（如果存在）\n\n" .. colorYello:WrapTextInColorCode("重要提示：") .. "如果您使用宏条件，则当您将宏拖动到插槽时，它们需要处于活动状态。\n_____________________________________________"

T["Can't drag item in combat."] = "戰鬥中無法拖曳動物品。"

T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ")
    .. "and " .. colorBlu:WrapTextInColorCode("use Items and Configured Macros ")
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Cast ") .. "、" .. colorBlu:WrapTextInColorCode("Reel ") .. " 和 " .. colorBlu:WrapTextInColorCode(" 使用项目和配置的宏 ") .. "using \n一鍵。"

T[colorYello:WrapTextInColorCode("Can't use Macro: ")
.. "The item used in this macro doesn't have a trackable spell/aura."] = colorYello:WrapTextInColorCode("無法使用巨集：") .. "此巨集中使用的物品沒有可追蹤的法術/光環。"

T["Crate of Bobbers: Cat Head"] = "浮標箱：貓頭"

T["Anglers Fishing Raft"] = "釣魚者釣魚筏"

T["Disable Soft Interact"] = "禁用軟交互"

T["Note for Classic:"] = "經典版註意事項："

T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)"] = "選擇一個 " .. colorBrown:WrapTextInColorCode("Raft") .. "，Angleur 會讓您在 " .. colorDarkBlu:WrapTextInColorCode("water") .. " 中使用它！\n（之後也要保持buff）"

T["you do not own this toy. please select another"] = "你不擁有這個玩具。請選擇另一個"

T["Random Raft"] = "隨機筏"

T["Glow Worm"] = "螢火蟲"

T["Debug Mode"] = "偵錯模式"

T["  Extra  "] = "額外的"

T["Shows what your next key press\nwill do. Not meant to be clicked."] = "顯示您下一個按鍵的內容\n會做的。不意味著被點擊。"

T["Modifier key "] = "修飾鍵"

T["Tuskarr Dinghy"] = "海像人小艇"

T["When unchecked, Bobber Scanner warn you with a chat message when your "
.. "Camera Zoom changes during scan(when it's not supposed to). It's usually due to a wall that's behind you, and it is recommended to "
.. "keep the warning \'enabled\' so you can know when a fishing spot might cause issues."] = "未選取時，當您的 " .. colorYello:WrapTextInColorCode(" 相機變焦 ") .. " 在掃描期間發生變更時（當它不應該變更時），Bobber Scanner 會透過聊天訊息警告您。\n\n這通常是由於您身後有一堵牆造成的，" .. colorYello:WrapTextInColorCode(" 建議 ") .. " 保持警告 " .. colorGreen:WrapTextInColorCode("「已啟用」") .. "，以便您可以知道釣魚點何時可能會導致問題。"

T["Return\nAngleur Visual"] = "返回\n角度视觉"

T["Visual Size"] = "視覺尺寸"

T["Angleur: Sharpened Tuskarr Spear(MoP) detected."] = colorBlu:WrapTextInColorCode("Angleur：偵測到") .. colorYello:WrapTextInColorCode("鋒利的海象矛(MoP)") .. "。"

T["Angleur: VERSION UPDATED. Please re-set your \'OneKey\' from the Config Panel."] = colorBlu:WrapTextInColorCode("Angleur：") .. " 版本已更新。請從 " .. colorYello:WrapTextInColorCode(" 設定面板重新設定您的 [[colorYello]]「OneKey」") .. "。 [[/colorYello]]"

T["\n(Released BACK in Combat!)"] = "[[colorGrae]]\n（在戰鬥中釋放回來！）\n角標1X"

T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot")
.. ", then turn it back off after you reel.\n\n" .. colorGrae:WrapTextInColorCode("If you have ")
.. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")] = "如果選中，Angleur 將暫時開啟 " .. colorYello:WrapTextInColorCode("Auto-Loot") .. "，然後在捲起後將其關閉。\n\n" .. colorGrae:WrapTextInColorCode("如果您啟用了 ") .. colorYello:WrapTextInColorCode(" 自動掠奪 ") .. colorGrae:WrapTextInColorCode("，則此功能將自動停用。 ")

T["Bobber Scanner - Dizzy Warning"] = "Bobber Scanner - 頭暈警告"

T["Please try again after combat ends."] = "請戰鬥結束後重試。"

T["Right Click: " .. colorYello:WrapTextInColorCode("Sleep/Wake")] = "右鍵點選：" .. colorYello:WrapTextInColorCode("睡眠/喚醒")

T["Niche functionality plugin for Angleur. Adding niche user requests through this plugin!"] = "Angleur 的利基功能插件。透過這個插件添加利基用戶請求！"

T["Heat-Treated Spinning Lure"] = "熱處理旋轉魚餌"

T["Zoom Out To"] = colorPurple:WrapTextInColorCode("!!新的 ！ ！ ") .. colorYello:WrapTextInColorCode("縮小至")

T["Toggle Bags"] = "切換袋"

T["ELEVATION:"] = colorUnderlight:WrapTextInColorCode(" 標高：")

T["/angsleep"] = "/安睡"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Soft Interact has been turned " .. colorGreen:WrapTextInColorCode("ON ") .. "for you to be able to ".. colorYello:WrapTextInColorCode("Reel/Loot ")
.. "your catches. The previous values will be restored upon logout, so that if you uninstall Angleur you will have them back to normal."] = colorBlu:WrapTextInColorCode("Angleur：") .. "Soft Interact 已轉變為 " .. colorGreen:WrapTextInColorCode("ON ") .. "，以便您能夠 " .. colorYello:WrapTextInColorCode(" 捲取/掠奪 ") .. " 您的漁獲物。先前的值將在登出時恢復，因此，如果您卸載 Angleur，它們將恢復正常。"

T["Macro empty"] = "宏空"

T["Sleep Without Fishing Rod"] = "睡不帶釣竿"

T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ")
    .. ", use " .. colorPurple:WrapTextInColorCode("Toys") .. ", " .. colorBlu:WrapTextInColorCode(" Items and Configured Macros ")
    .. "using \none button."] = colorBlu:WrapTextInColorCode("铸造") .. "，" .. colorBlu:WrapTextInColorCode("卷轴") .. "，使用" .. colorPurple:WrapTextInColorCode("T玩具") .. "，" .. colorBlu:WrapTextInColorCode("项目") .. "和" .. colorBlu:WrapTextInColorCode("\n使用一鍵配置巨集 ") .. "。"

T["   " .. colorYello:WrapTextInColorCode("Click ") .. "any of the buttons above\nthen select a toy with left click from\nthe "
.. colorYello:WrapTextInColorCode("Toy Box ") .. "that pops up."] = colorYello:WrapTextInColorCode("點選 ") .. " 上面的任何按鈕\n然後用左鍵從中選擇一個玩具\n彈出的 " .. colorYello:WrapTextInColorCode("T 玩具箱 ") .. "。"

T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."] = "是否顯示浮子上方的鉤子圖示。\n請注意，這會影響其他軟目標物件的圖示。"

T["Ultra Focus:"] = "超對焦："

T[colorWhite:WrapTextInColorCode("\nEquip a ") .. "Fishing Pole\n"] = colorWhite:WrapTextInColorCode("\n裝備 ") .. " 釣竿"

T["1) Tents such as Gnoll Tent to protect yourself from the sun as you fish."
    .. "\n2) Transformation toys such as Burning Defender's Medallion.\n3) Seating items like pillows so you can fish comfortably."
    .. "\n4) Darkmoon whistle if you want to be annoying.\nAnd other whacky combinations!"] = "1) 帳篷，如豺狼人帳篷，可以在釣魚時保護自己免受陽光照射。\n2) 變形玩具，例如燃燒衛士勳章。\n3) 枕頭等座椅物品，讓您可以舒適地釣魚。\n4）如果你想惹惱的話，可以吹闇月口哨。\n還有其他古怪的組合！"

T["Enable Soft Interact"] = "啟用軟交互"

T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("Double Click\n")] = "釣魚模式：[[colorBlu]]雙擊\n角標1X"

T["Recast Reminder"] = "重鑄提醒"

T["Choose when Angleur's Ultra Focus Activates/Releases.\n\n" .. "Cast/Reel : Will activate/release with every single cast (DEFAULT)\n\n"
.. "Sleep/Wake : Will only activate/release when you wake/sleep the addon\n"] = "选择何时 Angleur 的 Ultra Focus " .. colorGreen:WrapTextInColorCode(" 激活 ") .. "/" .. colorRed:WrapTextInColorCode(" 发布 ") .. "。\n\n" .. colorYello:WrapTextInColorCode("Cast/Reel：") .. "每次施放" .. colorGrae:WrapTextInColorCode("時都會啟動/釋放（預設）\n\n") .. colorYello:WrapTextInColorCode("睡眠/唤醒：") .. "只会在您唤醒/睡眠插件时激活/释放"

T["Activation Mode:"] = "激活方式："

T["Angleur: Minimap Button Hidden"] = colorBlu:WrapTextInColorCode("Angleur：") .. "隱藏小地圖按鈕"

T["Pick a Bobber from the Crate of Bobbers, and Angleur will have you keep it applied!\n\n"
.. "Pick \'Random Bobber\' to get a different one every time!"] = "從 " .. colorYello:WrapTextInColorCode("Bobbers") .. " 板條箱中選擇一個浮標，Angleur 會讓您一直使用它！\n\n選擇 " .. colorYello:WrapTextInColorCode("“隨機浮標”") .. "，每次都會獲得不同的！"

T["Angleur: Minimap Button Shown"] = colorBlu:WrapTextInColorCode("Angleur: ") .. " 顯示小地圖按鈕"

T["Pick a Bait Item from the ones in your bags, and Angleur will keep it applied!\n\nMake sure you pick one whose level isn't higher than yours."] = "從您包包中的誘餌物品中選擇一個 " .. colorYello:WrapTextInColorCode(" 誘餌物品 ") .. "，Angleur 會一直使用它！ " .. colorGrae:WrapTextInColorCode("\n\n確保您選擇的等級不高於您的等級。 ")

T["Open Config Panel"] = "打開配置面板"

T["If checked, Angleur will show developer debug messages. Useful to display when submitting bug reports through discord!\n\n"
.. "Keep unchecked during regular use."] = "如果選中，Angler 將顯示開發人員偵錯訊息。\n透過 " .. colorPurple:WrapTextInColorCode("discord 提交錯誤報告時顯示很有用！\n\n") .. colorGrae:WrapTextInColorCode("在正常使用過程中不要勾選。 ")

T["/angmini"] = "/angmini"

T["Uncheck to hide minimap, or middle-mouse-click on the minimap button."] = "取消選取以隱藏小地圖，或用滑鼠中鍵點選小地圖按鈕。"

T["Show Minimap Button"] = "顯示小地圖按鈕"

T["Recommended Value: 2\n"] = "[[colorGrae]]建議值：2\n角標1X"

T["How far out the camera will zoom out before starting the scan. Higher value => farther.\n"] = colorWhite:WrapTextInColorCode(" 在開始掃描之前，相機將 ") .. " 縮小 " .. colorWhite:WrapTextInColorCode(" 多遠。更高的值=>更遠。\n")

T["sec"] = "秒"

T["Equipping of the Angleur set disrupted due to sudden death/ghost-form"] = "由於突然死亡/幽靈形態，Angler 套裝的裝備中斷"

T["Defaults\n(Recommended)"] = "預設值\n（推薦）"

T["Two-Way Transformations to Worgens when you cast abilities or use items!\n\nFeatures a built-in drag&drop Macro Maker."] = "當您施放技能或使用物品時，可以雙向轉變為狼人！\n\n具有內建拖曳功能 " .. colorYello:WrapTextInColorCode("Macro Maker.")

T["Dialog Volume"] = "對話音量"

T["Couldn't find \n Oversized Bobber in \n toybox, feature disabled"] = "找不到\n 超大浮標\n 玩具箱，功能已禁用"

T["OneKey removed"] = "一鍵刪除"

T["Shiny Bauble"] = "閃亮的小玩意"

T["for [Patient Chest]\n\n" .. "When enabled, Angleur will play a warning sound, screen animation and show a cool image of Reno Jackson warning you about the treasure.\n\nNote: The sound is also that of Reno Jackson\n\n"
.. "We're gonna be rich!"] = colorGrae:WrapTextInColorCode("適用於") .. colorDarkBlu:WrapTextInColorCode("[患者胸部]\n\n") .. "啟用後，Angleur 將播放警告聲音、螢幕動畫並顯示 Reno Jackson 的酷炫圖像，警告您有關寶藏的資訊。\n\n" .. colorGrae:WrapTextInColorCode("註：聲音也是 Reno Jackson 的聲音\n\n") .. colorGrae:WrapTextInColorCode("我們會變得富有的！ ")

T["THANK YOU!"] = "謝謝你！"

T["Effects Volume"] = "效果音量"

T["You can drag and place this anywhere on your screen"] = "您可以將其拖曳並放置在螢幕上的任何位置"

T["Master Volume"] = "主音量"

T["To stop seeing these messages, go to:"] = "要停止看到這些訊息，請訪問："

T["Login Messages"] = "登入訊息"

T["Failed to get macro index"] = "取得巨集索引失敗"

T["Music Volume"] = "音樂音量"

T["Advanced Angling"] = "高級釣魚"

T["Patient Chest"] = "病人胸部"

T["[Patient Treasure] Spawned. Be quick and grab it! Good luck with the mount egg:\n"] = colorDarkBlu:WrapTextInColorCode("[耐心寶藏] ") .. "生成。快點抓住它吧！祝坐騎蛋好運："

T["link of macro item: "] = "宏項連結："

T["Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."] = "位於 Plater->進階->常規設定中。\n\n不然的話，鮟鱇魚就釣不到魚了。"

T["Crate of Bobbers: Tugboat"] = "浮標箱：拖船"

T["Note for Mists:"] = "迷霧注意事項："

T["Bind a dedicated \'Re-Cast Key\'.\n\nWill be released back to you when not fishing."] = "綁定專用的" .. colorYello:WrapTextInColorCode("「重鑄金鑰」。\n\n") .. colorGrae:WrapTextInColorCode("不釣魚時會釋放回給您。 ")

T["Angleur Visual Button"] = "Angleur視覺按鈕"

T["Crate of Bobbers: Face of the Forest"] = "浮標箱：森林之面"

T["Wake!"] = "喚醒！"

T["Use this if you are fishing in a spot where the elevation constantly changes from level to lower and vice versa."
.. " The scan covers twice the height as usual, thus taking twice as long."] = colorWhite:WrapTextInColorCode("如果您在海拔高度不高的地方釣魚，請使用此選項\n不斷地將 ") .. colorWhite:WrapTextInColorCode(" 從 ") .. " 相同的 " .. colorWhite:WrapTextInColorCode(" 改為 ") .. "lower、" .. colorWhite:WrapTextInColorCode("，反之亦然。\n\n") .. colorWhite:WrapTextInColorCode("掃描覆蓋的高度是平常的兩倍，因此需要兩倍的時間。 ")

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Modifier Keys ")
.. "won't be recognized when the game is in the " .. colorGrae:WrapTextInColorCode("background. ")
.. "If you are using the scroll wheel for that purpose. Just bind the wheel alone instead, without modifiers."] = colorBlu:WrapTextInColorCode("Angleur：") .. colorYello:WrapTextInColorCode("修改鍵 當遊戲處於 [[colorGrae]] 背景時，") .. " 將無法被辨識。 [[/colorGrae]]如果您為此目的使用滾輪。只需單獨綁定輪子即可，無需修飾符。"

T["If checked, Angleur will have you keep \'Reusable Oversized Bobber\' applied."] = "如果選中，Angleur 會讓您保留 " .. colorYello:WrapTextInColorCode("「可重複使用的超大浮子」") .. " 應用程式。"

T["ITEM NOT FOUND IN BAGS. TO USE FOR EQUIPMENT SWAP, EITHER ADD IT MANUALLY TO ANGLEUR SET OR RE-DRAG THE MACRO."] = "袋子裡沒有發現物品。若要用於裝置交換，請將其手動新增至 angleur 設定或重新拖曳巨集。"

T["If checked, Angleur will adjust your audio settings for you when you cast your rod, and restore them to the previous values when you reel/loot.\n\n"
.. "Ambience & Music will be muted.\nSound Effects will be turned up.\n\nWhile Angleur is awake, \'Sound in Background\' will also be enabled(restored to previous on sleep).\n\n"
.. "If you want to change the adjusted audio volume, go to Angleur->Tiny->Master Volume(Ultra Focus) and adjust from the slider."] = "如果選中，Angler 會在您投擲魚竿時為您調整音訊設置，並​​在您捲起/掠奪時將它們恢復到先前的值。\n\n" .. colorYello:WrapTextInColorCode("氛圍與音樂 ") .. " 將會被 " .. colorRed:WrapTextInColorCode(" 靜音。 ") .. colorYello:WrapTextInColorCode("\n音效 ") .. " 將 " .. colorGreen:WrapTextInColorCode(" 出現。 ") .. "\n\n當 Angleur 處於喚醒狀態時，" .. colorYello:WrapTextInColorCode("「背景聲音」") .. " 也會啟用（在睡眠時恢復到先前的狀態）。如果您想要變更 [[colorUnderlight]] 已調整的音訊音量，請前往 " .. colorBlu:WrapTextInColorCode("Angleur ") .. "-> " .. colorBlu:WrapTextInColorCode("Tiny ") .. "-> " .. colorBlu:WrapTextInColorCode(" 主音量（雙焦點）") .. "-> " .. colorBlu:WrapTextInColorCode(" 主音量（雙焦點）") .. "->然後從超滑桿調整。"

T["When unchecked, Angleur will stop showing Login messages.\n\nLogin messages may contain useful tips, and can be re-enabled at any time."] = "取消選取時，Angler 將停止顯示登入訊息。\n\n" .. colorGrae:WrapTextInColorCode("登入訊息可能包含有用的提示，並且可以隨時重新啟用。 ")

T["You need to open the Config Panel to change Angleur's settings!"
.. "\n\n(Hint) You can also:\n - type /ang\n - Double-Click the Angleur Visual\n - Click the Minimap/AddonCompartment Button\nto open it."] = colorWhite:WrapTextInColorCode("您需要開啟配置面板來變更 Angleur 的設定！ ") .. colorGrae:WrapTextInColorCode("\n\n（提示）您还可以：\n - 類型 ") .. colorYello:WrapTextInColorCode("/ang") .. colorGrae:WrapTextInColorCode("\n - 雙擊 ") .. colorYello:WrapTextInColorCode("Angleur 視覺效果\n") .. colorGrae:WrapTextInColorCode(" - 點選 ") .. colorYello:WrapTextInColorCode(" 迷你地圖/附加隔間按鈕") .. colorGrae:WrapTextInColorCode("\n打開它。 ")

T["Angleur will no longer Sleep/Wake based on Fishing Rod equip status."] = colorBlu:WrapTextInColorCode("Angleur ") .. " 將不再根據釣竿裝備狀態對 " .. colorYello:WrapTextInColorCode(" 睡眠/喚醒 ") .. "。"

T[" plugin from Curseforge if you want Angleur to use it for you."] = "如果您希望 Angleur 使用 Curseforge 的插件，請使用它。"

T["Please download the: "] = "請下載："

T["Due to the fishing rod taking up the mainhand slot in Classic, this item cannot be added to the Auto-Equip System."] = "由於經典版中釣竿佔據了主手槽位，因此該物品無法添加到自動裝備系統中。"

T["Can't add toys while dead"] = "死亡時無法添加玩具"

T["Item equip interrupted by death/ghost-form"] = "物品裝備因死亡/幽靈型態而中斷"

T["Can't change sleep state in combat."] = "戰鬥中無法改變睡眠狀態。"

T["OneKey set to: "] = "一鍵設定為："

T["Inside Water"] = "水內"

T["Angleur Configuration"] = "角度配置"

T["Disable Wall Warning"] = "禁用牆壁警告"

T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ")
.. "Tiny tab(tab 3),  and disable \'Login Messages\'"] = "Angleur 配置面板 " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny 選項卡（選項卡 3），並停用“登入訊息”"

T["\nor"] = "或者"

T["(Already on)"] = "（已經開啟）"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Fishing Hat")
.. " detected."] = colorBlu:WrapTextInColorCode("Angleur：偵測到 ") .. colorYello:WrapTextInColorCode(" 釣魚帽") .. "。"

T["Limited Edition Rocket Bobber"] = "限量版火箭浮標"

T["Ultra Focus: Audio Settings"] = "超級聚焦：音頻設定"

T["Extra Toys is a feature meant to provide flexible user customization, but not every toy is"
    .. " created the same. Targeted toys, toys that silence you, remote controlled toys etc might mess with your fishing routine."
    .. " Test them out, experiment and have fun!\n"] = "Extra Toys 是一項旨在提供靈活的使用者自訂功能，但並非每個玩具都是相同的。有針對性的玩具、讓你安靜的玩具、遙控玩具等可能會擾亂你的釣魚習慣。測試它們，嘗試並享受樂趣！"

T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n"
.. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")] = "如果選中，Angleur 將在您停止釣魚後停用 " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "。\n\n" .. colorGrae:WrapTextInColorCode("適用於希望在正常遊戲期間停用軟互動的使用者。 ")

T["If you want Soft-Interact to be " .. colorRed:WrapTextInColorCode("TURNED OFF ") .. "when not fishing, go to:\n"
.. "Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact\nand check it "
.. colorGreen:WrapTextInColorCode("ON.")] = "如果您希望在不釣魚時將 Soft-Interact 關閉 " .. colorRed:WrapTextInColorCode(" ") .. "，請造訪：\nAngleur 配置面板 " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny 選項卡（選項卡 3） " .. colorYello:WrapTextInColorCode("-> ") .. "停用軟交互\n並檢查 " .. colorGreen:WrapTextInColorCode("ON.")

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off "
.. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."] = "當您不釣魚時，" .. colorBlu:WrapTextInColorCode("Angleur ") .. " 現在將關閉 " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "。"

T["Can't change in combat."] = "戰鬥中無法改變。"

T["Use this when you are on the same level as the water, or close to it."] = colorWhite:WrapTextInColorCode(" 當您與水處於同一水平面或靠近水時使用此功能。 ")

T["For it to work properly, please make sure to add it as a macro like so: "] = "為了使其正常工作，請確保將其添加為宏，如下所示："

T["Angleur Bobber Scanner : WARNING! Camera Zoom changed during scan. "
.. "This can (and will) disrupt success of the bobber scanner, and is likely "
.. "due to a wall or some other game world object behind your character. To fix this, "
.. "either move to a clearing, or lower the \'Max Camera Distance\' in "
.. "the Game's Options under Options->Gameplay->Controls->Camera."
.. "You can turn this warning off in the Bobber Scanner's Config Menu by clicking the gear icon next to the mouse drop-off box."] = colorBlu:WrapTextInColorCode("Angleur Bobber 掃描器：") .. colorRed:WrapTextInColorCode(" 警告！ ") .. colorYello:WrapTextInColorCode("相機變焦 ") .. "在掃描期間發生變化。這可能（並且將會）破壞浮子掃描器的成功，並且很可能是由於角色後面的牆壁或其他遊戲世界物件 " .. colorYello:WrapTextInColorCode(" 造成的。 ") .. "要解決此問題，請移至空地，或降低遊戲選項中的 " .. colorYello:WrapTextInColorCode("「最大攝影機距離」") .. "在選項" .. colorYello:WrapTextInColorCode("->") .. "Gameplay" .. colorYello:WrapTextInColorCode("->") .. "Controls" .. colorYello:WrapTextInColorCode("->") .. "Camera 下。您可以透過點選滑鼠下拉框旁的" .. colorYello:WrapTextInColorCode("gear 圖示") .. " 在Bobber Scanner 的設定選單中關閉此警告。"

T["Use this when the water is lower level than you."] = colorWhite:WrapTextInColorCode("當水位低於您時使用此功能。 ")

T["Lower Elevation"] = "較低海拔"

T["Same Elevation"] = "相同海拔"

T["Ultra Focus: Default audio settings restored"] = "Ultra Focus：恢復預設音訊設定"

T["debug mode active"] = "調試模式激活"

T["Start Delay"] = colorYello:WrapTextInColorCode("開始延遲")

T["Preferred Mouse Button"] = "首選滑鼠按鈕"

T["Rafts"] = "木筏"

T["Crate of Bobbers: Demon Noggin"] = "浮標箱：惡魔腦袋"

T[" minutes, "] = "分鐘，"

T["Selected extra toy: "] = "選定的額外玩具："

T["\nto wake Angleur!"] = "喚醒安格魯爾！"

T["Soft target icon for game objects re-enabled."] = "重新啟用遊戲物件的軟目標圖示。"

T["Crate of Bobbers: Enchanted Bobber"] = "浮標箱：魔法浮標"

T["please choose the toy with left click so that angleur can function properly"] = "請用左鍵選擇玩具，以便angleur能夠正常運作"

T["Scan Speed"] = colorYello:WrapTextInColorCode("掃描速度")

T["HOW?"] = "如何？"

T["Dismount With Key"] = "用鑰匙拆卸"

T["Fun toy recommendations from mod author, Legolando:"] = "來自模組作者 Legolando 的有趣玩具推薦："

T["Crate of Bobbers: Wooden Pepe"] = "浮標箱：木佩佩"

T["Set your desired key by: "] = "透過以下方式設定您想要的密鑰："

T["  Tiny  "] = "微小的"

T["Raft"] = "筏"

T["To access the configuration menu, type "] = "若要存取配置選單，請鍵入"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping."] = colorBlu:WrapTextInColorCode("Angleur：") .. "正在睡覺。"

T["Key set to "] = "鍵設定為"

T["Set Timer"] = "設定定時器"

T["GAMEPAD MODE: After casting \'fishing\', move the cursor that appears into the box below to use."] = colorPurple:WrapTextInColorCode(" 遊戲手把模式：\n") .. "施放" .. colorBlu:WrapTextInColorCode("'釣魚'") .. "後，移動遊標\n即出現在 " .. colorRed:WrapTextInColorCode("box 下面的 ") .. " 中使用。"

T["Not every toy will work!"] = "不是每個玩具都能用！"

T["Now, let's move to the " .. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Click here."] = "現在，讓我們轉到 " .. colorYello:WrapTextInColorCode("Extra ") .. "T 標籤。點這裡。"

T["No"] = "不"

T[" or\n"] = "或者"

T["Pickpocket overhaul for Rogues!\n\nSingle player RPG-like Pickpocket Prompt System with dynamic keybind(released back when not pick pocketing)."] = "盜賊的扒手大修！\n\n類似單人角色扮演遊戲的扒手提示系統，具有動態按鍵綁定（不扒竊時釋放）。"

T[colorBlu:WrapTextInColorCode("Cast ") .. "your rod and " .. colorBlu:WrapTextInColorCode("use Items/Macros ")
    .. "using\ndouble mouse clicks!\n"] = colorBlu:WrapTextInColorCode("投射 ") .. " 你的釣竿和 " .. colorBlu:WrapTextInColorCode(" 使用項目/巨集 ") .. " 使用\n雙擊滑鼠！"

T["Nat's Drinking Hat"] = "納特的飲酒帽"

T[" seconds"] = "秒"

T["Otherwise, you will have to manually target your fishing rod every time."
.. "If you want to see an example of how to slot macros, click the "
..  colorRed:WrapTextInColorCode("[HOW?] ") .. "button on the "
.. colorYello:WrapTextInColorCode("Extra Tab")] = "否則，您每次都必須手動瞄準釣魚竿。如果您想查看如何設定巨集的範例，請點選 " .. colorYello:WrapTextInColorCode("Extra 標籤上的 [[colorRed]][HOW?] [[/colorRed]] 按鈕")

T["/angang"] = "/安鋼"

T["Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"] = "找不到\n 任何板條箱浮標\n 在玩具箱中，功能已停用"

T["Can't change sleep state while in ghost form."] = "在幽靈型態下無法改變睡眠狀態。"

T["If enabled, Angleur will play a sound effect when your fishing cast runs out to remind you to cast again!"
.. "\n\nRecommended when fishing on the side while doing something else."] = "如果启用，当您的鱼线用完时，Angleur 会播放 " .. colorYello:WrapTextInColorCode(" 音效 ") .. "，提醒您再次抛投！ " .. colorGrae:WrapTextInColorCode("\n\n建议在一边钓鱼一边做其他事情时使用。 ")

T["Double Click Window"] = "按兩下視窗"

T["One Key"] = "一鍵"

T["Reset to Defaults"] = "重設為預設值"

T["Swapback item not found in bags, cannot re-equip."] = "袋子中未找到交換物品，無法重新裝備。"

T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("One Key")] = "釣魚模式：" .. colorBlu:WrapTextInColorCode("一鍵")

T["Created equipment set for " .. colorBlu:WrapTextInColorCode("Angleur" ) .. ". ID is : "] = "為 " .. colorBlu:WrapTextInColorCode("Angleur") .. " 建立設備群組。身分證號碼是："

T["Right Click"] = "右鍵單擊"

T["Unslotted " .. colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Equipment Set ")
.. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it."] = "無槽 " .. colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode(" 裝備套裝 ") .. " 項目。如果您不希望 Angleur 繼續裝備它，請將其從裝置管理員中的 Angleur 集中刪除。"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "cannot open "
.. colorYello:WrapTextInColorCode("Config Panel ") .. "in combat."] = colorBlu:WrapTextInColorCode("Angleur：") .. "無法在戰鬥中開啟" .. colorYello:WrapTextInColorCode("設定面板") .. "。"

T["Crate of Bobbers"] = "浮標箱"

T["Defaults"] = "預設值"

T["Crate of Bobbers: Floating Totem"] = "浮標箱：漂浮圖騰"

T["The next key you press\nwill be set as Angleur Key"] = "您按下的下一個鍵\n將被設定為 Angleur Key"

T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) "
.. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact"] = "Angleur 配置面板 " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny 選項卡（選項卡 3） " .. colorYello:WrapTextInColorCode("-> ") .. "停用軟交互"

T["Do not "
.."use this feature if you are sensitive to\nrapid movement "
.. "or any form of fast graphical\nchange. Such as but not limited "
.. "to:\nPhotosensitive Epilepsy, Vertigo..."] = "如果您對以下內容敏感，請勿使用此功能\n快速移動或任何形式的快速圖形\n改變。例如但不限於：\n" .. colorYello:WrapTextInColorCode("光敏性癲癇、眩暈...")

T["Master Volume(Ultra Focus)"] = "主音量（超焦點）"

T["For passive items you'd like to add to your fishing gear, you can use the game's "
.. colorYello:WrapTextInColorCode("Equipment Manager ") .. "to add them to the "
.. colorBlu:WrapTextInColorCode("Angleur ") .. "set"] = "對於您想要添加到漁具中的被動物品，您可以使用遊戲的 " .. colorYello:WrapTextInColorCode(" 設備管理器 ") .. " 將它們添加到 " .. colorBlu:WrapTextInColorCode("Angleur ") .. " 集中"

T["Sets the OneKey/Double-Click to Recast when the bobber lands too far for the soft interact system to capture."] = "當浮標著陸距離太遠而軟交互系統無法捕獲時，將 " .. colorRed:WrapTextInColorCode("OneKey") .. " / " .. colorRed:WrapTextInColorCode(" 雙擊 ") .. " 設定為 " .. colorYello:WrapTextInColorCode(" 重鑄 ") .. "。"

T["Couldn't equip slotted item in time before combat"] = "無法在戰鬥前及時裝備槽位物品"

T["Angleur works on a " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. "system, so you don't have to reload your UI after you're done fishing.\n\n"
.. colorBlu:WrapTextInColorCode("Right Click ")
.. "to put Angleur to sleep, and wake it up if it is. You can also Right Click the minimap button."] = "Angleur 在 " .. colorYello:WrapTextInColorCode(" 睡眠/喚醒 ") .. " 系統上運行，因此您在完成釣魚後無需重新加載 UI。\n\n" .. colorBlu:WrapTextInColorCode(" 右鍵點選 ") .. " 使 Angleur 進入睡眠狀態，如果處於睡眠狀態則將其喚醒。您也可以右鍵點選小地圖按鈕。"

T["   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " ..
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes above."] = colorYello:WrapTextInColorCode("將 ") .. " 可用的 " .. colorYello:WrapTextInColorCode(" 項目 ") .. " 或 " .. colorYello:WrapTextInColorCode(" 巨集 ") .. " 拖曳到上面的任何方塊中。"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to reel properly."] = "必須在 [[/colorGreen]] 上檢查 [[colorGreen]]，Angleur 才能正確捲繞。"

T["Couldn't find any rafts \n in toybox, feature disabled"] = "找不到木筏\n 在玩具箱中，功能已停用"

T["Manually scans for the bobber by moving the camera in a grid.\n\nDIZZY WARNING:\nDo NOT "
.."use this feature if you are sensitive to rapid movement or any form of fast graphical change.\n\n"
.."This feature is still in development! With enough good feedback, it can be improved and made much smoother :)"] = "透過在網格中移動相機來手動掃描浮標。\n\n" .. colorYello:WrapTextInColorCode("頭暈警告：") .. "[[colorRed]]\n如果您對快速移動或任何形式的快速圖形變化敏感，請勿使用此功能。\n\n此功能仍在開發中！有了足夠好的回饋，它就可以改進並變得更加流暢:)"

T["\nRight-Click"] = "右鍵單擊"

T["Has been " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to be able to "
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] = "已在 [[/colorGreen]] 上進行了 [[colorGreen]] 檢查，Angleur 的按鍵綁定能夠對 " .. colorYello:WrapTextInColorCode(" 捲取/掠奪 ") .. " 您的捕獲物。"

T["This is a limitation of Classic(not the case for Mists and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."] = "這是 Classic 的限制（Mists 和 Retail 的情況除外），因為它缺乏適當的內建裝置管理器，可讓您將被動物品插入 Angleur 套裝。"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Failed to get macro spell/item. If you are using "
.. colorYello:WrapTextInColorCode("macro conditions \n")
.. "you need to drag the macro into the button frame when the conditions are met."] = colorBlu:WrapTextInColorCode("Angleur：") .. "無法取得巨集咒語/物品。 If you are using " .. colorYello:WrapTextInColorCode("macro conditions\n") .. "滿足條件時，需要將巨集拖曳入按鈕框架中。"

T["Mouseover the bobber\nto reel consistently."] = "滑鼠懸停在浮標上\n一致地捲繞。"

T["Coming Soon!"] = "即將推出！"

T[colorBlu:WrapTextInColorCode("Angleur visual ") .. "is now hidden."] = colorBlu:WrapTextInColorCode("Angleur 視覺 ") .. " 現已隱藏。"

T["Aquadynamic Fish Attractor"] = "水動力誘魚器"

T["Warning Sound"] = "警告聲"

T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."] = "或 " .. colorYello:WrapTextInColorCode(" 右鍵點選 ") .. " 視覺按鈕。"

T["Open Macros"] = "開啟巨集"

T["Create\n  Add"] = "創建\n  添加"

T["   The " .. colorYello:WrapTextInColorCode("Update/Create Set ") .. "Button automatically adds equippable items in your "
.. colorYello:WrapTextInColorCode"Extra Items " .. "slots to your " .. colorBlu:WrapTextInColorCode("Angleur Set")
.. ", and creates one if there isn't already.\n\nIf you want to " .. colorRed:WrapTextInColorCode("remove ")
.. "previously saved slotted items, you need to click the " .. colorRed:WrapTextInColorCode("Delete ")
.. "Button to the top right, and then re-create the set - or manually change the item set.\n\nYou may also assign "
.. colorGrae:WrapTextInColorCode("- Passive Items - ") .. "to your ".. colorBlu:WrapTextInColorCode("Angleur Set ")
.. "manually, and Angleur will swap them in and out like the rest."] = colorYello:WrapTextInColorCode("更新/建立設定") .. "按鈕會自動將" .. colorYello:WrapTextInColorCode("額外物品") .. "插槽中的可裝備物品新增至" .. colorBlu:WrapTextInColorCode("Angleur Set") .. "中，並建立​​一個（如果還沒有）。\n\n如果您想要 " .. colorRed:WrapTextInColorCode(" 刪除 ") .. " 先前儲存的開槽項目，您需要點擊右上角的 " .. colorRed:WrapTextInColorCode(" 刪除 ") .. " 按鈕，然後重新建立該集 - 或手動更改項目集。\n\n您也可以手動將 " .. colorGrae:WrapTextInColorCode("- 被動物品 - ") .. " 分配給您的 " .. colorBlu:WrapTextInColorCode("Angleur 套裝 ") .. "，Angleur 會像其他物品一樣將它們換入和換出。"

T["Angleur unexpected error: Modifier exists, but main key doesn't. Please let the author know."] = "Angleur 意外错误：修饰符存在，但主键不存在。請告知作者。"

T["Please select a toy using Left Mouse Click"] = "請使用滑鼠左鍵點擊選擇一個玩具"

T["Can't drag macro in combat."] = "戰鬥中無法拖曳巨集。"

T["Bait"] = "餌"

T["Couldn't find any bait \n in your bags, feature disabled"] = "找不到任何誘餌\n 在你的包包裡，功能已禁用"

T["FISHING METHOD:"] = "釣魚方法："

T["or "] = "或者"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a "
.. colorYello:WrapTextInColorCode("/reload") .. " to fix it."] = colorBlu:WrapTextInColorCode("Angleur：") .. "如果您在雙擊時遇到僵硬，請執行 " .. colorYello:WrapTextInColorCode("/重新載入") .. " 來修復它。"

T["Organically-Sourced Wellington Bobber"] = "有機來源的威靈頓 Bobber"

T["Crate of Bobbers: Replica Gondola"] = "浮標箱：貢多拉複製品"

T["Slotted items successfully updated for your "
.. colorYello:WrapTextInColorCode("Angleur Equipment Set.")] = "已成功更新您的 " .. colorYello:WrapTextInColorCode("Angleur 裝備套裝的開槽物品。 ")

T["Toggle Equipment"] = "切換裝置"

T["Bright Baubles"] = "明亮的小玩意"

T["Random Bobber"] = "隨機浮標"

T["Bobber Scanner Configuration"] = "Bobber 掃描器配置"

T[colorBlu:WrapTextInColorCode("Angleur ")
.. "will have you cast the dragged item/macro\nif all of their below listed conditions are met."] = colorBlu:WrapTextInColorCode("Angleur ") .. " 會讓您投射拖曳的項目/宏\n如果满足下面列出的所有条件。"

T["Shows how far the camera will move downward from the \'Centered Position\' to start the scan. "
.. "Amount is based on your Max Zoom and chosen \'Elevation\'(Bobber Scanner Menu)"] = colorWhite:WrapTextInColorCode("顯示") .. colorDarkRed:WrapTextInColorCode("相機將向下移動[[/colorWhite]][[colorDarkRed]]多遠") .. colorWhite:WrapTextInColorCode("\n[[/colorDarkRed]][[colorWhite]] 從 ") .. colorYello:WrapTextInColorCode("「居中位置」") .. colorWhite:WrapTextInColorCode(" 開始掃描。\n金額取決於您的 ") .. colorYello:WrapTextInColorCode(" 最大變焦 ") .. " 和\n選擇" .. colorYello:WrapTextInColorCode("'海拔'") .. colorGrae:WrapTextInColorCode("（浮標掃描器選單）")
