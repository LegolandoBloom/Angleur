if (GAME_LOCALE or GetLocale()) ~= "frFR" then
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

T["Toggle Background Audio"] = "Basculer l'audio d'arrière-plan"

T["Oversized Bobber"] = "Bobber surdimensionné"

T["Extra Items / Macros"] = "Éléments supplémentaires / Macros"

T["Recast When OOB"] = "Refonte quand OOB"

T["Mouse needs to be in the indicated area for the scanner to work properly."] = "La souris doit se trouver dans la zone indiquée pour que le scanner fonctionne correctement."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Is awake. To temporarily disable, type "
.. colorYello:WrapTextInColorCode("/angsleep ")] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Est réveillé. Pour désactiver temporairement, tapez " .. colorYello:WrapTextInColorCode("/angsleep ")

T["(If it lands too far, the\nsoft-interact will miss it.)"] = "(S'il atterrit trop loin, le\nsoft-interact le manquera.)"

T["My Other Addons!"] = "Mes autres extensions !"

T["(You can redo it later by clicking the Redo Button\nin the Tiny Panel)"] = "(Vous pouvez le refaire plus tard en cliquant sur le bouton Rétablir\ndans le petit panneau)"

T["If there is an object BEHIND your character that forces your camera angle to change, try setting it to a lower value."] = colorWhite:WrapTextInColorCode("S'il y a un objet DERRIÈRE votre personnage qui force l'angle de votre caméra à changer, essayez de le régler sur une valeur ") .. colorRed:WrapTextInColorCode("inférieure ") .. colorWhite:WrapTextInColorCode("value.")

T["Temp. Auto Loot "] = "Temp. Butin automatique"

T["Enable Recast Key"] = "Activer la clé de refonte"

T["/angleur"] = "/pêcheur"

T["Use this when you are inside the water, making the bobber land higher than you."] = colorWhite:WrapTextInColorCode("Utilisez-le lorsque vous êtes dans l'eau, pour que le bobber atterrisse plus haut que vous.")

T["And lastly, the " .. colorYello:WrapTextInColorCode("Create & Add ") .. "button Creates an item set for you and automatically adds your "
.. "slotted items to it.\n\nNow, Angleur will automatically equip your slotted items when you "
.. colorYello:WrapTextInColorCode("wake ") .."it up, and restore previous items when you put it back to "
.. colorYello:WrapTextInColorCode("sleep.")] = "Et enfin, le bouton " .. colorYello:WrapTextInColorCode("Créer et ajouter ") .. " crée un ensemble d'éléments pour vous et y ajoute automatiquement vos éléments à emplacement.\n\nDésormais, Angleur équipera automatiquement vos objets placés lorsque vous réveillerez [[/colorYello]]it et restaurera les objets précédents lorsque vous le remettrez en veille.[[colorYello]]."

T["This will restart the tutorial, are you sure?"] = "Cela relancera le didacticiel, êtes-vous sûr ?"

T["Due to a limitation in Classic, the \'soft interact system\' can sometimes fail to catch the bobber when it lands too far.(Demonstrated in the picture)"
.. "\n\nAngleur is designed to provide workarounds for this. Once enabled, please check out the options that appear below."] = "En raison d'une limitation dans Classic,\nle système d'interaction douce " .. colorYello:WrapTextInColorCode(" ") .. " peut parfois ne pas réussir à attraper le bobber lorsqu'il atterrit trop loin." .. colorGrae:WrapTextInColorCode("\n(Démontré sur la photo)") .. colorBlu:WrapTextInColorCode("\n\nAngleur ") .. " est conçu pour fournir des solutions de contournement à ce problème. Une fois activé, veuillez consulter les options " .. colorYello:WrapTextInColorCode(" qui apparaissent ci-dessous.")

T["Weather-Beaten Fishing Hat"] = "Chapeau de pêche battu par les intempéries"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to "
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] = "Doit être coché " .. colorGreen:WrapTextInColorCode(" SUR ") .. " pour la combinaison de touches d'AnglEURMARK2XReel/Loot [[/colorYello]]vos captures."

T["Bobber Scanner(EXPERIMENTAL)"] = "Scanner Bobber\n" .. colorBlu:WrapTextInColorCode("(EXPÉRIMENTAL)")

T["Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ")
.. "General Settings" .. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"] = "Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Avancé " .. colorYello:WrapTextInColorCode("-> ") .. "Paramètres généraux" .. colorYello:WrapTextInColorCode(" :") .. " Afficher l'interaction douce sur les objets du jeu*"

T["Nat's Hat"] = "Le chapeau de Nat"

T["down,\nawaiting additional key press."] = "vers le bas,\nen attente d'une pression supplémentaire sur une touche."

T["First install tutorial restarting."] = "Installez d’abord le tutoriel en redémarrant."

T["Left Click: " .. colorYello:WrapTextInColorCode("Config Panel")] = "Clic gauche : " .. colorYello:WrapTextInColorCode("Panneau de configuration")

T["Angleur Bobber Scanner: Please move the Gamepad Cursor that appears into the inticated box."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner : ") .. "Veuillez déplacer la manette de jeu " .. colorYello:WrapTextInColorCode("Curseur ") .. "qui apparaît dans la case " .. colorRed:WrapTextInColorCode("indiquée.")

T["\n\nChecked by default, uncheck if you want to use Extra Toys, Items, Spells while submerged in water."] = colorGrae:WrapTextInColorCode("\n\nCoché par défaut, décochez si vous souhaitez utiliser des jouets, objets et sorts supplémentaires lorsque vous êtes immergé dans l'eau.")

T["Angleur Warning: Plater"] = "Avertissement Angleur : Plater"

T["This item does not have a castable spell."] = "Cet objet n'a pas de sort pouvant être lancé."

T["Flesh Eating Worm"] = "Ver mangeur de chair"

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now "
.. colorYello:WrapTextInColorCode("dismount ") .. "you"] = colorBlu:WrapTextInColorCode("Angleur ") .. "va maintenant " .. colorYello:WrapTextInColorCode("démonter ") .. "vous"

T["Sharpened Fish Hook"] = "Hameçon aiguisé"

T["One-Key Fishing Mode"] = "Mode de pêche à une touche"

T["Note for Cata:"] = "Remarque pour Cata :"

T["Make sure this box is checked!"] = "Assurez-vous que cette case est cochée !"

T["Timer set to: "] = "Minuterie réglée sur :"

T["This is a limitation of Classic(not the case for Cata and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."] = "Il s'agit d'une limitation de Classic (pas le cas de Cata et Retail), car il lui manque un gestionnaire d'équipement intégré approprié, vous permettant d'insérer des objets passifs dans votre ensemble Angleur."

T["Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"] = "Veuillez définir un raccourci clavier\npour utiliser la One Key\nMéthode de pêche par\nen utilisant le\nbouton ci-dessus"

T["Crate of Bobbers: Can of Worms"] = "Caisse de Bobbers : Boîte de vers"

T["One-Key NOT SET! To set,\nopen config menu with:"] = "Une clé NON RÉGLÉE ! Pour régler,\nouvrez le menu de configuration avec :"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to function properly."] = "Doit être coché " .. colorGreen:WrapTextInColorCode(" SUR ") .. " pour qu'Angleur fonctionne correctement."

T["Feathered Lure"] = "Leurre à plumes"

T["You can re-enable it from the"] = "Vous pouvez le réactiver à partir du"

T["Equipping of the Angleur set disrupted due to sudden combat"] = "Équipement du set Angleur perturbé en raison d'un combat soudain"

T["Update"] = "Mise à jour"

T[colorYello:WrapTextInColorCode("Config Menu ") .. "accessed by: "
.. colorYello:WrapTextInColorCode("/angleur ") .. " or  "
.. colorYello:WrapTextInColorCode("/angang")] = colorYello:WrapTextInColorCode("Menu de configuration ") .. "accessible par : " .. colorYello:WrapTextInColorCode("/angleur ") .. " ou " .. colorYello:WrapTextInColorCode("/angang")

T["If enabled, Angleur will turn on \"Sound in the Background\" when awake, and restore it to its previous value when sleeping."
.. "\n\nOnly disable if you NEVER want background sound to be on, or there is an error due to a clash with another addon."] = "Si activé, Angleur activera " .. colorGreen:WrapTextInColorCode(" sur ") .. colorYello:WrapTextInColorCode(" \"Son en arrière-plan\" ") .. " lorsque " .. colorGreen:WrapTextInColorCode(" se réveillera ") .. ", et " .. colorRed:WrapTextInColorCode(" restaurera ") .. "it à sa valeur précédente lorsque " .. colorRed:WrapTextInColorCode(" dormir") .. "." .. colorGrae:WrapTextInColorCode("\n\nDésactivez-le uniquement si vous ne souhaitez JAMAIS que le son de fond soit activé ou s'il y a une erreur due à un conflit avec un autre module complémentaire.")

