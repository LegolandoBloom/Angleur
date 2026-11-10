if (GAME_LOCALE or GetLocale()) ~= "esES" then
  return
end

local T = Angleur_Translate


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

T["Toggle Background Audio"] = "Alternar audio de fondo"

T["Oversized Bobber"] = "Bobber de gran tamaño"

T["Extra Items / Macros"] = "Elementos adicionales/Macros"

T["Recast When OOB"] = "Refundido cuando OOB"

T["Mouse needs to be in the indicated area for the scanner to work properly."] = "El mouse debe estar en el área indicada para que el escáner funcione correctamente."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Is awake. To temporarily disable, type "
.. colorYello:WrapTextInColorCode("/angsleep ")] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Está despierto. Para desactivar temporalmente, escriba " .. colorYello:WrapTextInColorCode("/angsleep ")

T["(If it lands too far, the\nsoft-interact will miss it.)"] = "(Si cae demasiado lejos, el\nsoft-interact se lo perderá.)"

T["My Other Addons!"] = "¡Mis otros complementos!"

T["(You can redo it later by clicking the Redo Button\nin the Tiny Panel)"] = "(Puedes rehacerlo más tarde haciendo clic en el botón Rehacer\nen el panel pequeño)"

T["If there is an object BEHIND your character that forces your camera angle to change, try setting it to a lower value."] = colorWhite:WrapTextInColorCode("Si hay un objeto DETRÁS de tu personaje que obliga a cambiar el ángulo de tu cámara, intenta configurarlo en un valor ") .. colorRed:WrapTextInColorCode(" inferior a ") .. colorWhite:WrapTextInColorCode(".")

T["Temp. Auto Loot "] = "Temperatura. Botín automático"

T["Enable Recast Key"] = "Habilitar clave de refundición"

T["/angleur"] = "/ pescador"

T["Use this when you are inside the water, making the bobber land higher than you."] = colorWhite:WrapTextInColorCode("Utiliza esto cuando estés dentro del agua, haciendo que el corcho aterrice más alto que tú.")

T["And lastly, the " .. colorYello:WrapTextInColorCode("Create & Add ") .. "button Creates an item set for you and automatically adds your "
.. "slotted items to it.\n\nNow, Angleur will automatically equip your slotted items when you "
.. colorYello:WrapTextInColorCode("wake ") .."it up, and restore previous items when you put it back to "
.. colorYello:WrapTextInColorCode("sleep.")] = "Y por último, el botón " .. colorYello:WrapTextInColorCode("Crear y agregar ") .. " Crea un conjunto de elementos para usted y le agrega automáticamente los elementos ranurados.\n\nAhora, Angleur equipará automáticamente sus elementos ranurados cuando " .. colorYello:WrapTextInColorCode(" despierte ANGLEURMARK3Salga y restaurará los elementos anteriores cuando los vuelva a poner en [[colorYello]]dormir.")

T["This will restart the tutorial, are you sure?"] = "Esto reiniciará el tutorial, ¿estás seguro?"

T["Due to a limitation in Classic, the \'soft interact system\' can sometimes fail to catch the bobber when it lands too far.(Demonstrated in the picture)"
.. "\n\nAngleur is designed to provide workarounds for this. Once enabled, please check out the options that appear below."] = "Debido a una limitación en Classic,\nEl 'sistema de interacción suave' " .. colorYello:WrapTextInColorCode(" ") .. " a veces no logra atrapar el corcho cuando aterriza demasiado lejos." .. colorGrae:WrapTextInColorCode("\n(Se muestra en la imagen)") .. colorBlu:WrapTextInColorCode("\n\nAngleur ") .. " está diseñado para proporcionar soluciones alternativas a este problema. Una vez habilitado, consulte las opciones de " .. colorYello:WrapTextInColorCode(" que aparecen a continuación.")

T["Weather-Beaten Fishing Hat"] = "Sombrero de pesca deteriorado por la intemperie"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to "
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] = "Debe estar marcado " .. colorGreen:WrapTextInColorCode(" EN ") .. " para la combinación de teclas de Angleur con " .. colorYello:WrapTextInColorCode("Reel/Loot ") .. "tus capturas."

T["Bobber Scanner(EXPERIMENTAL)"] = "Escáner Bobber\n" .. colorBlu:WrapTextInColorCode("(EXPERIMENTAL)")

T["Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ")
.. "General Settings" .. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"] = "Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Avanzado " .. colorYello:WrapTextInColorCode("-> ") .. "Configuración general" .. colorYello:WrapTextInColorCode(":") .. " Mostrar interacción suave en los objetos del juego*"

T["Nat's Hat"] = "El sombrero de Nat"

T["down,\nawaiting additional key press."] = "abajo,\nesperando que se presione una tecla adicional."

T["First install tutorial restarting."] = "Primer tutorial de instalación reiniciando."

T["Left Click: " .. colorYello:WrapTextInColorCode("Config Panel")] = "Clic izquierdo: " .. colorYello:WrapTextInColorCode("Panel de configuración")

T["Angleur Bobber Scanner: Please move the Gamepad Cursor that appears into the inticated box."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner: ") .. "Mueva el Gamepad " .. colorYello:WrapTextInColorCode("Cursor ") .. " que aparece en el cuadro indicado " .. colorRed:WrapTextInColorCode(".")

T["\n\nChecked by default, uncheck if you want to use Extra Toys, Items, Spells while submerged in water."] = colorGrae:WrapTextInColorCode("\n\nMarcado de forma predeterminada, desmarque si desea usar juguetes, artículos o hechizos adicionales mientras está sumergido en agua.")

T["Angleur Warning: Plater"] = "Advertencia de Angleur: Plater"

T["This item does not have a castable spell."] = "Este objeto no tiene un hechizo que se pueda lanzar."

T["Flesh Eating Worm"] = "Gusano carnívoro"

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now "
.. colorYello:WrapTextInColorCode("dismount ") .. "you"] = colorBlu:WrapTextInColorCode("Angleur ") .. "ahora " .. colorYello:WrapTextInColorCode("desmontará ") .. "usted"

T["Sharpened Fish Hook"] = "Anzuelo afilado"

T["One-Key Fishing Mode"] = "Modo de pesca con una sola tecla"

T["Note for Cata:"] = "Nota para Cata:"

T["Make sure this box is checked!"] = "¡Asegúrate de que esta casilla esté marcada!"

T["Timer set to: "] = "Temporizador configurado en:"

T["This is a limitation of Classic(not the case for Cata and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."] = "Esta es una limitación de Classic (no es el caso de Cata y Retail), ya que carece de un administrador de equipos incorporado adecuado, lo que le permite colocar elementos pasivos en su conjunto Angleur."

T["Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"] = "Por favor establece una combinación de teclas\npara usar la tecla única\nMétodo de pesca por\nusando el\nbotón arriba"

T["Crate of Bobbers: Can of Worms"] = "Caja de Bobbers: Lata de Gusanos"

T["One-Key NOT SET! To set,\nopen config menu with:"] = "¡Una tecla NO ESTABLECIDA! Para configurar,\nabra el menú de configuración con:"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to function properly."] = "Debe estar marcado " .. colorGreen:WrapTextInColorCode(" EN ") .. " para que Angleur funcione correctamente."

T["Feathered Lure"] = "Señuelo emplumado"

T["You can re-enable it from the"] = "Puedes volver a habilitarlo desde el"

T["Equipping of the Angleur set disrupted due to sudden combat"] = "Equipamiento del conjunto Angleur interrumpido debido a un combate repentino"

T["Update"] = "Actualizar"

T[colorYello:WrapTextInColorCode("Config Menu ") .. "accessed by: "
.. colorYello:WrapTextInColorCode("/angleur ") .. " or  "
.. colorYello:WrapTextInColorCode("/angang")] = colorYello:WrapTextInColorCode("Menú de configuración ") .. " al que se accede por: " .. colorYello:WrapTextInColorCode("/angleur ") .. " o " .. colorYello:WrapTextInColorCode("/angang")

T["If enabled, Angleur will turn on \"Sound in the Background\" when awake, and restore it to its previous value when sleeping."
.. "\n\nOnly disable if you NEVER want background sound to be on, or there is an error due to a clash with another addon."] = "Si está habilitado, Angleur activará " .. colorGreen:WrapTextInColorCode(" en ") .. colorYello:WrapTextInColorCode(" \"Sonido de fondo\" ") .. " cuando " .. colorGreen:WrapTextInColorCode(" esté despierto ") .. ", y " .. colorRed:WrapTextInColorCode(" restaurará ") .. " a su valor anterior cuando " .. colorRed:WrapTextInColorCode(" esté dormido") .. "." .. colorGrae:WrapTextInColorCode("\n\nDesactívelo solo si NUNCA desea que el sonido de fondo esté activado o si hay un error debido a un conflicto con otro complemento.")

