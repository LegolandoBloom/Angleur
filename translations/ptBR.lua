-- ♡ Translation // cathtail
-- Tradutora @cathtail

if (GAME_LOCALE or GetLocale()) ~= "ptBR" then
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
T["Ultra Focus:"] = "Ultra Foco:"
T["You can drag and place this anywhere on your screen"] = "Arraste e coloque isso\n em qualquer lugar da tela."
T["FISHING METHOD:"] = "MODO DE PESCA:"
T["One Key"] = "Uma Tecla"
T["The next key you press\nwill be set as Angleur Key"] = "A próxima tecla que você apertar\nserá denominada como o atalho do Angleur"
T["Please set a keybind\nto use the One Key\nishing Method by\nusing the the\nbutton above"] = "Por favor escolha uma tecla de atalho\npara usar o Modo de Pesca\n'Uma tecla'\nusando o\nbotão acima"
T["Return\nAngleur Visual"] = "Retornar Visual\n do Angleur"
T["Double Click"] = "Clique duplo"
T["Redo Tutorial"] = "Refazer tutorial"
T["Wake!"] = "Acorde!"
T["Create\n  Add"] = "Criar\n  Adic."
T["Update"] = "Atualizar"
T["Please select a toy using Left Mouse Click"] = "Escolha um brinquedo com o Clique Esquerdo"
T["Make sure this box is checked!"] = "Marque esta opção!"
T["Located in Plater->Advanced->General Settings.\n\nOtherwise Angleur wont be able to reel fish in."] = "Plater>Avançado>Genral Settings\n\nSenão, o Angleur não irá fisgar os peixes."
T["Angleur Configuration"] = "Configuração do Angleur"
T["Having Problems?"] = "Está tendo problemas?"
T["Angleur Warning: Plater"] = "Aviso do Angleur: Plater"
T["Okay"] = "Okay"
T["  Extra  "] = "  Extra  "
T["  Tiny  "] = "  Mini  "
T["Standard"] = "Padrão"
    --Angleur.xml->Tooltips
    T["Angleur Visual Button"] = "Botão Visual do Angleur"
    T["Shows what your next key press\nwill do. Not meant to be clicked."] = "Mostra o que sua próxima tecla pressionada\nirá fazer. Não foi feito pra clicar."
    T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("Double Click\n")] = "Modo de Pesca: " .. colorBlu:WrapTextInColorCode("Clique Duplo\n")
    T["Fishing Mode: " .. colorBlu:WrapTextInColorCode("One Key")] = "Modo de Pesca: " .. colorBlu:WrapTextInColorCode("Uma Tecla")
    T["One-Key NOT SET! To set,\nopen config menu with:"] = "Modo Uma Tecla NÃO CONFIGURADO! Para fazer isso,\nabra o menu de configuração com:"
    T[" or\n"] = " ou\n"
    T["Right Click to temporarily put Angleur to sleep. zzz..."] = "Clique dir. para fazer o Angleur dormir temporariamente. Zzz..."
    T["Sleeping. Zzz...\n"] = "Dormindo. Zzz...\n"
    T["\nRight-Click"] = "\nClique Direito"
    T["\nto wake Angleur!"] = "\npara acordar o Angleur!"
    T["One-Key Fishing Mode"] = "Modo de Pesca: Uma Tecla"
    
    T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") 
    .. ", use " .. colorPurple:WrapTextInColorCode("Toys") .. ", " .. colorBlu:WrapTextInColorCode(" Items and Configured Macros ") 
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Lançar") .. ", " .. colorBlu:WrapTextInColorCode("Fisgar") 
    .. ", usar " .. colorPurple:WrapTextInColorCode("Brinquedos") .. ", " .. colorBlu:WrapTextInColorCode(" Itens e Macros configurados ") 
    .. "usando \num botão."
    
    T["Set your desired key by: "] = "Escolha a tecla que deseja: "
    T["Clicking on the button\nthat appears below\nonce this option is selected."] = "Clicando no botão\nque aparece abaixo\nassim que essa opção for selecionada."
    T["Double-Click Fishing Mode"] = "Modo de Pesca: Clique Duplo"
    T["Fish, Reel, cast Toys, Items and Macros using double mouse clicks!\n"] = "Pesque, Fisgue, use Brinquedos, Itens e Macros usando cliques duplos do mouse!\n"
    T["Select which mouse button by:"] = "Selecione qual botão do mouse:"
    T["Not every toy will work!"] = "Nem todo brinquedo vai funcionar!"
    T["Extra Toys is a feature meant to provide flexible user customization, but not every toy is" 
    .. " created the same. Targeted toys, toys that silence you, remote controlled toys etc might mess with your fishing routine."
    .. " Test them out, experiment and have fun!\n"] = "Brinquedos Extra é um recurso criado para oferecer personalização flexível ao usuário, mas nem todo brinquedo é" 
    .. " feito da mesma forma. Brinquedos direcionados, brinquedos que te silenciam, brinquedos com controle remoto, etc. talvez atrapalhem sua rotina de pesca."
    .. " Teste eles, experimente e se divirta!\n"
    T["Fun toy recommendations from mod author, Legolando:"] = "Recomendações de brinquedos divertidos, do autor, Legolando:"
    T["1) Tents such as Gnoll Tent to protect yourself from the sun as you fish."
    .. "\n2) Transformation toys such as Burning Defender's Medallion.\n3) Seating items like pillows so you can fish comfortably."
    .. "\n4) Darkmoon whistle if you want to be annoying.\nAnd other whacky combinations!"] = "1) Tendas, tipo a Tenda de Gnoll pra proteger você do sol enquanto pesca."
    .. "\n2) Brinquedos de transformação, tipo o Medalhão do Defensor em Chamas\n3) Itens para se sentar, tipo almofadas pra que você pesque confortávelmente."
    .. "\n4) Apito de Negraluna, se você quiser ser irritante.\nE outras combinações doidas!"
    T["Beta: " .. colorWhite:WrapTextInColorCode("If you are having trouble,\ntry resetting the set by clicking\nthe reset button then refreshing\nthe UI with ") 
    .. "/reload."] = "Beta: " .. colorWhite:WrapTextInColorCode("Se estiver tendo problemas,\ntente redefinir o conjunto clicando no\nbotão de redefinir e então recarregue\na interface com ") 
    .. "/reload."
    T["Reset Angleur Set"] = "Redefinir Conjunto do Angleur"
    --Cata
    T[colorWhite:WrapTextInColorCode("\nEquip a ") .. "Fishing Pole\n"] = colorWhite:WrapTextInColorCode("\nEquipe uma ") .. "Vara de Pescar\n"
    T["\nor"] = "\nou"
    T["Note for Cata:"] = "Nota para Cata:"
    T["Mouseover the bobber\nto reel consistently."] = "Passe o mouse em cima da boia\npara fisgar consistentemente."
    T["(If it lands too far, the\nsoft-interact will miss it.)"] = "(Se cair muito longe, a\ntecla de interação não vai funcionar.)"
    T["Key set to "] = "Tecla escolhida: "
    T["Fish, cast Toys, Items and Macros using double mouse clicks!\n"] = "Pesque, use Brinquedos, Itens e Macros usando cliques duplos do mouse!\n"
    --Vanilla
    T[colorBlu:WrapTextInColorCode("Cast ") .. ", " .. colorBlu:WrapTextInColorCode("Reel ") 
    .. "and " .. colorBlu:WrapTextInColorCode("use Items and Configured Macros ") 
    .. "using \none button."] = colorBlu:WrapTextInColorCode("Lançar ") .. ", "
    .. colorBlu:WrapTextInColorCode("Fisgar ") .. "e " 
    .. colorBlu:WrapTextInColorCode("use Itens e Macros Configurados ") .. "usando \num botão."

    T["Note for Classic:"] = "Nota para Classic:"
    T[colorBlu:WrapTextInColorCode("Cast ") .. "your rod and " .. colorBlu:WrapTextInColorCode("use Items/Macros ") 
    .. "using\ndouble mouse clicks!\n"] = colorBlu:WrapTextInColorCode("Lance ") .. "sua vara de pesca e "
    .. colorBlu:WrapTextInColorCode("use Itens/Macros ") .. "usando\nclique duplo do mouse!\n"