T["Please select a usable item."] = "Veuillez sélectionner un article utilisable."

T["Angleur Bobber Scanner: Gamepad Detected! Cast fishing once to trigger cursor mode, then place it in the indicated box."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner : ") .. "Gamepad détecté ! Lancez " .. colorYello:WrapTextInColorCode("fishing ") .. " une fois pour déclencher le mode curseur " .. colorYello:WrapTextInColorCode("") .. ", puis placez-le dans la case indiquée " .. colorRed:WrapTextInColorCode(".")

T["Soft target icon for game objects disabled."] = "Icône de cible souple pour les objets de jeu désactivée."

T["Right Click to temporarily put Angleur to sleep. zzz..."] = "Clic droit pour endormir temporairement Angleur. zzz..."

T["login messages re-enabled"] = "messages de connexion réactivés"

T["Redo Tutorial"] = "Refaire le didacticiel"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping. To continue using, type "
.. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Dormir. Pour continuer à utiliser, tapez à nouveau " .. colorYello:WrapTextInColorCode("/angsleep ") .. ","

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Minimap Icon hidden, "
.. colorYello:WrapTextInColorCode("/angmini ") .. "to show."] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Icône de mini-carte masquée, " .. colorYello:WrapTextInColorCode("/angmini ") .. "à afficher."

T["Nightcrawlers"] = "Les robots nocturnes"

T["Personal Fishing Barge"] = "Barge de pêche personnelle"

T["Yes"] = "Oui"

T["link of macro spell: "] = "lien du sort macro :"

T["Bat Visage Bobber"] = "Visage de chauve-souris Bobber"

T["Clicking on the button\nthat appears below\nonce this option is selected."] = "En cliquant sur le bouton\nqui apparaît ci-dessous\nune fois cette option sélectionnée."

T["Standard"] = "Standard"

T["Release When Swimming"] = "Relâcher en nageant"

T["Plays a warning sound when the bobber lands too far for the soft interact system to capture."] = "Joue un son d'avertissement " .. colorYello:WrapTextInColorCode("") .. " lorsque le bobber atterrit trop loin pour que le système d'interaction douce puisse le capturer."

T["Angleur Bobber Scanner: Gamepad Cursor has been enabled. Please move it to the indicated area to start using."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner :") .. colorYello:WrapTextInColorCode(" Le curseur de la manette de jeu ") .. " a été activé. Veuillez le déplacer vers la zone indiquée [[colorRed]] pour commencer à l'utiliser."

T["You can enable\n\nRafts,\n\nBobbers,\n\nand Ultra Focus(Audio/Temporary Auto Loot)\n\nby checking these boxes."] = "Vous pouvez activer\n\ndes radeaux,\n\nBobbers,\n\net Ultra Focus (audio/butin automatique temporaire)\n\nen cochant ces cases."

T[colorBrown:WrapTextInColorCode("Extra Items/Macros\n\n")  .. "You can " .. colorYello:WrapTextInColorCode("Drag ")
.. "items or macros here to add them to your Angleur rotation.\n\n" .. "These can be fishing hats, throwable fish, spells...\n\n"
.. "You can even set custom timers for them by clicking the " .. colorYello:WrapTextInColorCode("stopwatch ")
.. "icon that appears once you slot an item/macro.\n\nClick "
.. colorYello:WrapTextInColorCode("Okay ") .. "to move on."] = colorBrown:WrapTextInColorCode("Articles/Macros supplémentaires\n\n") .. "Vous pouvez " .. colorYello:WrapTextInColorCode("Drag ") .. "éléments ou macros ici pour les ajouter à votre rotation Angleur.\n\nIl peut s'agir de chapeaux de pêche, de poissons jetables, de sorts...\n\nVous pouvez même définir des minuteries personnalisées pour eux en cliquant sur l'icône du chronomètre " .. colorYello:WrapTextInColorCode(" ") .. " qui apparaît une fois que vous avez inséré un élément/une macro.\n\nCliquez sur " .. colorYello:WrapTextInColorCode("OK ") .. "pour continuer."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "You are running an addon that interferes with"
.. colorYello:WrapTextInColorCode("Soft-Interact.")] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Vous exécutez un module complémentaire qui interfère avec" .. colorYello:WrapTextInColorCode("Soft-Interact.")

T["Scan Width"] = colorYello:WrapTextInColorCode("Largeur de numérisation")

T["If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ")
.. "when you use OneKey/DoubleClick.\n\n"
.. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")] = "Si coché, Angleur vous fera démonter " .. colorYello:WrapTextInColorCode("") .. "lorsque vous utilisez OneKey/DoubleClick.\n\n" .. colorGrae:WrapTextInColorCode("Votre clé ne sera plus débloquée au montage.")

T["Shows a visual range indicator when the bobber lands too far for the soft interact system to capture."] = "Affiche un indicateur de portée visuelle lorsque le bobber atterrit trop loin pour que le système d'interaction douce puisse le capturer."

T["Place your cursor in the box\nbelow for the scanner to work."] = "Placez votre curseur dans la case\nci-dessous pour que le scanner fonctionne."

T["Toy selection deactivated"] = "Sélection de jouets désactivée"

T["Crate of Bobbers: Carved Wooden Helm"] = "Caisse de Bobbers : casque en bois sculpté"

T["Artisan Beverage Goblet Bobber"] = "Gobelet à boisson artisanal Bobber"

T["Bobber Scan: Scan unsuccessful. Try changing the \'Elevation\' setting, "
.. "or the width of the search area in the Scanner menu by clicking the Gear icon next to the mouse drop-off box"] = colorBlu:WrapTextInColorCode("Bobber Scan : ") .. "Scan a échoué. Essayez de modifier le paramètre " .. colorYello:WrapTextInColorCode("'Elevation' ") .. " ou la largeur de la zone de recherche dans le menu Scanner en cliquant sur l'icône " .. colorYello:WrapTextInColorCode("Gear ") .. " à côté de la souris " .. colorGreen:WrapTextInColorCode("drop") .. colorRed:WrapTextInColorCode("-off ") .. "box."

T[colorPurple:WrapTextInColorCode("Extra Toys\n\n")  .. "You can select a toy from the " .. colorYello:WrapTextInColorCode("Toy Box ")
.. "to add it to your Angleur rotation.\n\n Click on an empty slot to open toy selection, or click next to move on.\n\n"
.. "Note: Not every toy will work, some silence you so you can't fish etc. Experiment around!"] = colorPurple:WrapTextInColorCode("Jouets supplémentaires\n\n") .. "Vous pouvez sélectionner un jouet dans le Coffre à Jouets " .. colorYello:WrapTextInColorCode("") .. "pour l'ajouter à votre rotation Angleur.\n\n Cliquez sur un emplacement vide pour ouvrir la sélection de jouets, ou cliquez sur Suivant pour continuer.\n\nRemarque : Tous les jouets ne fonctionneront pas, certains vous feront taire pour ne pas pouvoir pêcher, etc. Expérimentez !"

T["Spell/Item has no Cooldown/Aura?\n"
.. "Click " .. colorYello:WrapTextInColorCode("the Stopwatch ") .. "to set a manual timer.\n"
.. colorYello:WrapTextInColorCode("                                                 (minutes:seconds)")] = "Le sort/objet n'a pas de temps de recharge/d'aura ?\nCliquez sur " .. colorYello:WrapTextInColorCode(" sur le chronomètre ") .. " pour régler une minuterie manuelle.\n" .. colorYello:WrapTextInColorCode(" (minutes:secondes)")

T["Automatic Aquatic Form for ALL CLASSES, ALL THE TIME!\n\nEquip Underlight_Angler when swimming, re-equip your \'Main\' Fishing Rod when not."] = "Forme aquatique automatique pour TOUTES LES CLASSES, TOUT LE TEMPS !\n\nÉquipez " .. colorUnderlight:WrapTextInColorCode("Underlight_Angler ") .. "lorsque vous nagez, rééquipez votre canne à pêche « principale » lorsque vous ne le faites pas."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ")
.. "detected."] = colorBlu:WrapTextInColorCode("Angleur : ") .. colorYello:WrapTextInColorCode("Plater ") .. "détecté."

T["Default tiny settings restored"] = "Petits paramètres par défaut restaurés"

T["Both"] = "Les deux"

T["All unslotted items in the set have been set to <ignore slot>."] = "Tous les éléments sans emplacement de l'ensemble ont été définis sur <ignorer l'emplacement>."

T["Angleur will only have you cast rafts while swimming, then release the key afterward."] = "Angleur vous demandera uniquement de lancer des radeaux pendant la nage, puis de relâcher la clé par la suite."