T["Please select a usable item."] = "Seleccione un artículo utilizable."

T["Angleur Bobber Scanner: Gamepad Detected! Cast fishing once to trigger cursor mode, then place it in the indicated box."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner: ") .. "¡Gamepad detectado! Lanza " .. colorYello:WrapTextInColorCode("fishing ") .. "una vez para activar el modo de cursor " .. colorYello:WrapTextInColorCode("") .. ", luego colócalo en el cuadro indicado " .. colorRed:WrapTextInColorCode(".")

T["Soft target icon for game objects disabled."] = "Icono de objetivo suave para objetos del juego desactivado."

T["Right Click to temporarily put Angleur to sleep. zzz..."] = "Haz clic derecho para poner a Angleur a dormir temporalmente. zzz..."

T["login messages re-enabled"] = "mensajes de inicio de sesión rehabilitados"

T["Redo Tutorial"] = "Tutorial de rehacer"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping. To continue using, type "
.. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Durmiendo. Para continuar usando, escriba " .. colorYello:WrapTextInColorCode("/angsleep ") .. " nuevamente,"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Minimap Icon hidden, "
.. colorYello:WrapTextInColorCode("/angmini ") .. "to show."] = colorBlu:WrapTextInColorCode("Ángulo: ") .. "Minimapa Icono oculto, " .. colorYello:WrapTextInColorCode("/angmini ") .. "para mostrar."

T["Nightcrawlers"] = "Rondadores nocturnos"

T["Personal Fishing Barge"] = "Barcaza de pesca personal"

T["Yes"] = "Sí"

T["link of macro spell: "] = "enlace del hechizo macro:"

T["Bat Visage Bobber"] = "Bobber con rostro de murciélago"

T["Clicking on the button\nthat appears below\nonce this option is selected."] = "Haciendo clic en el botón\nque aparece debajo\nuna vez seleccionada esta opción."

T["Standard"] = "Estándar"

T["Release When Swimming"] = "Liberar al nadar"

T["Plays a warning sound when the bobber lands too far for the soft interact system to capture."] = "Reproduce un sonido de advertencia " .. colorYello:WrapTextInColorCode(" ") .. " cuando el bobber aterriza demasiado lejos para que el sistema de interacción suave lo capture."

T["Angleur Bobber Scanner: Gamepad Cursor has been enabled. Please move it to the indicated area to start using."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner:") .. colorYello:WrapTextInColorCode(" Cursor del gamepad ") .. " se ha habilitado. Muévalo al área indicada por " .. colorRed:WrapTextInColorCode(" ") .. " para comenzar a usarlo."

T["You can enable\n\nRafts,\n\nBobbers,\n\nand Ultra Focus(Audio/Temporary Auto Loot)\n\nby checking these boxes."] = "Puedes habilitar\n\nbalsas,\n\nBobbers,\n\ny Ultra Focus (audio/botín automático temporal)\n\nmarcando estas casillas."

T[colorBrown:WrapTextInColorCode("Extra Items/Macros\n\n")  .. "You can " .. colorYello:WrapTextInColorCode("Drag ")
.. "items or macros here to add them to your Angleur rotation.\n\n" .. "These can be fishing hats, throwable fish, spells...\n\n"
.. "You can even set custom timers for them by clicking the " .. colorYello:WrapTextInColorCode("stopwatch ")
.. "icon that appears once you slot an item/macro.\n\nClick "
.. colorYello:WrapTextInColorCode("Okay ") .. "to move on."] = colorBrown:WrapTextInColorCode("Elementos/Macros adicionales\n\n") .. "Puedes " .. colorYello:WrapTextInColorCode("Arrastrar elementos o macros de ") .. " aquí para agregarlos a tu rotación de Angleur.\n\nPueden ser gorros de pesca, peces arrojables, hechizos...\n\nIncluso puedes configurar temporizadores personalizados para ellos haciendo clic en el icono del cronómetro " .. colorYello:WrapTextInColorCode(" ") .. " que aparece una vez que colocas un elemento/macro.\n\nHaga clic en " .. colorYello:WrapTextInColorCode("Aceptar ") .. "para continuar."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "You are running an addon that interferes with"
.. colorYello:WrapTextInColorCode("Soft-Interact.")] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Estás ejecutando un complemento que interfiere con" .. colorYello:WrapTextInColorCode("Soft-Interact.")

T["Scan Width"] = colorYello:WrapTextInColorCode("Ancho de escaneo")

T["If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ")
.. "when you use OneKey/DoubleClick.\n\n"
.. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")] = "Si está marcado, Angleur le hará " .. colorYello:WrapTextInColorCode("desmontar ") .. " cuando utilice OneKey/DoubleClick.\n\n" .. colorGrae:WrapTextInColorCode(" Su llave ya no se liberará al realizar el montaje.")

T["Shows a visual range indicator when the bobber lands too far for the soft interact system to capture."] = "Muestra un indicador de alcance visual cuando el flotador aterriza demasiado lejos para que el sistema de interacción suave lo capture."

T["Place your cursor in the box\nbelow for the scanner to work."] = "Coloque el cursor en el cuadro\na continuación para que el escáner funcione."

T["Toy selection deactivated"] = "Selección de juguetes desactivada"

T["Crate of Bobbers: Carved Wooden Helm"] = "Caja de Bobbers: Yelmo de madera tallada"

T["Artisan Beverage Goblet Bobber"] = "Bobber de copa de bebida artesanal"

T["Bobber Scan: Scan unsuccessful. Try changing the \'Elevation\' setting, "
.. "or the width of the search area in the Scanner menu by clicking the Gear icon next to the mouse drop-off box"] = colorBlu:WrapTextInColorCode("Bobber Scan: ") .. "Scan fallido. Intente cambiar la configuración " .. colorYello:WrapTextInColorCode("'Elevation' ") .. ", o el ancho del área de búsqueda en el menú del escáner haciendo clic en el icono " .. colorYello:WrapTextInColorCode("Gear ") .. " al lado del mouse " .. colorGreen:WrapTextInColorCode("drop") .. colorRed:WrapTextInColorCode("-off ") .. "box."

T[colorPurple:WrapTextInColorCode("Extra Toys\n\n")  .. "You can select a toy from the " .. colorYello:WrapTextInColorCode("Toy Box ")
.. "to add it to your Angleur rotation.\n\n Click on an empty slot to open toy selection, or click next to move on.\n\n"
.. "Note: Not every toy will work, some silence you so you can't fish etc. Experiment around!"] = colorPurple:WrapTextInColorCode("Juguetes adicionales\n\n") .. " Puedes seleccionar un juguete de " .. colorYello:WrapTextInColorCode("Toy Box ") .. " para agregarlo a tu rotación de Angleur.\n\n Haga clic en un espacio vacío para abrir la selección de juguetes o haga clic en Siguiente para continuar.\n\nNota: No todos los juguetes funcionan, algunos te silencian para que no puedas pescar, etc. ¡Experimenta!"

T["Spell/Item has no Cooldown/Aura?\n"
.. "Click " .. colorYello:WrapTextInColorCode("the Stopwatch ") .. "to set a manual timer.\n"
.. colorYello:WrapTextInColorCode("                                                 (minutes:seconds)")] = "¿El hechizo/objeto no tiene tiempo de reutilización/aura?\nHaga clic en " .. colorYello:WrapTextInColorCode(" en el cronómetro ") .. " para configurar un temporizador manual.\n" .. colorYello:WrapTextInColorCode(" (minutos:segundos)")

T["Automatic Aquatic Form for ALL CLASSES, ALL THE TIME!\n\nEquip Underlight_Angler when swimming, re-equip your \'Main\' Fishing Rod when not."] = "Forma Acuática Automática para TODAS LAS CLASES, ¡TODO EL TIEMPO!\n\nEquipa " .. colorUnderlight:WrapTextInColorCode("Underlight_Angler ") .. " cuando nades, vuelve a equipar tu caña de pescar \"principal\" cuando no."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ")
.. "detected."] = colorBlu:WrapTextInColorCode("Ángulo: ") .. colorYello:WrapTextInColorCode("Plater ") .. "detectado."

T["Default tiny settings restored"] = "Pequeñas configuraciones predeterminadas restauradas"

T["Both"] = "Ambos"