--extra.lua
T["Extra Toys"] = "Brinquedos Extra"
T["   " .. colorYello:WrapTextInColorCode("Click ") .. "any of the buttons above\nthen select a toy with left click from\nthe " 
.. colorYello:WrapTextInColorCode("Toy Box ") .. "that pops up."] = "   " .. colorYello:WrapTextInColorCode("Clique em ") .. "qualquer um dos botões\nacima então selecione um brinquedo com o clique esq. na " 
    .. colorYello:WrapTextInColorCode("Caixa de Brinquedo ") .. "que vai aparecer."

T["Extra Items / Macros"] = "Itens / Macros Extra"

T["   " .. colorYello:WrapTextInColorCode("Drag ") .. "a usable " .. colorYello:WrapTextInColorCode("Item ") .. "or a " .. 
    colorYello:WrapTextInColorCode("Macro ") .. "into any of the boxes above."] = "   " .. colorYello:WrapTextInColorCode("Arraste ") .. "um " .. colorYello:WrapTextInColorCode("Item ") .. "ou um " .. 
    colorYello:WrapTextInColorCode("Macro ") .. "em qualquer uma dessas caixas acima."

T["Set Timer"] = "Definir Timer"
T["Toggle Equipment"] = "Abrir equipamentos"
T["Toggle Bags"] = "Abrir bolsas"
T["Open Macros"] = "Abrir macros"



--standard.lua
T["Raft"] = "Barcas"
T["Couldn't find any rafts \n in toybox, feature disabled"] = "Não há Barcas em \nBrinquedos, recurso inativo."
T["Oversized Bobber"] = "Boia Gigante"
T["Couldn't find \n Oversized Bobber in \n toybox, feature disabled"] = "Não há Boias Gigantes em \nBrinquedos, recurso inativo."
T["Crate of Bobbers"] = "Flutuadores"
T["Couldn't find \n any Crate Bobbers \n in toybox, feature disabled"] = "\nNão há Flutuadores em \n Brinquedos, recurso desativado"
T["Crate Bobbers"] = "Flutuadores"
T["Ultra Focus:"] = "Ultra Foco:"
T["Audio"] = "Áudio"
T["Temp. Auto Loot "] = "Auto Saque Temp. "
T["If checked, Angleur will temporarily turn on " .. colorYello:WrapTextInColorCode("Auto-Loot") 
.. ", then turn it back off after you reel.\n\n" .. colorGrae:WrapTextInColorCode("If you have ")
.. colorYello:WrapTextInColorCode("Auto-Loot ")
.. colorGrae:WrapTextInColorCode("enabled anyway, this feature will be disabled automatically.")] = "Se selecionado, Angleur irá ativar temporariamente " 
.. colorYello:WrapTextInColorCode("Saque Automático") .. ", e então desativará após fisgar um peixe.\n\n" 
.. colorGrae:WrapTextInColorCode("Se você tiver ") .. colorYello:WrapTextInColorCode("Saque Automático ")
.. colorGrae:WrapTextInColorCode("habilitado de qualquer forma, esse recurso é desativado automaticamente.")
T["(Already on)"] = "(Ativado)"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "If you experience stiffness with the Double-Click, do a " 
.. colorYello:WrapTextInColorCode("/reload") .. " to fix it."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Se o clique duplo parecer meio travado dê um " .. colorYello:WrapTextInColorCode("/reload") .. " pra arrumar."
T["Rafts"] = "Barcas"
T["Random Bobber"] = "Boia Aleatória"
T["Preferred Mouse Button"] = "Botão preferido do mouse"
T["Right Click"] = "Clique direito"


