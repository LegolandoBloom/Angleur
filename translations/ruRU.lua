-- if (GAME_LOCALE or GetLocale()) ~= "ruRU" then
--   return
-- end

local T = Angleur_Translate

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)
local colorWhite = CreateColor(1, 1, 1)
local colorGreen = CreateColor(0, 1, 0)
local colorPurple = CreateColor(0.64, 0.3, 0.71)
local colorBrown = CreateColor(0.67, 0.41, 0)

--Angleur.xml
T["Ultra Focus:"] = "Ультра Фокус:"
T["You can drag and place this anywhere on your screen"] = "Вы можете перетащить и разместить это в любом месте экрана"
T["FISHING METHOD:"] = "МЕТОД РЫБАЛКИ:"
T["One Key"] = "Одна клавиша"
T["The next key you press\nwill be set as Angleur Key"] = "Следующая нажатая клавиша\nбудет установлена как клавиша Angleur"
T["Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"] = "Пожалуйста, назначьте клавишу\nдля использования метода\n\"Одна клавиша\" с помощью\nкнопки выше"
T["Return\nAngleur Visual"] = "Вернуть\nвизуал Angleur"
T["Double Click"] = "Двойной клик"
T["Redo Tutorial"] = "Повторить обучение"
T["Wake!"] = "Проснись!"
T["Create\n  Add"] = "Добавить"
T["Update"] = "Обновить"
T["Please select a toy using Left Mouse Click"] = "Пожалуйста, выберите игрушку левым кликом мыши"
T["Make sure this box is checked!"] = "Убедитесь, что эта галочка установлена!"
T["Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."] = "Находится в Plater->Дополнительно->Основные настройки.\n\nИначе Angleur не сможет подсекать рыбу."
T["Angleur Configuration"] = "Настройки Angleur"
T["The next key you press\nwill be set as Angleur Key"] = "Следующая нажатая клавиша\nбудет установлена как клавиша Angleur"
T["Having Problems?"] = "Возникли проблемы?"
T["Angleur Warning: Plater"] = "Предупреждение Angleur: Plater"
T["Okay"] = "Окей"
T["  Extra  "] = "Дополнительно"
T["  Tiny  "] = "Мини"
T["Standard"] = "Стандарт"
    --Angleur.xml->Tooltips
    T["Angleur Visual Button"] = "Визуальная кнопка Angleur"
    T["Shows what your next key press\nwill do. Not meant to be clicked."] = "Показывает, что сделает следующее нажатие. Не предназначена для кликов."
    T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("Double Click\n")] = "Режим рыбалки: " .. colorBlu:WrapTextInColorCode("Двойной клик\n")
    T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("One Key")] = "Режим рыбалки: " .. colorBlu:WrapTextInColorCode("Одна клавиша")
    T["One-Key NOT SET! To set,\nopen config menu with:"] = "Клавиша НЕ НАЗНАЧЕНА! Для настройки\nоткройте меню конфигурации:"
    T[" or\n"] = " или\n"
    T["Right Click to temporarily put Angleur to sleep. zzz..."] = "Правый клик, чтобы временно усыпить Angleur. zzz..."
    T["Sleeping. Zzz...\n"] = "Спит. Zzz...\n"
    T["\nRight-Click"] = "\nПравый клик"
    T["\nto wake Angleur!"] = "\nчтобы разбудить Angleur!"
    T["One-Key Fishing Mode"] = "Режим рыбалки \"Одна клавиша\""

    T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") 
    .. ", use " .. colorPurple:WrapTextInColorCode("Toys") .. ", " .. colorBlu:WrapTextInColorCode(" Items and Configured Macros ") 
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Заброс ") .. ", " .. colorBlu:WrapTextInColorCode("Подсечка ") 
    .. ", использование " .. colorPurple:WrapTextInColorCode("Игрушек") .. ", " .. colorBlu:WrapTextInColorCode(" Предметов и Настроенных Макросов ") 
    .. "одной кнопкой."

    T["Set your desired key by: "] = "Назначьте желаемую клавишу: "
    T["Clicking on the button\nthat appears below\nonce this option is selected."] = "Нажав на кнопку, которая появится ниже, после выбора этой опции."
    T["Double-Click Fishing Mode"] = "Режим рыбалки \"Двойной клик\""
    T["Fish, Reel, cast Toys, Items and Macros using double mouse clicks!\n"] = "Рыбалка, подсечка, использование игрушек, предметов и макросов двойным кликом мыши!\n"
    T["Select which mouse button by:"] = "Выберите кнопку мыши:"
    T["Not every toy will work!"] = "Не все игрушки будут работать!"
    T["Extra Toys is a feature meant to provide flexible user customization, but not every toy is" 
    .. " created the same. Targeted toys, toys that silence you, remote controlled toys etc might mess with your fishing routine."
    .. " Test them out, experiment and have fun!\n"] = "Дополнительные игрушки — это функция для гибкой настройки, но не все игрушки одинаковы. Целевые игрушки, игрушки, которые вас заставляют молчать, дистанционно управляемые игрушки и т.д. могут нарушить ваш процесс рыбалки."
    .. " Тестируйте, экспериментируйте и получайте удовольствие!\n"
    T["Fun toy recommendations from mod author, Legolando:"] = "Рекомендации по игрушкам от автора мода, Legolando:"
    T["1) Tents such as Gnoll Tent to protect yourself from the sun as you fish."
    .. "\n2) Transformation toys such as Burning Defender's Medallion.\n3) Seating items like pillows so you can fish comfortably."
    .. "\n4) Darkmoon whistle if you want to be annoying.\nAnd other whacky combinations!"] = "1) Палатки, например, Гнолльская палатка, чтобы защититься от солнца во время рыбалки."
    .. "\n2) Игрушки для трансформации, например, Медальон Пылающего Защитника.\n3) Сидячие предметы, такие как подушки, для комфортной рыбалки."
    .. "\n4) Свисток Темной Луны, если хотите раздражать.\nИ другие безумные комбинации!"
    T["Beta: " .. colorWhite:WrapTextInColorCode("If you are having trouble,\ntry resetting the set by clicking\nthe reset button then refreshing\nthe UI with ") 
    .. "/reload."] = "Бета: " .. colorWhite:WrapTextInColorCode("Если возникли проблемы,\nпопробуйте сбросить настройки,\nнажав кнопку сброса, а затем\nперезагрузите интерфейс с помощью ") 
    .. "/reload."
    T["Reset Angleur Set"] = "Сбросить набор Angleur"
    --Cata
    T[colorWhite:WrapTextInColorCode("\nEquip a ") .. "Fishing Pole\n"] = colorWhite:WrapTextInColorCode("\nЭкипируйте ") .. "удочку\n"
    T["\nor"] = "\nили"
    T["Note for Cata:"] = "Примечание для Cataclysm:"
    T["Mouseover the bobber\nto reel consistently."] = "Наведите курсор на поплавок,\nчтобы подсекать стабильно."
    T["(If it lands too far, the\nsoft-interact will miss it.)"] = "(Если он упадет слишком далеко,\nмягкое взаимодействие его не зацепит.)"
    T["Key set to "] = "Клавиша назначена на "
    T["Fish, cast Toys, Items and Macros using double mouse clicks!\n"] = "Рыбалка, использование игрушек, предметов и макросов двойным кликом мыши!\n"
    --Vanilla
    T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") 
    .. "and " .. colorBlu:WrapTextInColorCode("use Items and Configured Macros ") 
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Заброс ") .. ", "
    .. colorBlu:WrapTextInColorCode("Подсечка ") .. "и " 
    .. colorBlu:WrapTextInColorCode("использование предметов и настроенных макросов ") .. "одной кнопкой."

    T["Note for Classic:"] = "Примечание для Classic:"
    T[colorBlu:WrapTextInColorCode("Cast ") .. "your rod and " .. colorBlu:WrapTextInColorCode("use Items/Macros ") 
    .. "using\ndouble mouse clicks!\n"] = colorBlu:WrapTextInColorCode("Забросьте ") .. "удочку и "
    .. colorBlu:WrapTextInColorCode("используйте предметы/макросы ") .. "двойным \nкликом мыши!\n"