T["All unslotted items in the set have been set to <ignore slot>."] = "Todos los elementos sin ranura del conjunto se han configurado en <ignorar ranura>."

T["Angleur will only have you cast rafts while swimming, then release the key afterward."] = "Angleur solo te hará lanzar balsas mientras nadas y luego soltará la llave."

T["If checked, the only action your OneKey/DoubleClick will perform while swimming will be casting rafts.\n(If you already have one, the key will be released.)"] = "Si está marcado, la única acción que su " .. colorYello:WrapTextInColorCode("OneKey / DoubleClick ") .. " realizará " .. colorDarkBlu:WrapTextInColorCode(" mientras nada ") .. " será lanzar " .. colorBrown:WrapTextInColorCode("rafts.") .. "\n(Si ya tiene una, se liberará la clave)."

T["Let Angleur take care of Audio & Loot settings for you."] = "Deje que Angleur se encargue de " .. colorYello:WrapTextInColorCode("Audio") .. " y " .. colorYello:WrapTextInColorCode("Obtenga la configuración de ") .. " por usted."

T["If checked, Angleur will go to Sleep when you unequip your fishing rod.\n\nUncheck if you want to fish without a rod in the main hand slot. On by default."] = "Si está marcado, Angleur irá a " .. colorYello:WrapTextInColorCode("Sleep ") .. " cuando desequipes tu caña de pescar.\n\n" .. colorGrae:WrapTextInColorCode("Desmarque si desea pescar sin caña en la ranura de mano principal. Activado de forma predeterminada.")

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Thank you for using Angleur!"] = colorBlu:WrapTextInColorCode("Angleur: ") .. "¡Gracias por usar Angleur!"

T["Select which mouse button by:"] = "Seleccione qué botón del mouse:"

T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)\n\n"
.. "Pick \'Random Raft\' to get a different one every time!"] = "¡Elige un " .. colorBrown:WrapTextInColorCode("Raft") .. " y Angleur te pedirá que lo uses cuando estés en " .. colorDarkBlu:WrapTextInColorCode("water") .. "!\n(También mantén el beneficio después)\n\n¡Elija " .. colorYello:WrapTextInColorCode(" 'Random Raft' ") .. " para obtener uno diferente cada vez!"

T["Crate of Bobbers: Squeaky Duck"] = "Caja de Bobbers: Pato chillón"

T["You can support the project\nby donating on " .. colorYello:WrapTextInColorCode("Ko-Fi! ")] = "Puedes apoyar el proyecto.   \ndonando en " .. colorYello:WrapTextInColorCode("Ko-Fi!")

T["Crate of Bobbers: Murloc Head"] = "Caja de Bobbers: Cabeza de múrloc"

T["The following slotted items could not be added to your Angleur Equipment Set:"] = "Los siguientes artículos ranurados no se pudieron agregar a su " .. colorYello:WrapTextInColorCode("Angleur Equipment Set ") .. ":"

T["Double Click"] = "Doble clic"

T["Angleur will no longer release your keybind while swimming."] = "Angleur ya no soltará la combinación de teclas mientras nada."

T["Macro-Bound Key to find and mark Void Pools easily!\n\nWhen you press it, if there is a nearby Void Pool, it will be marked on your minimap & in-game with a skull marker."
    .. "\n\nAlso plays a cool sound effect and a scan animation under your mouse cursor"] = "¡Clave vinculada a macros para encontrar y marcar piscinas vacías fácilmente!\n\nCuando lo presionas, si hay un " .. colorDarkBlu:WrapTextInColorCode("Void Pool") .. " cercano, se marcará en tu minimapa y en el juego con un marcador de calavera." .. colorGrae:WrapTextInColorCode("\n\nTambién reproduce un efecto de sonido genial y una animación de escaneo debajo del cursor del mouse")

T["Soft Interact in Classic:"] = "Interacción suave en clásico:"

T["Extra Toys"] = "juguetes adicionales"

T["Sleeping. Zzz...\n"] = "Durmiendo. Zzz..."

T["Fish, Reel, cast Toys, Items and Macros using double mouse clicks!\n"] = "¡Pesca, carrete, lanza juguetes, objetos y macros con doble clic del ratón!"

T["Disable Soft Icon"] = "Desactivar icono suave"

T["Gnarlwood Waveboard"] = "Tabla de olas Gnarlwood"

T["Okay"] = "Bueno"

T["Audio"] = "Audio"

T["Angleur Warning"] = "Advertencia de ángulo"

T[colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Visual:\n\n") .. "Shows what your next input will do.\n"
.. "Drag and place it anywhere you might like.\n\n" .. "You can also hide it by clicking its close button."] = colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Visual:\n\n") .. "Muestra lo que hará su próxima entrada.\nArrástralo y colócalo donde quieras.\n\nTambién puedes ocultarlo haciendo clic en su botón de cerrar."

T["Are you sure you want to abandon the tutorial?"] = "¿Estás seguro de que quieres abandonar el tutorial?"

T["Reset Angleur Set"] = "Restablecer conjunto de ángulos"

T["Ambience Volume"] = "Volumen ambiental"

T[", with modifier "] = ", con modificador"

T["login messages disabled"] = "mensajes de inicio de sesión deshabilitados"

T["Beta: " .. colorWhite:WrapTextInColorCode("If you are having trouble,\ntry resetting the set by clicking\nthe reset button then refreshing\nthe UI with ")
    .. "/reload."] = "Beta: " .. colorWhite:WrapTextInColorCode(" Si tiene problemas,\nintente restablecer el conjunto haciendo clic\nel botón de reinicio y luego actualizando\nla interfaz de usuario con ") .. "/reload."

T["Middle Button: " .. colorYello:WrapTextInColorCode("Hide Minimap Icon")] = "Botón central: " .. colorYello:WrapTextInColorCode("Ocultar icono del minimapa")

T["Can't create Equipment Set without any equippable slotted items. Slot a usable and equippable item to your Extra Items slots first."] = "No se puede crear un conjunto de equipos sin ningún objeto ranurado equipable. Primero, coloca un artículo utilizable y equipable en tus espacios de artículos adicionales."

T["Crate Bobbers"] = "Bobbers de cajas"

T["debug mode deactivated"] = "modo de depuración desactivado"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Macro successfully slotted. If you make changes to it, you need to "
.. colorYello:WrapTextInColorCode("re-drag ")
.. "the new version to the slot. You can also delete the macro to save space, Angleur will remember it."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Macro ranurado exitosamente. Si realiza cambios, deberá volver a arrastrar " .. colorYello:WrapTextInColorCode(" la nueva versión de ") .. " a la ranura. También puedes eliminar la macro para ahorrar espacio, Angleur la recordará."

T["Having Problems?"] = "¿Tiene problemas?"

T["Click here if you need an example & explanation of use of macros for Angleur!"] = "¡Haga clic aquí si necesita un ejemplo y una explicación del uso de macros para Angleur!"

T["Angleur: Ultra Focus will trigger on "] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Ultra Focus se activará"

T["Adjust Audio Levels"] = "Ajustar los niveles de audio"

T["A bug with the Angleur Set has occurred, where it is set to unequip all gear. "
.. "Therefore, it has been deleted. If this keeps happening, please contact the Author."] = "Se produjo un error con el conjunto Angleur, donde está configurado para desequipar todo el equipo. Por tanto, ha sido eliminado. Si esto continúa sucediendo, comuníquese con el autor."

T[colorYello:WrapTextInColorCode("To Get Started:\n\n") .. "Choose your desired\n"
.. colorBlu:WrapTextInColorCode("Fishing Method") .. " by\nclicking one of these buttons.\n\n"] = colorYello:WrapTextInColorCode("TPara comenzar:\n\n") .. "Elija el que desee\n" .. colorBlu:WrapTextInColorCode("Método de pesca") .. " por\nhaciendo clic en uno de estos botones."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Awake."] = colorBlu:WrapTextInColorCode("Ángulo: ") .. "Despierto."

T["Double-Click Fishing Mode"] = "Modo de pesca con doble clic"