--tabs-general.lua
T[colorBlu:WrapTextInColorCode("Angleur visual ") .. "is now hidden."] = colorBlu:WrapTextInColorCode("Visual do Angleur ") .. "agora está escondido."
T["You can re-enable it from the"] = "Você pode reabilitá-lo no"
T[colorYello:WrapTextInColorCode("Config Menu ") .. "accessed by: " 
.. colorYello:WrapTextInColorCode("/angleur ") .. " or  " 
.. colorYello:WrapTextInColorCode("/angang")] = colorYello:WrapTextInColorCode("Menu de Configuração ") 
.. "acessado com: " .. colorYello:WrapTextInColorCode("/angleur ") 
.. " ou  " .. colorYello:WrapTextInColorCode("/angang")



--tiny.lua
T["Disable Soft Interact"] = "Desativar Tecla \nde Interação"

T["If checked, Angleur will disable " .. colorYello:WrapTextInColorCode("Soft Interact ") .. "after you stop fishing.\n\n" 
.. colorGrae:WrapTextInColorCode("Intended for people who want to keep Soft Interact disabled during normal play.")] = "Se marcado, Angleur desabilitará " 
.. colorYello:WrapTextInColorCode("Ícone de Tecla de Interação ") .. "depois que você terminar de pescar.\n\n" 
.. colorGrae:WrapTextInColorCode("Feito para pessoas que querem manter o Tecla de Interação desabilitado durante a jogatina comum.")

T["Can't change in combat."] = "Não dá pra mudar em combate."

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now turn off " 
.. colorYello:WrapTextInColorCode("Soft Interact ") .. "when you aren't fishing."] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "agora desabilitará " .. colorYello:WrapTextInColorCode("Tecla de Interação ") .. "quando você não estiver pescando."

T["Dismount With Key"] = "Desmonte com atalho"

T["If checked, Angleur will make you " .. colorYello:WrapTextInColorCode("dismount ") 
.. "when you use OneKey/DoubleClick.\n\n" 
.. colorGrae:WrapTextInColorCode("Your key will no longer be released upon mounting.")] = "Se marcado, Angleur irá fazer você " 
.. colorYello:WrapTextInColorCode("desmontar ") .. "quando você usar o UmaTecla/CliqueDuplo.\n\n" 
.. colorGrae:WrapTextInColorCode("Seu atalho não será mais liberado ao montar.")

T[colorBlu:WrapTextInColorCode("Angleur ") .. "will now " 
.. colorYello:WrapTextInColorCode("dismount ") .. "you"] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "agora vai " .. colorYello:WrapTextInColorCode("desmontar ") .. "você."

T["Disable Soft Icon"] = "Desativar Ícone\nde Interação"

T["Whether the Hook icon above the bobber is shown.\nNote, this affects icons for other soft target objects."] = "Se o ícone de gancho acima da boia será exibido.\nVeja, isso afetará todos os outros ícones de interação."

T["Soft target icon for game objects disabled."] = "Ícone de Interação para objetos no jogo desativado."
T["Soft target icon for game objects re-enabled."] = "Ícone de Interação para objetos no jogo reativado."
T["Double Click Window"] = "Janela do Clique Duplo"
T["Visual Size"] = "Tamanho do Visual"
T["Master Volume(Ultra Focus)"] = "Volume Mestre (Ultra Foco)"
T["Login Messages"] = "Mensagens de Login"
T["Debug Mode"] = "Modo Debug"
T["Defaults"] = "Padrão"


--firstInstall
T["Angleur Warning"] = "Aviso do Angleur"
T["Are you sure you want to abandon the tutorial?"] = "Tem certeza que quer abandonar o tutorial?"
T["(You can redo it later by clicking the Redo Button\nin the Tiny Panel)"] = "(Você pode refazê-lo depois\nclicando no botão Refazer Tutorial na aba Mini)"
T["Yes"] = "Sim"
T["No"] = "Não"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ")
.. "detected."] = colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Plater ") .. "detectado."

T["Plater " .. colorYello:WrapTextInColorCode("-> ") .. "Advanced " .. colorYello:WrapTextInColorCode("-> ") .. "General Settings" 
.. colorYello:WrapTextInColorCode(":") .. " Show soft-interact on game objects*"] = "Plater " .. colorYello:WrapTextInColorCode("-> ") 
.. "Avançado " .. colorYello:WrapTextInColorCode("-> ") .. "General Settings" .. colorYello:WrapTextInColorCode(":") .. " 'Show soft-interact on game objects*'"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to function properly."] = "Deve estar " .. colorGreen:WrapTextInColorCode("MARCADO ") .. "para que o Angleur funcione corretamente."