T["If checked, the only action your OneKey/DoubleClick will perform while swimming will be casting rafts.\n(If you already have one, the key will be released.)"] = "Si cette case est cochée, la seule action que votre " .. colorYello:WrapTextInColorCode("OneKey / DoubleClick ") .. " effectuera " .. colorDarkBlu:WrapTextInColorCode(" en nageant ") .. " lancera " .. colorBrown:WrapTextInColorCode("rafts.") .. "\n(Si vous en avez déjà une, la clé sera libérée.)"

T["Let Angleur take care of Audio & Loot settings for you."] = "Laissez Angleur s'occuper des paramètres " .. colorYello:WrapTextInColorCode("Audio") .. " & " .. colorYello:WrapTextInColorCode("Loot ") .. " pour vous."

T["If checked, Angleur will go to Sleep when you unequip your fishing rod.\n\nUncheck if you want to fish without a rod in the main hand slot. On by default."] = "Si coché, Angleur passera en " .. colorYello:WrapTextInColorCode("Sleep ") .. "lorsque vous déséquiperez votre canne à pêche.\n\n" .. colorGrae:WrapTextInColorCode("Décochez si vous souhaitez pêcher sans canne dans la fente main principale. Activé par défaut.")

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Thank you for using Angleur!"] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Merci d'utiliser Angleur !"

T["Select which mouse button by:"] = "Sélectionnez quel bouton de la souris en :"

T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)\n\n"
.. "Pick \'Random Raft\' to get a different one every time!"] = "Choisissez un " .. colorBrown:WrapTextInColorCode("Raft") .. ", et Angleur vous fera l'utiliser lorsque vous serez dans " .. colorDarkBlu:WrapTextInColorCode("water") .. " !\n(Conservez également le buff par la suite)\n\nChoisissez " .. colorYello:WrapTextInColorCode("'Random Raft' ") .. " pour en obtenir un différent à chaque fois !"

T["Crate of Bobbers: Squeaky Duck"] = "Caisse de Bobbers : Squeaky Duck"

T["You can support the project\nby donating on " .. colorYello:WrapTextInColorCode("Ko-Fi! ")] = "Vous pouvez soutenir le projet   \nen faisant un don sur " .. colorYello:WrapTextInColorCode("Ko-Fi!")

T["Crate of Bobbers: Murloc Head"] = "Caisse de Bobbers : Tête de Murloc"

T["The following slotted items could not be added to your Angleur Equipment Set:"] = "Les éléments à emplacements suivants n'ont pas pu être ajoutés à votre ensemble d'équipement " .. colorYello:WrapTextInColorCode("Angleur ") .. " :"

T["Double Click"] = "Double-cliquez"

T["Angleur will no longer release your keybind while swimming."] = "Angleur ne relâchera plus votre raccourci clavier en nageant."

T["Macro-Bound Key to find and mark Void Pools easily!\n\nWhen you press it, if there is a nearby Void Pool, it will be marked on your minimap & in-game with a skull marker."
    .. "\n\nAlso plays a cool sound effect and a scan animation under your mouse cursor"] = "Clé macro-liée pour trouver et marquer facilement les piscines vides !\n\nLorsque vous appuyez dessus, s'il y a un " .. colorDarkBlu:WrapTextInColorCode("Void Pool") .. " à proximité, il sera marqué sur votre mini-carte et dans le jeu avec un marqueur de crâne." .. colorGrae:WrapTextInColorCode("\n\nJoue également un effet sonore sympa et une animation de numérisation sous le curseur de votre souris")

T["Soft Interact in Classic:"] = "Interaction douce dans Classic :"

T["Extra Toys"] = "Jouets supplémentaires"

T["Sleeping. Zzz...\n"] = "Dormir. Zzz..."

T["Fish, Reel, cast Toys, Items and Macros using double mouse clicks!\n"] = "Pêchez, moulinet, lancez des jouets, des objets et des macros en utilisant des doubles clics de souris !"

T["Disable Soft Icon"] = "Désactiver l'icône logicielle"

T["Gnarlwood Waveboard"] = "Planche à vagues en bois noueux"

T["Okay"] = "D'accord"

T["Audio"] = "Audio"

T["Angleur Warning"] = "Avertissement des pêcheurs"

T[colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Visual:\n\n") .. "Shows what your next input will do.\n"
.. "Drag and place it anywhere you might like.\n\n" .. "You can also hide it by clicking its close button."] = colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Visuel :\n\n") .. "Montre ce que fera votre prochaine entrée.\nFaites-le glisser et placez-le où vous le souhaitez.\n\nVous pouvez également le masquer en cliquant sur son bouton de fermeture."

T["Are you sure you want to abandon the tutorial?"] = "Êtes-vous sûr de vouloir abandonner le didacticiel ?"

T["Reset Angleur Set"] = "Réinitialiser l'ensemble Angleur"

T["Ambience Volume"] = "Volume d'ambiance"

T[", with modifier "] = ", avec modificateur"

T["login messages disabled"] = "messages de connexion désactivés"

T["Beta: " .. colorWhite:WrapTextInColorCode("If you are having trouble,\ntry resetting the set by clicking\nthe reset button then refreshing\nthe UI with ")
    .. "/reload."] = "Bêta : " .. colorWhite:WrapTextInColorCode("Si vous rencontrez des problèmes,\nessayez de réinitialiser l'ensemble en cliquant sur\nle bouton de réinitialisation puis rafraîchissement\nl'interface utilisateur avec ") .. "/reload."

T["Middle Button: " .. colorYello:WrapTextInColorCode("Hide Minimap Icon")] = "Bouton du milieu : " .. colorYello:WrapTextInColorCode("Masquer l'icône de la mini-carte")

T["Can't create Equipment Set without any equippable slotted items. Slot a usable and equippable item to your Extra Items slots first."] = "Impossible de créer un ensemble d'équipement sans aucun élément à équiper. Placez d'abord un objet utilisable et équipable dans vos emplacements d'objets supplémentaires."

T["Crate Bobbers"] = "Bobbers de caisse"

T["debug mode deactivated"] = "mode débogage désactivé"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Macro successfully slotted. If you make changes to it, you need to "
.. colorYello:WrapTextInColorCode("re-drag ")
.. "the new version to the slot. You can also delete the macro to save space, Angleur will remember it."] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Macro inséré avec succès. Si vous y apportez des modifications, vous devez " .. colorYello:WrapTextInColorCode("re-faire glisser ") .. "la nouvelle version vers l'emplacement. Vous pouvez également supprimer la macro pour gagner de la place, Angleur s'en souviendra."

T["Having Problems?"] = "Vous avez des problèmes ?"

T["Click here if you need an example & explanation of use of macros for Angleur!"] = "Cliquez ici si vous avez besoin d'un exemple & d'une explication d'utilisation des macros pour Angleur !"

T["Angleur: Ultra Focus will trigger on "] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Ultra Focus se déclenchera sur"

T["Adjust Audio Levels"] = "Ajuster les niveaux audio"

T["A bug with the Angleur Set has occurred, where it is set to unequip all gear. "
.. "Therefore, it has been deleted. If this keeps happening, please contact the Author."] = "Un bug avec l'ensemble Angleur est survenu, où il est configuré pour déséquiper tout l'équipement. Il a donc été supprimé. Si cela continue, veuillez contacter l'auteur."

T[colorYello:WrapTextInColorCode("To Get Started:\n\n") .. "Choose your desired\n"
.. colorBlu:WrapTextInColorCode("Fishing Method") .. " by\nclicking one of these buttons.\n\n"] = colorYello:WrapTextInColorCode("Pour commencer :\n\n") .. "Choisissez votre choix\n" .. colorBlu:WrapTextInColorCode("Méthode de pêche") .. " par\nen cliquant sur l'un de ces boutons."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Awake."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Réveillez-vous."

T["Double-Click Fishing Mode"] = "Mode de pêche en double-clic"

T["Fish, cast Toys, Items and Macros using double mouse clicks!\n"] = "Pêchez, lancez des jouets, des objets et des macros en utilisant des doubles clics de souris !"

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
.. "_____________________________________________"] = colorYello:WrapTextInColorCode("Articles :\n") .. "- Tout objet utilisable provenant de vos sacs ou de l'équipement de votre personnage. \n\n Chaque fois que :\n\n   1) " .. colorYello:WrapTextInColorCode("hors temps de recharge\n") .. " 2) " .. colorYello:WrapTextInColorCode("Aura Inactive") .. " (si présent)\n" .. colorYello:WrapTextInColorCode("\nMacro :\n") .. "- Toute macro valide contenant un sort ou un objet utilisable - /cast ou /use. \n\n Chaque fois que :\n\n   1) " .. colorYello:WrapTextInColorCode("Macro Conditions ") .. "sont remplies\n   2) Le sort/objet est " .. colorYello:WrapTextInColorCode("Off-Cooldown") .. " et leur\n   3) " .. colorYello:WrapTextInColorCode("Auras inactifs") .. " (si présent)\n\n" .. colorYello:WrapTextInColorCode("IMPORTANT : ") .. "Si vous utilisez des conditions de macro, elles doivent être ACTIFS lorsque vous faites glisser la macro vers l'emplacement.\n_____________________________________________________________"