--extra.lua
T["Extra Toys"] = "Доп. игрушки"
T["   " .. colorYello:WrapTextInColorCode("Click ") .. "any of the buttons above\nthen select a toy with left click from\nthe " 
.. colorYello:WrapTextInColorCode("Toy Box ") .. "that pops up."] = "   " .. colorYello:WrapTextInColorCode("Нажмите ") .. "на любую из кнопок выше,\nзатем выберите игрушку левым кликом из\nпоявившейся " 
    .. colorYello:WrapTextInColorCode("коллекции игрушек") .. "."

T["Extra Items / Macros"] = "Доп. предметы / макросы"

T["   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " .. 
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes below."] = "   " .. colorYello:WrapTextInColorCode("Перетащите ") .. "используемый " .. colorYello:WrapTextInColorCode("предмет ") .. "или " .. 
    colorYello:WrapTextInColorCode("макрос ") .. "в любое из полей ниже."

T["Set Timer"] = "Установить таймер"
T["Toggle Equipment"] = "Переключить снаряжение"
T["Toggle Bags"] = "Переключить сумки"
T["Open Macros"] = "Открыть макросы"

--standard.lua
T["Raft"] = "Плот"
T["Couldn't find any rafts \n in toybox, feature disabled"] = "Не найдено плотов в коллекции,\nфункция отключена"
T["Oversized Bobber"] = "Увеличенный поплавок"
T["Couldn't find \n Oversized Bobber in \n toybox, feature disabled"] = "Не найден увеличенный\nпоплавок в коллекции,\nфункция отключена"
T["Crate of Bobbers"] = "Ящик с поплавками"
T["Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"] = "\nНе найденоящиков с\nпоплавкамив коллекции,\nфункция отключена"
T["Crate Bobbers"] = "Ящики с поплавками"
T["Ultra Focus:"] = "Ультра Фокус:"
T["Audio"] = "Звук"
T["Temp. Auto Loot "] = "Временный авто-лут "
T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot") 
.. ", then turn it back off after you reel.\n\n" .. colorGrae:WrapTextInColorCode("If you have ")
.. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")] = "Если включено, Angleur временно включит " 
.. colorYello:WrapTextInColorCode("Авто-лут") .. ", а затем выключит его после подсечки.\n\n" 
.. colorGrae:WrapTextInColorCode("Если у вас уже включен ") .. colorYello:WrapTextInColorCode("Авто-лут ")
.. colorGrae:WrapTextInColorCode(", эта функция автоматически отключится.")
T["(Already on)"] = "(Включено)"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a " 
.. colorYello:WrapTextInColorCode("/reload") .. " to fix it."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Если двойной клик работает нестабильно, выполните " .. colorYello:WrapTextInColorCode("/reload") .. " для исправления."
T["Rafts"] = "Плоты"
T["Random Bobber"] = "Случайный поплавок"
T["Preferred Mouse Button"] = "Предпочитаемая кнопка мыши"
T["Right Click"] = "Правый клик"

--tabs-general.lua
T[colorBlu:WrapTextInColorCode("Angleur visual ") .. "is now hidden."] = colorBlu:WrapTextInColorCode("Визуал Angleur ") .. "теперь скрыт."
T["You can re-enable it from the"] = "Вы можете снова включить его в"
T[colorYello:WrapTextInColorCode("Config Menu ") .. "accessed by: " 
.. colorYello:WrapTextInColorCode("/angleur ") .. " or  " 
.. colorYello:WrapTextInColorCode("/angang")] = colorYello:WrapTextInColorCode("Меню настроек ") 
.. "доступно по командам: " .. colorYello:WrapTextInColorCode("/angleur ") 
.. " или " .. colorYello:WrapTextInColorCode("/angang")

--tiny.lua
T["Disable Soft Interact"] = "Отключить мягкое взаимодействие"

T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n" 
.. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")] = "Если включено, Angleur отключит " 
.. colorYello:WrapTextInColorCode("Мягкое взаимодействие ") .. "после остановки рыбалки.\n\n" 
.. colorGrae:WrapTextInColorCode("Предназначено для тех, кто хочет оставить мягкое взаимодействие отключенным во время обычной игры.")

T["Can't change in combat."] = "Нельзя изменить в бою."

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off " 
.. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "теперь будет отключать " .. colorYello:WrapTextInColorCode("Мягкое взаимодействие ") .. "когда вы не рыбачите."

T["Dismount With Key"] = "Слезать с помощью клавиши"

T["If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ") 
.. "when you use OneKey/DoubleClick.\n\n" 
.. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")] = "Если включено, Angleur заставит вас " 
.. colorYello:WrapTextInColorCode("слезть ") .. "при использовании OneKey/Двойного клика.\n\n" 
.. colorGrae:WrapTextInColorCode("Ваша клавиша больше не будет отпускаться при посадке.")

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now " 
.. colorYello:WrapTextInColorCode("dismount ") .. "you"] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "теперь будет " .. colorYello:WrapTextInColorCode("сбрасывать вас ") .. "с транспорта"