T[colorYello:WrapTextInColorCode("To Get Started:\n\n") .. "Choose your desired\n"
.. colorBlu:WrapTextInColorCode("Fishing Method") .. " by\nclicking one of these buttons.\n\n"] = colorYello:WrapTextInColorCode("Vamos começar:\n\n") 
.. "Escolha o seu " .. colorBlu:WrapTextInColorCode("Modo de Pesca") .. " clicando em um destes botões.\n\n"

T[colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Visual:\n\n") .. "Shows what your next input will do.\n" 
.. "Drag and place it anywhere you might like.\n\n" .. "You can also hide it by clicking its close button."] = colorBlu:WrapTextInColorCode("Visual ") 
.. colorYello:WrapTextInColorCode("do Angleur:\n\n") .. "Mostra o que sua próxima tecla pressionada irá fazer." 
.. " Arraste e coloque onde quiser.\n\n" .. "Você pode escondê-lo clicando no X."

T["Angleur works on a " .. colorYello:WrapTextInColorCode("Sleep/Wake ") .. "system, so you don't have to reload your UI after you're done fishing.\n\n"
.. colorBlu:WrapTextInColorCode("Right Click ")
.. "to put Angleur to sleep, and wake it up if it is. You can also Right Click the minimap button."] = "Angleur com um sistema de " 
.. colorYello:WrapTextInColorCode("Dormir/Acordar ") .. "para que você não tenha que recarregar sua interface quando acabar de pescar.\n\n"
.. colorBlu:WrapTextInColorCode("Clique Direito ") .. "para por o Angleur pra dormir, e para acordá-lo também. Você também pode clicar com o botão direito no botão do minimapa."

T["You can enable\n\nRafts,\n\nBobbers,\n\nand Ultra Focus(Audio/Temporary Auto Loot)\n\nby checking these boxes."] = "Você pode habilitar\n\nBarcas,\n\nBoias,\n\ne o Ultra Foco(Áudio/Auto Saque Temporário)\n\nmarcando estas caixas."

T["Now, let's move to the " .. colorYello:WrapTextInColorCode("Extra ") .. "Tab. Click here."] = "Agora, vamos para a aba " 
.. colorYello:WrapTextInColorCode("Extra") .. ". Clique aqui."

T[colorPurple:WrapTextInColorCode("Extra Toys\n\n")  .. "You can select a toy from the " .. colorYello:WrapTextInColorCode("Toy Box ") 
.. "to add it to your Angleur rotation.\n\n Click on an empty slot to open toy selection, or click next to move on.\n\n"
.. "Note: Not every toy will work, some silence you so you can't fish etc. Experiment around!"] = colorPurple:WrapTextInColorCode("Brinquedos Extra\n\n")  
.. "Você pode selecionar um brinquedo da " .. colorYello:WrapTextInColorCode("Caixa de Brinquedo ") 
.. "para adicioná-lo na sua Rotação do Angleur.\n\nClique num espaço vazio para abrir a seleção de brinquedos, ou clique em próx. para continuarmos.\n\n"
.. "Nota: Nem todo brinquedo irá funcionar, alguns te silenciam então você não consegue pescar, etc. Experimenta aí!"

T[colorBrown:WrapTextInColorCode("Extra Items/Macros\n\n")  .. "You can " .. colorYello:WrapTextInColorCode("Drag ") 
.. "items or macros here to add them to your Angleur rotation.\n\n" .. "These can be fishing hats, throwable fish, spells...\n\n" 
.. "You can even set custom timers for them by clicking the " .. colorYello:WrapTextInColorCode("stopwatch ") 
.. "icon that appears once you slot an item/macro.\n\nClick " 
.. colorYello:WrapTextInColorCode("Okay ") .. "to move on."] = colorBrown:WrapTextInColorCode("Itens / Macros Extra\n\n")  
.. "Você pode " .. colorYello:WrapTextInColorCode("Arrastar ") .. "itens ou macros aqui para adicioná-lo na sua rotação do Angleur.\n\n" 
.. "Estes podem ser chapéus de pesca, peixes arremessáveis, feitiços...\n\n" .. "Você pode até configurar timers personalizados clicando no ícone de "
.. colorYello:WrapTextInColorCode("relógio ") .. "que aparece quando você coloca um item/macro aqui.\n\nClique "
.. colorYello:WrapTextInColorCode("Ok ") .. "para prosseguirmos."

T["Click here if you need an example & explanation of use of macros for Angleur!"] = "Clique aqui se você precisar de um exemplo & explicação sobre o uso de macros no Angleur!"

T["And lastly, the " .. colorYello:WrapTextInColorCode("Create & Add ") .. "button Creates an item set for you and automatically adds your " 
.. "slotted items to it.\n\nNow, Angleur will automatically equip your slotted items when you " 
.. colorYello:WrapTextInColorCode("wake ") .."it up, and restore previous items when you put it back to " 
.. colorYello:WrapTextInColorCode("sleep.")] = "E por fim, o botão " .. colorYello:WrapTextInColorCode("Criar & Adic. ") 
.. "cria um Conjunto de Itens pra você e adiciona automaticamente seus " 
.. "itens escolhidos aqui à ele.\n\nAgora, Angleur equipará automaticamente seus itens selecionados quando você " 
.. colorYello:WrapTextInColorCode("acordar ") .."o addon, e restaurar seus itens anteriores quando botar o Angleur pra " 
.. colorYello:WrapTextInColorCode("dormir.")

