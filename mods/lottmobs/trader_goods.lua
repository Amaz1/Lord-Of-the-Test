local MP = minetest.get_modpath(
    minetest.get_current_modname(
    )
)

local S, NS = dofile(
    MP .. "/intllib.lua"
)

--Item table format:
--{thing selling, price (in gold ingots), chance that it won't appear in the trader's inventory}

lottmobs.dwarf = {
	items = {
		{"lottthrowing:crossbow_silver 1", "default:gold_ingot 9", 15},
		{"lottarmor:chestplate_mithril 1", "default:gold_ingot 75", 50},
		{"default:steel_ingot 99", "default:gold_ingot 25", 12},
		{"lottores:silversword 1", "default:gold_ingot 7", 10},
		{"default:bronze_ingot 25", "default:gold_ingot 5", 15},
		{"lottblocks:small_lamp_pine 6", "default:gold_ingot 2", 6},
		{"lottblocks:dwarf_harp 1", "default:gold_ingot 15", 10},
		{"lottweapons:mithril_dagger 1", "default:gold_ingot 15", 20},
		{"lottores:mithrilsword 1", "default:gold_ingot 35", 30},
		{"default:sword_steel 1", "default:gold_ingot 5", 10},
		{"lottweapons:silver_battleaxe 1", "default:gold_ingot 10", 18},
		{"lottblocks:dwarfstone_stripe 50", "default:gold_ingot 17", 12},
		{"lottblocks:dwarfstone_black 99", "default:gold_ingot 33", 17},
		{"default:stonebrick 99", "default:gold_ingot 25", 14},
		{"lottblocks:dwarfstone_white 99", "default:gold_ingot 33", 17},
	},
	items_race = {
		{"lottthrowing:crossbow_silver 1", "default:gold_ingot 7", 15},
		{"lottarmor:chestplate_mithril 1", "default:gold_ingot 72", 50},
		{"default:steel_ingot 99", "default:gold_ingot 22", 12},
		{"lottores:silversword 1", "default:gold_ingot 5", 10},
		{"default:bronze_ingot 25", "default:gold_ingot 4", 15},
		{"lottblocks:small_lamp_pine 6", "default:gold_ingot 2", 6},
		{"lottblocks:dwarf_harp 1", "default:gold_ingot 12", 10},
		{"lottweapons:mithril_dagger 1", "default:gold_ingot 14", 20},
		{"lottores:mithrilsword 1", "default:gold_ingot 32", 30},
		{"default:sword_steel 1", "default:gold_ingot 4", 10},
		{"lottweapons:silver_battleaxe 1", "default:gold_ingot 9", 18},
		{"lottblocks:dwarfstone_stripe 50", "default:gold_ingot 14", 12},
		{"lottblocks:dwarfstone_black 99", "default:gold_ingot 30", 17},
		{"default:stonebrick 99", "default:gold_ingot 22", 14},
		{"lottblocks:dwarfstone_white 99", "default:gold_ingot 30", 17},
	},
	names = {
		"Azaghâl", "Balbrin", "Borin", "Farin", "Flói", "Frerin",
		"Grór", "Lóni", "Náli", "Narvi", "Telchar", "Thion", "Thorin",
		"Bifur", "Balin", "Bofur", "Bombur", "Dori", "Dwalin", "Nori",
		"Ori", "Gimli", "Gamil"
	},
	messages = {
		S("We have many treasures, and for the right price we might be willing to part with them..."),
		S("Don't even think of stealing our treasure... If you do, heads shall roll."),
		S("What are you doing here? What do you want from us?"),
		S("Be careful when you enter our homes, a fall from the ladder could well prove deadly."),
		S("If you want to mine, do so. There's plenty of iron to go around!"),
		S("If you venture deep underground, beware! The monsters there are very powerful, and kill the unprepared instantly."),
		S("Mines of Moria, where all our riches are! Mines of Moria, where our greed led to destruction."),
		S("We can’t bring a troll to the fire, but we can bring the fire to the troll."),
		S("Never turn down an ale, who knows if it may be your last..."),
		S("Guard your life, guard your gold, guard your beard. In that order."),
		S("Wherever there are elves, there are lies."),
		S("The Humans have a saying. The nail that sticks out gets hammered. We have a saying too. Shoddy work! Not a single nail should be sticking out."),
		S("You can kill a dwarf, but you can never vanquish one."),
		S("It is easy to fool a goblin, but even easier to kill one."),
		S("The best place to hide something precious is in your beard."),
		S("Evil breeds in the guts of the lazy."),
		S("The stones will sing if you let them."),
		S("Drinking contests with humans are unbearable. They drink, they collapse, \nand we have to drag them back to their homes. The next day they never remember losing."),
		S("A spear is not a dwarven weapon, but it will kill all the same."),
	}
}