T["Can't drag item in combat."] = "Impossible de faire glisser un objet en combat."

T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ")
    .. "and " .. colorBlu:WrapTextInColorCode("use Items and Configured Macros ")
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") .. "et " .. colorBlu:WrapTextInColorCode("utiliser des éléments et des macros configurées ") .. "using \nun bouton."

T[colorYello:WrapTextInColorCode("Can't use Macro: ")
.. "The item used in this macro doesn't have a trackable spell/aura."] = colorYello:WrapTextInColorCode("Impossible d'utiliser la macro : ") .. "L'objet utilisé dans cette macro n'a pas de sort/aura traçable."

T["Crate of Bobbers: Cat Head"] = "Caisse de Bobbers : Tête de Chat"

T["Anglers Fishing Raft"] = "Radeau de pêche des pêcheurs"

T["Disable Soft Interact"] = "Désactiver l'interaction douce"

T["Note for Classic:"] = "Remarque pour Classique :"

T["Pick a Raft, and Angleur will have you use it when you are in water!\n(Also keep the buff going afterwards)"] = "Choisissez un " .. colorBrown:WrapTextInColorCode("Raft") .. ", et Angleur vous fera l'utiliser lorsque vous serez dans " .. colorDarkBlu:WrapTextInColorCode("water") .. " !\n(Conservez également le buff par la suite)"

T["you do not own this toy. please select another"] = "vous ne possédez pas ce jouet. veuillez en sélectionner un autre"

T["Random Raft"] = "Radeau aléatoire"

T["Glow Worm"] = "Ver luisant"

T["Debug Mode"] = "Mode débogage"

T["  Extra  "] = "Supplémentaire"

T["Shows what your next key press\nwill do. Not meant to be clicked."] = "Montre quelle sera votre prochaine pression sur une touche\nfera l'affaire. Pas destiné à être cliqué."

T["Modifier key "] = "Touche de modification"

T["Tuskarr Dinghy"] = "Dériveur Tuskarr"

T["When unchecked, Bobber Scanner warn you with a chat message when your "
.. "Camera Zoom changes during scan(when it's not supposed to). It's usually due to a wall that's behind you, and it is recommended to "
.. "keep the warning \'enabled\' so you can know when a fishing spot might cause issues."] = "Lorsqu'il n'est pas coché, Bobber Scanner vous avertit avec un message de discussion lorsque votre " .. colorYello:WrapTextInColorCode("Camera Zoom ") .. " change pendant la numérisation (quand il n'est pas censé le faire).\n\nCela est généralement dû à un mur qui se trouve derrière vous, et il est recommandé à [[colorYello]] de garder l'avertissement " .. colorGreen:WrapTextInColorCode(" « activé » ") .. " afin que vous puissiez savoir quand un lieu de pêche pourrait poser des problèmes."

T["Return\nAngleur Visual"] = "Retour\nVisuel Angleur"

T["Visual Size"] = "Visual Size"

T["Angleur: Sharpened Tuskarr Spear(MoP) detected."] = colorBlu:WrapTextInColorCode("Angleur : ") .. colorYello:WrapTextInColorCode("Lance Tuskarr aiguisée (MoP)") .. " détectée."

T["Angleur: VERSION UPDATED. Please re-set your \'OneKey\' from the Config Panel."] = colorBlu:WrapTextInColorCode("Angleur : ") .. "VERSION MISE À JOUR. Veuillez réinitialiser votre " .. colorYello:WrapTextInColorCode("'OneKey' ") .. " à partir du panneau de configuration " .. colorYello:WrapTextInColorCode(".")

T["\n(Released BACK in Combat!)"] = colorGrae:WrapTextInColorCode("\n(Released BACK in Combat!)\n")

T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot")
.. ", then turn it back off after you reel.\n\n" .. colorGrae:WrapTextInColorCode("If you have ")
.. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")] = "Si cette case est cochée, Angleur activera temporairement " .. colorYello:WrapTextInColorCode("Auto-Loot") .. ", puis le désactivera après votre bobine.\n\n" .. colorGrae:WrapTextInColorCode("Si vous avez quand même activé ") .. colorYello:WrapTextInColorCode("Auto-Loot ") .. colorGrae:WrapTextInColorCode(", cette fonctionnalité sera désactivée automatiquement.")

T["Bobber Scanner - Dizzy Warning"] = "Bobber Scanner - Avertissement étourdi"

T["Please try again after combat ends."] = "Veuillez réessayer après la fin du combat."

T["Right Click: " .. colorYello:WrapTextInColorCode("Sleep/Wake")] = "Clic droit : " .. colorYello:WrapTextInColorCode("Sleep/Wake")

T["Niche functionality plugin for Angleur. Adding niche user requests through this plugin!"] = "Plugin de fonctionnalité de niche pour Angleur. Ajout de demandes d'utilisateurs de niche via ce plugin !"

T["Heat-Treated Spinning Lure"] = "Leurre tournant traité thermiquement"

T["Zoom Out To"] = colorPurple:WrapTextInColorCode(" !! NOUVEAU !! ") .. colorYello:WrapTextInColorCode("Zoom arrière sur")

T["Toggle Bags"] = "Sacs à bascule"

T["ELEVATION:"] = colorUnderlight:WrapTextInColorCode("ÉLÉVATION :")

T["/angsleep"] = "/anglesommeil"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Soft Interact has been turned " .. colorGreen:WrapTextInColorCode("ON ") .. "for you to be able to ".. colorYello:WrapTextInColorCode("Reel/Loot ")
.. "your catches. The previous values will be restored upon logout, so that if you uninstall Angleur you will have them back to normal."] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Soft Interact a été transformé " .. colorGreen:WrapTextInColorCode("ON ") .. "pour que vous puissiez " .. colorYello:WrapTextInColorCode("Reel/Loot ") .. "vos captures. Les valeurs précédentes seront restaurées lors de la déconnexion, de sorte que si vous désinstallez Angleur, elles reviendront à la normale."

T["Macro empty"] = "Macro vide"

T["Sleep Without Fishing Rod"] = "Dormir sans canne à pêche"

T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ")
    .. ", use " .. colorPurple:WrapTextInColorCode("Toys") .. ", " .. colorBlu:WrapTextInColorCode(" Items and Configured Macros ")
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") .. ", utilisez " .. colorPurple:WrapTextInColorCode("Touets") .. ", " .. colorBlu:WrapTextInColorCode(" Articles ") .. " et " .. colorBlu:WrapTextInColorCode("\nMacros configurées ") .. " à l'aide d'un seul bouton."

T["   " .. colorYello:WrapTextInColorCode("Click ") .. "any of the buttons above\nthen select a toy with left click from\nthe "
.. colorYello:WrapTextInColorCode("Toy Box ") .. "that pops up."] = colorYello:WrapTextInColorCode("Cliquez sur ") .. "l'un des boutons ci-dessus\npuis sélectionnez un jouet avec un clic gauche depuis\nle coffre à jouets " .. colorYello:WrapTextInColorCode("") .. "qui apparaît."

T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."] = "Indique si l'icône du crochet au-dessus du bobber est affichée.\nNotez que cela affecte les icônes des autres objets cibles souples."

T["Ultra Focus:"] = "Ultra-concentration :"

T[colorWhite:WrapTextInColorCode("\nEquip a ") .. "Fishing Pole\n"] = colorWhite:WrapTextInColorCode("\nEquiper une canne à pêche ")

T["1) Tents such as Gnoll Tent to protect yourself from the sun as you fish."
    .. "\n2) Transformation toys such as Burning Defender's Medallion.\n3) Seating items like pillows so you can fish comfortably."
    .. "\n4) Darkmoon whistle if you want to be annoying.\nAnd other whacky combinations!"] = "1) Des tentes comme la Gnoll Tent pour se protéger du soleil pendant la pêche.\n2) Jouets de transformation tels que le médaillon de Burning Defender.\n3) Asseyez-vous sur des objets comme des oreillers pour que vous puissiez pêcher confortablement.\n4) Sifflet de Sombrelune si vous voulez être ennuyeux.\nEt d'autres combinaisons farfelues !"

T["Enable Soft Interact"] = "Activer l'interaction douce"

