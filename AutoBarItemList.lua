--
-- AutoBar
-- Item List Database
--
-- Maintained by Azethoth / Toadkiller of Proudmoore.  Original author Saien of Hyjal
-- http://www.curse-gaming.com/en/wow/addons-4430-1-autobar-toadkiller.html
--

AutoBarItemList = {};

local L = AceLibrary("AceLocale-2.1"):GetInstance("AutoBar", true);
local PT = PeriodicTableEmbed:GetInstance("1");


-- Get set as a simple array of itemIds
function AutoBarItemList:GetSetItemsArray(set)
	local cacheSet = PT:GetSetTable(set);
	local retval = {};
	local index = 1;
	for i, val in pairs(cacheSet) do
		retval[index] = i;
		index = index + 1;
	end

	return retval
end


function AutoBarItemList:OnInitialize()
	-- Ok, step 1 is to start getting the raw data from PeriodicTableEmbed.  Later we can use more of its functions.
	AutoBar_Category_Info["FOOD_PERCENT"]["items"] = self:GetSetItemsArray("foodperc");
	AutoBar_Category_Info["WATER_PERCENT"]["items"] = self:GetSetItemsArray("waterperc");
end
-- /script DEFAULT_CHAT_FRAME:AddMessage(tostring(AutoBar_Category_Info["FOOD_PERCENT"]["items"][3]))