--thanks
T["You can support the project\nby donating on " .. colorYello:WrapTextInColorCode("Ko-Fi ")
.. "or " .. colorYello:WrapTextInColorCode("Patreon!")] = "Mostre seu apoio\ndoando no " 
.. colorYello:WrapTextInColorCode("Ko-Fi ") .. "ou no " .. colorYello:WrapTextInColorCode("Patreon!")

T["THANK YOU!"] = "MUITO OBRIGADO!"


--advancedAngling
T["HOW?"] = "COMO?"
T["Advanced Angling"] = "Angleur Avançado"

T[colorBlu:WrapTextInColorCode("Angleur ") 
.. "will have you cast the dragged item/macro\nif all of their below listed conditions are met."] = colorBlu:WrapTextInColorCode("Angleur ") 
.. "vai fazer você usar o item/macro selecionado\nse todas as condições abaixo forem atendidas."

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
.. "_____________________________________________"] = colorYello:WrapTextInColorCode("Itens:\n") .. 
"- Qualquer item utilizável das suas bolsas ou equipamento de personagem. " .. "\n\n Sempre que:\n\n   1) Estiver fora de "
.. colorYello:WrapTextInColorCode("recarga.\n") .. "   2) A " .. colorYello:WrapTextInColorCode("Aura estiver inativa") 
.. " (se houver uma).\n" .. colorYello:WrapTextInColorCode("\nMacros:\n") 
.. "- Qualquer macro válido que contenha um feitiço ou um item utilizável - /cast or /use. " 
.. "\n\n Sempre que:\n\n   1) As ".. colorYello:WrapTextInColorCode("Condições do Macro ") 
.. "forem atendidas\n" .. "   2) O Item/Feitiço estiver fora de " .. colorYello:WrapTextInColorCode("recarga.\n")
.. "                    e sua\n   3) " .. colorYello:WrapTextInColorCode("Aura estiver inativa") 
.. " (se houver uma).\n\n" .. colorYello:WrapTextInColorCode("IMPORTANTE: ") 
.. "Se você estiver usando condicionais de macro, eles precisam estar ATIVOS quando arrastá-los pro espaço vazio.\n" 
.. "_____________________________________________"

T["Spell/Item has no Cooldown/Aura?\n" 
.. "Click " .. colorYello:WrapTextInColorCode("the Stopwatch ") .. "to set a manual timer.\n" 
.. colorYello:WrapTextInColorCode("                                                 (minutes:seconds)")] = "Item/Feitiço não tem recarga/aura?\n" 
.. "Clique no " .. colorYello:WrapTextInColorCode("Ícone de Relógio ") .. "pra definir um timer\nmanualmente.\n" 
.. colorYello:WrapTextInColorCode("                                                 (minutos:segundos)")



T["Angleur Warning"] = "Aviso do Angleur"
T["This will restart the tutorial, are you sure?"] = "Isso vai recomeçar o tutorial, tem certeza?"
T["First install tutorial restarting."] = "Recomeçando o tutorial de primeira instalação."
T["/angsleep"] = "/angsleep"
T["/angleur"] = "/angleur"
T["/angang"] = "/angang"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "cannot open " 
.. colorYello:WrapTextInColorCode("Config Panel ") .. "in combat."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "não pode abrir " .. colorYello:WrapTextInColorCode("Painel de Configuração ") .. "em combate."

T["Please try again after combat ends."] = "Por favor, tente novamente quando o combate acabar."
T["login messages disabled"] = "mensagens de login desativadas"
T["login messages re-enabled"] = "mensagens de login reativadas"
T["debug mode active"] = "modo debug ativado"
T["debug mode deactivated"] = "modo debug desativado"
T["Can't change in combat."] =  "Não dá pra mudar isso em combate."


--minimap
T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Awake."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Acordado."
T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Dormindo."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Minimap Icon hidden, " 
.. colorYello:WrapTextInColorCode("/angmini ") .. "to show."] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Ícone do minimapa escondido, " 
.. colorYello:WrapTextInColorCode("/angmini ") .. "para voltar a mostrá-lo."

T["Left Click: " .. colorYello:WrapTextInColorCode("Config Panel")] = "Clique Esquerdo: " .. colorYello:WrapTextInColorCode("Painel de Config.")
T["Right Click: " .. colorYello:WrapTextInColorCode("Sleep/Wake")] = "Clique Direito " .. colorYello:WrapTextInColorCode("Dormir/Acordar")
T["Middle Button: " .. colorYello:WrapTextInColorCode("Hide Minimap Icon")] = "Botão do Meio: " .. colorYello:WrapTextInColorCode("Esconder ícone do minimapa")

T["/angmini"] = "/angmini"

T["Can't change sleep state in combat."] = "Não é possível mudar o estado de sono em combate."

--onekey
T["The next key you press\nwill be set as Angleur Key"] = "A próxima tecla que\napertar será a sua\ntecla do Angleur."
T["OneKey set to: "] = "UmaTecla definida como: "

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Modifier Keys ") 
.. "won't be recognized when the game is in the " .. colorGrae:WrapTextInColorCode("background. ") 
.. "If you are using the scroll wheel for that purpose. Just bind the wheel alone instead, without modifiers."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. colorYello:WrapTextInColorCode("Teclas modificadoras ") .. "não serão reconhecidas quando o jogo estiver rodando de " .. colorGrae:WrapTextInColorCode("fundo. ") 
.. "Se você estiver usando o scroll com esse propósito, apenas use o scroll sozinho, sem modificadores."