T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("Double Click\n")] = "Mode de pêche : " .. colorBlu:WrapTextInColorCode("Double Clic\n")

T["Recast Reminder"] = "Rappel de refonte"

T["Choose when Angleur's Ultra Focus Activates/Releases.\n\n" .. "Cast/Reel : Will activate/release with every single cast (DEFAULT)\n\n"
.. "Sleep/Wake : Will only activate/release when you wake/sleep the addon\n"] = "Choisissez quand l'Ultra Focus " .. colorGreen:WrapTextInColorCode(" d'Angleur active ") .. "/" .. colorRed:WrapTextInColorCode(" libère ") .. ".\n\n" .. colorYello:WrapTextInColorCode("Cast/Reel : ") .. "S'activera/se libérera à chaque lancer " .. colorGrae:WrapTextInColorCode(" (DEFAULT)\n\n") .. colorYello:WrapTextInColorCode("Sleep/Wake : ") .. "S'activera/se libérera uniquement lorsque vous réveillerez/endormirez l'addon"

T["Activation Mode:"] = "Mode d'activation :"

T["Angleur: Minimap Button Hidden"] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Bouton Mini-carte masqué"

T["Pick a Bobber from the Crate of Bobbers, and Angleur will have you keep it applied!\n\n"
.. "Pick \'Random Bobber\' to get a different one every time!"] = "Choisissez un Bobber dans la caisse de Bobbers" .. colorYello:WrapTextInColorCode("Crate ") .. ", et Angleur vous fera le garder appliqué !\n\nChoisissez " .. colorYello:WrapTextInColorCode("'Random Bobber' ") .. " pour en obtenir un différent à chaque fois !"

T["Angleur: Minimap Button Shown"] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Bouton Mini-carte affiché"

T["Pick a Bait Item from the ones in your bags, and Angleur will keep it applied!\n\nMake sure you pick one whose level isn't higher than yours."] = "Choisissez un " .. colorYello:WrapTextInColorCode("Bait Item ") .. " parmi ceux présents dans vos sacs, et Angleur le gardera appliqué !" .. colorGrae:WrapTextInColorCode("\n\nAssurez-vous d'en choisir un dont le niveau n'est pas supérieur au vôtre.")

T["Open Config Panel"] = "Ouvrir le panneau de configuration"

T["If checked, Angleur will show developer debug messages. Useful to display when submitting bug reports through discord!\n\n"
.. "Keep unchecked during regular use."] = "Si cette case est cochée, Angleur affichera les messages de débogage du développeur.\nUtile à afficher lors de la soumission de rapports de bugs via " .. colorPurple:WrapTextInColorCode("discord !\n\n") .. colorGrae:WrapTextInColorCode("Ne pas cocher lors d'une utilisation régulière.")

T["/angmini"] = "/angmini"

T["Uncheck to hide minimap, or middle-mouse-click on the minimap button."] = "Décochez pour masquer la mini-carte ou cliquez avec le bouton central de la souris sur le bouton de la mini-carte."

T["Show Minimap Button"] = "Afficher le bouton de la mini-carte"

T["Recommended Value: 2\n"] = colorGrae:WrapTextInColorCode("Valeur recommandée : 2\n")

T["How far out the camera will zoom out before starting the scan. Higher value => farther.\n"] = colorWhite:WrapTextInColorCode("À quelle distance la caméra ") .. "effectuera un zoom arrière " .. colorWhite:WrapTextInColorCode("avant de démarrer le scan. Valeur plus élevée => plus loin.\n")

T["sec"] = "seconde"

T["Equipping of the Angleur set disrupted due to sudden death/ghost-form"] = "Équipement du set Angleur perturbé à cause d'une mort subite/forme fantôme"

T["Defaults\n(Recommended)"] = "Valeurs par défaut\n(Recommandé)"

T["Two-Way Transformations to Worgens when you cast abilities or use items!\n\nFeatures a built-in drag&drop Macro Maker."] = "Transformations bidirectionnelles en Worgens lorsque vous lancez des capacités ou utilisez des objets !\n\nComprend un glisser-déposer intégré " .. colorYello:WrapTextInColorCode("Macro Maker.")

T["Dialog Volume"] = "Volume des boîtes de dialogue"

T["Couldn't find \n Oversized Bobber in \n toybox, feature disabled"] = "Je n'ai pas trouvé \n Bobber surdimensionné \n coffre à jouets, fonctionnalité désactivée"

T["OneKey removed"] = "OneKey supprimé"

T["Shiny Bauble"] = "Boule brillante"

T["for [Patient Chest]\n\n" .. "When enabled, Angleur will play a warning sound, screen animation and show a cool image of Reno Jackson warning you about the treasure.\n\nNote: The sound is also that of Reno Jackson\n\n"
.. "We're gonna be rich!"] = colorGrae:WrapTextInColorCode("pour ") .. colorDarkBlu:WrapTextInColorCode("[Coffre du patient]\n\n") .. "Lorsqu'il est activé, Angleur émettra un son d'avertissement, une animation à l'écran et affichera une image sympa de Reno Jackson vous avertissant du trésor.\n\n" .. colorGrae:WrapTextInColorCode("Note : Le son est aussi celui de Reno Jackson\n\n") .. colorGrae:WrapTextInColorCode("On va être riches !")

T["THANK YOU!"] = "MERCI!"

T["Effects Volume"] = "Volume des effets"

T["You can drag and place this anywhere on your screen"] = "Vous pouvez le faire glisser et le placer n'importe où sur votre écran"

T["Master Volume"] = "Volume principal"

T["To stop seeing these messages, go to:"] = "Pour ne plus voir ces messages, accédez à :"

T["Login Messages"] = "Messages de connexion"

T["Failed to get macro index"] = "Impossible d'obtenir l'index de la macro"

T["Music Volume"] = "Volume de la musique"

T["Advanced Angling"] = "Pêche avancée"

T["Patient Chest"] = "Poitrine du patient"

T["[Patient Treasure] Spawned. Be quick and grab it! Good luck with the mount egg:\n"] = colorDarkBlu:WrapTextInColorCode("[Trésor du patient] ") .. "Engendré. Soyez rapide et saisissez-le ! Bonne chance avec l'œuf de monture :"

T["link of macro item: "] = "lien de l'élément macro :"

T["Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."] = "Situé dans Plater->Avancé->Paramètres généraux.\n\nSinon Angleur ne pourra pas ramener le poisson."

T["Crate of Bobbers: Tugboat"] = "Caisse de Bobbers : Remorqueur"

T["Note for Mists:"] = "Remarque pour les brumes :"

T["Bind a dedicated \'Re-Cast Key\'.\n\nWill be released back to you when not fishing."] = "Liez une clé " .. colorYello:WrapTextInColorCode(" 'Re-Cast' dédiée.\n\n") .. colorGrae:WrapTextInColorCode("Vous sera restitué lorsque vous ne pêchez pas.")

T["Angleur Visual Button"] = "Bouton Visuel Angleur"

T["Crate of Bobbers: Face of the Forest"] = "Caisse de Bobbers : visage de la forêt"

T["Wake!"] = "Se réveiller!"

T["Use this if you are fishing in a spot where the elevation constantly changes from level to lower and vice versa."
.. " The scan covers twice the height as usual, thus taking twice as long."] = colorWhite:WrapTextInColorCode("Utilisez-le si vous pêchez dans un endroit où l'élévation\nchange constamment ") .. colorWhite:WrapTextInColorCode("de ") .. "même " .. colorWhite:WrapTextInColorCode("à ") .. "inférieur, " .. colorWhite:WrapTextInColorCode("et vice versa.\n\n") .. colorWhite:WrapTextInColorCode("Le scan couvre deux fois la hauteur comme d'habitude, prenant ainsi deux fois plus de temps.")

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Modifier Keys ")
.. "won't be recognized when the game is in the " .. colorGrae:WrapTextInColorCode("background. ")
.. "If you are using the scroll wheel for that purpose. Just bind the wheel alone instead, without modifiers."] = colorBlu:WrapTextInColorCode("Angleur : ") .. colorYello:WrapTextInColorCode("Touches de modification ") .. "ne sera pas reconnu lorsque le jeu est en arrière-plan " .. colorGrae:WrapTextInColorCode(". ") .. "Si vous utilisez la molette de défilement à cet effet. Liez simplement la roue seule, sans modificateurs."

T["If checked, Angleur will have you keep \'Reusable Oversized Bobber\' applied."] = "Si coché, Angleur vous fera conserver " .. colorYello:WrapTextInColorCode("'Reusable Oversize Bobber' ") .. "appliqué."