AutoBar_Category_Info = { -- global
	["CUSTOM"] = {
		["description"] = AUTOBAR_CLASS_CUSTOM;
		["texture"] = "INV_Misc_Bandage_12",
		["custom"] = true;
		["items"] = { 19307 },
	},
	["AAACLEAR"] = {
		["description"] = AUTOBAR_CLASS_CLEAR;
		["texture"] = "INV_Misc_Fork&Knife";
		["items"] = {},
	},
	["BANDAGES"] = {
		["description"] = AUTOBAR_CLASS_BANDAGES;
		["texture"] = "INV_Misc_Bandage_12";
		["targetted"] = true;
		["smarttarget"] = true;
	},
	["ALTERAC_BANDAGES"] = {
		["description"] = AUTOBAR_CLASS_ALTERAC_BANDAGE;
		["texture"] = "INV_Misc_Bandage_12";
		["targetted"] = true;
		["location"] = AUTOBAR_ALTERACVALLEY;
		["smarttarget"] = true;
		["items"] = { 19307 },
	},
	["WARSONG_BANDAGES"] = {
		["description"] = AUTOBAR_CLASS_WARSONG_BANDAGE;
		["texture"] = "INV_Misc_Bandage_12";
		["targetted"] = true;
		["location"] = AUTOBAR_WARSONGGULCH;
		["smarttarget"] = true;
	},
	["ARATHI_BANDAGES"] = {
		["description"] = AUTOBAR_CLASS_ARATHI_BANDAGE;
		["texture"] = "INV_Misc_Bandage_12";
		["targetted"] = true;
		["location"] = AUTOBAR_ARATHIBASIN;
		["smarttarget"] = true;
	},
	["UNGORO_RESTORE"] = {
		["description"] = AUTOBAR_CLASS_UNGORORESTORE;
		["texture"] = "INV_Misc_Gem_Diamond_02";
		["combatonly"] = true;
		["targetted"] = true;
		["smarttarget"] = true;
		["limit"] = { ["downhp"] = { 670 } },
		["items"] = { 11562 },
	},
	["ANTI_VENOM"] = {
		["description"] = AUTOBAR_CLASS_ANTIVENOM;
		["texture"] = "INV_Drink_14";
		["targetted"] = true;
		["smarttarget"] = true;
		["items"] = {
			2633,   -- Jungle Remedy            22
			6452,	-- Anti-Venom				25
			6453,	-- Strong Anti-Venom		35
			19440,	-- Powerful Anti-Venom		60
			12586,	-- Immature Venom Sac
			3386, 	-- elixir of poison resistance
		},
	},
	----------------
	["POTION_AGILITY"] = {
		["texture"] = "INV_Potion_94",
		["description"] = AUTOBAR_CLASS_AGILITYPOTIONS,
		["items"] = {
			2457,	-- Elixir of Minor Agility		4		60
			3390,	-- Elixir of Lesser Agility		8		60
			8949,	-- Elixir of Agility			15		60
			9187,	-- Elixir of Greater Agility	25		60
			13452,	-- Elixir of the Mongoose		25		60 2% crit
		},
	},
	["POTION_STRENGTH"] = {
		["texture"] = "INV_Potion_61",
		["description"] = AUTOBAR_CLASS_STRENGTHPOTIONS,
		["items"] = {
			2457,	-- Elixir of Lion's Strength	4		60
			3391,	-- Elixir of Ogre's Strength	8		60
			6662,	-- Elixir of Giant Growth		8		60
			9206,	-- Elixir of Giants				25		60
			13453,	-- Elixir of Brute Force		18		60 18 sta
		},
	},
	["POTION_FORTITUDE"] = {
		["texture"] = "INV_Potion_43",
		["description"] = AUTOBAR_CLASS_FORTITUDEPOTIONS,
		["items"] = {
			2458,	-- Elixir of Minor Fortitude	27		60
			3825,	-- Elixir of Fortitude			120		60
			20079, 	-- Spirit of Zanza				50 sta 120
		},
	},
	["POTION_INTELLECT"] = {
		["texture"] = "INV_Potion_10",
		["description"] = AUTOBAR_CLASS_INTELLECTPOTIONS,
		["items"] = {
			9179,	-- Elixir of Greater Intellect	25		60
			13447,	-- Elixir of the Sages			18		60 18 spi
		},
	},
	["POTION_SPELLPOWER"] = {
		["texture"] = "INV_Potion_25",
		["description"] = AUTOBAR_CLASS_SPELLPOWERPOTIONS,
		["items"] = {
			6373,	-- Elixir of Firepower			+10 fire spd
			17708,	-- Elixir of Frost Power 		+15 frost spd
			9155, 	-- Arcane Elixir				+20 spd
			21546,	-- Elixir of Greater Firepower	+40 fire spd
			9264,	-- Elixir of Shadow Power		+40 shadow spd
			13454,	-- Greater Arcane Elixir		+35 spd
			61423,	-- Dreamtonic					+35 spd - 20 min
			61224,	-- Dreamshard Elixir			+15 spd +2 spellcrit
	--		13512, 	-- Flask of Supreme Power		+150 spd
		},
	},

	["POTION_WISDOM"] = {
		["texture"] = "INV_Potion_06",
		["description"] = AUTOBAR_CLASS_WISDOMPOTIONS,
		["items"] = {
			3383,	-- Elixir of Wisdom				6		60
		},
	},
	["POTION_DEFENSE"] = {
		["texture"] = "INV_Potion_66",
		["description"] = AUTOBAR_CLASS_DEFENSEPOTIONS,
		["items"] = {
			5997,	-- Elixir of Minor Defense		50		60
			3389,	-- Elixir of Defense			150		60
			8951,	-- Elixir of Greater Defense	250		60
			13445,	-- Elixir of Superior Defense	450		60
		},
	},
	["POTION_TROLL"] = {
		["texture"] = "INV_Potion_80",
		["description"] = AUTOBAR_CLASS_TROLLBLOODPOTIONS,
		["items"] = {
			3382,	-- Weak Troll's Blood Potion	2/5		60
			3388,	-- Strong Troll's Blood Potion	6/5		60
			3826,	-- Mighty Troll's Blood Potion	12/5	60
			20004,	-- Major Troll's Blood Potion	20/5	60
		},
	},
	----------------
	["SCROLL_AGILITY"] = {
		["texture"] = "INV_Scroll_02",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_SCROLLOFAGILITY,
		["items"] = {
			3012,	-- Scroll of Agility
			1477,	-- Scroll of Agility II
			4425,	-- Scroll of Agility III
			10309,	-- Scroll of Agility IV
		},
	},
	["SCROLL_INTELLECT"] = {
		["texture"] = "INV_Scroll_01",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_SCROLLOFINTELLECT,
		["items"] = {
			955,	-- Scroll of Intellect
			2290,	-- Scroll of Intellect II
			4419,	-- Scroll of Intellect III
			10308,	-- Scroll of Intellect IV
			12458,	-- Juju Guile				40
		},
	},
	["SCROLL_PROTECTION"] = {
		["texture"] = "INV_Scroll_07",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_SCROLLOFPROTECTION,
		["items"] = {
			3013,	-- Scroll of Protection
			1478,	-- Scroll of Protection II
			4421,	-- Scroll of Protection III
			10305,	-- Scroll of Protection IV
		},
	},
	["SCROLL_SPIRIT"] = {
		["texture"] = "INV_Scroll_01",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_SCROLLOFSPIRIT,
		["items"] = {
			1181,	-- Scroll of Spirit
			1712,	-- Scroll of Spirit II
			4424,	-- Scroll of Spirit III
			10306,	-- Scroll of Spirit IV
		},
	},
	["SCROLL_STAMINA"] = {
		["texture"] = "INV_Scroll_07",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_SCROLLOFSTAMINA,
		["items"] = {
			1180,	-- Scroll of Stamina
			1711,	-- Scroll of Stamina II
			4422,	-- Scroll of Stamina III
			10307,	-- Scroll of Stamina IV
		},
	},
	["SCROLL_STRENGTH"] = {
		["texture"] = "INV_Scroll_02",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_SCROLLOFSTRENGTH,
		["items"] = {
			954,	-- Scroll of Strength		5
			2289,	-- Scroll of Strength II	9
			4426,	-- Scroll of Strength III	13
			10310,	-- Scroll of Strength IV	17
			12451,	-- Juju Power				30
		},
	},
	["BUFF_ATTACKPOWER"] = {
		["texture"] = "INV_Misc_MonsterScales_07",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_BUFF_ATTACKPOWER,
		["items"] = {
			12820,	-- Winterfall Firewater		35	20m
			12460,	-- Juju Might				40	30m
		},
	},
	["BUFF_ATTACKSPEED"] = {
		["texture"] = "INV_Misc_MonsterScales_17",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_BUFF_ATTACKSPEED,
		["items"] = {
			12450,	-- Juju Flurry				3%	20s
		},
	},
	["BUFF_DODGE"] = {
		["texture"] = "INV_Misc_MonsterScales_17",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_BUFF_DODGE,
		["items"] = {
			12459,	-- Juju Escape				5%	10s
		},
	},
	["BUFF_FROST"] = {
		["texture"] = "INV_Misc_MonsterScales_09",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_BUFF_FROST,
		["items"] = {
			12457,	-- Juju Chill				15	10m
		},
	},
	["BUFF_FIRE"] = {
		["texture"] = "INV_Misc_MonsterScales_15",
		["targetted"] = true,
		["description"] = AUTOBAR_CLASS_BUFF_FIRE,
		["items"] = {
			12455,	-- Juju Ember				15	10m
		},
	},
	----------------
	["HEALPOTIONS"] = {
		["description"] = AUTOBAR_CLASS_HEALPOTIONS;
		["texture"] = "INV_Potion_54";
		["limit"] = { ["downhp"] = { 70, 140, 140, 280, 455, 700, 1050} },
	},
	["PVP_HEALPOTIONS"] = {
		["description"] = AUTOBAR_CLASS_PVP6HEALPOTIONS;
		["texture"] = "INV_Potion_38";
		["items"] = { 18839 },
		["limit"] = { ["downhp"] = { 900 } },
	},
	["HEALTHSTONE"] = {
		["description"] = AUTOBAR_CLASS_HEALTHSTONE;
		["texture"] = "INV_Stone_04";
	},
	["WHIPPER_ROOT"] = {
		["description"] = AUTOBAR_CLASS_WHIPPER_ROOT;
		["texture"] = "INV_Misc_Food_55";
		["items"] = { 11951 },
		["limit"] = { ["downhp"] = { 700 } },
	},
	["ALTERAC_HEAL"] = {
		["description"] = AUTOBAR_CLASS_BATTLEGROUNDHEALPOTIONS;
		["texture"] = "INV_Potion_39";
		["battleground"] = true;
		["items"] = {
			17349,	-- Superior Healing Draught
			17348,	-- Major Healing Draught
		},
	},
	----------------
	["MANAPOTIONS"] = {
		["description"] = AUTOBAR_CLASS_MANAPOTIONS;
		["texture"] = "INV_Potion_76";
		["limit"] = { ["downmana"] = { 140, 280, 455, 700, 900, 1350} },
	},
	["PVP_MANAPOTIONS"] = {
		["description"] = AUTOBAR_CLASS_PVP6MANAPOTIONS;
		["texture"] = "INV_Potion_80";
		["items"] = { 18841 },
		["limit"] = { ["downmana"] = { 900 }, },
	},
	["MANASTONE"] = {
		["description"] = AUTOBAR_CLASS_MANASTONE;
		["texture"] = "INV_Misc_Gem_Emerald_01";
	},
	["ALTERAC_MANA"] = {
		["description"] = AUTOBAR_CLASS_BATTLEGROUNDMANAPOTIONS;
		["texture"] = "INV_Potion_81";
		["battleground"] = true;
		["items"] = {
			17352,	-- Superior Mana Draught
			17351,	-- Major Mana Draught
		},
	},
	["DREAMLESS_SLEEP"] = {
		["description"] = AUTOBAR_CLASS_DREAMLESS_SLEEP;
		["texture"] = "INV_Potion_83";
		["items"] = {
			12190,	-- Dreamless Sleep
			20002,	-- Greater Dreamless Sleep
		},
	},
	----------------
	["NIGHT_DRAGONS_BREATH"] = {
		["description"] = AUTOBAR_CLASS_NIGHT_DRAGONS_BREATH;
		["texture"] = "INV_Misc_Food_45";
		["limit"] = { ["downhp"] = { 456 }, ["downmana"] = { 456 }, },
		["items"] = { 11952 },
	},
	["REJUVENATION_POTIONS"] = {
		["description"] = AUTOBAR_CLASS_REJUVENATION_POTIONS;
		["texture"] = "INV_Potion_47";
		["items"] = {
			2456,	-- Minor Rejuvenation Potion
			9144,	-- Wildvine Potion
			18253,	-- Major Rejuvenation Potion
		},
		["limit"] = { ["downhp"] = { 150, 750, 1760 }, ["downmana"] = { 150, 750, 1760 }, },
	},
	----------------
	["BATTLE_STANDARD"] = {
		["description"] = AUTOBAR_CLASS_BATTLESTANDARD;
		["texture"] = "INV_BannerPVP_01";
		["battleground"] = true;
		["items"] = {
			18606,	-- Alliance Battle Standard
			18607,	-- Horde Battle Standard
		},
	},
	["BATTLE_STANDARD_AV"] = {
		["description"] = AUTOBAR_CLASS_BATTLESTANDARDAV;
		["texture"] = "INV_BannerPVP_02";
		["location"] = AUTOBAR_ALTERACVALLEY;
		["items"] = {
			19045,	-- Stormpike Battle Standard
			19046,	-- Frostwolf Battle Standard
		},
	},
	["HOURGLASS_SAND"] = {
		["description"] = AUTOBAR_CLASS_BATTLESTANDARDAV;
		["texture"] = "INV_BannerPVP_02";
		["location"] = AUTOBAR_BWL;
		["items"] = {
			19183,	-- Hourglass Sand
		},
	},
	----------------
	["RUNES"] = {
		["description"] = AUTOBAR_CLASS_DEMONIC_DARK_RUNES;
		["texture"] = "Spell_Shadow_SealOfKings";
		["limit"] = { ["downmana"] = { 900, 900 }, },
		["items"] = {
			20520,	-- Dark Rune
			12662,	-- Demonic Rune
		},
	},
	["TEAS"] = {
		["description"] = AUTOBAR_CLASS_TEAS;
		["texture"] = "INV_Drink_Milk_05";
		["limit"] = { ["downhp"] = { 1050, 1050 }, ["downmana"] = { 1050, 1050 }, },
		["items"] = {
			15723,	-- Tea with Sugar
			61675,	-- Nordanaar Herbal Tea
		},
	},

	----------------
	["PROTECTION_ARCANE"] = {
		["description"] = AUTOBAR_CLASS_ARCANE_PROTECTION;
		["texture"] = "INV_Potion_83";
		["items"] = { 13461 },
	},
	["PROTECTION_FIRE"] = {
		["description"] = AUTOBAR_CLASS_FIRE_PROTECTION;
		["texture"] = "INV_Potion_24";
		["items"] = { 6049, 13457 },
	},
	["PROTECTION_FROST"] = {
		["description"] = AUTOBAR_CLASS_FROST_PROTECTION;
		["texture"] = "INV_Potion_20";
		["items"] = { 6050, 13456 },
	},
	["PROTECTION_NATURE"] = {
		["description"] = AUTOBAR_CLASS_NATURE_PROTECTION;
		["texture"] = "INV_Potion_22";
		["items"] = { 6052, 13458 },
	},
	["PROTECTION_SHADOW"] = {
		["description"] = AUTOBAR_CLASS_SHADOW_PROTECTION;
		["texture"] = "INV_Potion_23";
		["items"] = { 6048, 13459 },
	},
	["PROTECTION_SPELLS"] = {
		["description"] = AUTOBAR_CLASS_SPELL_PROTECTION;
		["texture"] = "INV_Potion_29";
		["items"] = {
			20080	-- Sheen of Zanza
		},
	},
	["PROTECTION_HOLY"] = {
		["description"] = AUTOBAR_CLASS_HOLY_PROTECTION;
		["texture"] = "INV_Potion_09";
		["items"] = { 6051 },
		["noncombat"] = false,
	},
	["PROTECTION_DAMAGE"] = {
		["description"] = AUTOBAR_CLASS_INVULNERABILITY_POTIONS;
		["texture"] = "INV_Potion_62";
		["items"] = { 3387 },
		["noncombat"] = false,
	},
	["ACTION_POTIONS"] = {
		["description"] = AUTOBAR_CLASS_FREE_ACTION_POTION;
		["texture"] = "INV_Potion_04";
		["items"] = {
			20008,		-- Living Action Potion
			5634,			-- Free Action Potion
		},
	},
	["ZANZA"]	= {
		["description"] = AUTOBAR_CLASS_ZANZA;
		["texture"] = "INV_Potion_04";
		["items"] = {
			20081,		-- Swiftness of Zanza
			20080,		-- Sheen of Zanza
		},
	},
	----------------
	["HEARTHSTONE"] = {
		["description"] = AUTOBAR_CLASS_HEARTHSTONE;
		["texture"] = "INV_Misc_Rune_01";
		["items"] = {
			6948,			-- HearthStone
		},
	},
	----------------
	["WATER"] = {
		["description"] = AUTOBAR_CLASS_WATER;
		["texture"] = "INV_Drink_10";
		["noncombat"] = true,
	},
	["WATER_PERCENT"] = {
		["description"] = AUTOBAR_CLASS_WATER_PERCENT;
		["texture"] = "INV_Drink_04";
		["noncombat"] = true,
	},
	["WATER_CONJURED"] = {
		["description"] = AUTOBAR_CLASS_WATER_CONJURED;
		["texture"] = "INV_Drink_18";
		["noncombat"] = true,
	},
	["WATER_SPIRIT"] = {
		["description"] = AUTOBAR_CLASS_WATER_SPIRIT;
		["texture"] = "INV_Drink_16";
		["noncombat"] = true,
	},
	["RAGEPOTIONS"] = {
		["description"] = AUTOBAR_CLASS_RAGEPOTIONS;
		["texture"] = "INV_Potion_24";
	},
	["ENERGYPOTIONS"] = {
		["description"] = AUTOBAR_CLASS_ENERGYPOTIONS;
		["texture"] = "INV_Drink_Milk_05";
		["items"] = { 7676 },
	},
	["SWIFTNESSPOTIONS"] = {
		["description"] = AUTOBAR_CLASS_SWIFTNESSPOTIONS;
		["texture"] = "INV_Potion_95";
		["items"] = { 20081, 2459, },
	},
	["SOULSHARDS"] = {
		["description"] = AUTOBAR_CLASS_SOULSHARDS;
		["texture"] = "INV_Misc_Gem_Amethyst_02";
		["notusable"] = true;
		["items"] = { 6265 },
	},
	--------------
	["ARROWS"] = {
		["description"] = AUTOBAR_CLASS_ARROWS;
		["texture"] = "INV_Ammo_Arrow_02";
		["notusable"] = true;
	},
	["BULLETS"] = {
		["description"] = AUTOBAR_CLASS_BULLETS;
		["texture"] = "INV_Ammo_Bullet_02";
		["notusable"] = true;
	},
	["THROWN"] = {
		["description"] = AUTOBAR_CLASS_THROWNWEAPON;
		["texture"] = "INV_Axe_19";
		["notusable"] = true;
	},
	--------------
	["FOOD"] = {
		["description"] = AUTOBAR_CLASS_FOOD;
		["texture"] = "INV_Misc_Food_23";
		["noncombat"] = true,
	},
	["FOOD_PERCENT"] = {
		["description"] = AUTOBAR_CLASS_FOOD_PERCENT;
		["texture"] = "INV_Misc_Food_60",
		["custom"] = true;
	},
	["FOOD_PET_BREAD"] = {
		["description"] = AUTOBAR_CLASS_FOOD_PET_BREAD;
		["texture"] = "INV_Misc_Food_35";
		["noncombat"] = true,
	},
	["FOOD_PET_CHEESE"] = {
		["description"] = AUTOBAR_CLASS_FOOD_PET_CHEESE;
		["texture"] = "INV_Misc_Food_37";
		["noncombat"] = true,
	},
	["FOOD_PET_FISH"] = {
		["description"] = AUTOBAR_CLASS_FOOD_PET_FISH;
		["texture"] = "INV_Misc_Fish_22";
		["noncombat"] = true,
	},
	["FOOD_PET_FRUIT"] = {
		["description"] = AUTOBAR_CLASS_FOOD_PET_FRUIT;
		["texture"] = "INV_Misc_Food_19";
		["noncombat"] = true,
	},
	["FOOD_PET_FUNGUS"] = {
		["description"] = AUTOBAR_CLASS_FOOD_PET_FUNGUS;
		["texture"] = "INV_Mushroom_05";
		["noncombat"] = true,
	},
	["FOOD_PET_MEAT"] = {
		["description"] = AUTOBAR_CLASS_FOOD_PET_MEAT;
		["texture"] = "INV_Misc_Food_14";
		["noncombat"] = true,
	},
	["FOOD_WATER"] = {
		["description"] = AUTOBAR_CLASS_FOOD_COMBO;
		["texture"] = "INV_Misc_Food_33";
		["noncombat"] = true,
	},
	["FOOD_CONJURED"] = {
		["description"] = AUTOBAR_CLASS_FOOD_CONJURED;
		["texture"] = "INV_Misc_Food_73CinnamonRoll";
		["noncombat"] = true,
	},
	["DRINK_STAMINA"] ={
		["description"] = AUTOBAR_CLASS_DRINK_STAMINA;
		["texture"] = "INV_Drink_04";
	},
	["FOOD_STAMINA"] = {
		["description"] = AUTOBAR_CLASS_FOOD_STAMINA;
		["texture"] = "INV_Egg_03";
		["noncombat"] = true,
	},
	["FOOD_AGILITY"] = {
		["description"] = AUTOBAR_CLASS_FOOD_AGILITY;
		["texture"] = "INV_Misc_Fish_13";
		["noncombat"] = true,
	},
	["FOOD_MANAREGEN"] = {
		["description"] = AUTOBAR_CLASS_FOOD_MANAREGEN;
		["texture"] = "INV_Drink_17";
		["noncombat"] = true,
	},
	["FOOD_HPREGEN"] = {
		["description"] = AUTOBAR_CLASS_FOOD_HPREGEN;
		["texture"] = "INV_Misc_Fish_19";
		["noncombat"] = true,
	},
	["FOOD_STRENGTH"] = {
		["description"] = AUTOBAR_CLASS_FOOD_STRENGTH;
		["texture"] = "INV_Misc_Food_41";
		["noncombat"] = true,
	},
	["FOOD_INTELLIGENCE"] = {
		["description"] = AUTOBAR_CLASS_FOOD_INTELLIGENCE;
		["texture"] = "INV_Misc_Food_63";
		["noncombat"] = true,
	},
	["FOOD_SPELLPOWER"] = {
		["description"] = AUTOBAR_CLASS_FOOD_SPELLPOWER;
		["texture"] = "INV_Drink_19";
		["noncombat"] = true,
	},
	["FOOD_ARATHI"] = {
		["description"] = AUTOBAR_CLASS_FOOD_ARATHI;
		["texture"] = "INV_Misc_Food_33";
		["noncombat"] = true,
		["location"] = AUTOBAR_ARATHIBASIN;
		["items"] = {
			20062,
			20063,	-- Arathi Basin Field Ration	1074 health	2202 mana 30 sec
			20064,
			20222,	-- Defiler's Enriched Ration	2148 health	4410 mana 30 sec
			20223,
			20224,
			20225,
			20226,
			20227,
		},
	},
	["FOOD_WARSONG"] = {
		["description"] = AUTOBAR_CLASS_FOOD_WARSONG;
		["texture"] = "INV_Misc_Food_33";
		["noncombat"] = true,
		["location"] = AUTOBAR_WARSONGGULCH;
		["items"] = { 19062, 19061, 19060 },
	},
	--------------
	["SHARPENINGSTONES"] = {
		["description"] = AUTOBAR_CLASS_SHARPENINGSTONES;
		["texture"] = "INV_Stone_SharpeningStone_01";
		["targetted"] = "WEAPON";
	},
	["WEIGHTSTONE"] = {
		["description"] = AUTOBAR_CLASS_WEIGHTSTONE;
		["texture"] = "INV_Stone_WeightStone_02";
		["targetted"] = "WEAPON";
	},
	--------------
	["POISON-CRIPPLING"] = {
		["description"] = AUTOBAR_CLASS_POISON_CRIPPLING;
		["texture"] = "INV_Potion_19";
		["targetted"] = "WEAPON";
	},
	["POISON-DEADLY"] = {
		["description"] = AUTOBAR_CLASS_POISON_DEADLY;
		["texture"] = "Ability_Rogue_DualWeild";
		["targetted"] = "WEAPON";
	},
	["POISON-INSTANT"] = {
		["description"] = AUTOBAR_CLASS_POISON_INSTANT;
		["texture"] = "Ability_Poisons";
		["targetted"] = "WEAPON";
	},
	["POISON-MINDNUMBING"] = {
		["description"] = AUTOBAR_CLASS_POISON_MINDNUMBING;
		["texture"] = "Spell_Nature_NullifyDisease";
		["targetted"] = "WEAPON";
	},
	["POISON-WOUND"] = {
		["description"] = AUTOBAR_CLASS_POISON_WOUND;
		["texture"] = "Ability_PoisonSting";
		["targetted"] = "WEAPON";
	},
	--------------
	["EXPLOSIVES"] = {
		["description"] = AUTOBAR_CLASS_EXPLOSIVES;
		["texture"] = "INV_Misc_Bomb_08";
		["nosmartcast"] = true;
		["targetted"] = true;
	},
	--------------
	["MOUNTS_TROLL"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_TROLL;
		["texture"] = "Ability_Mount_Raptor";
		["noncombat"] = true,
	},
	["MOUNTS_ORC"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_ORC;
		["texture"] = "Ability_Mount_BlackDireWolf",
		["noncombat"] = true,
	},
	["MOUNTS_UNDEAD"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_UNDEAD;
		["texture"] = "Ability_Mount_Undeadhorse";
		["noncombat"] = true,
	},
	["MOUNTS_TAUREN"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_TAUREN;
		["texture"] = "Ability_Mount_Kodo_01";
		["noncombat"] = true,
	},
	["MOUNTS_HUMAN"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_HUMAN;
		["texture"] = "Ability_Mount_NightmareHorse";
		["noncombat"] = true,
	},
	["MOUNTS_NIGHTELF"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_NIGHTELF;
		["texture"] = "Ability_Mount_BlackPanther";
		["noncombat"] = true,
	},
	["MOUNTS_DWARF"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_DWARF;
		["texture"] = "Ability_Mount_MountainRam";
		["noncombat"] = true,
	},
	["MOUNTS_GNOME"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_GNOME;
		["texture"] = "Ability_Mount_MechaStrider";
		["noncombat"] = true,
	},
	["MOUNTS_SPECIAL"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_SPECIAL;
		["texture"] = "Ability_Mount_JungleTiger";
		["noncombat"] = true,
	},
	["MOUNTS_QIRAJI"] = {
		["description"] = AUTOBAR_CLASS_MOUNTS_QIRAJI;
		["texture"] = "INV_Misc_QirajiCrystal_05";
		["noncombat"] = true,
		["location"] = AUTOBAR_AHN_QIRAJ;
	},
	--------------
	["MANA_OIL"] = {
		["texture"] = "INV_Potion_100";
		["targetted"] = "WEAPON";
		["description"] = AUTOBAR_CLASS_MANA_OIL;
	},
	["WIZARD_OIL"] = {
		["texture"] = "INV_Potion_105";
		["targetted"] = "WEAPON";
		["description"] = AUTOBAR_CLASS_WIZARD_OIL;
	},
	["FISHINGITEMS"] = {
		["texture"] = "INV_Misc_Food_26",
		["targetted"] = "WEAPON",
		["description"] = AUTOBAR_CLASS_FISHINGITEMS,
		["items"] = {
			6529, -- Shiny Bauble
			6530, -- Nightcrawlers
			6811, -- Aquadynamic Fish Lens
			6532, -- Bright Baubles
			6533, -- Aquadynamic Fish Attractors
		},
	},
	["QUESTSTARTITEMS"] = {
		["texture"] = "INV_letter_17",
		["description"] = AUTOBAR_CLASS_QUESTSTARTITEMS,
		["items"] = {
			1307, -- Gold Pickup Schedule
			1357, -- Captain Sander's Treasure Map
			1962, -- Glowing Shadowhide Pendant
			1972, -- Westfall Deed
			2794, -- An Old History Book
			2839, -- A Letter to Yvette
			2874, -- An Unsent Letter
			3317, -- A Talking Head
			3668, -- Assassin's Contract
			3706, -- Ensorcelled Parchment
			3985, -- Monogrammed Sash
			4056, -- Cortello's Riddle
			4098, -- Carefully Folded Note
			4433, -- Waterlogged Envelope
			4613, -- Corroded Black Box
			4614, -- Pendant of Myzrael
			4851, -- Dirt-stained Map
			4854, -- Demon Scarred Cloak
			4881, -- Aged Envelope
			4903, -- Eye of Burning Shadow
			4926, -- Chen's Empty Keg
			5099, -- Hoof of Lakota'mani
			5102, -- Owatanka's Tailspike
			5103, -- Washte Pawne's Feather
			5138, -- Harvester's Head
			5179, -- Moss-twined Heart
			5352, -- Book: The Powers Below
			5791, -- Henrig Lonebrow's Journal
			5877, -- Cracked Silithid Carapace
			6172, -- Lost Supplies
			6196, -- Noboru's Cudgel
			6497, -- Simple Parchment
			6775, -- Tome of Divinity
			6776, -- Tome of Valor
			6916, -- Tome of Divinity
			7666, -- Shattered Necklace
			8524, -- Model 4711-FTZ Power Source
			8623, -- OOX-17/TN Distress Beacon
			8704, -- OOX-09/HL Distress Beacon
			8705, -- OOX-22/FE Distress Beacon
			9250, -- Ship Schedule
			9254, -- Cuergo's Treasure Map
			9326, -- Grime-Encrusted Ring
			9370, -- Gordunni Scroll
			10000, -- Margol's Horn
			10441, -- Glowing Shard
			10454, -- Essence of Eranikus
			10589, -- Oathstone of Ysera's Dragonflight
			10590, -- Pocked Black Box
			10621, -- Runed Scroll
			11116, -- A Mangled Journal
			11446, -- A Crumpled Up Note
			11463, -- Undelivered Parcel
			11668, -- Flute of Xavaric
			11818, -- Grimeslit Outhouse Key
			12558, -- Blue-feathered Necklace
			12563, -- Warlord Goretooth's Command
			12564, -- Assassination Note
			12771, -- Empty Firewater Flask
			12780, -- General Drakkisath's Command
			12842, -- Crudely-written Log
			13140, -- Blood Red Key
			13250, -- Head of Balnazzar
			13920, -- Healthy Dragon Scale
			14646, -- Northshire Gift Voucher
			14647, -- Coldridge Valley Gift Voucher
			14648, -- Shadowglen Gift Voucher
			14649, -- Valley of Trials Gift Voucher
			14650, -- Camp Narache Gift Voucher
			14651, -- Deathknell Gift Voucher
			16303, -- Ursangous's Paw
			16304, -- Shadumbra's Head
			16305, -- Sharptalon's Claw
			16408, -- Befouled Water Globe
			16782, -- Strange Water Globe
			17008, -- Small Scroll
			17115, -- Squirrel Token
			17116, -- Squirrel Token
			17126, -- Elegant Letter
			17409, -- Encrusted Crystal Fragment
			18356, -- Garona: A Study on Stealth and Treachery
			18357, -- Codex of Defence
			18358, -- The Arcanist's Cookbook
			18359, -- The Light and How to Swing It
			18360, -- Harnessing Shadows
			18361, -- The Greatest Race of Hunters
			18362, -- Holy Bologna: What the Light Won't Tell You
			18363, -- Frost Shock and You
			18364, -- The Emerald Dream
			18401, -- Nostro's Compendium of Dragon Slaying
			18422, -- Head of Onyxia
			18423, -- Head of Onyxia
			18513, -- A Dull and Flat Elven Blade
			18628, -- Thorium Brotherhood Contract
			18703, -- Ancient Petrified Leaf
			18706, -- Arena Master
			18769, -- Enchanted Thorium Platemail
			18770, -- Enchanted Thorium Platemail
			18771, -- Enchanted Thorium Platemail
			18950, -- Chambermaid Pillaclencher's Pillow
			18969, -- Pristine Yeti Hide
			18972, -- Perfect Yeti Hide
			18987, -- Blackhand's Command
			19002, -- Head of Nefarian
			19003, -- Head of Nefarian
			19016, -- Vessel of Rebirth
			19018, -- Dormant Wind Kissed Blade
			19228, -- Beasts Deck
			19257, -- Warlords Deck
			19267, -- Elementals Deck
			19277, -- Portals Deck
			19424, -- Sayge's Fortune #24
			19443, -- Sayge's Fortune #25
			19452, -- Sayge's Fortune #27
			19802, -- Heart of Hakkar
			20310, -- Flayed Demon Skin
			20460, -- Brann Bronzebeard's Lost Letter
			20644, -- Nightmare Engulfed Object
			20741, -- Deadwood Ritual Totem
			20742, -- Winterfall Ritual Totem
			20806, -- Logistics Task Briefing X
			20807, -- Logistics Task Briefing I
			20939, -- Logistics Task Briefing II
			20941, -- Combat Task Briefing XII
			20942, -- Combat Task Briefing III
			20943, -- Tactical Task Briefing X
			20944, -- Tactical Task Briefing IX
			20945, -- Tactical Task Briefing II
			20946, -- Tactical Task Briefing III
			20947, -- Tactical Task Briefing IV
			20948, -- Tactical Task Briefing V
			20949, -- Magical Ledger
			21166, -- Tactical Task Briefing VII
			21167, -- Tactical Task Briefing VIII
			21220, -- Head of Ossirian the Unscarred
			21221, -- Eye of C'Thun
			21230, -- Ancient Qiraji Artifact
			21245, -- Tactical Task Briefing I
			21246, -- Combat Task Briefing I
			21247, -- Combat Task Briefing II
			21248, -- Combat Task Briefing IV
			21249, -- Combat Task Briefing V
			21250, -- Combat Task Briefing VI
			21251, -- Combat Task Briefing VII
			21252, -- Combat Task Briefing VIII
			21253, -- Combat Task Briefing IX
			21255, -- Combat Task Briefing X
			21256, -- Combat Task Briefing XI
			21257, -- Logistics Task Briefing IV
			21261, -- Logistics Task Briefing VI
			21262, -- Logistics Task Briefing VIII
			21263, -- Logistics Task Briefing VII
			21265, -- Logistics Task Briefing IX
			21378, -- Logistics Task Briefing I
			21379, -- Logistics Task Briefing II
			21380, -- Logistics Task Briefing III
			21381, -- Logistics Task Briefing IX
			21382, -- Loistics Task Briefing V
			21384, -- Logistics Task Briefing VIII
			21385, -- Logistics Task Briefing X
			21514, -- Logistics Task Briefing XI
			21750, -- Combat Task Briefing II
			21751, -- Tactical Task Briefing III
			22520, -- The Phylactery of Kel'Thuzad
			22600, -- Craftsman's Writ - Dense Weightstone
			22601, -- Craftsman's Writ - Imperial Plate Chest
			22602, -- Craftsman's Writ - Volcanic Hammer
			22603, -- Craftsman's Writ - Huge Thorium Battleaxe
			22605, -- Craftsman's Writ - Wicked Leather Headband
			22606, -- Craftsman's Writ - Rugged Armor Kit
			22607, -- Craftsman's Writ - Wicked Leather Belt
			22608, -- Craftsman's Writ - Runic Leather Pants
			22609, -- Craftsman's Writ - Brightcloth Pants
			22610, -- Craftsman's Writ - Runecloth Boots
			22611, -- Craftsman's Writ - Runecloth Bag
			22612, -- Craftsman's Writ - Runecloth Robe
			22613, -- Craftsman's Writ - Goblin Sapper Charge
			22614, -- Craftsman's Writ - Thorium Grenade
			22615, -- Craftsman's Writ - Gnomish Battle Chicken
			22616, -- Craftsman's Writ - Thorium Tube
			22617, -- Craftsman's Writ - Major Mana Potion
			22618, -- Craftsman's Writ - Major Healing Potion
			22620, -- Craftsman's Writ - Greater Arcane Protection Potion
			22621, -- Craftsman's Writ - Flask of Petrification
			22622, -- Craftsman's Writ - Stonescale Eel
			22623, -- Craftsman's Writ - Plated Armorfish
			22624, -- Craftsman's Writ - Lightning Eel
			22719, -- Omarion's Handbook
			22723, -- A Letter from the Keeper of the Rolls
			22727, -- Frame of Atiesh
			22970, -- A Bloodstained Envelope
			22972, -- A Careworn Note
			22973, -- A Crumpled Missive
			22974, -- A Ragged Page
			22975, -- A Smudged Document
			22977, -- A Torn Letter
			23179, -- Flame of Orgrimmar
			23180, -- Flame of Thunder Bluff
			23181, -- Flame of the Undercity
			23182, -- Flame of Stormwind
			23183, -- Flame of Ironforge
			23184, -- Flame of Darnassus
			--Turtle WoW Quest Start Items--
			985, -- Tome of Khadgar's Unlocking
			1567, -- Tome of Khadgar's Unlocking II
			4158, -- Tome of Khadgar's Unlocking III
			6075, -- Vime's Report
			8881, -- Tome of Khadgar's Unlocking IV
			9572, -- Glyphic Rune
			51855, -- Dirty Old Ring
			70027, -- Broken Spear
			81275, -- Intact Pounder Machine - Drops Off Crowd Pummeler 9-60
		},
	},
	["QUESTUSEITEMS"] = {
		["texture"] = "INV_gizmo_09",
		["description"] = AUTOBAR_CLASS_QUESTUSEITEMS,
		["items"] = {
			4027, -- Catelyn's Blade
			4702, -- Prospector's Pick
			4986, -- Flawed Power Stone
			5068, -- Dried Seeds
			5165, -- Sunscale Feather
			5185, -- Crystal Phial
			5475, -- Wooden Key
			5619, -- Jade Phial
			5621, -- Tourmaline Phial
			5845, -- Flank of Meat
			5880, -- Crate With Holes
			6284, -- Runes of Summoning
			6544, -- Voidwalker Summoning Scroll
			6684, -- Snufflenose Command Stick
			6783, -- Dead-tooth's Key
			6928, -- Bloodstone Choker
			7207, -- Jennea's Flask
			7247, -- Chest of Containment Coffers
			7269, -- Deino's Flask
			7273, -- Witherbark Totem Stick
			7667, -- Talvash's Phial of Scrying
			8049, -- Gnarlpine Necklace
			8149, -- Voodoo Charm
			8155, -- Sathrah's Sacrifice
			9189, -- Shay's Bell
			9241, -- Sacred Mallet
			9283, -- Empty Leaden Collection Phial
			9323, -- Gadrin's Parchment
			9328, -- Super Snapper FX
			9364, -- Heavy Leaden Collection Phial
			9606, -- Treant Muisek Vessel
			10444, -- Standard Issue Flare Gun
			10445, -- Drawing Kit
			10465, -- Egg of Hakkar
			10515, -- Torch of Retribution
			10663, -- Essence of Hakkar
			10699, -- Yeh'kinya's Bramble
			10757, -- Ward of the Defiler
			11079, -- Gor'tesh's Lopped Off Head
			11085, -- Customer of the Month Coffer Key
			11243, -- Videre Elixir
			11286, -- Thorium Shackles
			11445, -- Flute of the Ancients
			11473, -- PX83-Enigmatron
			11609, -- Altered Black Dragonflight Molt
			12262, -- Empty Worg Pup Cage
			12286, -- Eggscilloscope Prototype
			12287, -- Collectronic Module
			12323, -- Unforged Seal of Ascension
			12472, -- Krakle's Thermometer
			12627, -- Temporal Displacer
			12733, -- Sacred Frostsaber Meat
			12785, -- Incendia Powder
			12891, -- Jaron's Pick
			12942, -- Panther Cage Key
			13156, -- Mystic Crystal
			13289, -- Egan's Blaster
			13536, -- Horn of Awakening
			13752, -- Soulbound Keepsake
			15042, -- Emptyu Termite Jar
			15826, -- Curative Animal Salve
			15848, -- Crate of Ghost Magnets
			15875, -- Rotten Apple
			15908, -- Taming Rod
			15911, -- Taming Rod
			15913, -- Taming Rod
			15914, -- Taming Rod
			15915, -- Taming Rod
			15916, -- Taming Rod
			15917, -- Taming Rod
			15919, -- Taming Rod
			15920, -- Taming Rod
			15921, -- Taming Rod
			15922, -- Taming Rod
			15923, -- Taming Rod
			16114, -- Foreman's Blackjack
			16208, -- Enchanted Gaea Seeds
			16333, -- Samuel's Remains
			16603, -- Enchanted Resonite Crystal
			16787, -- Amulet of Draconic Subversion
			16991, -- Triage Bandage
			17117, -- Rat Catcher's Flute
			17626, -- Frostwolf Muzzle
			17689, -- Stormpike Training Collar
			18152, -- Amethyst Phial
			18488, -- Heated Ancient Blade
			18749, -- Charger's Lost Soul
			20604, -- Stink Bomb Cleaner 
			21984, -- Left Piece of Lord Valthalak's Amulet
			21986, -- Banner of Provocation
			22047, -- Top Piece of Lord Valthalak's Amulet
			51425, -- Teresa's Copper Coin
		},
	},
};

