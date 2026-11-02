--
-- AutoBar
-- http://www.curse-gaming.com/en/wow/addons-4430-1-autobar-toadkiller.html
--

local AceLocale = AceLibrary("AceLocale-2.1");

AceLocale:RegisterTranslation("AutoBar", "ruRU", function()
    return {
	["AUTOBAR"] = "AutoBar",
	["CONFIG_WINDOW"] = "Окно настроек",
	["SLASHCMD_LONG"] = "/autobar",
	["SLASHCMD_SHORT"] = "/atb",
	["BUTTON"] = "Кнопка",
	["EDITSLOT"] = "Изменить ячейку",
	["VIEWSLOT"] = "Просмотр ячейки",
	
	--  AutoBarConfig.lua
	["EMPTY"] = "Нет"; --AUTOBAR_CONFIG_EMPTY
	["AUTOBAR_CONFIG_SMARTSELFCAST"] = "Умное применение на себя";
	["AUTOBAR_CONFIG_REMOVECAT"] = "Удалить текущую категорию";
	["AUTOBAR_CONFIG_ROW"] = "Строки";
	["AUTOBAR_CONFIG_COLUMN"] = "Столбцы";
	["AUTOBAR_CONFIG_GAPPING"] = "Расстояние между иконками";
	["AUTOBAR_CONFIG_ALPHA"] = "Прозрачность иконки";
	["AUTOBAR_CONFIG_BUTTONWIDTH"] = "Ширина кнопок";
	["AUTOBAR_CONFIG_BUTTONHEIGHT"] = "Высота кнопок";
	["AUTOBAR_CONFIG_DOCKSHIFTX"] = "Сдвиг панели Влево/Вправо";
	["AUTOBAR_CONFIG_DOCKSHIFTY"] = "Сдвиг панели Вверх/Вниз";
	["AUTOBAR_CONFIG_WIDTHHEIGHTUNLOCKED"] = "Разблокировать высоту\nи ширину кнопок";
	["AUTOBAR_CONFIG_HIDEKEYBINDING"] = "Скрыть горячие клавиши";
	["AUTOBAR_CONFIG_HIDECOUNT"] = "Скрыть количество";
	["AUTOBAR_CONFIG_SHOWEMPTY"] = "Показать пустые кнопки";
	["AUTOBAR_CONFIG_SHOWCATEGORYICON"] = "Показывать иконки категорий";
	["AUTOBAR_CONFIG_HIDETOOLTIP"] = "Скрыть подсказки";
	["AUTOBAR_CONFIG_POPUPDIRECTION"] = "Направление\nвсплывающих\nкнопок";
	["AUTOBAR_CONFIG_POPUPDISABLE"] = "Отключить всплывающие кнопки";
	["AUTOBAR_CONFIG_POPUPONSHIFT"] = "Всплывающие кнопки по Shift";
	["AUTOBAR_CONFIG_HIDEDRAGHANDLE"] = "Скрыть кнопку перетаскивания";
	["AUTOBAR_CONFIG_PLAINBUTTONS"] = "Обычные кнопки";
	["AUTOBAR_CONFIG_NOPOPUP"] = "Без всплывающих кнопок";
	["AUTOBAR_CONFIG_ARRANGEONUSE"] = "Переставлять при использовании";
	["AUTOBAR_CONFIG_RIGHTCLICKTARGETSPET"] = "Правый клик нацеливает питомца";
	["AUTOBAR_CONFIG_DOCKTONONE"] = "Нет пристыковки";
	["AUTOBAR_CONFIG_DOCKTOGBARS"] = "Вторая полоса основной панели";
	["AUTOBAR_CONFIG_DOCKTOMAIN"] = "Главное меню";
	["AUTOBAR_CONFIG_DOCKTOCHATFRAME"] = "Окно чата";
	["AUTOBAR_CONFIG_DOCKTOCHATFRAMEMENU"] = "Меню окна чата";
	["AUTOBAR_CONFIG_DOCKTOACTIONBAR"] = "Панель действий";
	["AUTOBAR_CONFIG_DOCKTOMENUBUTTONS"] = "Меню кнопок";
	["AUTOBAR_CONFIG_ALIGN"] = "Выровнять кнопки";
    }
end);