T["Fish, cast Toys, Items and Macros using double mouse clicks!\n"] = "¡Pesca, lanza juguetes, objetos y macros con doble clic del ratón!"

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
.. "_____________________________________________"] = colorYello:WrapTextInColorCode("Artículos:\n") .. ": cualquier artículo utilizable de tus bolsos o equipo de personaje. \n\n Siempre que:\n\n   1) " .. colorYello:WrapTextInColorCode("Off-Enfriamiento\n") .. " 2) " .. colorYello:WrapTextInColorCode("Aura Inactiva") .. " (si está presente)\n" .. colorYello:WrapTextInColorCode("\nMacros:\n") .. ": cualquier macro válida que contenga un hechizo o un elemento utilizable: /cast o /use. \n\n Siempre que:\n\n   1) Se cumplen las condiciones macro " .. colorYello:WrapTextInColorCode(" ") .. "\n   2) El hechizo/objeto está fuera de tiempo de reutilización " .. colorYello:WrapTextInColorCode("") .. " y sus\n   3) " .. colorYello:WrapTextInColorCode("Auras Inactiva") .. " (si está presente)\n\n" .. colorYello:WrapTextInColorCode("IMPORTANTE: ") .. "Si está utilizando macro condicionales, deben estar ACTIVOS cuando arrastre la macro a la ranura.\n_____________________________________________"

T["Can't drag item in combat."] = "No se puede arrastrar un objeto en combate."

T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ")
    .. "and " .. colorBlu:WrapTextInColorCode("use Items and Configured Macros ")
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") .. "y " .. colorBlu:WrapTextInColorCode("use elementos y macros configuradas ") .. "using \nun botón."

T[colorYello:WrapTextInColorCode("Can't use Macro: ")
.. "The item used in this macro doesn't have a trackable spell/aura."] = colorYello:WrapTextInColorCode(" No se puede usar la macro: ") .. " El elemento utilizado en esta macro no tiene un hechizo/aura rastreable."

T["Crate of Bobbers: Cat Head"] = "Caja de Bobbers: Cabeza de gato"

T["Anglers Fishing Raft"] = "Balsa de pesca para pescadores"

T["Disable Soft Interact"] = "Deshabilitar la interacción suave"

T["Note for Classic:"] = "Nota para Clásico:"

T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)"] = "¡Elige un " .. colorBrown:WrapTextInColorCode("Raft") .. " y Angleur te pedirá que lo uses cuando estés en " .. colorDarkBlu:WrapTextInColorCode("water") .. "!\n(También mantén el beneficio después)"

T["you do not own this toy. please select another"] = "No eres dueño de este juguete. por favor seleccione otro"

T["Random Raft"] = "Balsa aleatoria"

T["Glow Worm"] = "Gusano luminoso"

T["Debug Mode"] = "Modo de depuración"

T["  Extra  "] = "Extra"

T["Shows what your next key press\nwill do. Not meant to be clicked."] = "Muestra cuál será tu siguiente tecla que presiones\nlo haré. No está destinado a ser hecho clic."

T["Modifier key "] = "Tecla modificadora"

T["Tuskarr Dinghy"] = "Bote Tuskarr"

T["When unchecked, Bobber Scanner warn you with a chat message when your "
.. "Camera Zoom changes during scan(when it's not supposed to). It's usually due to a wall that's behind you, and it is recommended to "
.. "keep the warning \'enabled\' so you can know when a fishing spot might cause issues."] = "Cuando no está marcado, Bobber Scanner le advierte con un mensaje de chat cuando su " .. colorYello:WrapTextInColorCode("Camera Zoom ") .. " cambia durante el escaneo (cuando no se supone que debe hacerlo).\n\nPor lo general, se debe a una pared que está detrás de usted, y se recomienda " .. colorYello:WrapTextInColorCode(" ") .. " mantener la advertencia " .. colorGreen:WrapTextInColorCode(" 'habilitada' ") .. " para que pueda saber cuándo un lugar de pesca puede causar problemas."

T["Return\nAngleur Visual"] = "Regresar\nAngleur Visual"

T["Visual Size"] = "Tamaño visual"

T["Angleur: Sharpened Tuskarr Spear(MoP) detected."] = colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Lanza Tuskarr afilada (MoP)") .. " detectado."

T["Angleur: VERSION UPDATED. Please re-set your \'OneKey\' from the Config Panel."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "VERSIÓN ACTUALIZADA. Reinicie su " .. colorYello:WrapTextInColorCode("'OneKey' ") .. " desde el panel de configuración " .. colorYello:WrapTextInColorCode(".")

T["\n(Released BACK in Combat!)"] = colorGrae:WrapTextInColorCode("\n(¡Lanzado DE VUELTA en Combate!)\n")

T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot")
.. ", then turn it back off after you reel.\n\n" .. colorGrae:WrapTextInColorCode("If you have ")
.. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")] = "Si está marcado, Angleur activará temporalmente " .. colorYello:WrapTextInColorCode("Auto-Loot") .. " y luego lo volverá a apagar después de girar.\n\n" .. colorGrae:WrapTextInColorCode("Si tiene ") .. colorYello:WrapTextInColorCode("Loot automático ") .. colorGrae:WrapTextInColorCode(" habilitado de todos modos, esta función se desactivará automáticamente.")

T["Bobber Scanner - Dizzy Warning"] = "Escáner Bobber - Advertencia de mareo"

T["Please try again after combat ends."] = "Inténtalo de nuevo después de que finalice el combate."

T["Right Click: " .. colorYello:WrapTextInColorCode("Sleep/Wake")] = "Haga clic derecho: " .. colorYello:WrapTextInColorCode("Suspensión/Wake")

T["Niche functionality plugin for Angleur. Adding niche user requests through this plugin!"] = "Complemento de funcionalidad de nicho para Angleur. ¡Agregando solicitudes de usuarios especializados a través de este complemento!"

T["Heat-Treated Spinning Lure"] = "Señuelo giratorio tratado térmicamente"

T["Zoom Out To"] = "¡¡" .. colorPurple:WrapTextInColorCode("!! NUEVO !! ") .. colorYello:WrapTextInColorCode("Alejar a")

T["Toggle Bags"] = "Alternar bolsas"

T["ELEVATION:"] = colorUnderlight:WrapTextInColorCode("ELEVACIÓN:")

T["/angsleep"] = "/angsleep"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Soft Interact has been turned " .. colorGreen:WrapTextInColorCode("ON ") .. "for you to be able to ".. colorYello:WrapTextInColorCode("Reel/Loot ")
.. "your catches. The previous values will be restored upon logout, so that if you uninstall Angleur you will have them back to normal."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Soft Interact se ha activado " .. colorGreen:WrapTextInColorCode("ON ") .. " para que puedas " .. colorYello:WrapTextInColorCode("Reel/Loot ") .. "tus capturas. Los valores anteriores se restaurarán al cerrar sesión, de modo que si desinstalas Angleur los volverás a la normalidad."

T["Macro empty"] = "Macro vacía"

T["Sleep Without Fishing Rod"] = "Dormir sin caña de pescar"

T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ")
    .. ", use " .. colorPurple:WrapTextInColorCode("Toys") .. ", " .. colorBlu:WrapTextInColorCode(" Items and Configured Macros ")
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") .. ", use " .. colorPurple:WrapTextInColorCode("Toys") .. ", " .. colorBlu:WrapTextInColorCode(" Artículos ") .. "y" .. colorBlu:WrapTextInColorCode("\nMacros configuradas ") .. " usando un botón."

T["   " .. colorYello:WrapTextInColorCode("Click ") .. "any of the buttons above\nthen select a toy with left click from\nthe "
.. colorYello:WrapTextInColorCode("Toy Box ") .. "that pops up."] = colorYello:WrapTextInColorCode("Haga clic en ") .. "cualquiera de los botones de arriba\nluego seleccione un juguete con clic izquierdo desde\nel " .. colorYello:WrapTextInColorCode("Toy Box ") .. "que aparece."

T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."] = "Si se muestra el icono del gancho encima del corcho.\nTenga en cuenta que esto afecta a los iconos de otros objetos de destino suaves."

T["Ultra Focus:"] = "Ultraenfoque:"

T[colorWhite:WrapTextInColorCode("\nEquip a ") .. "Fishing Pole\n"] = colorWhite:WrapTextInColorCode("\nEquipar una caña de pescar ")

T["1) Tents such as Gnoll Tent to protect yourself from the sun as you fish."
    .. "\n2) Transformation toys such as Burning Defender's Medallion.\n3) Seating items like pillows so you can fish comfortably."
    .. "\n4) Darkmoon whistle if you want to be annoying.\nAnd other whacky combinations!"] = "1) Tiendas de campaña como las Gnoll Tent para protegerte del sol mientras pescas.\n2) Juguetes de transformación como Burning Defender's Medallion.\n3) Asientos como almohadas para que puedas pescar cómodamente.\n4) Silbato de la Luna Negra si quieres ser molesto.\n¡Y otras combinaciones extravagantes!"

T["Enable Soft Interact"] = "Habilitar interacción suave"

T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("Double Click\n")] = "Modo de pesca: " .. colorBlu:WrapTextInColorCode("Doble clic\n")