T["Modifier key "] = "Modificador "
T["down,\nawaiting additional key press."] = "pressionado, \nesperando a tecla restante."
T[", with modifier "] = ", com modificador "
T["OneKey removed"] = "UmaTecla removido."


--eqMan
T["Can't create Equipment Set without any equippable slotted items. Slot a usable and equippable item to your Extra Items slots first."] = "Não é possível criar um Conjunto de Equipamentos sem nenhum item equipável selecionado. Selecione um item usável e equipável na seção Itens Extra primeiro."
T["This is a limitation of Classic(not the case for Cata and Retail), since it lacks a proper built-in Equipment Manager, allowing you to slot passive items to your Angleur Set."] = "Isso é uma limitação do Classic(não é o caso do Retail e Cata), já que não há um Gerenciador de Equipamentos próprio, permitindo que você selecione itens passivos no seu Conjunto do Angleur."
T["Created equipment set for " .. colorBlu:WrapTextInColorCode("Angleur" ) .. ". ID is : "] = "Criou um conjunto de equipamentos pro " .. colorBlu:WrapTextInColorCode("Angleur" ) .. ". O ID é: "
T["All unslotted items in the set have been set to <ignore slot>."] = "Todos os itens não selecionados no conjunto foram definidos como <ignorados>."

T["For passive items you'd like to add to your fishing gear, you can use the game's " 
.. colorYello:WrapTextInColorCode("Equipment Manager ") .. "to add them to the " 
.. colorBlu:WrapTextInColorCode("Angleur ") .. "set"] = "Para itens passivos que você gostaria de adicionar no seu equipamento de pesca, você pode usar o " 
.. colorYello:WrapTextInColorCode("Gerenciador de Equipamentos ") .. "do jogo para adicioná-los no " 
.. colorBlu:WrapTextInColorCode("Conjunto do Angleur ") .. "."

T["Couldn't equip slotted item in time before combat"] = "Não foi possível equipar o item selecionado antes do combate começar"

T["Slotted items successfully updated for your " 
.. colorYello:WrapTextInColorCode("Angleur Equipment Set.")] = "Itens selecionados atualizados com sucesso no seu " 
.. colorYello:WrapTextInColorCode("Conjunto de Itens do Angleur.")

T["   The " .. colorYello:WrapTextInColorCode("Update/Create Set ") .. "Button automatically adds equippable items in your " 
.. colorYello:WrapTextInColorCode"Extra Items " .. "slots to your " .. colorBlu:WrapTextInColorCode("Angleur Set") 
.. ", and creates one if there isn't already.\n\nIf you want to " .. colorRed:WrapTextInColorCode("remove ") 
.. "previously saved slotted items, you need to click the " .. colorRed:WrapTextInColorCode("Delete ") 
.. "Button to the top right, and then re-create the set - or manually change the item set.\n\nYou may also assign " 
.. colorGrae:WrapTextInColorCode("- Passive Items - ") .. "to your ".. colorBlu:WrapTextInColorCode("Angleur Set ") 
.. "manually, and Angleur will swap them in and out like the rest."] = "   O botão " .. colorYello:WrapTextInColorCode("Atualizar/Criar Conjunto ") 
.. "adiciona automaticamente itens equipáveis da seção " .. colorYello:WrapTextInColorCode"Items Extra " 
.. "no seu " .. colorBlu:WrapTextInColorCode("Conjunto do Angleur") .. ", e o cria, se não houver um.\n\nSe deseja " 
.. colorRed:WrapTextInColorCode("remover ") .. "itens selecionados anteriormente, você precisa clicar no botão de " 
.. colorRed:WrapTextInColorCode("Deletar ") .. "no canto superior direito, e então recriar o conjunto - ou mudar manualmente o conjunto de itens.\n\nVocê também pode designar " 
.. colorGrae:WrapTextInColorCode("- Itens Passivos - ") .. "no seu ".. colorBlu:WrapTextInColorCode("Conjunto do Angleur ") 
.. "manualmente, e o Angleur vai trocá-los como o resto."

T["ITEM NOT FOUND IN BAGS. TO USE FOR EQUIPMENT SWAP, EITHER ADD IT MANUALLY TO ANGLEUR SET OR RE-DRAG THE MACRO."] = "ITEM NÃO ENCONTRADO NAS BOLSAS. PARA USAR A TROCA DE EQUIPAMENTOS, ADICIONE MANUALMENTE AO CONJUNTO DO ANGLEUR OU ARRASTE O MACRO NOVAMENTE."
T["Equipping of the Angleur set disrupted due to sudden combat"] = "Equipamento do Conjunto do Angleur interrompido devido a combate repentino."


--items
T["Unslotted " .. colorBlu:WrapTextInColorCode("Angleur ") .. colorYello:WrapTextInColorCode("Equipment Set ") 
.. " item. Remove it from the Angleur set in the equipment manager if you don't want Angleur to keep equipping it."] = "Item do " 
.. colorBlu:WrapTextInColorCode("Conjunto de Equipamento ") .. colorYello:WrapTextInColorCode("do Angleur ") 
.. " não selecionado. Remova-o do Conjunto de Itens do Angleur no Gerenciador de Equipamento se você não quer que o Angleur fique equipando ele."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Fishing Hat") 
.. " detected."] = colorBlu:WrapTextInColorCode("Angleur: ") .. colorYello:WrapTextInColorCode("Chapéu de Pesca") .. " detectado."