T["ITEM NOT FOUND IN BAGS. TO USE FOR EQUIPMENT SWAP, EITHER ADD IT MANUALLY TO ANGLEUR SET OR RE-DRAG THE MACRO."] = "ARTICLE INTROUVABLE DANS LES SACS. POUR L'UTILISER POUR UN ÉCHANGE D'ÉQUIPEMENT, SOIT L'AJOUTER MANUELLEMENT À L'ANGLEUR SET OU RE-DRAGER LA MACRO."

T["If checked, Angleur will adjust your audio settings for you when you cast your rod, and restore them to the previous values when you reel/loot.\n\n"
.. "Ambience & Music will be muted.\nSound Effects will be turned up.\n\nWhile Angleur is awake, \'Sound in Background\' will also be enabled(restored to previous on sleep).\n\n"
.. "If you want to change the adjusted audio volume, go to Angleur->Tiny->Master Volume(Ultra Focus) and adjust from the slider."] = "Si cette case est cochée, Angleur ajustera vos paramètres audio pour vous lorsque vous lancerez votre canne et les restaurera aux valeurs précédentes lorsque vous lancerez/pillerez.\n\n" .. colorYello:WrapTextInColorCode("Ambiance & Musique ") .. "sera " .. colorRed:WrapTextInColorCode("muté.") .. colorYello:WrapTextInColorCode("\nEffets sonores ") .. "sera " .. colorGreen:WrapTextInColorCode("monté.") .. "\n\nPendant qu'Angleur est réveillé, " .. colorYello:WrapTextInColorCode("'Sound in Background' ") .. "sera également activé (restauré au précédent en veille).Si vous souhaitez " .. colorUnderlight:WrapTextInColorCode("changer ") .. "le volume audio ajusté, accédez à " .. colorBlu:WrapTextInColorCode("Angleur ") .. "-> " .. colorBlu:WrapTextInColorCode("Tiny ") .. "-> " .. colorBlu:WrapTextInColorCode("Master Volume (Ultra Focus) ") .. " et réglez à partir du curseur."

T["When unchecked, Angleur will stop showing Login messages.\n\nLogin messages may contain useful tips, and can be re-enabled at any time."] = "Lorsque cette case n'est pas cochée, Angleur cessera d'afficher les messages de connexion.\n\n" .. colorGrae:WrapTextInColorCode("Les messages de connexion peuvent contenir des conseils utiles et peuvent être réactivés à tout moment.")

T["You need to open the Config Panel to change Angleur's settings!"
.. "\n\n(Hint) You can also:\n - type /ang\n - Double-Click the Angleur Visual\n - Click the Minimap/AddonCompartment Button\nto open it."] = colorWhite:WrapTextInColorCode("Vous devez ouvrir le panneau de configuration pour modifier les paramètres d'Angleur !") .. colorGrae:WrapTextInColorCode("\n\n(Indice) Vous pouvez également :\n - tapez ") .. colorYello:WrapTextInColorCode("/ang") .. colorGrae:WrapTextInColorCode("\n - Double-cliquez sur le visuel ") .. colorYello:WrapTextInColorCode("Angleur\n") .. colorGrae:WrapTextInColorCode(" - Cliquez sur le bouton ") .. colorYello:WrapTextInColorCode("Minimap/AddonCompartment") .. colorGrae:WrapTextInColorCode("\npour l'ouvrir.")

T["Angleur will no longer Sleep/Wake based on Fishing Rod equip status."] = colorBlu:WrapTextInColorCode("Angleur ") .. " ne sera plus " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. " en fonction du statut d'équipement de la canne à pêche."

T[" plugin from Curseforge if you want Angleur to use it for you."] = "plugin de Curseforge si vous souhaitez qu'Angleur l'utilise pour vous."

T["Please download the: "] = "Veuillez télécharger le :"

T["Due to the fishing rod taking up the mainhand slot in Classic, this item cannot be added to the Auto-Equip System."] = "Étant donné que la canne à pêche occupe l'emplacement principal dans Classic, cet objet ne peut pas être ajouté au système d'équipement automatique."

T["Can't add toys while dead"] = "Impossible d'ajouter des jouets en étant mort"

T["Item equip interrupted by death/ghost-form"] = "Équipement d'objet interrompu par la mort/forme fantôme"

T["Can't change sleep state in combat."] = "Impossible de changer l'état de sommeil en combat."

T["OneKey set to: "] = "OneKey défini sur :"

T["Inside Water"] = "À l'intérieur de l'eau"

T["Angleur Configuration"] = "Configuration Angleur"

T["Disable Wall Warning"] = "Désactiver l'avertissement mural"

T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ")
.. "Tiny tab(tab 3),  and disable \'Login Messages\'"] = "Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny onglet (onglet 3) et désactiver « Messages de connexion »"

T["\nor"] = "ou"

T["(Already on)"] = "(Déjà allumé)"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Fishing Hat")
.. " detected."] = colorBlu:WrapTextInColorCode("Angleur : ") .. colorYello:WrapTextInColorCode("Chapeau de pêche") .. " détecté."

T["Limited Edition Rocket Bobber"] = "Rocket Bobber en édition limitée"

T["Ultra Focus: Audio Settings"] = "Ultra Focus : paramètres audio"

T["Extra Toys is a feature meant to provide flexible user customization, but not every toy is"
    .. " created the same. Targeted toys, toys that silence you, remote controlled toys etc might mess with your fishing routine."
    .. " Test them out, experiment and have fun!\n"] = "Extra Toys est une fonctionnalité destinée à fournir une personnalisation flexible à l'utilisateur, mais tous les jouets ne sont pas créés de la même manière. Les jouets ciblés, les jouets qui vous font taire, les jouets télécommandés, etc. pourraient perturber votre routine de pêche. Testez-les, expérimentez et amusez-vous !"

T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n"
.. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")] = "Si cette case est cochée, Angleur désactivera " .. colorYello:WrapTextInColorCode("Soft Interact ") .. " après avoir arrêté de pêcher.\n\n" .. colorGrae:WrapTextInColorCode("Destiné aux personnes qui souhaitent garder Soft Interact désactivé pendant le jeu normal.")