if (GetLocale() == "ruRU") then
	
	AUTOBAR_CHAT_MESSAGE1 = "Конфигурация этого персонажа устарела. Выполняется очистка. Обновление конфигурации не производится.";
	AUTOBAR_CHAT_MESSAGE2 = "Обновление кнопки с несколькими предметами #%d, предмет #%d: использование ID вместо имени предмета.";
	AUTOBAR_CHAT_MESSAGE3 = "Обновление кнопки с одним предметом #%d: использование ID вместо имени предмета.";
	
	---------------------------------------
	--  AutoBar_Config.xml
	---------------------------------------
	AUTOBAR_CONFIG_VIEWTEXT = "Чтобы отредактировать ячейку, выберите ее в разделе редактирования ячеек \nв нижней части вкладки «Ячейки»."
	AUTOBAR_CONFIG_SLOTVIEWTEXT = "Комбинированный вид слоя (не редактируемый)"
	AUTOBAR_CONFIG_RESET = "Сброс"
	AUTOBAR_CONFIG_REVERT = "Возврат"
	AUTOBAR_CONFIG_DONE = "Готово"
	AUTOBAR_CONFIG_DETAIL_CATEGORIES = "(Зажмите Shift+левую кнопку мыши, чтобы исследовать категорию)"
	AUTOBAR_CONFIG_DRAGHANDLE = "Зажмите левую кнопку мыши для перемещения AutoBar\nЩелкните левой кнопкой мыши для Блокировки/Разблокировки\nЩелкните правой кнопкой мыши для настроек"
	AUTOBAR_CONFIG_EMPTYSLOT = "Пустая ячейка"
	AUTOBAR_CONFIG_CLEARSLOT = "Очистить ячейку"
	AUTOBAR_CONFIG_SETSHARED = "Общий профиль:"
	AUTOBAR_CONFIG_SETSHAREDTIP = "Выберите общий профиль для этого персонажа, который будет использоваться.\nИзменение общего профиля влияет на всех персонажей использующих его."
	
	AUTOBAR_CONFIG_TAB_SLOTS = "Ячейки"
	AUTOBAR_CONFIG_TAB_BAR = "Полоса"
	AUTOBAR_CONFIG_TAB_BUTTONS = "Кнопки"
	AUTOBAR_CONFIG_TAB_POPUP = "Всплывающие"
	AUTOBAR_CONFIG_TAB_PROFILE = "Профиль"
	
	AUTOBAR_TOOLTIP1 = " (Количество: "
	AUTOBAR_TOOLTIP2 = " [Пользовательский элемент]"
	AUTOBAR_TOOLTIP3 = " [Только в бою]"
	AUTOBAR_TOOLTIP4 = " [Только на поле боя]"
	AUTOBAR_TOOLTIP5 = " [Только вне боя]"
	AUTOBAR_TOOLTIP6 = " [Ограниченное использование]"
	AUTOBAR_TOOLTIP7 = " [Восстановление]"
	AUTOBAR_TOOLTIP8 = "\n(Щелкните левой кнопкой мыши, чтобы применить к оружию в правой руке\nЩелкните правой кнопкой мыши, чтобы применить к оружию в левой руке)"	
	
	
	---------------------------------------
	--  AutoBarConfig.lua
	---------------------------------------
	AUTOBAR_CONFIG_EMPTY = "Пусто";
	AUTOBAR_CONFIG_NOTFOUND = "(Не найдено: Предмет ";
	AUTOBAR_CONFIG_DOCKTO = "Пристыкован к:";
	AUTOBAR_CONFIG_SLOTEDITTEXT = " Слой (нажмите, чтобы править)";
	AUTOBAR_CONFIG_CHARACTER = "Персонаж";
	AUTOBAR_CONFIG_SHARED = "Общий";
	AUTOBAR_CONFIG_CLASS = "Класс";
	AUTOBAR_CONFIG_BASIC = "Основной";
	AUTOBAR_CONFIG_USECHARACTER = "Использовать слой персонажа";
	AUTOBAR_CONFIG_USESHARED = "Использовать общий слой";
	AUTOBAR_CONFIG_USECLASS = "Использовать классовый слой";
	AUTOBAR_CONFIG_USEBASIC = "Использовать основной слой";
	AUTOBAR_CONFIG_USECHARACTERTIP = "Предметы слоя персонажа предназначены только для этого персонажа.";
	AUTOBAR_CONFIG_USESHAREDTIP = "Предметы Общего слоя разделяются между другими персонажами, которые используют один и тот же Общий слой.\nКонкретный слой можно выбрать на вкладке «Профиль».";
	AUTOBAR_CONFIG_USECLASSTIP = "Предметы Классового слоя разделяются между всеми персонажами того же класса, который использует Классовый слой.";
	AUTOBAR_CONFIG_USEBASICTIP = "Предметы Основного слоя разделяются между всеми персонажами, использующими Основной слой.";
	AUTOBAR_CONFIG_HIDECONFIGTOOLTIPS = "Скрыть подсказки настроек";
	AUTOBAR_CONFIG_OSKIN = "Использовать oSkin";
	AUTOBAR_CONFIG_CHARACTERLAYOUT = "Макет персонажа";
	AUTOBAR_CONFIG_SHAREDLAYOUT = "Общий макет";
	AUTOBAR_CONFIG_CHARACTERLAYOUTTIP = "Изменения в видимом макете влияют только на этого персонажа.";
	AUTOBAR_CONFIG_SHAREDLAYOUTTIP = "Изменения в видимом макете влияют на всех персонажей, использующих один и тот же общий профиль.";
	AUTOBAR_CONFIG_SHARED1 = "Общий 1";
	AUTOBAR_CONFIG_SHARED2 = "Общий 2";
	AUTOBAR_CONFIG_SHARED3 = "Общий 3";
	AUTOBAR_CONFIG_SHARED4 = "Общий 4";
	AUTOBAR_CONFIG_TIPOVERRIDE = "Предметы в ячейке на этом слое перекрывают предметы в этой ячейке на нижних слоях.\n";
	AUTOBAR_CONFIG_TIPOVERRIDDEN = "Предметы в ячейке на этом слое перекрываются предметами на более высоких слоях.\n";
	AUTOBAR_CONFIG_TIPAFFECTSCHARACTER = "Изменения влияют только на этого персонажа.";
	AUTOBAR_CONFIG_TIPAFFECTSALL = "Изменения влияют на всех персонажей.";
	AUTOBAR_CONFIG_EDITCHARACTER = "Править слой персонажа";
	AUTOBAR_CONFIG_EDITSHARED = "Править общий слой";
	AUTOBAR_CONFIG_EDITCLASS = "Править классовый слой";
	AUTOBAR_CONFIG_EDITBASIC = "Править основной слой";
	AUTOBAR_CONFIG_SETUPSINGLE = "Единая настройка";
	AUTOBAR_CONFIG_SETUPSHARED = "Общая настройка";
	AUTOBAR_CONFIG_SETUPSTANDARD = "Стандартная настройка";
	AUTOBAR_CONFIG_SETUPBLANKSLATE = "Чистый лист";
	AUTOBAR_CONFIG_SETUPSINGLETIP = "Нажмите для настроек одного персонажа, аналогично классическому AutoBar.";
	AUTOBAR_CONFIG_SETUPSHAREDTIP = "Нажмите для общих настроек.\nВключая конкретного персонажа, а также общие слои.";
	AUTOBAR_CONFIG_SETUPSTANDARDTIP = "Включить редактирование и использование всех слоев.";
	AUTOBAR_CONFIG_SETUPBLANKSLATETIP = "Очистить все ячейки персонажа и общие ячейки.";
	AUTOBAR_CONFIG_RESETSINGLETIP = "Нажмите, чтобы сбросить значения по умолчанию для одного персонажа.";
	AUTOBAR_CONFIG_RESETSHAREDTIP = "Нажмите, чтобы сбросить настройки по умолчанию для общего профиля персонажа.\nКлассовые ячейки копируются на слой персонажа.\nЯчейки по умолчанию копируются на общий слой.";
	AUTOBAR_CONFIG_RESETSTANDARDTIP = "Нажмите, чтобы сбросить стандартные настройки.\nКлассовые ячейки находятся в классовом слое.\nЯчейки по умолчанию находятся в основном слое.\nОбщий слой и слой персонажа очищаются.";
	
	AUTOBAR_TOOLTIP9 = "Кнопка для нескольких категорий\n";
	AUTOBAR_TOOLTIP10 = " (Пользовательский предмет по ID)";
	AUTOBAR_TOOLTIP11 = "\n(ID предмета не опознан)";
	AUTOBAR_TOOLTIP12 = " (Пользовательский предмет по имени)";
	AUTOBAR_TOOLTIP13 = "Кнопка одной категории\n\n";
	AUTOBAR_TOOLTIP14 = "\nНе используется непосредственно.";
	AUTOBAR_TOOLTIP15 = "\nЦель оружия\n(Нажатие левой кнопкой мыши - оружие в правой руке\nНажатие правой кнопкой мыши - оружие в левой руке.)";
	AUTOBAR_TOOLTIP16 = "\nНа цель.";
	AUTOBAR_TOOLTIP17 = "\nТолько вне боя.";
	AUTOBAR_TOOLTIP18 = "\nТолько в бою.";
	AUTOBAR_TOOLTIP19 = "\nПоложение: ";
	AUTOBAR_TOOLTIP20 = "\nОграниченное использование: "
	AUTOBAR_TOOLTIP21 = "Требуется восстановление здоровья";
	AUTOBAR_TOOLTIP22 = "Требуется восстановление маны";
	AUTOBAR_TOOLTIP23 = "Кнопка одного элемента\n\n";
	
	
	---------------------------------------
	--  AutoBarItemList.lua
	---------------------------------------
	AUTOBAR_ALTERACVALLEY = "Альтеракская долина";
	AUTOBAR_WARSONGGULCH = "Ущелье Песни Войны";
	AUTOBAR_ARATHIBASIN = "Низина Арати";
	AUTOBAR_AHN_QIRAJ = "Ан'Кираж";
	AUTOBAR_BWL = "Логово Крыла Тьмы";
	
	AUTOBAR_CLASS_CUSTOM = "Пользовательские";
	AUTOBAR_CLASS_CLEAR = "Очистить эту ячейку";
	AUTOBAR_CLASS_BANDAGES = "Бинты";
	AUTOBAR_CLASS_ALTERAC_BANDAGE = "Бинты Альтерака";
	AUTOBAR_CLASS_WARSONG_BANDAGE = "Бинты Песни Войны";
	AUTOBAR_CLASS_ARATHI_BANDAGE = "Бинты Арати";
	AUTOBAR_CLASS_UNGORORESTORE = "Ун'Горо: Кристалл восстановления";
	
	AUTOBAR_CLASS_ANTIVENOM = "Противоядие";
	AUTOBAR_CLASS_AGILITYPOTIONS = "Зелья ловкости";
	AUTOBAR_CLASS_STRENGTHPOTIONS = "Зелья силы";
	AUTOBAR_CLASS_FORTITUDEPOTIONS = "Зелья стойкости";
	AUTOBAR_CLASS_INTELLECTPOTIONS = "Зелья интеллекта";
	AUTOBAR_CLASS_SPELLPOWERPOTIONS = "Зелья силы заклинаний";
	AUTOBAR_CLASS_WISDOMPOTIONS = "Зелья мудрости";
	AUTOBAR_CLASS_DEFENSEPOTIONS = "Зелья защиты";
	AUTOBAR_CLASS_TROLLBLOODPOTIONS = "Зелья тролльей крови";
	AUTOBAR_CLASS_SCROLLOFAGILITY = "Свиток ловкости";
	AUTOBAR_CLASS_SCROLLOFINTELLECT = "Свиток интеллекта";
	AUTOBAR_CLASS_SCROLLOFPROTECTION = "Свиток защиты";
	AUTOBAR_CLASS_SCROLLOFSPIRIT = "Свиток духа";
	AUTOBAR_CLASS_SCROLLOFSTAMINA = "Свиток выносливости";
	AUTOBAR_CLASS_SCROLLOFSTRENGTH = "Свиток силы";
	AUTOBAR_CLASS_BUFF_ATTACKPOWER = "Бафф силы атаки";
	AUTOBAR_CLASS_BUFF_ATTACKSPEED = "Бафф скорости атаки";
	AUTOBAR_CLASS_BUFF_DODGE = "Бафф уклонения";
	AUTOBAR_CLASS_BUFF_FROST = "Бафф сопротивления холоду";
	AUTOBAR_CLASS_BUFF_FIRE = "Бафф сопротивления огню";
	
	AUTOBAR_CLASS_HEALPOTIONS = "Зелья здоровья";
	AUTOBAR_CLASS_PVP6HEALPOTIONS = "PVP Звание 6 - Зелья здоровья";
	AUTOBAR_CLASS_HEALTHSTONE = "Камни здоровья";
	AUTOBAR_CLASS_WHIPPER_ROOT = "Кнутокорни";
	AUTOBAR_CLASS_BATTLEGROUNDHEALPOTIONS = "Зелья здоровья: Поля боя";
	AUTOBAR_CLASS_MANAPOTIONS = "Зелья маны";
	AUTOBAR_CLASS_PVP6MANAPOTIONS = "PVP Звание 6 - Зелья маны";
	AUTOBAR_CLASS_MANASTONE = "Камни маны";
	AUTOBAR_CLASS_BATTLEGROUNDMANAPOTIONS = "Зелья маны: Поля боя";
	AUTOBAR_CLASS_DREAMLESS_SLEEP = "Спокойный сон";
	AUTOBAR_CLASS_NIGHT_DRAGONS_BREATH = "Ночное дыхание дракона";
	AUTOBAR_CLASS_REJUVENATION_POTIONS = "Зелья омоложения";
	
	AUTOBAR_CLASS_BATTLESTANDARD = "Боевые штандарты";
	AUTOBAR_CLASS_BATTLESTANDARDAV = "Боевые штандарты АД";
	AUTOBAR_CLASS_DEMONIC_DARK_RUNES = "Демонические и тёмные руны";
	AUTOBAR_CLASS_TEAS = "Чай";
	AUTOBAR_CLASS_ARCANE_PROTECTION = "Защита от тайной магии";
	AUTOBAR_CLASS_FIRE_PROTECTION = "Защита от огня";
	AUTOBAR_CLASS_FROST_PROTECTION = "Защита от магии льда";
	AUTOBAR_CLASS_NATURE_PROTECTION = "Защита от сил природы";
	AUTOBAR_CLASS_SHADOW_PROTECTION = "Защита от тёмной магии";
	AUTOBAR_CLASS_SPELL_PROTECTION = "Защита от заклинаний";
	AUTOBAR_CLASS_HOLY_PROTECTION = "Защита от магии света";
	AUTOBAR_CLASS_INVULNERABILITY_POTIONS = "Зелья неуязвимости";
	AUTOBAR_CLASS_FREE_ACTION_POTION = "Зелье свободы действий";
	AUTOBAR_CLASS_ZANZA = "Занза";
	
	AUTOBAR_CLASS_HEARTHSTONE = "Камень возвращения";
	AUTOBAR_CLASS_WATER = "Вода";
	AUTOBAR_CLASS_WATER_PERCENT = "Вода: % восполнения маны";
	AUTOBAR_CLASS_WATER_CONJURED = "Вода: сотворенная магом";
	AUTOBAR_CLASS_WATER_SPIRIT = "Вода: бонус к духу";
	AUTOBAR_CLASS_RAGEPOTIONS = "Зелья ярости";
	AUTOBAR_CLASS_ENERGYPOTIONS = "Зелья энергии";
	AUTOBAR_CLASS_SWIFTNESSPOTIONS = "Зелья скорости";
	AUTOBAR_CLASS_SOULSHARDS = "Осколки души";
	AUTOBAR_CLASS_ARROWS = "Стрелы";
	AUTOBAR_CLASS_BULLETS = "Пули";
	AUTOBAR_CLASS_THROWNWEAPON = "Метательное оружие";
	AUTOBAR_CLASS_FOOD = "Еда: без бонуса";
	AUTOBAR_CLASS_FOOD_PERCENT = "Еда: % восполнения здоровья";
	AUTOBAR_CLASS_FOOD_PET_BREAD = "Еда: питомец Хлеб";
	AUTOBAR_CLASS_FOOD_PET_CHEESE = "Еда: питомец Сыр";
	AUTOBAR_CLASS_FOOD_PET_FISH = "Еда: питомец Рыба";
	AUTOBAR_CLASS_FOOD_PET_FRUIT = "Еда: питомец Фрукты";
	AUTOBAR_CLASS_FOOD_PET_FUNGUS = "Еда: питомец Грибы";
	AUTOBAR_CLASS_FOOD_PET_MEAT = "Еда: питомец Мясо";
	AUTOBAR_CLASS_FOOD_COMBO= "Еда и Вода: Комбинированный";
	AUTOBAR_CLASS_FOOD_CONJURED = "Еда: сотворенная магом";
	AUTOBAR_CLASS_DRINK_STAMINA = "Напиток: бонус к выносливости";
	AUTOBAR_CLASS_FOOD_STAMINA = "Еда: бонус к выносливости";
	AUTOBAR_CLASS_FOOD_AGILITY = "Еда: бонус к ловкости";
	AUTOBAR_CLASS_FOOD_MANAREGEN = "Еда: бонус восполнения маны";
	AUTOBAR_CLASS_FOOD_HPREGEN = "Еда: бонус восполнения здоровья";
	AUTOBAR_CLASS_FOOD_STRENGTH = "Еда: бонус к силе";
	AUTOBAR_CLASS_FOOD_INTELLIGENCE = "Еда: бонус к интеллекту";
	AUTOBAR_CLASS_FOOD_SPELLPOWER = "Еда: бонус к силе заклинаний";
	AUTOBAR_CLASS_FOOD_ARATHI = "Еда: Низина Арати";
	AUTOBAR_CLASS_FOOD_WARSONG = "Еда: Ущелье Песни Войны";
	AUTOBAR_CLASS_SHARPENINGSTONES = "Точило кузнечного дела";
	AUTOBAR_CLASS_WEIGHTSTONE = "Грузило кузнечного дела";
	AUTOBAR_CLASS_POISON_CRIPPLING = "Калечащий яд";
	AUTOBAR_CLASS_POISON_DEADLY = "Смертельный яд";
	AUTOBAR_CLASS_POISON_INSTANT = "Быстродействующий яд";
	AUTOBAR_CLASS_POISON_MINDNUMBING = "Дурманящий яд";
	AUTOBAR_CLASS_POISON_WOUND = "Нейтрализующий яд";
	AUTOBAR_CLASS_EXPLOSIVES = "Инженерная взрывчатка";
	AUTOBAR_CLASS_MOUNTS_TROLL = "Транспорт: Тролль - Ящер";
	AUTOBAR_CLASS_MOUNTS_ORC = "Транспорт: Орк - Волк";
	AUTOBAR_CLASS_MOUNTS_UNDEAD = "Транспорт: Нежить - Конь-скелет";
	AUTOBAR_CLASS_MOUNTS_TAUREN = "Транспорт: Таурен - Кодо";
	AUTOBAR_CLASS_MOUNTS_HUMAN = "Транспорт: Человек - Конь";
	AUTOBAR_CLASS_MOUNTS_NIGHTELF = "Транспорт: Ночной эльф - Тигр";
	AUTOBAR_CLASS_MOUNTS_DWARF = "Транспорт: Дворф - Баран";
	AUTOBAR_CLASS_MOUNTS_GNOME = "Транспорт: Гном - Механодолгоног";
	AUTOBAR_CLASS_MOUNTS_SPECIAL = "Транспорт: Особый";
	AUTOBAR_CLASS_MOUNTS_QIRAJI = "Транспорт: Киражи";
	AUTOBAR_CLASS_MANA_OIL = "Масло наложения чар: Восполнение маны";
	AUTOBAR_CLASS_WIZARD_OIL = "Масло наложения чар: Бонус к урону/исцелению";
	AUTOBAR_CLASS_FISHINGITEMS = "Рыболовные предметы";
	AUTOBAR_CLASS_QUESTSTARTITEMS = "Предметы, начинающие задания";
	AUTOBAR_CLASS_QUESTUSEITEMS = "Предметы, используемые в заданиях";
end