T["For it to work properly, please make sure to add it as a macro like so: "] = "Para que funcione corretamente, tenha certeza que adicionou um macro tipo: "

T["Otherwise, you will have to manually target your fishing rod every time."
.. "If you want to see an example of how to slot macros, click the " 
..  colorRed:WrapTextInColorCode("[HOW?] ") .. "button on the " 
.. colorYello:WrapTextInColorCode("Extra Tab")] = "Senão, você vai ter que clicar manualmente na sua vara de pesca toda vez."
.. "Se quiser um exemplo de como selecionar macros, clique no botão " 
..  colorRed:WrapTextInColorCode("[COMO?] ") .. "na " 
.. colorYello:WrapTextInColorCode("Aba Extra")

T["Can't drag item in combat."] = "Não dá pra arrastar itens em combate."
T["Please select a usable item."] = "Por favor, selecione um item utilizável."
T["This item does not have a castable spell."] = "Esse item não tem um feitiço lançável."
T["Can't drag macro in combat."] = "Não dá pra arrastar macros em combate."
T["link of macro spell: "] = "link de feitiço de macro: "
T["link of macro item: "] = "link de item de macro: "

T[colorYello:WrapTextInColorCode("Can't use Macro: ") 
.. "The item used in this macro doesn't have a trackable spell/aura."] = colorYello:WrapTextInColorCode("Não dá pra usar esse macro: ") 
.. "O item usando nesse macro não tem um feitiço/aura rastreável."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Failed to get macro spell/item. If you are using " 
.. colorYello:WrapTextInColorCode("macro conditions \n") 
.. "you need to drag the macro into the button frame when the conditions are met."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Não foi possível achar o macro/item. Se estiver usando " .. colorYello:WrapTextInColorCode("condições de macro \n") 
.. "precisará arrastar o macro no quadro de botões quando as condições forem atendidas."

T["Failed to get macro index"] = "Falha ao obter índice do macro"

T["Macro empty"] = "Macro vazio"

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Macro successfully slotted. If you make changes to it, you need to " 
.. colorYello:WrapTextInColorCode("re-drag ") 
.. "the new version to the slot. You can also delete the macro to save space, Angleur will remember it."] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Macro selecionado com sucesso. Se você fizer alguma alteração, precisará " .. colorYello:WrapTextInColorCode("arrastar de novo ") 
.. "a nova versão no lugar. Você pode deletar o macro para salvar espaço, Angleur vai se lembrar disso."

T["Timer set to: "] = "Timer definido para: "
T[" minutes, "] = " minutos, "
T[" seconds"] = " segundos"


--tiny_mists
T["Default tiny settings restored"] = "Configurações padrão da aba mini restauradas."


--Angleur
T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Thank you for using Angleur!"] = colorBlu:WrapTextInColorCode("Angleur: ") .. "Obrigado por usar o Angleur!"
T["or "] = "ou "
T["To access the configuration menu, type "] = "Para acessar o menu de configuração, digite "

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Sleeping. To continue using, type " 
.. colorYello:WrapTextInColorCode("/angsleep ") .. "again,"] = colorBlu:WrapTextInColorCode("Angleur: ")
.. "Dormindo. Para continuar utilizando, digite " .. colorYello:WrapTextInColorCode("/angsleep ") .. "de novo,"

T["or " .. colorYello:WrapTextInColorCode("Right-Click ") .. "the Visual Button."] = "ou "
.. colorYello:WrapTextInColorCode("Clique Direito ") .. "no Botão Visual."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "Is awake. To temporarily disable, type " 
.. colorYello:WrapTextInColorCode("/angsleep ")] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Está acordado. Para desativá-lo temporariamente digite " .. colorYello:WrapTextInColorCode("/angsleep ")

T["Angleur unexpected error: Modifier exists, but main key doesn't. Please let the author know."] = "Erro inesperado do Angleur: Modificador existe, mas a tecla principal não. Por favor, avise o desenvolvedor."

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur's keybind to " 
.. colorYello:WrapTextInColorCode("Reel/Loot ") .. "your catches."] = "Tem que estar " 
.. colorGreen:WrapTextInColorCode("MARCADO ") .. "par que o atalho do Angleur " 
.. colorYello:WrapTextInColorCode("Fisgue/Saqueie ") .. "seus peixes."

T[colorBlu:WrapTextInColorCode("Angleur: ") .. "You are running an addon that interferes with" 
.. colorYello:WrapTextInColorCode("Soft-Interact.")] = colorBlu:WrapTextInColorCode("Angleur: ") 
.. "Você está usando um addon que interfere com a " .. colorYello:WrapTextInColorCode("Tecla de Interação.")

T["Angleur Config Panel " .. colorYello:WrapTextInColorCode("-> ") .. "Tiny tab(tab 3) "
.. colorYello:WrapTextInColorCode("-> ") .. "Disable Soft-Interact"] = "Painel de Config. do Angleur " 
.. colorYello:WrapTextInColorCode("-> ") .. "Aba Mini(Aba 3) "
.. colorYello:WrapTextInColorCode("-> ") .. "Desativar Tecla de Interação"

T["Must be " .. colorGreen:WrapTextInColorCode("checked ON ") .. "for Angleur to reel properly."] = "Tem que estar " 
.. colorGreen:WrapTextInColorCode("MARCADO ") .. "para que o Angleur fisgue peixes corretamente."




T["Nat's Hat"] = "Chapéu de Nat"
T["Nat's Drinking Hat"] = "Chapéu do Goró do Nat"
T["Weather-Beaten Fishing Hat"] = "Chapéu de Pescaria Gasto"