AutoBar_Category_Info["BANDAGES"].items = {
		1251,	-- Linen Bandage
		2581,	-- Heavy Linen Bandage
		3530,	-- Wool Bandage
		3531,	-- Heavy Wool Bandage
		6450,	-- Silk Bandage
		6451,	-- Heavy Silk Bandage
		8544,	-- Mageweave Bandage
		8545,	-- Heavy Mageweave Bandage
		14529,	-- Runecloth Bandage
		14530,	-- Heavy Runecloth Bandage
		23684,  -- Crystal Infused Bandage, maybe unused I dunno
};
AutoBar_Category_Info["HEALPOTIONS"].items = {
		118,	-- Minor Healing Potion
		858,	-- Lesser Healing Potion
		4596,	-- Discolored Healing Potion
		929,	-- Healing Potion
		1710,	-- Greater Healing Potion
		3928,	-- Superior Healing Potion
		13446,	-- Major Healing Potion
};
AutoBar_Category_Info["MANAPOTIONS"].items = {
		2455,	-- Minor Mana Potion
		3385,	-- Lesser Mana Potion
		3827,	-- Mana Potion
		6149,	-- Greater Mana Potion
		13443,	-- Superior Mana Potion
		13444,	-- Major Mana Potion
};
AutoBar_Category_Info["HEALTHSTONE"].items = {
		5512,	-- Minor Healthstone
		19004,	-- 1pt Talent improved Minor Healthstone
		19005,	-- 2pt Talent improved Minor Healthstone
		5511,	-- Lesser Healthstone
		19006,	-- Talent improved Lesser Healthstone
		19007,	-- 1pt 2pt Talent improved Lesser Healthstone
		5509,	-- Healthstone
		19008,	-- 1pt Talent improved Healthstone
		19009,	-- 2pt Talent improved Healthstone
		5510,	-- Greater Healthstone
		19010,	-- 1pt Talent improved Greater Healthstone
		19011,	-- 2pt Talent improved Greater Healthstone
		9421,	-- Major Healthstone
		19012,	-- 1pt Talent improved Major Healthstone
		19013,	-- 2pt Talent improved Major Healthstone
};
AutoBar_Category_Info["MANASTONE"].items = {
		5514,	-- Mana Agate
		5513,	-- Mana Jade
		8007,	-- Mana Citrine
		8008,	-- Mana Ruby
};
AutoBar_Category_Info["WATER"].items = {
		19997,		-- Harvest Nectar
		159,		-- Refreshing Spring Water
		1179,		-- Ice Cold Milk
		1205,		-- Melon Juice
		9451,		-- Bubbling Water
		1708,		-- Sweet Nectar
		4791,		-- Enchanted Water
		10841,		-- Goldthorn Tea				25 - 1344
		1645,		-- Moonberry Juice				35 - 1992
		8766,		-- Morning Glory Dew			45 - 2934
		23161,		-- Freshly-Squeezed Lemonade	45 - 2934
		--Turtle WoW Water--
		80167, 		-- Kaja'Cola 				-- Goblin Starting Water
		80250, 		-- Sun-Parched Waterskin	-- High Elf Starting Water
};
AutoBar_Category_Info["WATER_SPIRIT"].items = {
		13813,	-- Blessed Sunfruit Juice		45 - 4410   10
		19318,	-- Bottled Alterac Spring Water 55 - 4410   10
};
AutoBar_Category_Info["WATER_CONJURED"].items = {
		5350,	-- Conjured Water
		2288,	-- Conjured Fresh Water
		2136,	-- Conjured Purified Water
		3772,	-- Conjured Spring Water
		8077,	-- Conjured Mineral Water
		8078,	-- Conjured Sparkling Water
		8079,	-- Conjured Crystal Water
		83004,  -- Conjured Mana Orange
};
AutoBar_Category_Info["RAGEPOTIONS"].items = {
		5631,	-- Rage Potion
		5633,	-- Great Rage Potion
		13442,	-- Mighty Rage Potion
};
AutoBar_Category_Info["BULLETS"].items = {
		2516,	-- Light Shot
		4960,	-- Flash Pellet
		8067,	-- Crafted Light Shot
		2519,	-- Heavy Shot
		5568,	-- Smooth Pebble
		8068,	-- Crafted Heavy Shot
		3033,	-- Solid Shot
		8069,	-- Crafted Solid Shot
		3465,	-- Exploding Shot
		10512,	-- Hi-Impact Mithril Slugs
		11284,	-- Accurate Slugs
		10513,	-- Mithril Gyro-Shot        15
		19316,  -- Ice Threaded Bullet		16.5
		15997,	-- Thorium Shells           17.5
		11630,	-- Rockshard Pellets        18
		13377,	-- Minature Cannon Balls    20.5
};
AutoBar_Category_Info["ARROWS"].items = {
		2512,	-- Rough Arrow
		2515,	-- Sharp Arrow
		3030,	-- Razor Arrow
		3464,	-- Feathered Arrow
		9399,	-- Precision Arrow
		11285,	-- Jagged Arrow             13
		19316,  -- Ice Threaded Arrow       16.5
		18042,	-- Thorium Headed Arrow     17.5
		12654,	-- Doomshot                 20
};
AutoBar_Category_Info["THROWN"].items = {
		3111,	-- Crude Throwing Axe
		3463,	-- Silver Star
		2947,	-- Small Throwing Knife
		2946,	-- Balanced Throwing Dagger
		5379,	-- Boot Knife
		3131,	-- Weighted Throwing Axe
		4959,	-- Throwing Tomahawk
		3107,	-- Keen Throwing Knife
		3135,	-- Sharp Throwing Axe
		3137,	-- Deadly Throwing Axe
		3108,	-- Heavy Throwing Dagger
		15326,	-- Gleaming Throwing Axe
		15327,	-- Wicked Throwing Dagger
		13173,	-- Flightblade Throwing Axe
};
AutoBar_Category_Info["FOOD_WATER"].items = {
		3448,	-- Senggin Root				Level 1		heals 294	mana 294
		2682,	-- Cooked Crab Claw			Level 5		heals 294	mana 294
		13724,  -- Enriched Manna Biscuit   -- 45
		19301,  -- Alterac Manna Biscuit    -- 51
		20031,  -- Essence Mango            -- 55
};
AutoBar_Category_Info["FOOD_CONJURED"].items = {
		5349,	-- Conjured Muffin			-- Mage    - Level 1, heals 61
		1113,	-- Conjured Bread			-- Mage    - Level 5, heals 243
		1114,	-- Conjured Rye 			-- Mage    - Level 15, heals 552
		1487,	-- Conjured Pumpernickel 	-- Mage    - Level 25, heals 874
		8075,	-- Conjured Sourdough		-- Mage    - Level 35, heals 1392
		8076,	-- Conjured Sweet Roll		-- Mage    - Level 45, heals 2148
		22895,	-- Conjured Cinnamon Roll	-- Mage    - Level 55, heals 3180
};
AutoBar_Category_Info["FOOD"].items = {
		2070,	-- Darnassian Bleu			-- Vendor  - Level 1, heals 61
		4540,	-- Tough Hunk of Bread		-- Vendor  - Level 1, heals 61
		4536,	-- Shiny Red Apple			-- Vendor  - Level 1, heals 61
		117,	-- Tough Jerky				-- Vendor  - Level 1, heals 61
		4604,	-- Forest Mushroom Cap		-- Vendor  - Level 1, heals 61
		16166,	-- Bean Soup				-- Vendor  - Level 1, heals 61
		2679,	-- Charred Wolf Meat		-- Cooking - Level 1, heals 61
		2681,	-- Roasted Boar Meat		-- Cooking - Level 1, heals 61
		787,	-- Slitherskin Mackerel		-- Cooking - Level 1, heals 61
		6290,	-- Brilliant Smallfish		-- Cooking - Level 1, heals 61
		2680,	-- Spiced Wolf Meat			-- Cooking
		16167,	-- Versicolor Treat			-- Vendor - Level 5, heals 243
		4605,	-- Red-speckled Mushroom	-- Vendor  - Level 5, heals 243
		2287,	-- Haunch of Meat			-- Vendor  - Level 5, heals 243
		4537,	-- Tel'Abim Banana			-- Vendor  - Level 5, heals 243
		414,	-- Dalaran Sharp			-- Vendor  - Level 5, heals 243
		4541,	-- Freshly Baked Bread		-- Vendor  - Level 5, heals 243
		6890,	-- Smoked Bear Meat			-- Cooking - Level 5, heals 243
		6316,	-- Loch Frenzy Delight		-- Cooking - Level 5, heals 243
		5095,	-- Rainbow Fin Albacore		-- Cooking - Level 5, heals 243
		4592,	-- Longjaw Mud Snapper		-- Cooking - Level 5, heals 243
		2683,	-- Crab Cake				-- Cooking
		2684,	-- Coyote Steak				-- Cooking
		5473,	-- Scorpid Surprise			-- Cooking - Level 1, heals 294
		733,	-- Westfall Stew			-- Cooking - Level 5, heals 552
		422,	-- Dwarven Mild				-- Vendor  - Level 15, heals 552
		4542,	-- Moist Cornbread			-- Vendor  - Level 15, heals 552
		4538,	-- Snapvine Watermelon		-- Vendor  - Level 15, heals 552
		3770,	-- Mutton Chop				-- Vendor  - Level 15, heals 552
		4606,	-- Spongy Morel				-- Vendor  - Level 15, heals 552
		16170,	-- Steamed Mandu			-- Vendor  - Level 15, heals 552
		5526,	-- Clam Chowder				-- Cooking - Level 10, heals 552
		5478,	-- Dig Rat Stew				-- Cooking - Level 10, heals 552
		2685,	-- Succulent Pork Ribs		-- Cooking - Level 10, heals 552
		4593,	-- Bristle Whisker Catfish 	-- Cooking - Level 15, heals 552
		4594,	-- Rockscale Cod			-- Cooking - Level 25, heals 874
		8364,	-- Mithril Head Trout 		-- Cooking - Level 25, heals 874
		16169,	-- Wild Ricecake			-- Vendor  - Level 25, heals 874
		4607,	-- Delicious Cave Mold		-- Vendor  - Level 25, heals 874
		3771,	-- Wild Hog Shank 			-- Vendor  - Level 25, heals 874
		4539,	-- Goldenbark Apple 		-- Vendor  - Level 25, heals 874
		4544,	-- Mulgore Spice Bread 		-- Vendor  - Level 25, heals 874
		1707,	-- Stormwind Brie 			-- Vendor  - Level 25, heals 874
		13546,	-- Bloodbelly Fish			-- Quest   - Level 25, heals 1392
		3927,	-- Fine Aged Cheddar		-- Vendor  - Level 35, heals 1392
		4601,	-- Soft Banana Bread		-- Vendor  - Level 35, heals 1392
		4602,	-- Moon Harvest Pumpkin		-- Vendor  - Level 35, heals 1392
		4599,	-- Cured Ham Steak 			-- Vendor  - Level 35, heals 1392
		4608,	-- Raw Black Truffle 		-- Vendor  - Level 35, heals 1392
		18255,	-- Runn Tum Tuber			-- Uncooked
		16168,	-- Heaven Peach				-- Vendor  - Level 35, heals 1392
		16766,	-- Undermine Clam Chowder	-- Cooking - Level 35, heals 1392
		6887,	-- Spotted Yellowtail		-- Cooking - Level 35, heals 1392
		13930,	-- Filet of Redgill			-- Cooking - Level 35, heals 1392
		9681,	-- Grilled King Crawler Legs	-- Quest - Level 35, heals 1392
		16171,	-- Shinsollo				-- Vendor  - Level 45, heals 2148
		8952,	-- Roasted Quail 			-- Vendor  - Level 45, heals 2148
		8953,	-- Deep Fried Plantains		-- Vendor  - Level 45, heals 2148
		8950,	-- Homemade Cherry Pie 		-- Vendor  - Level 45, heals 2148
		8932,	-- Alterac Swiss 			-- Vendor  - Level 45, heals 2148
		8948,	-- Dried King Bolete 		-- Vendor  - Level 45, heals 2148
		8957,	-- Spinefin Halibut			-- Vendor  - Level 45, heals 2148
		13935,	-- Baked Salmon				-- Cooking - Level 45, heals 2148
		13933,	-- Lobster Stew				-- Cooking - Level 45, heals 2148
		23160,	-- Friendship Bread			-- Vendor  - Level 45, heals 2148
		--Turtle WoW Food--
		80168,	-- Crunchy Murloc Fine		-- Goblin Starting Food
		80251, 	-- Crusty Flatbread			-- High Elf Starting Food
};
AutoBar_Category_Info["FOOD_PET_BREAD"].items = {
		5349,	-- Conjured Muffin						heals 61
		4540,	-- Tough Hunk of Bread		Level 1		heals 61
		17197,	-- Gingerbread Cookie					heals 61
		1113,	-- Conjured Bread			Level 5		heals 243
		2683,	-- Crab Cake				Level 5		heals 243
		4541,	-- Freshly Baked Bread		Level 5		heals 243
		1114,	-- Conjured Rye				Level 15	heals 552
		4542,	-- Moist Cornbread			Level 15	heals 552
		1487,	-- Conjured Pumpernickel	Level 25	heals 874
		4544,	-- Mulgore Spice Bread 		Level 25	heals 874
		16169,	-- Wild Ricecake 			Level 25	heals 874
		8075,	-- Conjured Sourdough		Level 35	heals 1392
		4601,	-- Soft Banana Bread		Level 35	heals 1392
		8076,	-- Conjured Sweet Roll		Level 45	heals 2148
		23160,	-- Friendship Bread			Level 45	heals 2148
		8950,	-- Homemade Cherry Pie 		Level 45	heals 2148
		22895,	-- Conjured Cinnamon Roll	Level 55	heals 3180
};
AutoBar_Category_Info["FOOD_PET_CHEESE"].items = {
		2070,	-- Darnassian Bleu			Level 1, heals 61
		414,	-- Dalaran Sharp			Level 5, heals 243
		422,	-- Dwarven Mild				Level 15, heals 552
		1707,	-- Stormwind Brie 			Level 25, heals 874
		3927,	-- Fine Aged Cheddar		Level 35, heals 1392
		8932,	-- Alterac Swiss 			Level 45, heals 2148
};
AutoBar_Category_Info["FOOD_PET_FISH"].items = {
		6303,	-- Raw Slitherskin Mackerel			Level 0		30
		6291,	-- Raw Brilliant Smallfish			Level 0		30
		6290,	-- Brilliant Smallfish				Level 0		61
		6361,	-- Raw Rainbow Fin Albacore			Level 5		61
		6289,	-- Raw Longjaw Mud Snapper			Level 5		61
		787,	-- Slitherskin Mackerel				Level 1		61
		6316,	-- Loch Frenzy Delight				Level 5		243
		5095,	-- Rainbow Fin Albacore				Level 5		243
		4592,	-- Longjaw Mud Snapper				Level 5		243
		6308,	-- Raw Bristle Whisker Catfish		Level 15	243
		2682,	-- Cooked Crab Claw					Level 5		294
		5526,	-- Clam Chowder						Level 10	552
		4593,	-- Bristle Whisker Catfish			Level 15	552
		16170,	-- Steamed Mandu					Level 15	552
		6362,	-- Raw Rockscale Cod				Level 25	552
		8365,	-- Raw Mithril Head Trout			Level 25	552
		13754,	-- Raw Glossy Mightfish				Level 35	874
		4594,	-- Rockscale Cod					Level 25	874
		8364,	-- Mithril Head Trout				Level 25	874
		13758,	-- Raw Redgill						Level 35	874
		13760,	-- Raw Sunscale Salmon				Level 35	874
		13756,	-- Raw Summer Bass					Level 35	874
		4603,	-- Raw Spotted Yellowtail			Level 35	874
		13546,	-- Bloodbelly Fish					Level 25	1392
		13893,	-- Large Raw Mightfish				Level 45	1392
		8959,	-- Raw Spinefin Halibut				Level 45	1392
		13930,	-- Filet of Redgill					Level 35	1392
		6887,	-- Spotted Yellowtail				Level 35	1392
		16766,	-- Undermine Clam Chowder			Level 35	1392
		13888,	-- Darkclaw Lobster					Level 45	1392
		13933,	-- Lobster Stew						Level 45	2148
		8957,	-- Spinefin Halibut					Level 45	2148
		13935,	-- Baked Salmon						Level 45	2148
};
AutoBar_Category_Info["FOOD_PET_FRUIT"].items = {
		4536,	-- Shiny Red Apple					Level 1		61
		4537,	-- Tel'Abim Banana					Level 5		243
		4538,	-- Snapvine Watermelon				Level 15	552
		4539,	-- Goldenbark Apple 				Level 25	874
		4602,	-- Moon Harvest Pumpkin				Level 35	1392
		16168,	-- Heaven Peach						Level 35	1392
		8953,	-- Deep Fried Plantains				Level 45	2148
};
AutoBar_Category_Info["FOOD_PET_FUNGUS"].items = {
		4604,	-- Forest Mushroom Cap				Level 1		61
		4605,	-- Red-speckled Mushroom			Level 5		243
		4606,	-- Spongy Morel						Level 15	552
		4607,	-- Delicious Cave Mold				Level 25	874
		4608,	-- Raw Black Truffle 				Level 35	1392
		8948,	-- Dried King Bolete 				Level 45	2148
};
AutoBar_Category_Info["FOOD_PET_MEAT"].items = {
		4457,		--	Barbecued Buzzard Wing
		117,	-- Tough Jerky						Level 1		61
		3173,		--	Bear Meat
		2888,		--	Beer Basted Boar Ribs
		2679,	-- Charred Wolf Meat		-- Cooking - Level 1, heals 61
		2681,	-- Roasted Boar Meat		-- Cooking - Level 1, heals 61
		3730,		--	Big Bear Meat
		3726,		--	Big Bear Steak
		3220,		--	Blood Sausage
		2677,		--	Boar Ribs
		3404,		--	Buzzard Wing
		12213,	--	Carrion Surprise
		769,		--	Chunk of Boar Meat
		2673,		--	Coyote Meat
		1081,		--	Crisp Spider Meat
		12224,	--	Crispy Bat Wing
		5479,		--	Crispy Lizard Tail
		2924,		--	Crocolisk Meat
		3662,		--	Crocolisk Steak
		17119,	--	Deeprun Rat Kabob
		5051,		--	Dig Rat
		12217,	--	Dragonbreath Chili
		2687,		--	Dry Pork Ribs
		9681,		--	Grilled King Crawler Legs
		12204,	--	Heavy Kodo Meat
		3727,		--	Hot Lion Chops
		13851,	--	Hot Wolf Ribs
		12212,	--	Jungle Stew
		5472,		--	Kaldorei Spider Kabob
		5467,		--	Kodo Meat
		5480,		--	Lean Venison
		1015,		--	Lean Wolf Flank
		12209,	--	Lean Wolf Steak
		3731,		--	Lion Meat
		12223,	--	Meaty Bat Wing
		12037,	--	Mystery Meat
		4739,		--	Plainstrider Meat
		12184,	--	Raptor Flesh
		13759,	--	Raw Nightfin Snapper
		12203,	--	Red Wolf Meat
		12210,	--	Roast Raptor
		5474,		--	Roasted Kodo Meat
		1017,		--	Seasoned Wolf Kabob
		5465,		--	Small Spider Leg
		3729,		--	Soothing Turtle Bisque
		2680,	-- Spiced Wolf Meat			-- Cooking
		17222,	--	Spider Sausage
		5471,	--	Stag Meat
		2287,	-- Haunch of Meat			-- Vendor  - Level 5, heals 243
		6890,	-- Smoked Bear Meat			-- Cooking - Level 5, heals 243
		5469,	-- Strider Meat
		5477,	-- Strider Stew
		2672,	-- Stringy Wolf Meat
		3728,	-- Tasty Lion Steak
		3667,	-- Tender Crocolisk Meat
		12208,	-- Tender Wolf Meat
		18045,	-- Tender Wolf Steak
		5470,	-- Thunder Lizard Tail
		12202,	-- Tiger Meat
		2684,	-- Coyote Steak				-- Cooking
		5473,	-- Scorpid Surprise			-- Cooking - Level 1, heals 294
		733,	-- Westfall Stew			-- Cooking - Level 5, heals 552
		3770,	-- Mutton Chop				-- Vendor  - Level 15, heals 552
		5478,	-- Dig Rat Stew				-- Cooking - Level 10, heals 552
		2685,	-- Succulent Pork Ribs		-- Cooking - Level 10, heals 552
		3771,	-- Wild Hog Shank 			-- Vendor  - Level 25, heals 874
		3712,	-- Turtle Meat
		12205,	-- White Spider Meat
		4599,	-- Cured Ham Steak 			-- Vendor  - Level 35, heals 1392
		16171,	-- Shinsollo				-- Vendor  - Level 45, heals 2148
		8952,	-- Roasted Quail 			-- Vendor  - Level 45, heals 2148
};
AutoBar_Category_Info["DRINK_STAMINA"].items = {
		17048,	-- Rumsey Rum
		20709,	-- Rumsey Rum Light	
		21114,	-- Rumsey Rum Dark
		21151, 	-- rumsey rum black label
};
AutoBar_Category_Info["FOOD_STAMINA"].items = {
		6888,	-- Herb Baked Egg	-- Cooking - Level 1, heals 61, stamina/spirit
		12224,	-- Crispy Bat Wing	-- Cooking - Level 1, heals 61, stamina/spirit
		7808,	-- Chocolate Square	-- heals 61, 2 stamina/spirit
		17197,	-- Gingerbread Cookie	-- Cooking - Level 1, heals 61, stamina/spirit
		17198,	-- Egg Nog		-- Cooking - Level 1, heals 61, stamina/spirit
		5472,	-- Kaldorei Spider Kabo	-- Cooking - Level 1, heals 61, with bonus
		2888,	-- Beer Basted Boar Rib	-- Cooking - Level 1, heals 61, with bonus
		5474,	-- Roasted Kodo Meat	-- Cooking - Level 1, heals 61, stamina/spirit
		11584,	-- Cactus Apple Surpris	-- Quest   - Level 1, heals 61, with bonus
		5476,	-- Fillet of Frenzy	-- Cooking - Level 5, heals 243, with bonus
		5477,	-- Strider Stew		-- Cooking - Level 5, heals 243, stamina/spirit
		724,	-- Goretusk Liver Pieo	-- Cooking - Level 5, heals 243, with bonus
		3220,	-- Blood Sausageo	-- Cooking - Level 5, heals 243, with bonus
		3662,	-- Crocolisk Steako	-- Cooking - Level 5, heals 243, with bonus
		2687,	-- Dry Pork Ribso	-- Cooking - Level 5, heals 243, stamina/spirit
		5525,	-- Boiled Clams		-- Cooking - Level 5, heals 243, stamina/spirit
		1082,	-- Redridge Goulash	-- Cooking - Level 10, heals 552, with bonus
		5479,	-- Crispy Lizard Tail	-- Cooking - Level 12, heals 552, stamina/spirit
		1017,	-- Seasoned Wolf Kabob	-- Cooking - Level 15, heals 552, with bonus
		3663,	-- Murloc Fin Soup	-- Cooking - Level 15, heals 552, with bonus
		3726,	-- Big Bear Steak	-- Cooking - Level 15, heals 552, stamina/spirit
		5480,	-- Lean Venison		-- Cooking - Level 15, heals 552, stamina/spirit
		3666,	-- Gooey Spider Cake	-- Cooking - Level 15, heals 552, with bonus
		3664,	-- Crocolisk Gumbo	-- Cooking - Level 15, heals 552, with bonus
		5527,	-- Goblin Deviled Clams	-- Cooking - Level 15, heals 552, stamina/spirit
		3727,	-- Hot Lion Chops	-- Cooking - Level 15, heals 552, stamina/spirit
		12209,	-- Lean Wolf Steak	-- Cooking - Level 15, heals 552, with bonus
		3665,	-- Curiously Tasty Omel	-- Cooking - Level 15, heals 552, stamina/spirit
		3728,	-- Tasty Lion Steak	-- Cooking - Level 20, heals 874, with bonus
		4457,	-- Barbecued Buzzard Win-- Cooking - Level 25, heals 874, stamina/spirit
		12213,	-- Carrion Surprise	-- Cooking - Level 25, heals 874, stamina/spirit
		6038,	-- Giant Clam Corcho	-- Cooking - Level 25, heals 874, stamina/spirit
		3729,	-- Soothing Turtle Bisqu-- Cooking - Level 25, heals 874, stamina/spirit
		13851,	-- Hot Wolf Ribs	-- Cooking - Level 25, heals 874, with bonus
		12214,	-- Mystery Stew		-- Cooking - Level 25, heals 874, with bonus
		12210,	-- Roast Raptor		-- Cooking - Level 25, heals 874, stamina/spirit
		12212,	-- Jungle Stew		-- Cooking - Level 25, heals 874, stamina/spirit
		13929,	-- Hot Smoked Bass	-- Cooking - Level 35, heals 874, with bonus
		17222,	-- Spider Sausage 	-- Cooking - Level 35, heals 1392, stamina/spirit
		12215,	-- Heavy Kodo Stew	-- Cooking - Level 35, heals 1392, stamina/spirit
		13927,	-- Cooked Glossy Mightfi-- Cooking - Level 35, heals 1392, stamina
		12216,	-- Spider Chilli Crab	-- Cooking - Level 35, heals 1392, stamina/spirit
		12218,	-- Monster Omlette	-- Cooking - Level 40, heals 1392, stamina/spirit
		16971,	-- Clamlette Surprise 	-- Cooking - Level 40, heals 1392, with bonus
		18045,	-- Tender Wolf Steak	-- Cooking - Level 40, heals 1392, stamina/spirit
		13934,	-- Mightfish Steak	-- Cooking - Level 45, heals 1933, stamina
		11950,	-- Windblossom Berries	-- Felwood - Level 45, heals 1933, stamina/spirit
		21023,	-- Dirge's Kickin' Chimaerok Chops	-- Cooking - Level 55, heals 2250, 25 stamina
		51717,	-- Hardened Mushroom -- Survival - Level 55, heals 2250, 25 stamina
};
AutoBar_Category_Info["FOOD_AGILITY"].items = {
		13928,	-- Grilled Squid	-- Cooking - Level 35, heals 874, agility
		51711,	-- Sweet Mountain Berry			-- Survival - Level 35, heals 874, +10 agility
		60976, 	-- Danonzo's Tel'Abim Surprise	-- Cooking - Level 55, heals 3186, +45 rAP
		60978, 	-- Danonzo's Tel'Abim Medley	-- Cooking - Level 55, heals 3186, +2% haste
};
AutoBar_Category_Info["FOOD_MANAREGEN"].items = {
		21072,	-- Smoked Sagefish	-- Cooking - Level 10, heals 378, mana 567, 3/5 mana regen
		21217,	-- Sagefish Delight	-- Cooking - Level 30, heals 840, mana 1260, 6/5 mana regen
		13931,	-- Nightfin Soup	-- Cooking - Level 35, heals 874, 8/5 mana regen
};
AutoBar_Category_Info["FOOD_HPREGEN"].items = {
		13932,	-- Poached Sunscale Salmon	-- Cooking - Level 35, heals 874, hp regen
};
AutoBar_Category_Info["FOOD_STRENGTH"].items = {
		13810,	-- Blessed Sunfruit -- AD - Level 45, heals 1933, strength
		20452,	-- Smoked Desert Dumpling	-- Level 45, heals 2148, str bonus
		61720,	-- Power Mushroom			-- Survival -- Level 55, heals 2148, +20 str bonus
};
AutoBar_Category_Info["FOOD_INTELLIGENCE"].items = {
		18254,	-- Runn Tum Tuber Surpris	-- int bonus
		51718,	-- Juicy Striped Melon		-- Survival - Level 45, heals 1933, stamina
};
AutoBar_Category_Info["FOOD_SPELLPOWER"].items = {
		84041,	-- Gilneas Hot Stew +12spd
		60977,  -- Danonzo's Tel'Abim Delight +22spd
};