T["Disable Soft Icon"] = "Отключить значок мягкого взаимодействия"

T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."] = "Показывать ли значок крючка над поплавком.\nПримечание: это влияет на значки других объектов с мягким взаимодействием."

T["Soft target icon for game objects disabled."] = "Значок мягкого взаимодействия для игровых объектов отключен."
T["Soft target icon for game objects re-enabled."] = "Значок мягкого взаимодействия для игровых объектов снова включен."
T["Double Click Window"] = "Окно двойного клика"
T["Visual Size"] = "Размер визуала"
T["Master Volume(Ultra Focus)"] = "Громкость (Ультра Фокус)"
T["Login Messages"] = "Сообщения при входе"
T["Debug Mode"] = "Режим отладки"
T["Defaults"] = "По умолчанию"

--firstInstall
T["Angleur Warning"] = "Предупреждение Angleur"
T["Are you sure you want to abandon the tutorial?"] = "Вы уверены, что хотите прервать обучение?"
T["(You can redo it later by clicking the Redo Button\nin the Tiny Panel)"] = "(Вы можете повторить его позже, нажав кнопку \"Повторить обучение\"\nв мини-панели)"
T["Yes"] = "Да"
T["No"] = "Нет"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ")
.. "detected."] = colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ") .. "обнаружен."