lottmobs.elf = {
	items = {
		{"lottplants:mallorntree 10", "default:gold_ingot 4", 5},
		{"lottores:rough_rock 4", "default:gold_ingot 30", 17},
		{"lottblocks:elf_torch 10", "default:gold_ingot 20", 15},
		{"lottweapons:galvorn_spear 1", "default:gold_ingot 25", 20},
		{"lottweapons:silver_battleaxe 1", "default:gold_ingot 18", 14},
		{"lottores:galvornsword 1", "default:gold_ingot 23", 25},
		{"lottplants:elanor 10", "default:gold_ingot 2", 22},
		{"lottarmor:chestplate_galvorn 1", "default:gold_ingot 40", 25},
		{"lottarmor:helmet_galvorn 1", "default:gold_ingot 30", 25},
		{"lottarmor:boots_galvorn 1", "default:gold_ingot 25", 25},
		{"lottarmor:leggings_galvorn 1", "default:gold_ingot 35", 25},
		{"lottplants:niphredil 12", "default:gold_ingot 3", 14},
		{"lottblocks:mallorn_pillar 30", "default:gold_ingot 7", 4},
		{"lottplants:mallornsapling 3", "default:gold_ingot 2", 17},
		{"default:goldblock " .. math.random(8, 10), "lottores:pearl 9", 25},
	},
	items_race = {
		{"lottplants:mallorntree 10", "default:gold_ingot 4", 5},
		{"lottores:rough_rock 4", "default:gold_ingot 28", 17},
		{"lottblocks:elf_torch 10", "default:gold_ingot 18", 15},
		{"lottweapons:galvorn_spear 1", "default:gold_ingot 22", 20},
		{"lottweapons:silver_battleaxe 1", "default:gold_ingot 15", 14},
		{"lottores:galvornsword 1", "default:gold_ingot 21", 25},
		{"lottplants:elanor 10", "default:gold_ingot 2", 22},
		{"lottarmor:chestplate_galvorn 1", "default:gold_ingot 37", 25},
		{"lottarmor:helmet_galvorn 1", "default:gold_ingot 28", 25},
		{"lottarmor:boots_galvorn 1", "default:gold_ingot 23", 25},
		{"lottarmor:leggings_galvorn 1", "default:gold_ingot 32", 25},
		{"lottplants:niphredil 12", "default:gold_ingot 3", 14},
		{"lottblocks:mallorn_pillar 30", "default:gold_ingot 6", 4},
		{"lottplants:mallornsapling 3", "default:gold_ingot 2", 17},
		{"default:goldblock " .. math.random(8, 10), "lottores:pearl 9", 25},
	},
	names = {
		"Annael", "Anairë", "Curufin", "Erestor", "Gwindor", "Irimë",
		"Oropher", "Maglor", "Quennar", "Rúmil", "Orgof", "Voronwë",
		"Hinnoron", "Malton", "Bornor", "Landaer", "Nardchanar",
		"Delebon", "Gollorchanar", "Noron", "Preston", "Radhril",
		"Mistriel", "Ganis", "Mithes", "Loboril"
	},
	messages = {
		S("Welcome to our lovely forest home, weary traveler. Refresh yourself here."),
		S("Sauron grows in power. Shall we be able to vanquish him again?"),
		S("We are a peace loving people, but if we are angered, our wrath is terrible!"),
		S("Rest among us and prepare yourself, for war is imminent."),
		S("If you wish to buy goods from us, there are certain traders who wander our land."),
		S("Beware! Our society, and all societies, are on the edge of a knife blade - one false move and all will end, and Sauron will rule supreme."),
		"Êl síla erin lû e-govaned vîn.",
		S("It is perilous to study too deeply the arts of the Enemy, for good or for ill. But such falls and betrayals, alas, have happened before."),
		S("Do not meddle in the affairs of Wizards, for they are subtle and quick to anger."),
		S("The praise of the praiseworthy is above all rewards."),
		S("The old that is strong does not wither, deep roots are not reached by the frost."),
		S("I will not say 'do not weep,' for not all tears are an evil."),
		S("For even the very wise cannot see all ends."),
		S("Faithless is he who says farewell when the road darkens."),
		"Aa' lasser en lle coia orn n' omenta gurtha.",
		S("Sweet water and light laughter till next we meet."),
		"Aa' menealle nauva ar' malta.",
		S("May the wind fill your sails."),
		S("Do not scorn pity that is the gift of a gentle heart, Éowyn!"),
		S("Someone else always has to carry on the story."),
	}
}