T["Recast Reminder"] = "Recordatorio de refundición"

T["Choose when Angleur's Ultra Focus Activates/Releases.\n\n" .. "Cast/Reel : Will activate/release with every single cast (DEFAULT)\n\n"
.. "Sleep/Wake : Will only activate/release when you wake/sleep the addon\n"] = "Elija cuándo Ultra Focus " .. colorGreen:WrapTextInColorCode(" de Angleur activa ") .. "/" .. colorRed:WrapTextInColorCode(" y lanza ") .. ".\n\n" .. colorYello:WrapTextInColorCode("Cast/Reel: ") .. "Se activará/liberará con cada lanzamiento " .. colorGrae:WrapTextInColorCode("(DEFAULT)\n\n") .. colorYello:WrapTextInColorCode("Sleep/Wake: ") .. "Solo se activará/liberará cuando active/despierte el complemento."

T["Activation Mode:"] = "Modo de activación:"

T["Angleur: Minimap Button Hidden"] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Botón de minimapa oculto"

T["Pick a Bobber from the Crate of Bobbers, and Angleur will have you keep it applied!\n\n"
.. "Pick \'Random Bobber\' to get a different one every time!"] = "Elige un Bobber de la " .. colorYello:WrapTextInColorCode("Crate de Bobbers") .. ", ¡y Angleur hará que lo mantengas aplicado!\n\n¡Elija " .. colorYello:WrapTextInColorCode(" 'Random Bobber' ") .. " para obtener uno diferente cada vez!"

T["Angleur: Minimap Button Shown"] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Se muestra el botón de minimapa"

T["Pick a Bait Item from the ones in your bags, and Angleur will keep it applied!\n\nMake sure you pick one whose level isn't higher than yours."] = "Elige un artículo de cebo " .. colorYello:WrapTextInColorCode(" ") .. " de los que tienes en tus bolsas, ¡y Angleur lo mantendrá aplicado!" .. colorGrae:WrapTextInColorCode("\n\nAsegúrate de elegir uno cuyo nivel no sea superior al tuyo.")

T["Open Config Panel"] = "Abrir panel de configuración"

T["If checked, Angleur will show developer debug messages. Useful to display when submitting bug reports through discord!\n\n"
.. "Keep unchecked during regular use."] = "Si está marcado, Angleur mostrará mensajes de depuración del desarrollador.\n¡Útil para mostrar al enviar informes de errores a través de " .. colorPurple:WrapTextInColorCode("discord!\n\n") .. colorGrae:WrapTextInColorCode("Mantener sin controlar durante el uso regular.")

T["/angmini"] = "/angmini"

T["Uncheck to hide minimap, or middle-mouse-click on the minimap button."] = "Desmarque para ocultar el minimapa o haga clic con el botón central del mouse en el botón del minimapa."

T["Show Minimap Button"] = "Botón Mostrar minimapa"

T["Recommended Value: 2\n"] = colorGrae:WrapTextInColorCode("Valor recomendado: 2\n")

T["How far out the camera will zoom out before starting the scan. Higher value => farther.\n"] = colorWhite:WrapTextInColorCode("A qué distancia se alejará la cámara ") .. " " .. colorWhite:WrapTextInColorCode(" antes de iniciar el escaneo. Valor más alto => más lejos.\n")

T["sec"] = "segundo"

T["Equipping of the Angleur set disrupted due to sudden death/ghost-form"] = "El equipamiento del conjunto Angleur se interrumpió debido a muerte súbita/forma fantasma"

T["Defaults\n(Recommended)"] = "Valores predeterminados\n(Recomendado)"

T["Two-Way Transformations to Worgens when you cast abilities or use items!\n\nFeatures a built-in drag&drop Macro Maker."] = "¡Transformaciones bidireccionales en huargen cuando lanzas habilidades o usas objetos!\n\nIncluye función de arrastrar y soltar " .. colorYello:WrapTextInColorCode("Macro Maker.")

T["Dialog Volume"] = "Volumen de diálogo"

T["Couldn't find \n Oversized Bobber in \n toybox, feature disabled"] = "No se pudo encontrar \n Bobber extragrande en \n caja de juguetes, función deshabilitada"

T["OneKey removed"] = "OneKey eliminado"

T["Shiny Bauble"] = "Adorno brillante"

T["for [Patient Chest]\n\n" .. "When enabled, Angleur will play a warning sound, screen animation and show a cool image of Reno Jackson warning you about the treasure.\n\nNote: The sound is also that of Reno Jackson\n\n"
.. "We're gonna be rich!"] = colorGrae:WrapTextInColorCode("para ") .. colorDarkBlu:WrapTextInColorCode("[Cofre del paciente]\n\n") .. " Cuando esté habilitado, Angleur reproducirá un sonido de advertencia, una animación en la pantalla y mostrará una imagen genial de Reno Jackson advirtiéndole sobre el tesoro.\n\n" .. colorGrae:WrapTextInColorCode("Nota: El sonido también es el de Reno Jackson\n\n") .. colorGrae:WrapTextInColorCode("¡Vamos a ser ricos!")

T["THANK YOU!"] = "¡GRACIAS!"

T["Effects Volume"] = "Volumen de efectos"

T["You can drag and place this anywhere on your screen"] = "Puedes arrastrarlo y colocarlo en cualquier lugar de tu pantalla."

T["Master Volume"] = "Volumen maestro"

T["To stop seeing these messages, go to:"] = "Para dejar de ver estos mensajes, vaya a:"

T["Login Messages"] = "Mensajes de inicio de sesión"

T["Failed to get macro index"] = "No se pudo obtener el índice macro"

T["Music Volume"] = "Volumen de música"

T["Advanced Angling"] = "Pesca avanzada"

T["Patient Chest"] = "Pecho del paciente"

T["[Patient Treasure] Spawned. Be quick and grab it! Good luck with the mount egg:\n"] = colorDarkBlu:WrapTextInColorCode("[Tesoro del paciente] ") .. "Engendrado. ¡Sé rápido y cógelo! Buena suerte con el huevo de monte:"

T["link of macro item: "] = "enlace del elemento macro:"

T["Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."] = "Ubicado en Plater->Avanzado->Configuración general.\n\nDe lo contrario, Angleur no podrá pescar."

T["Crate of Bobbers: Tugboat"] = "Caja de Bobbers: Remolcador"

T["Note for Mists:"] = "Nota para las nieblas:"

T["Bind a dedicated \'Re-Cast Key\'.\n\nWill be released back to you when not fishing."] = "Vincule una 'Clave de retransmisión' " .. colorYello:WrapTextInColorCode(" dedicada.\n\n") .. colorGrae:WrapTextInColorCode("Se le devolverá cuando no esté pescando.")

T["Angleur Visual Button"] = "Botón visual Angleur"

T["Crate of Bobbers: Face of the Forest"] = "Caja de Bobbers: La cara del bosque"

T["Wake!"] = "¡Despertar!"

T["Use this if you are fishing in a spot where the elevation constantly changes from level to lower and vice versa."
.. " The scan covers twice the height as usual, thus taking twice as long."] = colorWhite:WrapTextInColorCode("Utilice esto si está pescando en un lugar donde la elevación\ncambia constantemente ") .. colorWhite:WrapTextInColorCode(" de ") .. "mismo " .. colorWhite:WrapTextInColorCode(" a ") .. "más bajo, " .. colorWhite:WrapTextInColorCode("y viceversa.\n\n") .. colorWhite:WrapTextInColorCode("El escaneo cubre el doble de altura de lo habitual, por lo que tarda el doble de tiempo.")

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Modifier Keys ")
.. "won't be recognized when the game is in the " .. colorGrae:WrapTextInColorCode("background. ")
.. "If you are using the scroll wheel for that purpose. Just bind the wheel alone instead, without modifiers."] = colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Teclas modificadoras ") .. " no se reconocerá cuando el juego esté en segundo plano " .. colorGrae:WrapTextInColorCode(". ") .. "Si está utilizando la rueda de desplazamiento para ese propósito. En su lugar, simplemente vincule la rueda sola, sin modificadores."

T["If checked, Angleur will have you keep \'Reusable Oversized Bobber\' applied."] = "Si está marcado, Angleur le pedirá que mantenga " .. colorYello:WrapTextInColorCode("'Bobber de gran tamaño reutilizable' ") .. " aplicado."