T["If you want Soft-Interact to be " .. colorRed:WrapTextInColorCode("TURNED OFF ") .. "when not fishing, go to:\n"
.. "Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact\nand check it "
.. colorGreen:WrapTextInColorCode("ON.")] = "Si vous souhaitez que Soft-Interact soit " .. colorRed:WrapTextInColorCode(" DÉSACTIVÉ ") .. " lorsque vous ne pêchez pas, rendez-vous sur :\nPanneau de configuration Angleur " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny onglet (onglet 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Désactiver Soft-Interact\net vérifiez-le " .. colorGreen:WrapTextInColorCode("ON.")

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off "
.. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."] = colorBlu:WrapTextInColorCode("Angleur ") .. "désactivera désormais " .. colorYello:WrapTextInColorCode("Soft Interact ") .. " lorsque vous ne pêchez pas."

T["Can't change in combat."] = "Impossible de changer au combat."

T["Use this when you are on the same level as the water, or close to it."] = colorWhite:WrapTextInColorCode("Utilisez-le lorsque vous êtes au même niveau que l'eau ou à proximité.")

T["For it to work properly, please make sure to add it as a macro like so: "] = "Pour que cela fonctionne correctement, assurez-vous de l'ajouter sous forme de macro comme ceci :"

T["Angleur Bobber Scanner : WARNING! Camera Zoom changed during scan. "
.. "This can (and will) disrupt success of the bobber scanner, and is likely "
.. "due to a wall or some other game world object behind your character. To fix this, "
.. "either move to a clearing, or lower the \'Max Camera Distance\' in "
.. "the Game's Options under Options->Gameplay->Controls->Camera."
.. "You can turn this warning off in the Bobber Scanner's Config Menu by clicking the gear icon next to the mouse drop-off box."] = colorBlu:WrapTextInColorCode("Angleur Bobber Scanner :") .. colorRed:WrapTextInColorCode(" ATTENTION ! ") .. colorYello:WrapTextInColorCode("Zoom de la caméra ") .. "changé pendant la numérisation. Cela peut (et va) perturber le succès du scanner bobber, et est probablement dû à un mur ou à un autre objet du monde du jeu " .. colorYello:WrapTextInColorCode(" derrière votre personnage. ") .. "Pour résoudre ce problème, déplacez-vous vers une clairière ou réduisez la " .. colorYello:WrapTextInColorCode("'Max Camera Distance' ") .. " dans les options du jeu.sous Options" .. colorYello:WrapTextInColorCode("->") .. "Gameplay" .. colorYello:WrapTextInColorCode("->") .. "Contrôles" .. colorYello:WrapTextInColorCode("->") .. "Camera. Vous pouvez désactiver cet avertissement dans le menu de configuration du scanner Bobber en cliquant sur l'icône " .. colorYello:WrapTextInColorCode("gear ") .. " à côté de la boîte de dépôt de la souris."

T["Use this when the water is lower level than you."] = colorWhite:WrapTextInColorCode("Utilisez-le lorsque le niveau d'eau est inférieur au vôtre.")

T["Lower Elevation"] = "Altitude inférieure"

T["Same Elevation"] = "Même altitude"

T["Ultra Focus: Default audio settings restored"] = "Ultra Focus : paramètres audio par défaut restaurés"

T["debug mode active"] = "mode débogage actif"

T["Start Delay"] = colorYello:WrapTextInColorCode("Délai de démarrage")

T["Preferred Mouse Button"] = "Bouton de souris préféré"

T["Rafts"] = "Radeaux"

T["Crate of Bobbers: Demon Noggin"] = "Caisse de Bobbers : Démon Noggin"

T[" minutes, "] = "minutes,"

T["Selected extra toy: "] = "Jouet supplémentaire sélectionné :"

T["\nto wake Angleur!"] = "pour réveiller Angleur !"

T["Soft target icon for game objects re-enabled."] = "Icône de cible souple pour les objets de jeu réactivée."

T["Crate of Bobbers: Enchanted Bobber"] = "Caisse de Bobbers : Bobber enchanté"

T["please choose the toy with left click so that angleur can function properly"] = "veuillez choisir le jouet avec un clic gauche pour que le pêcheur puisse fonctionner correctement"

T["Scan Speed"] = colorYello:WrapTextInColorCode("Vitesse de numérisation")

T["HOW?"] = "COMMENT?"

T["Dismount With Key"] = "Démonter avec clé"

T["Fun toy recommendations from mod author, Legolando:"] = "Recommandations de jouets amusants de l'auteur du mod, Legolando :"

T["Crate of Bobbers: Wooden Pepe"] = "Caisse de Bobbers : Pepe en bois"

T["Set your desired key by: "] = "Définissez la clé souhaitée en :"

T["  Tiny  "] = "Minuscule"

T["Raft"] = "Radeau"

T["To access the configuration menu, type "] = "Pour accéder au menu de configuration, tapez"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Dormir."

T["Key set to "] = "Clé réglée sur"

T["Set Timer"] = "Régler la minuterie"

T["GAMEPAD MODE: After casting \'fishing\', move the cursor that appears into the box below to use."] = "MODE " .. colorPurple:WrapTextInColorCode("GAMEPAD :\n") .. "Après avoir lancé " .. colorBlu:WrapTextInColorCode("'fishing'") .. ", déplacez le curseur\nqui apparaît dans la " .. colorRed:WrapTextInColorCode("box sous ") .. "à utiliser."

T["Not every toy will work!"] = "Tous les jouets ne fonctionneront pas !"

T["Now, let's move to the " .. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Click here."] = "Passons maintenant à l'onglet " .. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Cliquez ici."

T["No"] = "Non"

T[" or\n"] = "ou"

T["Pickpocket overhaul for Rogues!\n\nSingle player RPG-like Pickpocket Prompt System with dynamic keybind(released back when not pick pocketing)."] = "Révision des pickpockets pour les voleurs !\n\nSystème d'invite de pickpocket de type RPG pour un seul joueur avec combinaison de touches dynamique (relâché lorsqu'il n'est pas fait de vol à la tire)."

T[colorBlu:WrapTextInColorCode("Cast ") .. "your rod and " .. colorBlu:WrapTextInColorCode("use Items/Macros ")
    .. "using\ndouble mouse clicks!\n"] = colorBlu:WrapTextInColorCode("Cast ") .. "votre canne et " .. colorBlu:WrapTextInColorCode("utiliser des objets/macros ") .. "utiliser\ndouble clic de souris !"

T["Nat's Drinking Hat"] = "Chapeau à boire de Nat"

T[" seconds"] = "secondes"

T["Otherwise, you will have to manually target your fishing rod every time."
.. "If you want to see an example of how to slot macros, click the "
..  colorRed:WrapTextInColorCode("[HOW?] ") .. "button on the "
.. colorYello:WrapTextInColorCode("Extra Tab")] = "Sinon, vous devrez cibler manuellement votre canne à pêche à chaque fois. Si vous souhaitez voir un exemple de la façon d'insérer des macros, cliquez sur le bouton " .. colorRed:WrapTextInColorCode("[COMMENT ?] ") .. " sur l'onglet Extra " .. colorYello:WrapTextInColorCode("") .. "."

T["/angang"] = "/angang"

T["Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"] = "Je n'ai pas trouvé \n n'importe quel Crate Bobbers \n dans le coffre à jouets, fonctionnalité désactivée"

T["Can't change sleep state while in ghost form."] = "Impossible de changer l'état de sommeil sous forme fantôme."

T["If enabled, Angleur will play a sound effect when your fishing cast runs out to remind you to cast again!"
.. "\n\nRecommended when fishing on the side while doing something else."] = "Si activé, Angleur jouera un effet sonore " .. colorYello:WrapTextInColorCode(" ") .. " lorsque votre lancer de pêche sera épuisé pour vous rappeler de lancer à nouveau !" .. colorGrae:WrapTextInColorCode("\n\nRecommandé pour pêcher à côté en faisant autre chose.")

T["Double Click Window"] = "Fenêtre Double-clic"

T["One Key"] = "Une clé"

T["Reset to Defaults"] = "Réinitialiser aux valeurs par défaut"

T["Swapback item not found in bags, cannot re-equip."] = "Article d'échange introuvable dans les sacs, impossible de rééquiper."

T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("One Key")] = "Mode de pêche : " .. colorBlu:WrapTextInColorCode("One Key")

T["Created equipment set for " .. colorBlu:WrapTextInColorCode("Angleur" ) .. ". ID is : "] = "Ensemble d'équipement créé pour " .. colorBlu:WrapTextInColorCode("Angleur") .. ". La pièce d'identité est :"

T["Right Click"] = "Clic droit"

T["Unslotted " .. colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Equipment Set ")
.. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it."] = colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Ensemble d'équipement sans fente ") .. " article. Supprimez-le de l'ensemble Angleur dans le gestionnaire d'équipement si vous ne souhaitez pas qu'Angleur continue à l'équiper."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "cannot open "
.. colorYello:WrapTextInColorCode("Config Panel ") .. "in combat."] = colorBlu:WrapTextInColorCode("Angleur : ") .. " ne peut pas ouvrir le panneau de configuration " .. colorYello:WrapTextInColorCode("") .. " en combat."

T["Crate of Bobbers"] = "Caisse de Bobbers"

T["Defaults"] = "Valeurs par défaut"

T["Crate of Bobbers: Floating Totem"] = "Caisse de Bobbers : Totem flottant"

T["The next key you press\nwill be set as Angleur Key"] = "La prochaine touche sur laquelle vous appuyez\nsera défini comme Angleur Key"

T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) "
.. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact"] = "Panneau de configuration Angleur " .. colorYello:WrapTextInColorCode("-> ") .. "Tonglet minuscule (onglet 3) " .. colorYello:WrapTextInColorCode("-> ") .. "Désactiver Soft-Interact"

T["Do not "
.."use this feature if you are sensitive to\nrapid movement "
.. "or any form of fast graphical\nchange. Such as but not limited "
.. "to:\nPhotosensitive Epilepsy, Vertigo..."] = "N'utilisez pas cette fonctionnalité si vous êtes sensible à\nmouvement rapide ou toute forme de graphique rapide\nchanger. Tels que, mais sans s'y limiter :\n" .. colorYello:WrapTextInColorCode("Épilepsie photosensible, Vertiges...")

T["Master Volume(Ultra Focus)"] = "Volume principal (Ultra Focus)"

T["For passive items you'd like to add to your fishing gear, you can use the game's "
.. colorYello:WrapTextInColorCode("Equipment Manager ") .. "to add them to the "
.. colorBlu:WrapTextInColorCode("Angleur ") .. "set"] = "Pour les objets passifs que vous souhaitez ajouter à votre équipement de pêche, vous pouvez utiliser le gestionnaire d'équipement " .. colorYello:WrapTextInColorCode(" du jeu ") .. " pour les ajouter à l'ensemble " .. colorBlu:WrapTextInColorCode("Angleur ") .. "."

T["Sets the OneKey/Double-Click to Recast when the bobber lands too far for the soft interact system to capture."] = "Définit l'" .. colorRed:WrapTextInColorCode("OneKey") .. " / " .. colorRed:WrapTextInColorCode("Double-cliquez sur ") .. " pour " .. colorYello:WrapTextInColorCode("Recast ") .. " lorsque le bobber atterrit trop loin pour que le système d'interaction douce puisse le capturer."

