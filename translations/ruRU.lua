if (GAME_LOCALE or GetLocale()) ~= "ruRU" then
  return
end

local colorYello = CreateColor(1.0, 0.82, 0.0)
local colorGrae = CreateColor(0.85, 0.85, 0.85)
local colorBlu = CreateColor(0.61, 0.85, 0.92)

local T = Angleur_Translate

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
T["Make sure this box is checked!"] = "Убедитесь, что эта галочка отмечена!"
T["Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."] = "Находится в Plater->Дополнительно->Общие настройки.\n\nИначе Angleur не сможет подсекать рыбу."
T["Angleur Configuration"] = "Настройки Angleur"
T["Having Problems?"] = "Возникли проблемы?"
T["Angleur Warning: Plater"] = "Предупреждение Angleur: Plater"
T["Okay"] = "ОК"

--extra.lua

T["Extra Toys"] = "Доп. игрушки"
T["   " .. colorYello:WrapTextInColorCode("Click ") .. "any of the buttons above\nthen select a toy with left click from\nthe " 
.. colorYello:WrapTextInColorCode("Toy Box ") .. "that pops up."] = "   " .. colorYello:WrapTextInColorCode("Нажмите ") .. "любую из кнопок выше,\nзатем выберите игрушку левым кликом из\n" 
    .. colorYello:WrapTextInColorCode("Коллекции игрушек ") .. "которая появится."

T["Extra Items / Macros"] = "Доп. предметы / макросы"

T["   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " .. 
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes below."] = "   " .. colorYello:WrapTextInColorCode("Перетащите ") .. "используемый " .. colorYello:WrapTextInColorCode("предмет ") .. "или " .. 
    colorYello:WrapTextInColorCode("макрос ") .. "в любое из полей ниже."

--standard.lua

T["Raft"] = "Плот"
T["Couldn't find any rafts \n in toybox, feature disabled"] = "Не найдено в коллекции,\n функция отключена"
T["Oversized Bobber"] = "Гигантский поплавок"
T["Couldn't find \n Oversized Bobber in \n toybox, feature disabled"] = "Не найден коллекции,\n функция отключена"
T["Crate of Bobbers"] = "Ящик с поплавками"
T["Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"] = "Не найдено в коллекции,\n функция отключена"
T["Crate Bobbers"] = "Поплавки из ящика"
T["Audio"] = "Звук"
T["Temp. Auto Loot "] = "Временный авто-лут "
T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot") 
.. ", then turn it back off after you reel.\n\n" .. colorGrae:WrapTextInColorCode("If you have ")
.. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")] = "Если отмечено, Angleur временно включит " 
.. colorYello:WrapTextInColorCode("Авто-лут") .. ", затем выключит его после подсечки.\n\n" 
.. colorGrae:WrapTextInColorCode("Если у вас уже включен ") .. colorYello:WrapTextInColorCode("Авто-лут ")
.. colorGrae:WrapTextInColorCode(", эта функция автоматически отключится.")
T["(Already on)"] = "(Уже вкл.)"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a " 
.. colorYello:WrapTextInColorCode("/reload") .. " to fix it."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Если двойной клик работает не плавно, выполните " .. colorYello:WrapTextInColorCode("/reload") .. " для исправления."
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
.. " или  " .. colorYello:WrapTextInColorCode("/angang")

--tiny.lua

T["Disable Soft Interact"] = "Отключить мягкое взаимодействие"

T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n" 
.. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")] = "Если отмечено, Angleur отключит " 
.. colorYello:WrapTextInColorCode("Мягкое взаимодействие ") .. "после окончания рыбалки.\n\n" 
.. colorGrae:WrapTextInColorCode("Для тех, кто хочет оставлять эту функцию отключенной вне рыбалки.")

T["Can't change in combat."] = "Нельзя изменить в бою."

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off " 
.. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "теперь будет отключать " .. colorYello:WrapTextInColorCode("Мягкое взаимодействие ") .. "вне рыбалки."

T["Dismount With Key"] = "Слезать с транспорта по клавише"

T["If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ") 
.. "when you use OneKey/DoubleClick.\n\n" 
.. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")] = "Если отмечено, Angleur заставит вас " 
.. colorYello:WrapTextInColorCode("слезть с транспорта ") .. "при использовании OneKey/Двойного клика.\n\n" 
.. colorGrae:WrapTextInColorCode("Ваша клавиша больше не будет отпускаться при посадке на транспорт.")

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now " 
.. colorYello:WrapTextInColorCode("dismount ") .. "you"] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "теперь будет " .. colorYello:WrapTextInColorCode("сбрасывать вас с транспорта")

T["Disable Soft Icon"] = "Отключить иконку мягкого взаимодействия"

T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."] = "Отображать ли иконку крючка над поплавком.\nПримечание: это влияет на иконки других объектов с мягким взаимодействием."

T["Soft target icon for game objects disabled."] = "Иконка мягкого взаимодействия для игровых объектов отключена."
T["Soft target icon for game objects re-enabled."] = "Иконка мягкого взаимодействия для игровых объектов снова включена."
T["Double Click Window"] = "Окно двойного клика"
T["Visual Size"] = "Размер визуала"
T["Master Volume(Ultra Focus)"] = "Громкость (Ультра Фокус)"
T["Login Messages"] = "Сообщения при входе"