AutoBar_Category_Info["SHARPENINGSTONES"].items = {
		23122,	-- Consecrated Sharpening Stone
		2862,	-- Rough Sharpening Stone
		2863,	-- Coarse Sharpening Stone
		2871,	-- Heavy Sharpening Stone
		7964,	-- Solid Sharpening Stone
		12404,	-- Dense Sharpening Stone
		18262,	-- Elemental Sharpening Stone
};
AutoBar_Category_Info["WEIGHTSTONE"].items = {
		3239,	-- Rough Weightstone
		3240,	-- Coarse Weightstone
		3241,	-- Heavy Weightstone
		7965,	-- Solid Weightstone
		12643,	-- Dense Weightstone
};
AutoBar_Category_Info["POISON-CRIPPLING"].items = {
		3775,	-- Crippling Poison
		3776,	-- Crippling Poison II
};
AutoBar_Category_Info["POISON-DEADLY"].items = {
		2892,	-- Deadly Poison
		2893,	-- Deadly Poison II
		8984,	-- Deadly Poison III
		8985,	-- Deadly Poison IV
		20844,	-- Deadly Poison V
};
AutoBar_Category_Info["POISON-INSTANT"].items = {
		6947,	-- Instant Poison
		6949,	-- Instant Poison II
		6950,	-- Instant Poison III
		8926,	-- Instant Poison IV
		8927,	-- Instant Poison V
		8928,	-- Instant Poison VI
};
AutoBar_Category_Info["POISON-MINDNUMBING"].items = {
		5237,	-- Mind-numbing Poison
		6951,	-- Mind-numbing Poison II
		9186,	-- Mind-numbing Poison III
};
AutoBar_Category_Info["POISON-WOUND"].items = {
		10918,	-- Wound Poison
		10920,	-- Wound Poison II
		10921,	-- Wound Poison III
		10922,	-- Wound Poison IV
};
AutoBar_Category_Info["EXPLOSIVES"].items = {
		4358,	-- Rough Dynamite
		4360,	-- Rough Copper Bomb
		4365,	-- Coarse Dynamite
		4370,	-- Large Copper Bomb
		6714,	-- EZ-Thro Dynamite
		4374,	-- Small Bronze Bomb
		4378,	-- Heavy Dynamite
		4380,	-- Big Bronze Bomb
		10507,	-- Solid Dynamite
		4390,	-- Iron Grenade
		4403,	-- Portable Bronze Mortar
		4394,	-- Big Iron Bomb
		18588,	-- EZ-Thro Dynamite II
		10514,	-- Mithril Frag Bomb
		10586,	-- The Big One
		10562,	-- Hi-Explosive Bomb
		18641,	-- Dense Dynamite
		15993,	-- Thorium Grenade
		16005,	-- Dark Iron Bomb
		16040,	-- Arcane Bomb
};
AutoBar_Category_Info["WARSONG_BANDAGES"].items = {
		19068,	-- Warsong Gulch Silk Bandage
		19067,	-- Warsong Gulch Mageweave Bandage
		19066,	-- Warsong Gulch Runecloth Bandage
};
AutoBar_Category_Info["ARATHI_BANDAGES"].items = {
		20067,	-- Arathi Basin Silk Bandage
		20244,	-- Highlander's Silk Bandage
		20235,	-- Defiler's Silk Bandage
		20065,	-- Arathi Basin Mageweave Bandage
		20237,	-- Highlander's Mageweave Bandage
		20232,	-- Defiler's Mageweave Bandage
		20066,	-- Arathi Basin Runecloth Bandage
		20243,	-- Highlander's Runecloth Bandage
		20234,	-- Defiler's Runecloth Bandage
};
AutoBar_Category_Info["MANA_OIL"].items = {
		20745, 	-- Minor Mana Oil 4mana/5sec
		20747, 	-- Lesser Mana Oil 8mana/5sec
		20748,	-- Brilliant Mana Oil 12mana/5sec
};
AutoBar_Category_Info["WIZARD_OIL"].items = {
		23123,	-- Blessed Wizard Oil +60 vs undead
		20744,	-- Minor Wizard Oil +8 spell damage
		20746,	-- Lesser Wizard Oil +16 spell damage
		20750, 	-- Wizard Oil +24 spell damage
		20749, 	-- Brilliant Wizard Oil +36 spell damage
};
AutoBar_Category_Info["MOUNTS_TROLL"].items = {
		8588,	-- Emerald Raptor
		8591,	-- Turquoise Raptor
		8592,	-- Violet Raptor
		8586,	-- Elite: Red Raptor
		13317,	-- Elite: Ivory Raptor
		18788,	-- Elite: Swift Blue Raptor
		18789,	-- Elite: Swift Olive Raptor
		18790,	-- Elite: Swift Orange Raptor
		18246,	-- Elite: PVP: Black War Raptor
};
AutoBar_Category_Info["MOUNTS_ORC"].items = {
		1132, 	-- Timber Wolf
		5665,	-- Dire Wolf
		5668,	-- Brown Wolf
		12330, 	-- Elite: Red Wolf
		12351, 	-- Elite: Arctic Wolf
		18796, 	-- Elite: Swift Brown Wolf
		18797,	-- Elite: Swift Timber Wolf
		18798,	-- Elite: Swift Gray Wolf
		18245,	-- Elite: PVP: Black War Wolf
};
AutoBar_Category_Info["MOUNTS_UNDEAD"].items = {
		13331,	-- Red Skeletal Horse
		13332,	-- Blue Skeleton Horse
		13333,	-- Brown Skeletal Horse
		13334, 	-- Elite: Green Skeletal Warhorse
		18791,	-- Elite: Purple Skeletal Warhorse
		18248,	-- Elite: PVP: Red Skeletal Warhorse
};
AutoBar_Category_Info["MOUNTS_TAUREN"].items = {
		15277, 	-- Gray Kodo
		15290,	-- Brown Kodo
		15292,  -- Elite: Green Kodo
		15293,  -- Elite: Teal Kodo
		18793,	-- Elite: Great White Kodo
		18794,	-- Elite: Great Brown Kodo
		18795,	-- Elite: Great Grey Kodo
		18247,	-- Elite: PVP: Black War Kodo
};
AutoBar_Category_Info["MOUNTS_HUMAN"].items = {
		2414, 	-- Pinto
		2411,	-- Black Stallion
		5655,	-- Chestnut Mare
		5656,	-- Brown Horse
		12353,  -- Elite: White Stallion
		12354,  -- Elite: Palamino Bridle
		18776,	-- Elite: Swift Palamino
		18777,	-- Elite: Swift Brown Steed
		18778,	-- Elite: Swift White Steed
		18241,	-- Elite: PVP: Black War Steed
};
AutoBar_Category_Info["MOUNTS_NIGHTELF"].items = {
		8628,	-- Spotted Nightsaber,
		8629,	-- Striped Nightsaber
		8631,	-- Striped Frostsaber
		8632,	-- Spotted Frostsaber
		12302,  -- Elite: Frostsaber
		12303,  -- Elite: Nightsaber
		18766,	-- Elite: Swift Frostsaber
		18767,	-- Elite: Swift Mistsaber
		18902,	-- Elite: Swift Stormsaber
		13086,	-- Elite: Winterspring Frostsaber
		18242,	-- Elite: PVP: Black War Tiger
};
AutoBar_Category_Info["MOUNTS_DWARF"].items = {
		5864,	-- Gray Ram
		5872,	-- Brown Ram
		5873,	-- White Ram
		13328,  -- Elite: Black Ram
		13329,  -- Elite: Frost Ram
		18785,	-- Elite: Swift White Ram
		18786,	-- Elite: Swift Brown Ram
		18787,	-- Elite: Swift Gray Ram
		18244,	-- Elite: PVP: Black War Ram
};
AutoBar_Category_Info["MOUNTS_GNOME"].items = {
		8563,	-- Red Mechanostrider
		8595,	-- Blue Mechanostrider
		13321,	-- Green Mechanostrider
		13326,  -- White Mechanostrider
		13322,	-- Unpainted Mechanostrider
		13327,  -- Icy Blue Mechanostrider
		18772,	-- Swift Green Mechanostrider
		18773,	-- Swift White Mechanostrider
		18774,	-- Swift Yellow Mechanostrider
		18243,	-- Elite: PVP: Black Battlestrider
};
AutoBar_Category_Info["MOUNTS_SPECIAL"].items = {
		19029,	-- Elite: AV: Horn of the Frostwolf Howler
		19030,	-- Elite: AV: Stormpike Battle Charger
		19872,	-- Elite: ZG: Swift Razzashi Raptor
		19902,	-- Elite: ZG: Swift Zulian Tiger
		13335,  -- Deathcharger's Reins
};
AutoBar_Category_Info["MOUNTS_QIRAJI"].items = {
		21218,	-- Blue Qiraji Resonating Crystal
		21324,	-- Yellow Qiraji Resonating Crystal
		21323,	-- Green Qiraji Resonating Crystal
		21321,	-- Red Qiraji Resonating Crystal
		21176,	-- Black Qiraji Resonating Crystal
};