lottmobs.hobbit = {
	items = {
		{"lottfarming:pipe 1", "default:gold_ingot 2", 5},
		{"lottfarming:pipeweed_cooked 50", "default:gold_ingot 17", 10},
		{"lottpotion:beer " .. math.random(5, 15), "default:gold_ingot 7", 8},
		{"lottpotion:cider " .. math.random(10, 20), "default:gold_ingot 11", 13},
		{"lottpotion:wine " .. math.random(5, 10), "default:gold_ingot 18", 14},
		{"lottfarming:potato " .. math.random(25, 35), "default:gold_ingot 10", 22},
		{"lottfarming:brown_mushroom ".. math.random(40, 45), "default:gold_ingot 40", 25},
		{"lottfarming:corn_seed 12", "default:gold_ingot 30", 25},
		{"farming:hoe_bronze 1", "default:gold_ingot 25", 25},
		{"lottinventory:brewing_book 1", "default:gold_ingot 35", 25},
		{"lottfarming:barley_seed " .. math.random(5, 10), "default:gold_ingot 3", 14},
		{"lottfarming:berries " .. math.random(15, 20), "default:gold_ingot 7", 4},
		{"lottplants:firsapling 2", "default:gold_ingot 2", 17},
		{"default:apple " .. math.random(5, 20), "default:gold_ingot 10", 5},
		{"default:goldblock " .. math.random(9, 12), "lottores:pearl 9", 25},
	},
	items_race = {
		{"lottfarming:pipe 1", "default:gold_ingot 2", 5},
		{"lottfarming:pipeweed_cooked 50", "default:gold_ingot 14", 10},
		{"lottpotion:beer " .. math.random(5, 15), "default:gold_ingot 5", 8},
		{"lottpotion:cider " .. math.random(10, 20), "default:gold_ingot 9", 13},
		{"lottpotion:wine " .. math.random(5, 10), "default:gold_ingot 16", 14},
		{"lottfarming:potato " .. math.random(25, 35), "default:gold_ingot 7", 22},
		{"lottfarming:brown_mushroom ".. math.random(40, 45), "default:gold_ingot 35", 25},
		{"lottfarming:corn_seed 12", "default:gold_ingot 27", 25},
		{"farming:hoe_bronze 1", "default:gold_ingot 22", 25},
		{"lottinventory:brewing_book 1", "default:gold_ingot 32", 25},
		{"lottfarming:barley_seed " .. math.random(5, 10), "default:gold_ingot 3", 14},
		{"lottfarming:berries " .. math.random(15, 20), "default:gold_ingot 6", 4},
		{"lottplants:firsapling 2", "default:gold_ingot 2", 17},
		{"default:apple " .. math.random(5, 20), "default:gold_ingot 8", 5},
		{"default:goldblock " .. math.random(9, 12), "lottores:pearl 9", 25},
	},
	names = {
		"Adalgrim", "Bodo", "Cotman", "Doderic", "Falco", "Gormadoc",
		"Hobson", "Ilberic", "Largo", "Madoc", "Orgulas", "Rorimac"
	},
	messages = {
		S("Ah, what a lovely land we have, so peaceful, so beautiful."),
		S("There's nothing quite like the smell of pipe smoke rising on a cold October morning, is there?"),
		S("If you are in need of any food, there are traders who wander around and they usually have a good stock."),
		S("If you are thinking that you'll find adventures here, think again! Good day!"),
		S("We hear tales of war, but they cannot be more than tales - like that of the Oliphaunt."),
		S("Go not to the Elves for counsel, for they will say both no and yes."),
		S("Food is meant to be enjoyed, not rushed. Don't just eat a little here and a little there, sit down for a proper meal sometimes..."),
	}
}