T["ITEM NOT FOUND IN BAGS. TO USE FOR EQUIPMENT SWAP, EITHER ADD IT MANUALLY TO ANGLEUR SET OR RE-DRAG THE MACRO."] = "ARTÍCULO NO ENCONTRADO EN BOLSAS. PARA UTILIZARLO PARA EL INTERCAMBIO DE EQUIPO, AGREGUELO MANUALMENTE AL CONFIGURACIÓN DE ANGLEUR O VUELVA A ARRASTRAR LA MACRO."

T["If checked, Angleur will adjust your audio settings for you when you cast your rod, and restore them to the previous values when you reel/loot.\n\n"
.. "Ambience & Music will be muted.\nSound Effects will be turned up.\n\nWhile Angleur is awake, \'Sound in Background\' will also be enabled(restored to previous on sleep).\n\n"
.. "If you want to change the adjusted audio volume, go to Angleur->Tiny->Master Volume(Ultra Focus) and adjust from the slider."] = "Si está marcado, Angleur ajustará la configuración de audio por usted cuando lance su caña y los restaurará a los valores anteriores cuando enrolle/saquee.\n\n" .. colorYello:WrapTextInColorCode("Ambiente y música ") .. "será " .. colorRed:WrapTextInColorCode("silenciado.") .. colorYello:WrapTextInColorCode("\nEfectos de sonido ") .. " aparecerá " .. colorGreen:WrapTextInColorCode(".") .. "\n\nMientras Angleur está despierto, " .. colorYello:WrapTextInColorCode("'Sonido de fondo' ") .. " también se habilitará (restaurado al estado anterior en suspensión).Si desea " .. colorUnderlight:WrapTextInColorCode("cambiar ") .. "el volumen de audio ajustado, vaya a " .. colorBlu:WrapTextInColorCode("Angleur ") .. "-> " .. colorBlu:WrapTextInColorCode("Tiny ") .. "-> " .. colorBlu:WrapTextInColorCode("Volumen maestro (Ultra Focus) ") .. " y ajústelo desde el control deslizante."

T["When unchecked, Angleur will stop showing Login messages.\n\nLogin messages may contain useful tips, and can be re-enabled at any time."] = "Cuando no esté marcado, Angleur dejará de mostrar mensajes de inicio de sesión.\n\n" .. colorGrae:WrapTextInColorCode("LLos mensajes de inicio de sesión pueden contener consejos útiles y se pueden volver a habilitar en cualquier momento.")

T["You need to open the Config Panel to change Angleur's settings!"
.. "\n\n(Hint) You can also:\n - type /ang\n - Double-Click the Angleur Visual\n - Click the Minimap/AddonCompartment Button\nto open it."] = colorWhite:WrapTextInColorCode("¡Necesitas abrir el Panel de configuración para cambiar la configuración de Angleur!") .. colorGrae:WrapTextInColorCode("\n\n(Pista) También puedes:\n - tipo ") .. colorYello:WrapTextInColorCode("/ang") .. colorGrae:WrapTextInColorCode("\n - Haga doble clic en ") .. colorYello:WrapTextInColorCode("Angleur Visual\n") .. colorGrae:WrapTextInColorCode(": haga clic en el botón ") .. colorYello:WrapTextInColorCode("Minimapa/compartimento adicional") .. colorGrae:WrapTextInColorCode("\npara abrirlo.")

T["Angleur will no longer Sleep/Wake based on Fishing Rod equip status."] = colorBlu:WrapTextInColorCode("Angleur ") .. " ya no " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. " según el estado de equipamiento de la caña de pescar."

T[" plugin from Curseforge if you want Angleur to use it for you."] = "complemento de Curseforge si desea que Angleur lo use por usted."

T["Please download the: "] = "Por favor descargue el:"

T["Due to the fishing rod taking up the mainhand slot in Classic, this item cannot be added to the Auto-Equip System."] = "Debido a que la caña de pescar ocupa la ranura principal en Classic, este artículo no se puede agregar al sistema Auto-Equip."

T["Can't add toys while dead"] = "No puedo agregar juguetes mientras estoy muerto"

T["Item equip interrupted by death/ghost-form"] = "Equipo de artículo interrumpido por muerte/forma fantasma"

T["Can't change sleep state in combat."] = "No se puede cambiar el estado de sueño en combate."

T["OneKey set to: "] = "OneKey configurado en:"

T["Inside Water"] = "Agua interior"

T["Angleur Configuration"] = "Configuración del ángulo"

T["Disable Wall Warning"] = "Deshabilitar advertencia de pared"

T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ")
.. "Tiny tab(tab 3),  and disable \'Login Messages\'"] = "Panel de configuración de Angleur " .. colorYello:WrapTextInColorCode("-> ") .. "Tpestaña pequeña (pestaña 3) y deshabilite 'Mensajes de inicio de sesión'"

T["\nor"] = "o"

T["(Already on)"] = "(Ya en marcha)"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Fishing Hat")
.. " detected."] = colorBlu:WrapTextInColorCode("Ángulo: ") .. colorYello:WrapTextInColorCode("Sombrero de pesca") .. " detectado."

T["Limited Edition Rocket Bobber"] = "Bobber cohete de edición limitada"

T["Ultra Focus: Audio Settings"] = "Ultra Focus: configuración de audio"

T["Extra Toys is a feature meant to provide flexible user customization, but not every toy is"
    .. " created the same. Targeted toys, toys that silence you, remote controlled toys etc might mess with your fishing routine."
    .. " Test them out, experiment and have fun!\n"] = "Extra Toys es una función destinada a proporcionar una personalización flexible al usuario, pero no todos los juguetes se crean de la misma manera. Los juguetes dirigidos, los juguetes que te silencian, los juguetes controlados a distancia, etc., pueden alterar tu rutina de pesca. ¡Pruébalos, experimenta y diviértete!"

T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n"
.. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")] = "Si está marcado, Angleur desactivará " .. colorYello:WrapTextInColorCode("Soft Interact ") .. " después de que dejes de pescar.\n\n" .. colorGrae:WrapTextInColorCode(" Diseñado para personas que desean mantener Soft Interact desactivado durante el juego normal.")

T["If you want Soft-Interact to be " .. colorRed:WrapTextInColorCode("TURNED OFF ") .. "when not fishing, go to:\n"
.. "Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact\nand check it "
.. colorGreen:WrapTextInColorCode("ON.")] = "Si desea que Soft-Interact esté DESACTIVADO " .. colorRed:WrapTextInColorCode(" ") .. " cuando no esté pescando, vaya a:\nPanel de configuración de Angleur " .. colorYello:WrapTextInColorCode("-> ") .. "Testaña pequeña (pestaña 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Desactivar Soft-Interact\ny compruébalo " .. colorGreen:WrapTextInColorCode("ON.")

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off "
.. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."] = colorBlu:WrapTextInColorCode("Angleur ") .. " ahora desactivará " .. colorYello:WrapTextInColorCode("Soft Interact ") .. " cuando no esté pescando."

T["Can't change in combat."] = "No se puede cambiar en combate."

T["Use this when you are on the same level as the water, or close to it."] = colorWhite:WrapTextInColorCode("Utilízalo cuando estés al mismo nivel que el agua o cerca de ella.")

T["For it to work properly, please make sure to add it as a macro like so: "] = "Para que funcione correctamente, asegúrese de agregarlo como una macro como esta:"