T["Couldn't equip slotted item in time before combat"] = "Impossible d'équiper l'objet inséré à temps avant le combat"

T["Angleur works on a " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. "system, so you don't have to reload your UI after you're done fishing.\n\n"
.. colorBlu:WrapTextInColorCode("Right Click ")
.. "to put Angleur to sleep, and wake it up if it is. You can also Right Click the minimap button."] = "Angleur fonctionne sur un système " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. ", vous n'avez donc pas besoin de recharger votre interface utilisateur une fois la pêche terminée.\n\n" .. colorBlu:WrapTextInColorCode("Cliquez droit sur ") .. "pour endormir Angleur, et réveillez-le si c'est le cas. Vous pouvez également cliquer avec le bouton droit sur le bouton de la mini-carte."

T["   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " ..
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes above."] = colorYello:WrapTextInColorCode("Faites glisser ") .. "un " .. colorYello:WrapTextInColorCode("élément utilisable ") .. "ou un " .. colorYello:WrapTextInColorCode("Macro ") .. "dans l'une des cases ci-dessus."

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to reel properly."] = "Doit être coché " .. colorGreen:WrapTextInColorCode(" SUR ") .. " pour qu'Angleur puisse bobiner correctement."

T["Couldn't find any rafts \n in toybox, feature disabled"] = "Je n'ai trouvé aucun radeau \n dans le coffre à jouets, fonctionnalité désactivée"

T["Manually scans for the bobber by moving the camera in a grid.\n\nDIZZY WARNING:\nDo NOT "
.."use this feature if you are sensitive to rapid movement or any form of fast graphical change.\n\n"
.."This feature is still in development! With enough good feedback, it can be improved and made much smoother :)"] = "Recherche manuellement le bobber en déplaçant la caméra dans une grille.\n\n" .. colorYello:WrapTextInColorCode("DIZZY AVERTISSEMENT :") .. colorRed:WrapTextInColorCode("\nN'utilisez PAS ") .. " cette fonctionnalité si vous êtes sensible aux mouvements rapides ou à toute forme de changement graphique rapide.\n\nCette fonctionnalité est encore en développement ! Avec suffisamment de bons retours, cela peut être amélioré et rendu beaucoup plus fluide :)"

T["\nRight-Click"] = "Clic droit"

T["Has been " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to be able to "
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] = "A été " .. colorGreen:WrapTextInColorCode("vérifié SUR ") .. "pour le raccourci clavier d'AnglEURMARK2XReel/Loot [[/colorYello]]vos captures."

T["This is a limitation of Classic(not the case for Mists and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."] = "Il s'agit d'une limitation de Classic (pas le cas de Mists et Retail), car il lui manque un gestionnaire d'équipement intégré approprié, vous permettant d'insérer des objets passifs dans votre ensemble Angleur."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Failed to get macro spell/item. If you are using "
.. colorYello:WrapTextInColorCode("macro conditions \n")
.. "you need to drag the macro into the button frame when the conditions are met."] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Échec de l'obtention du sort/objet de macro. Si vous utilisez les conditions " .. colorYello:WrapTextInColorCode("macro \n") .. "vous devez faire glisser la macro dans le cadre du bouton lorsque les conditions sont remplies."

T["Mouseover the bobber\nto reel consistently."] = "Passez la souris sur le bobber\npour rouler de manière cohérente."

T["Coming Soon!"] = "À venir!"

T[colorBlu:WrapTextInColorCode("Angleur visual ") .. "is now hidden."] = colorBlu:WrapTextInColorCode("Angleur visuel ") .. "est désormais masqué."

T["Aquadynamic Fish Attractor"] = "Attracteur de poissons aquadynamique"

T["Warning Sound"] = "Son d'avertissement"

T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."] = "ou " .. colorYello:WrapTextInColorCode("Cliquez avec le bouton droit sur ") .. " sur le bouton visuel."

T["Open Macros"] = "Macros ouvertes"

T["Create\n  Add"] = "Créer\n  Ajouter"

T["   The " .. colorYello:WrapTextInColorCode("Update/Create Set ") .. "Button automatically adds equippable items in your "
.. colorYello:WrapTextInColorCode"Extra Items " .. "slots to your " .. colorBlu:WrapTextInColorCode("Angleur Set")
.. ", and creates one if there isn't already.\n\nIf you want to " .. colorRed:WrapTextInColorCode("remove ")
.. "previously saved slotted items, you need to click the " .. colorRed:WrapTextInColorCode("Delete ")
.. "Button to the top right, and then re-create the set - or manually change the item set.\n\nYou may also assign "
.. colorGrae:WrapTextInColorCode("- Passive Items - ") .. "to your ".. colorBlu:WrapTextInColorCode("Angleur Set ")
.. "manually, and Angleur will swap them in and out like the rest."] = "Le bouton " .. colorYello:WrapTextInColorCode("Update/Create Set ") .. "Button ajoute automatiquement des éléments équipables dans vos " .. colorYello:WrapTextInColorCode("Extra Items ") .. "slots à votre " .. colorBlu:WrapTextInColorCode("Angleur Set") .. ", et en crée un s'il n'y en a pas déjà.\n\nSi vous souhaitez " .. colorRed:WrapTextInColorCode("supprimer les éléments ") .. " précédemment enregistrés, vous devez cliquer sur le bouton " .. colorRed:WrapTextInColorCode("Supprimer ") .. " en haut à droite, puis recréer l'ensemble - ou manuellement.modifier l'ensemble d'éléments.\n\nVous pouvez également attribuer " .. colorGrae:WrapTextInColorCode(" - Objets passifs - ") .. "à votre " .. colorBlu:WrapTextInColorCode("Angleur Set ") .. "manuellement, et Angleur les échangera comme les autres."

T["Angleur unexpected error: Modifier exists, but main key doesn't. Please let the author know."] = "Erreur inattendue d'Angleur : le modificateur existe, mais pas la clé principale. Merci d'en informer l'auteur."

T["Please select a toy using Left Mouse Click"] = "Veuillez sélectionner un jouet en utilisant le clic gauche de la souris"

T["Can't drag macro in combat."] = "Impossible de faire glisser la macro en combat."

T["Bait"] = "Appât"

T["Couldn't find any bait \n in your bags, feature disabled"] = "Je n'ai trouvé aucun appât \n dans vos bagages, fonctionnalité désactivée"

T["FISHING METHOD:"] = "MÉTHODE DE PÊCHE :"

T["or "] = "ou"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a "
.. colorYello:WrapTextInColorCode("/reload") .. " to fix it."] = colorBlu:WrapTextInColorCode("Angleur : ") .. "Si vous ressentez une raideur avec le Double-Clic, faites un " .. colorYello:WrapTextInColorCode("/reload") .. " pour y remédier."

T["Organically-Sourced Wellington Bobber"] = "Wellington Bobber d'origine biologique"

T["Crate of Bobbers: Replica Gondola"] = "Caisse de Bobbers : réplique de la gondole"

T["Slotted items successfully updated for your "
.. colorYello:WrapTextInColorCode("Angleur Equipment Set.")] = "Objets à fentes mis à jour avec succès pour votre ensemble d'équipement " .. colorYello:WrapTextInColorCode("Angleur.")

T["Toggle Equipment"] = "Basculer l'équipement"

T["Bright Baubles"] = "Boules lumineuses"

T["Random Bobber"] = "Bobber aléatoire"

T["Bobber Scanner Configuration"] = "Configuration du scanner Bobber"

T[colorBlu:WrapTextInColorCode("Angleur ")
.. "will have you cast the dragged item/macro\nif all of their below listed conditions are met."] = colorBlu:WrapTextInColorCode("Angleur ") .. "vous fera lancer l'élément/la macro glissé\nsi toutes les conditions énumérées ci-dessous sont remplies."

T["Shows how far the camera will move downward from the \'Centered Position\' to start the scan. "
.. "Amount is based on your Max Zoom and chosen \'Elevation\'(Bobber Scanner Menu)"] = colorWhite:WrapTextInColorCode("Affiche ") .. colorDarkRed:WrapTextInColorCode("jusqu'où ") .. colorWhite:WrapTextInColorCode("la caméra déplacera ") .. colorDarkRed:WrapTextInColorCode("vers le bas\n") .. colorWhite:WrapTextInColorCode("à partir de l'") .. colorYello:WrapTextInColorCode("'Position centrée' ") .. colorWhite:WrapTextInColorCode("pour démarrer le scan.\nLe montant est basé sur votre ") .. colorYello:WrapTextInColorCode("Max Zoom ") .. "et\nchoisi" .. colorYello:WrapTextInColorCode("'Elevation' ") .. colorGrae:WrapTextInColorCode("(Menu du scanner Bobber)")