lottmobs.human = {
	items = {
		{"default:sandstone 40", "default:gold_ingot 10", 12},
		{"boats:sail_boat 1", "default:gold_ingot 4", 14},
		{"lottarmor:shield_bronze 1", "default:gold_ingot 20", 20},
		{"farming:bread 12", "default:gold_ingot 2", 5},
		{"lottblocks:marble_brick 35", "default:gold_ingot 12", 10},
		{"default:desert_stone 30", "default:gold_ingot 8", 12},
		{"lottblocks:lamp_alder 5", "default:gold_ingot 4", 8},
		{"lottarmor:chestplate_bronze 1", "default:gold_ingot 30", 30},
		{"lottarmor:boots_bronze 1", "default:gold_ingot 12", 18},
		{"lottblocks:lamp_lebethron 7", "default:gold_ingot 6", 11},
		{"lottblocks:door_alder 6", "default:gold_ingot 2", 18},
		{"lottores:marble 99", "default:gold_ingot 33", 18},
		{"lottarmor:helmet_bronze 1", "default:gold_ingot 20", 24},
		{"default:brick 30", "default:gold_ingot 10", 17},
		{"lottarmor:leggings_bronze 1", "default:gold_ingot 25", 34},
	},
	items_race = {
		{"default:sandstone 40", "default:gold_ingot 8", 12},
		{"boats:sail_boat 1", "default:gold_ingot 3", 14},
		{"lottarmor:shield_bronze 1", "default:gold_ingot 18", 20},
		{"farming:bread 12", "default:gold_ingot 2", 5},
		{"lottblocks:marble_brick 35", "default:gold_ingot 11", 10},
		{"default:desert_stone 30", "default:gold_ingot 7", 12},
		{"lottblocks:lamp_alder 5", "default:gold_ingot 3", 8},
		{"lottarmor:chestplate_bronze 1", "default:gold_ingot 27", 30},
		{"lottarmor:boots_bronze 1", "default:gold_ingot 10", 18},
		{"lottblocks:lamp_lebethron 7", "default:gold_ingot 5", 11},
		{"lottblocks:door_alder 6", "default:gold_ingot 2", 18},
		{"lottores:marble 99", "default:gold_ingot 30", 18},
		{"lottarmor:helmet_bronze 1", "default:gold_ingot 18", 24},
		{"default:brick 30", "default:gold_ingot 9", 17},
		{"lottarmor:leggings_bronze 1", "default:gold_ingot 21", 34},
	},
	names = {
		"Aratan", "Arvegil", "Belegorn", "Celepharn", "Dúnhere", "Elatan",
		"Gilraen", "Írimon", "Minardil", "Oromendil", "Tarcil", "Vorondil"
	},
	messages = {
		S("War comes swiftly... We are preparing, but are we doing enough?"),
		S("The noble race of man rises in the world! Even the dwarves are starting to show interest in some of our goods."),
		S("Are you willing to fight with us? We have much to lose, but much to gain also! We must rally together."),
		S("Don't listen to those who say that all this talk of war will come to nothing, for we are at war now."),
		S("We suffer raids from orcs, and other evil things, yet we do nothing! We must act, and act with force!"),
		S("Life here is far from normal. We wish for peace, yet the only way we can get peace is through war..."),
	}
}
lottmobs.orc = {
        names = {
                "Azog", "Balcmeg", "Boldog", "Bolg", "Golfimbul", "Gorbag", "Gorgol",
                "Grishnákh", "Lagduf", "Lug", "Lugdush", "Mauhúr", "Muzgash", "Orcobal",
                "Othrod", "Radbug", "Shagrat", "Ufthak", "Uglúk"
        },
        messages = {
                S("DIE!!!"), S("Urrrrrrrrrrrrrghhhhhhhhhhhhhhhhhhh!!"),
                S("Arrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr!"), S("KILL! KILL! KILL!")
        },
}