T["Angleur Bobber Scanner : WARNING! Camera Zoom changed during scan. "
.. "This can (and will) disrupt success of the bobber scanner, and is likely "
.. "due to a wall or some other game world object behind your character. To fix this, "
.. "either move to a clearing, or lower the \'Max Camera Distance\' in "
.. "the Game's Options under Options->Gameplay->Controls->Camera."
.. "You can turn this warning off in the Bobber Scanner's Config Menu by clicking the gear icon next to the mouse drop-off box."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner:") .. colorRed:WrapTextInColorCode(" ¡ADVERTENCIA! ") .. colorYello:WrapTextInColorCode("Zoom de cámara ") .. "cambió durante el escaneo. Esto puede (y lo hará) interrumpir el éxito del escáner bobber, y probablemente se deba a una pared o algún otro objeto del mundo del juego " .. colorYello:WrapTextInColorCode(" detrás de tu personaje. ") .. " Para solucionar este problema, muévete a un claro o reduce la " .. colorYello:WrapTextInColorCode(" 'Distancia máxima de la cámara' ") .. " en las Opciones del juegoen Opciones" .. colorYello:WrapTextInColorCode("->") .. "Juego" .. colorYello:WrapTextInColorCode("->") .. "Controles" .. colorYello:WrapTextInColorCode("->") .. "Cámara. Puede desactivar esta advertencia en el menú de configuración del escáner Bobber haciendo clic en el icono de engranaje " .. colorYello:WrapTextInColorCode(" ") .. " al lado del cuadro desplegable del mouse."

T["Use this when the water is lower level than you."] = colorWhite:WrapTextInColorCode("Utilice esto cuando el nivel del agua esté por debajo del suyo.")

T["Lower Elevation"] = "Elevación más baja"

T["Same Elevation"] = "Misma elevación"

T["Ultra Focus: Default audio settings restored"] = "Ultra Focus: configuración de audio predeterminada restaurada"

T["debug mode active"] = "modo de depuración activo"

T["Start Delay"] = colorYello:WrapTextInColorCode("Retraso de inicio")

T["Preferred Mouse Button"] = "Botón de ratón preferido"

T["Rafts"] = "Balsas"

T["Crate of Bobbers: Demon Noggin"] = "Caja de Bobbers: Demon Noggin"

T[" minutes, "] = "minutos,"

T["Selected extra toy: "] = "Juguete extra seleccionado:"

T["\nto wake Angleur!"] = "¡Para despertar a Angleur!"

T["Soft target icon for game objects re-enabled."] = "Icono de objetivo suave para objetos del juego reactivado."

T["Crate of Bobbers: Enchanted Bobber"] = "Caja de Bobbers: Bobber encantado"

T["please choose the toy with left click so that angleur can function properly"] = "Elija el juguete con el clic izquierdo para que Angleur pueda funcionar correctamente."

T["Scan Speed"] = colorYello:WrapTextInColorCode("Velocidad de escaneo")

T["HOW?"] = "¿CÓMO?"

T["Dismount With Key"] = "Desmontar con llave"

T["Fun toy recommendations from mod author, Legolando:"] = "Recomendaciones de juguetes divertidos del autor del mod, Legolando:"

T["Crate of Bobbers: Wooden Pepe"] = "Caja de Bobbers: Pepe de Madera"

T["Set your desired key by: "] = "Configure la clave que desee de la siguiente manera:"

T["  Tiny  "] = "Diminuto"

T["Raft"] = "Balsa"

T["To access the configuration menu, type "] = "Para acceder al menú de configuración, escriba"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Durmiendo."

T["Key set to "] = "Clave configurada en"

T["Set Timer"] = "Establecer temporizador"

T["GAMEPAD MODE: After casting \'fishing\', move the cursor that appears into the box below to use."] = "MODO " .. colorPurple:WrapTextInColorCode("GAMEPAD:\n") .. "Después de lanzar " .. colorBlu:WrapTextInColorCode("'fishing'") .. ", mueve el cursor\nque aparece en el cuadro " .. colorRed:WrapTextInColorCode(" debajo de ") .. " para usar."

T["Not every toy will work!"] = "¡No todos los juguetes funcionarán!"

T["Now, let's move to the " .. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Click here."] = "Ahora, pasemos a " .. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Haga clic aquí."

T["No"] = "No"

T[" or\n"] = "o"

T["Pickpocket overhaul for Rogues!\n\nSingle player RPG-like Pickpocket Prompt System with dynamic keybind(released back when not pick pocketing)."] = "¡Revisión de carteristas para pícaros!\n\nSistema de aviso de carterista similar a un juego de rol para un jugador con combinación de teclas dinámica (se libera cuando no se roba)."

T[colorBlu:WrapTextInColorCode("Cast ") .. "your rod and " .. colorBlu:WrapTextInColorCode("use Items/Macros ")
    .. "using\ndouble mouse clicks!\n"] = colorBlu:WrapTextInColorCode("Cast ") .. "su caña y " .. colorBlu:WrapTextInColorCode("use artículos/macros ") .. "usando\n¡Dobles clics del ratón!"

T["Nat's Drinking Hat"] = "Sombrero para beber de Nat"

T[" seconds"] = "artículos de segunda clase"

T["Otherwise, you will have to manually target your fishing rod every time."
.. "If you want to see an example of how to slot macros, click the "
..  colorRed:WrapTextInColorCode("[HOW?] ") .. "button on the "
.. colorYello:WrapTextInColorCode("Extra Tab")] = "De lo contrario, tendrás que apuntar manualmente a tu caña de pescar cada vez. Si quieres ver un ejemplo de cómo asignar macros, haz clic en el botón " .. colorRed:WrapTextInColorCode("[¿CÓMO?] ") .. " en la pestaña adicional " .. colorYello:WrapTextInColorCode("")

T["/angang"] = "/angang"

T["Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"] = "No se pudo encontrar \n cualquier caja Bobbers \n en toybox, función deshabilitada"

T["Can't change sleep state while in ghost form."] = "No se puede cambiar el estado de sueño mientras se está en forma fantasma."

T["If enabled, Angleur will play a sound effect when your fishing cast runs out to remind you to cast again!"
.. "\n\nRecommended when fishing on the side while doing something else."] = "Si está habilitado, Angleur reproducirá un efecto de sonido " .. colorYello:WrapTextInColorCode(" ") .. " cuando se acabe tu lance de pesca para recordarte que debes volver a lanzar." .. colorGrae:WrapTextInColorCode("\n\nRecomendado cuando se pesca de costado mientras se hace otra cosa.")

T["Double Click Window"] = "Ventana de doble clic"

T["One Key"] = "Una llave"

T["Reset to Defaults"] = "Restablecer los valores predeterminados"

T["Swapback item not found in bags, cannot re-equip."] = "El artículo de intercambio no se encuentra en las bolsas, no se puede volver a equipar."

T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("One Key")] = "Modo de pesca: " .. colorBlu:WrapTextInColorCode("Una tecla")

T["Created equipment set for " .. colorBlu:WrapTextInColorCode("Angleur" ) .. ". ID is : "] = "Conjunto de equipos creado para " .. colorBlu:WrapTextInColorCode("Angleur") .. ". La identificación es:"

T["Right Click"] = "Clic derecho"

T["Unslotted " .. colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Equipment Set ")
.. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it."] = "Sin ranura " .. colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Juego de equipos ") .. " artículo. Elimínalo del conjunto de Angleur en el administrador de equipos si no quieres que Angleur siga equipándolo."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "cannot open "
.. colorYello:WrapTextInColorCode("Config Panel ") .. "in combat."] = colorBlu:WrapTextInColorCode("Angleur: ") .. " no se puede abrir " .. colorYello:WrapTextInColorCode("Panel de configuración ") .. " en combate."

T["Crate of Bobbers"] = "Caja de Bobbers"

T["Defaults"] = "Valores predeterminados"

T["Crate of Bobbers: Floating Totem"] = "Caja de Bobbers: Tótem flotante"

T["The next key you press\nwill be set as Angleur Key"] = "La siguiente tecla que presiones\nse establecerá como Angleur Key"