T["Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ") .. "General Settings" 
.. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"] = "Plater " .. colorYello:WrapTextInColorCode("-> ") 
.. "Дополнительно " .. colorYello:WrapTextInColorCode("-> ") .. "Основные настройки" .. colorYello:WrapTextInColorCode(":") .. " Показывать мягкое взаимодействие с игровыми объектами*"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") 
.. "for Angleur to function properly."] = "Должно быть " .. colorGreen:WrapTextInColorCode("включено ") .. "для корректной работы Angleur."

T[colorYello:WrapTextInColorCode("To Get Started:\n\n") .. "Choose your desired\n"
.. colorBlu:WrapTextInColorCode("Fishing Method") .. " by\nclicking one of these buttons.\n\n"] = colorYello:WrapTextInColorCode("Чтобы начать:\n\n") 
.. "Выберите предпочитаемый\n" .. colorBlu:WrapTextInColorCode("метод рыбалки") .. ",\nнажав одну из этих кнопок.\n\n"

T[colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Visual:\n\n") .. "Shows what your next input will do.\n" 
.. "Drag and place it anywhere you might like.\n\n" .. "You can also hide it by clicking its close button."] = colorBlu:WrapTextInColorCode("Angleur ") 
.. colorYello:WrapTextInColorCode("Визуал:\n\n") .. "Показывает, что сделает следующее действие.\n" 
.. "Перетащите и разместите его в удобном месте.\n\n" .. "Вы также можете скрыть его, нажав кнопку закрытия."

T["Angleur works on a " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. "system, so you don't have to reload your UI after you're done fishing.\n\n"
.. colorBlu:WrapTextInColorCode("Right Click ")
.. "to put Angleur to sleep, and wake it up if it is. You can also Right Click the minimap button."] = "Angleur работает по системе " 
.. colorYello:WrapTextInColorCode("Сон/Пробуждение ") .. ", поэтому вам не нужно перезагружать интерфейс после рыбалки.\n\n"
.. colorBlu:WrapTextInColorCode("Правый клик ") .. "усыпляет Angleur и будит его. Также можно использовать правый клик по кнопке у мини-карты."

T["You can enable\n\nRafts,\n\nBobbers,\n\nand Ultra Focus(Audio/Temporary Auto Loot)\n\nby checking these boxes."] = "Вы можете включить\n\nПлоты,\n\nПоплавки,\n\nи Ультра Фокус (Звук/Временный авто-лут)\n\nустановив эти галочки."