T["please choose the toy with left click so that angleur can function properly"] = "por favor escolha um brinquedo com o clique esq. do mouse para que o angleur funcione corretamente."
T["you do not own this toy. please select another"] = "você não tem esse brinquedo. por favor, escolha outro."
T["Selected extra toy: "] = "Brinquedo extra selecionado: "
T["Toy selection deactivated"] = "Seleção de brinquedos desativada."

--Cata extra lines
T["Bait"] = "Isca"
T["Couldn't find any bait \n in your bags, feature disabled"] = "Não há iscas \n nas suas bolsas, recurso inativo."



--Eq set bug fixes
T["Swapback item not found in bags, cannot re-equip."] = "Não foi possível re-equipar seus itens, um item não foi encontrado nas bolsas."
T["A bug with the Angleur Set has occurred, where it is set to unequip all gear. " 
.. "Therefore, it has been deleted. If this keeps happening, please contact the Author."] = "Ocorreu um bug com o Set do Angleur, que desequipa todos os equipamentos. " 
.. "Portanto, ele foi deletado. Se isso continuar acontecendo, por favor contate o desenvolvedor."


T["Tuskarr Dinghy"] = "Bote Morsano"
T["Anglers Fishing Raft"] = "Canoa dos Pescadores"
T["Gnarlwood Waveboard"] = "Prancha de Nodoso"
T["Personal Fishing Barge"] = "Barcaça de Pesca Pessoal"

T["Crate of Bobbers: Can of Worms"] = "Caixote de Flutuadores: Lata de Minhocas"
T["Crate of Bobbers: Carved Wooden Helm"] = "Caixote de Flutuadores: Elmo de Madeira Entalhado"
T["Crate of Bobbers: Cat Head"] = "Caixote de Flutuadores: Cabeça de Gato"
T["Crate of Bobbers: Demon Noggin"] = "Caixote de Flutuadores: Cocuruto de Demônio"
T["Crate of Bobbers: Enchanted Bobber"] = "Caixote de Flutuadores: Isca Encantada"
T["Crate of Bobbers: Face of the Forest"] = "Caixote de Flutuadores: Face da Floresta"
T["Crate of Bobbers: Floating Totem"] = "Caixote de Flutuadores: Totem Flutuante"
T["Crate of Bobbers: Murloc Head"] = "Caixote de Flutuadores: Cabeça de Murloc"
T["Crate of Bobbers: Replica Gondola"] = "Caixote de Flutuadores: Réplica de Gôndola"
T["Crate of Bobbers: Squeaky Duck"] = "Caixote de Flutuadores: Patinho de Borracha"
T["Crate of Bobbers: Tugboat"] = "Caixote de Flutuadores: Rebocador"
T["Crate of Bobbers: Wooden Pepe"] = "Caixote de Flutuadores: Pepe de Madeira"
T["Bat Visage Bobber"] = "Isca com Aparência de Morcego"
T["Limited Edition Rocket Bobber"] = "Flutuador de Foguete - Edição Limitada"
T["Artisan Beverage Goblet Bobber"] = "Flutuador de Cálice de Bebida Artesanal"
T["Organically-Sourced Wellington Bobber"] = "Flutuador de Beef Wellington de Origem Orgânica"

T["Shiny Bauble"] = "Miçanga Brilhosa"
T["Nightcrawlers"] = "Reptantes"
T["Bright Baubles"] = "Iscas Brilhantes"
T["Flesh Eating Worm"] = "Verme Come-carne"
T["Aquadynamic Fish Attractor"] = "Pega-peixes Aquadinâmico"
T["Feathered Lure"] = "Isca de Penas"
T["Sharpened Fish Hook"] = "Anzol Afiado"
T["Glow Worm"] = "Minhoca Luminosa"
T["Heat-Treated Spinning Lure"] = "Isca Giratória Temperada"



-- Other addon promotion
T["My Other Addons!"] = "Meus outros addons!"
T["Automatic Aquatic Form for ALL CLASSES, ALL THE TIME!\n\nEquip Underlight_Angler when swimming, re-equip your \'Main\' Fishing Rod when not."] = "Forma aquática automática PARA TODAS AS CLASSES! O TEMPO TODO!\n\n"
.. "Equipe " .. colorUnderlight:WrapTextInColorCode("Pescador Telúmino ") .. "enquanto nadar, re-equipe sua Vara de Pesca \'Principal\' quando sair da água."
T["Pickpocket overhaul for Rogues!\n\nSingle player RPG-like Pickpocket Prompt System with dynamic keybind(released back when not pick pocketing)."] = "Melhorias para Ladinos ao Bater Carteira!\n\nSistema de Bater Carteira estilo RPG para um jogador, com prompts e atalhos dinâmicos (Desativa quando não estiver batendo carteira)."
T["Two-Way Transformations to Worgens when you cast abilities or use items!\n\nFeatures a built-in drag&drop Macro Maker."] = "Transforme-se em Worgen ou Humano ao usar habilidades ou itens!\n\n" .. colorYello:WrapTextInColorCode("Criador de macros ") .. "com recurso integrado de arrastar & soltar."


-- Major rework to eqMan
T["The following slotted items could not be added to your Angleur Equipment Set:"] = "Os itens selecionados a seguir não puderam ser adicionados ao seu " .. colorYello:WrapTextInColorCode("Conjunto de itens do Angleur ") .. ":"


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