T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) "
.. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact"] = "Panel de configuración de Angleur " .. colorYello:WrapTextInColorCode("-> ") .. "Tpestaña pequeña (pestaña 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Desactivar Soft-Interact"

T["Do not "
.."use this feature if you are sensitive to\nrapid movement "
.. "or any form of fast graphical\nchange. Such as but not limited "
.. "to:\nPhotosensitive Epilepsy, Vertigo..."] = "No utilice esta función si es sensible a\nmovimiento rápido o cualquier forma de gráfico rápido\ncambiar. Tales como, entre otros:\n" .. colorYello:WrapTextInColorCode("Epilepsia fotosensible, vértigo...")

T["Master Volume(Ultra Focus)"] = "Volumen maestro (ultra enfoque)"

T["For passive items you'd like to add to your fishing gear, you can use the game's "
.. colorYello:WrapTextInColorCode("Equipment Manager ") .. "to add them to the "
.. colorBlu:WrapTextInColorCode("Angleur ") .. "set"] = "Para los elementos pasivos que quieras agregar a tu equipo de pesca, puedes usar el administrador de equipos " .. colorYello:WrapTextInColorCode(" del juego ") .. " para agregarlos al conjunto " .. colorBlu:WrapTextInColorCode("Angleur ") .. "."

T["Sets the OneKey/Double-Click to Recast when the bobber lands too far for the soft interact system to capture."] = "Establece " .. colorRed:WrapTextInColorCode("OneKey") .. " / " .. colorRed:WrapTextInColorCode("Haga doble clic en ") .. " para " .. colorYello:WrapTextInColorCode("Recast ") .. " cuando el bobber aterriza demasiado lejos para que el sistema de interacción suave lo capture."

T["Couldn't equip slotted item in time before combat"] = "No se pudo equipar el objeto ranurado a tiempo antes del combate."

T["Angleur works on a " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. "system, so you don't have to reload your UI after you're done fishing.\n\n"
.. colorBlu:WrapTextInColorCode("Right Click ")
.. "to put Angleur to sleep, and wake it up if it is. You can also Right Click the minimap button."] = "Angleur funciona en un sistema " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. ", por lo que no es necesario recargar la interfaz de usuario una vez que haya terminado de pescar.\n\n" .. colorBlu:WrapTextInColorCode(" Haga clic derecho en ") .. " para poner a Angleur en modo de suspensión y despertarlo si es así. También puedes hacer clic derecho en el botón del minimapa."

T["   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " ..
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes above."] = colorYello:WrapTextInColorCode("Arrastre ") .. "un elemento " .. colorYello:WrapTextInColorCode(" utilizable ") .. " o una macro " .. colorYello:WrapTextInColorCode(" ") .. " a cualquiera de los cuadros anteriores."

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to reel properly."] = "Debe estar marcado " .. colorGreen:WrapTextInColorCode(" EN ") .. " para que Angleur se enrolle correctamente."

T["Couldn't find any rafts \n in toybox, feature disabled"] = "No se pudo encontrar ninguna balsa. \n en toybox, función deshabilitada"

T["Manually scans for the bobber by moving the camera in a grid.\n\nDIZZY WARNING:\nDo NOT "
.."use this feature if you are sensitive to rapid movement or any form of fast graphical change.\n\n"
.."This feature is still in development! With enough good feedback, it can be improved and made much smoother :)"] = "Busca manualmente el corcho moviendo la cámara en una cuadrícula.\n\n" .. colorYello:WrapTextInColorCode("ADVERTENCIA DE MAREADO:") .. colorRed:WrapTextInColorCode("\nNO ") .. " utilice esta función si es sensible al movimiento rápido o cualquier forma de cambio gráfico rápido.\n\n¡Esta característica aún está en desarrollo! Con suficientes comentarios buenos, se puede mejorar y hacerlo mucho más fluido :)"

T["\nRight-Click"] = "Haga clic derecho"

T["Has been " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to be able to "
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] = "Se ha verificado " .. colorGreen:WrapTextInColorCode(" EN ") .. " para que la combinación de teclas de Angleur pueda " .. colorYello:WrapTextInColorCode("Reel/Saquear ") .. "sus capturas."

T["This is a limitation of Classic(not the case for Mists and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."] = "Esta es una limitación de Classic (no es el caso de Mists y Retail), ya que carece de un administrador de equipos incorporado adecuado, lo que le permite colocar elementos pasivos en su conjunto Angleur."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Failed to get macro spell/item. If you are using "
.. colorYello:WrapTextInColorCode("macro conditions \n")
.. "you need to drag the macro into the button frame when the conditions are met."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "No se pudo obtener el hechizo/elemento macro. Si está utilizando condiciones macro " .. colorYello:WrapTextInColorCode(" \n") .. " debe arrastrar la macro al marco del botón cuando se cumplan las condiciones."

T["Mouseover the bobber\nto reel consistently."] = "Pase el mouse sobre el corcho\npara tambalearse consistentemente."

T["Coming Soon!"] = "¡Muy pronto!"

T[colorBlu:WrapTextInColorCode("Angleur visual ") .. "is now hidden."] = colorBlu:WrapTextInColorCode("El ángulo visual ") .. " ahora está oculto."

T["Aquadynamic Fish Attractor"] = "Atractor de peces acuadinámico"

T["Warning Sound"] = "Sonido de advertencia"

T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."] = "o " .. colorYello:WrapTextInColorCode("Haga clic derecho en ") .. "el botón visual."

T["Open Macros"] = "Macros abiertas"

T["Create\n  Add"] = "crear\n  Añadir"

T["   The " .. colorYello:WrapTextInColorCode("Update/Create Set ") .. "Button automatically adds equippable items in your "
.. colorYello:WrapTextInColorCode"Extra Items " .. "slots to your " .. colorBlu:WrapTextInColorCode("Angleur Set")
.. ", and creates one if there isn't already.\n\nIf you want to " .. colorRed:WrapTextInColorCode("remove ")
.. "previously saved slotted items, you need to click the " .. colorRed:WrapTextInColorCode("Delete ")
.. "Button to the top right, and then re-create the set - or manually change the item set.\n\nYou may also assign "
.. colorGrae:WrapTextInColorCode("- Passive Items - ") .. "to your ".. colorBlu:WrapTextInColorCode("Angleur Set ")
.. "manually, and Angleur will swap them in and out like the rest."] = "El botón " .. colorYello:WrapTextInColorCode("Update/Create Set ") .. " agrega automáticamente elementos equipables en tus ranuras " .. colorYello:WrapTextInColorCode("Extra Items ") .. " a tu " .. colorBlu:WrapTextInColorCode("Angleur Set") .. ", y crea uno si aún no lo hay.\n\nSi desea " .. colorRed:WrapTextInColorCode(" eliminar ") .. " elementos ranurados previamente guardados, debe hacer clic en el botón " .. colorRed:WrapTextInColorCode(" Eliminar ") .. " en la parte superior derecha y luego volver a crear el conjunto, o manualmentecambiar el conjunto de elementos.\n\nTambién puede asignar " .. colorGrae:WrapTextInColorCode(" - Elementos pasivos - ") .. " a su " .. colorBlu:WrapTextInColorCode("Angleur Set ") .. " manualmente, y Angleur los intercambiará dentro y fuera como el resto."

T["Angleur unexpected error: Modifier exists, but main key doesn't. Please let the author know."] = "Error inesperado de Angleur: el modificador existe, pero la clave principal no. Por favor, hágaselo saber al autor."

T["Please select a toy using Left Mouse Click"] = "Seleccione un juguete con el clic izquierdo del mouse."

T["Can't drag macro in combat."] = "No se puede arrastrar macro en combate."

T["Bait"] = "Carnada"

T["Couldn't find any bait \n in your bags, feature disabled"] = "No pude encontrar ningún cebo \n en tus maletas, función desactivada"

T["FISHING METHOD:"] = "MÉTODO DE PESCA:"

T["or "] = "o"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a "
.. colorYello:WrapTextInColorCode("/reload") .. " to fix it."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Si experimenta rigidez con el doble clic, haga un " .. colorYello:WrapTextInColorCode("/reload") .. " para solucionarlo."

T["Organically-Sourced Wellington Bobber"] = "Bobber Wellington de origen orgánico"

T["Crate of Bobbers: Replica Gondola"] = "Caja de Bobbers: Réplica de góndola"

T["Slotted items successfully updated for your "
.. colorYello:WrapTextInColorCode("Angleur Equipment Set.")] = "Artículos ranurados actualizados con éxito para su " .. colorYello:WrapTextInColorCode("Angleur Equipment Set.")

T["Toggle Equipment"] = "Alternar equipo"

T["Bright Baubles"] = "Adornos brillantes"

T["Random Bobber"] = "Bobber aleatorio"

T["Bobber Scanner Configuration"] = "Configuración del escáner Bobber"

T[colorBlu:WrapTextInColorCode("Angleur ")
.. "will have you cast the dragged item/macro\nif all of their below listed conditions are met."] = colorBlu:WrapTextInColorCode("Angleur ") .. " te hará lanzar el elemento/macro arrastrado\nsi se cumplen todas las condiciones enumeradas a continuación."

T["Shows how far the camera will move downward from the \'Centered Position\' to start the scan. "
.. "Amount is based on your Max Zoom and chosen \'Elevation\'(Bobber Scanner Menu)"] = colorWhite:WrapTextInColorCode("Muestra ") .. colorDarkRed:WrapTextInColorCode("hasta qué punto ") .. colorWhite:WrapTextInColorCode("la cámara se moverá ") .. colorDarkRed:WrapTextInColorCode("hacia abajo\n") .. colorWhite:WrapTextInColorCode(" desde ") .. colorYello:WrapTextInColorCode(" 'Posición centrada' ") .. colorWhite:WrapTextInColorCode(" para iniciar el escaneo.\nLa cantidad se basa en su ") .. colorYello:WrapTextInColorCode("Max Zoom ") .. "y\nelegido" .. colorYello:WrapTextInColorCode("'Elevación' ") .. colorGrae:WrapTextInColorCode("(Menú del escáner Bobber)")