T["Now, let's move to the " .. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Click here."] = "Теперь перейдем на вкладку " 
.. colorYello:WrapTextInColorCode("Дополнительно") .. ". Нажмите здесь."

T[colorPurple:WrapTextInColorCode("Extra Toys\n\n")  .. "You can select a toy from the " .. colorYello:WrapTextInColorCode("Toy Box ") 
.. "to add it to your Angleur rotation.\n\n Click on an empty slot to open toy selection, or click next to move on.\n\n"
.. "Note: Not every toy will work, some silence you so you can't fish etc. Experiment around!"] = colorPurple:WrapTextInColorCode("Дополнительные игрушки\n\n")  
.. "Вы можете выбрать игрушку из " .. colorYello:WrapTextInColorCode("коллекции игрушек") 
.. ", чтобы добавить ее в ротацию Angleur.\n\n Нажмите на пустой слот для выбора игрушки или нажмите \"Далее\".\n\n"
.. "Примечание: Не все игрушки будут работать, некоторые могут заставить вас молчать и т.д. Экспериментируйте!"

T[colorBrown:WrapTextInColorCode("Extra Items/Macros\n\n")  .. "You can " .. colorYello:WrapTextInColorCode("Drag ") 
.. "items or macros here to add them to your Angleur rotation.\n\n" .. "These can be fishing hats, throwable fish, spells...\n\n" 
.. "You can even set custom timers for them by clicking the " .. colorYello:WrapTextInColorCode("stopwatch ") 
.. "icon that appears once you slot an item/macro.\n\nClick " 
.. colorYello:WrapTextInColorCode("Okay ") .. "to move on."] = colorBrown:WrapTextInColorCode("Дополнительные предметы/макросы\n\n")  
.. "Вы можете " .. colorYello:WrapTextInColorCode("перетащить ") .. "предметы или макросы сюда, чтобы добавить их в ротацию Angleur.\n\n" 
.. "Это могут быть шляпы для рыбалки, бросаемая рыба, заклинания...\n\n" .. "Вы даже можете установить таймеры для них, нажав на " 
.. colorYello:WrapTextInColorCode("иконку секундомера") .. ", которая появится после добавления предмета/макроса.\n\nНажмите " 
.. colorYello:WrapTextInColorCode("Окей") .. ", чтобы продолжить."

T["Click here if you need an example & explanation of use of macros for Angleur!"] = "Нажмите здесь, если вам нужен пример и объяснение использования макросов для Angleur!"

T["And lastly, the " .. colorYello:WrapTextInColorCode("Create & Add ") .. "button Creates an item set for you and automatically adds your " 
.. "slotted items to it.\n\nNow, Angleur will automatically equip your slotted items when you " 
.. colorYello:WrapTextInColorCode("wake ") .."it up, and restore previous items when you put it back to " 
.. colorYello:WrapTextInColorCode("sleep.")] = "И, наконец, кнопка " .. colorYello:WrapTextInColorCode("Создать & Добавить") 
.. " создает набор предметов и автоматически добавляет в него ваши " 
.. "предметы.\n\nТеперь Angleur будет автоматически экипировать ваши предметы при " 
.. colorYello:WrapTextInColorCode("пробуждении") .. " и восстанавливать предыдущие предметы при " 
.. colorYello:WrapTextInColorCode("усыплении") .. "."

--thanks
T["You can support the project\nby donating on " .. colorYello:WrapTextInColorCode("Ko-Fi ")
.. "or " .. colorYello:WrapTextInColorCode("Patreon!")] = "Вы можете поддержать проект\nпожертвованием на " .. colorYello:WrapTextInColorCode("Ko-Fi ")
.. "или " .. colorYello:WrapTextInColorCode("Patreon!")

T["THANK YOU!"] = "СПАСИБО!"


--advancedAngling
--advancedAngling
T["HOW?"] = "КАК?"
T["Advanced Angling"] = "Продвинутая рыбалка"

T[colorBlu:WrapTextInColorCode("Angleur ") 
.. "will have you cast the dragged item/macro\nif all of their below listed conditions are met."] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "заставит вас использовать перетаскиваемый предмет/макрос,\nесли все перечисленные ниже условия будут выполнены."

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
.. "_____________________________________________"] = colorYello:WrapTextInColorCode("Предметы:\n") .. 
"- Любой используемый предмет из ваших сумок или экипировки персонажа. " .. "\n\n Условия:\n\n   1) "
.. colorYello:WrapTextInColorCode("Не на перезарядке\n") .. "   2) " .. colorYello:WrapTextInColorCode("Аура не активна") 
.. " (если присутствует)\n" .. colorYello:WrapTextInColorCode("\nМакросы:\n") 
.. "- Любой валидный макрос, содержащий заклинание или используемый предмет - /cast или /use. " 
.. "\n\n Условия:\n\n      1) ".. colorYello:WrapTextInColorCode("Условия макроса ") 
.. "выполнены\n" .. "      2) Заклинание/предмет " .. colorYello:WrapTextInColorCode("не на перезарядке\n")
.. "                    и их\n      3) " .. colorYello:WrapTextInColorCode("Ауры не активны") 
.. " (если присутствуют)\n\n" .. colorYello:WrapTextInColorCode("      ВАЖНО: ") 
.. "Если вы используете условные выражения в макросах, они должны быть АКТИВНЫ, когда вы перетаскиваете макрос в слот.\n" 
.. "   _____________________________________________"

T["Spell/Item has no Cooldown/Aura?\n" 
.. "Click " .. colorYello:WrapTextInColorCode("the Stopwatch ") .. "to set a manual timer.\n" 
.. colorYello:WrapTextInColorCode("                                                 (minutes:seconds)")] = "У заклинания/предмета нет перезарядки/ауры?\n" 
.. "Нажмите " .. colorYello:WrapTextInColorCode("на секундомер ") .. ", чтобы установить таймер вручную.\n" 
.. colorYello:WrapTextInColorCode("                                                 (минуты:секунды)")
