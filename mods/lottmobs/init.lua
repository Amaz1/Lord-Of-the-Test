lottmobs = {}
lottmobs.connected_player_names = {}
lottmobs.player_guards = {}

local file = io.open(minetest.get_worldpath().."/"..SAVEDIR.."/guard_hunger.txt", "r")
if file then
	lottmobs.player_guards = minetest.deserialize(file:read("*all"))
	file:close()
end

minetest.register_on_joinplayer(function(player)
                lottmobs.connected_player_names[player:get_player_name()] = true
end)

minetest.register_on_leaveplayer(function(player)
                lottmobs.connected_player_names[player:get_player_name()] = nil
end)

minetest.register_globalstep(function(dtime)
                lottmobs.do_guard_hunger(dtime)
end)

minetest.register_on_shutdown(function()
                lottmobs.save_guard_hunger()
end)


dofile(minetest.get_modpath("lottmobs").."/functions.lua")
dofile(minetest.get_modpath("lottmobs").."/craftitems.lua")
dofile(minetest.get_modpath("lottmobs").."/elves.lua")
dofile(minetest.get_modpath("lottmobs").."/dwarves.lua")
dofile(minetest.get_modpath("lottmobs").."/hobbits.lua")
dofile(minetest.get_modpath("lottmobs").."/horse.lua")
dofile(minetest.get_modpath("lottmobs").."/warg.lua")
dofile(minetest.get_modpath("lottmobs").."/trader_goods.lua")
dofile(minetest.get_modpath("lottmobs").."/trader.lua")
dofile(minetest.get_modpath("lottmobs").."/special_mobs.lua")
dofile(minetest.get_modpath("lottmobs").."/animals.lua")

-- Mobs


mobs:register_mob("lottmobs:ent", {
	type = "npc",
	race = "ents",
	hp_min = 50,
	hp_max = 70,
	collisionbox = {-0.5, 0, -0.5, 0.5, 5, 0.5},
	textures = {
		{"lottmobs_ent.png"},
	},
	visual_size = {x=3.5,y=3.5},
	visual = "mesh",
	mesh = "ent_model.x",
	view_range = 20,
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 1.5,
	armor = 100,
	damage = 5,
	drops = {
		{name = "default:sapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:aldersapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:applesapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:birchsapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:beechsapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:culumaldasapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:elmsapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:lebethronsapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:plumsapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:rowansapling",
		chance = 5,
		min = 1,
		max = 3,},
		{name = "lottplants:yavannamiresapling",
		chance = 250,
		min = 1,
		max = 1,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 60,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 17,
		stand_end = 17,
		walk_start = 10,
		walk_end = 80,
		run_start = 10,
		run_end = 80,
		punch_start = 1,
		punch_end = 1,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "mobs_yeti_death",
		attack = "default_punch2",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:ent", {"lottmapgen:fangorn_grass"}, 20, -1, 6000, 3, 31000)

mobs:register_mob("lottmobs:spider", {
	type = "monster",
	hp_min = 20,
	hp_max = 40,
	collisionbox = {-0.9, -0.01, -0.7, 0.7, 0.6, 0.7},
	textures = {
		{"lottmobs_spider.png"},
		{"lottmobs_spider_1.png"},
		{"lottmobs_spider_2.png"},
	},
	visual_size = {x=7,y=7},
	visual = "mesh",
	mesh = "spider_model.x",
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	armor = 200,
	damage = 3,
	drops = {
		{name = "farming:string",
		chance = 3,
		min = 1,
		max = 6,},
		{name = "wool:white",
		chance = 10,
		min = 1,
		max = 3,},
		{name = "lottmobs:meat_raw",
		chance = 5,
		min = 1,
		max = 2,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 1,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		punch_start = 50,
		punch_end = 90,
	},
	on_rightclick = function(self, clicker)
		local player_inv = clicker:get_inventory()
		local item = clicker:get_wielded_item()
		if item:get_name() == "vessels:glass_bottle" then
			if player_inv:room_for_item("main", 1) then
                item:take_item(1)
                player_inv:add_item("main", "lottmobs:spiderpoison")
            end
			clicker:set_wielded_item(item)
		end
	end,
	jump = true,
	sounds = {
		war_cry = "mobs_spider",
		death = "mobs_howl",
		attack = "mobs_oerkki_attack",
	},
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:spider", {"lottmapgen:mirkwood_grass"}, 20, -10, 6000, 3, 31000)

mobs:register_mob("lottmobs:rohan_guard", {
        type = "npc",
        race = "GAMEman",
	hp_min = 20,
	hp_max = 30,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	textures = {
		{"lottmobs_rohan_guard.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_rohan_guard_1.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_rohan_guard_2.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_rohan_guard_3.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
	},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	makes_footstep_sound = true,
	view_range = 12,
	walk_velocity = 2,
	run_velocity = 3.5,
	armor = 100,
	damage = 5,
	drops = {
		{name = "lottmobs:horseh1",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "default:bronze_ingot",
		chance = 7,
		min = 1,
		max = 5,},
		{name = "lottmobs:horsepeg1",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "lottmobs:horsearah1",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "default:steel_sword",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottores:galvornsword",
		chance = 35,
		min = 1,
		max = 1,},
		{name = "lottweapons:steel_spear",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottarmor:helmet_bronze",
		chance = 30,
		min = 1,
		max = 1,},
		{name = "lottarmor:chestplate_steel",
		chance = 27,
		min = 1,
		max = 1,},
		{name = "lottarmor:leggings_tin",
		chance = 25,
		min = 1,
		max = 1,},
		{name = "lottarmor:boots_bronze",
		chance = 30,
		min = 1,
		max = 1,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 10,
	light_damage = 0,
	attack_type = "dogfight",
	follow = "lottother:narya",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	on_rightclick = function(self, clicker)
		lottmobs.guard(self, clicker, "default:gold_ingot", "Rohan Guard", "human")
	end,
	do_custom = lottmobs.do_custom_guard,
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:rohan_guard", {"lottmapgen:rohan_grass"}, 20, -1, 6000, 3, 31000)
lottmobs.register_guard_craftitem("lottmobs:rohan_guard", "Rohan Guard", "lottmobs_rohan_guard_inv.png")

mobs:register_mob("lottmobs:gondor_guard", {
	type = "npc",
	race = "GAMEman",
	hp_min = 20,
	hp_max = 30,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	textures = {
		{"lottmobs_gondor_guard.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_gondor_guard_1.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_gondor_guard_2.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_gondor_guard_3.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
	},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	makes_footstep_sound = true,
	view_range = 12,
	walk_velocity = 2,
	run_velocity = 3.5,
	armor = 100,
	damage = 5,
	drops = {
		{name = "lottweapons:galvorn_warhammer",
		chance = 35,
		min = 1,
		max = 1,},
		{name = "default:steel_ingot",
		chance = 10,
		min = 2,
		max = 5,},
		{name = "lottweapons:galvorn_battleaxe",
		chance = 35,
		min = 1,
		max = 1,},
		{name = "default:steel_sword",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottplants:whitesapling",
		chance = 250,
		min = 1,
		max = 1,},
		{name = "lottweapons:steel_battleaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:steel_warhammer",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottarmor:helmet_steel",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:chestplate_steel",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:leggings_steel",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:boots_steel",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:helmet_galvorn",
		chance = 50,
		min = 1,
		max = 1,},
		{name = "lottarmor:chestplate_galvorn",
		chance = 50,
		min = 1,
		max = 1,},
		{name = "lottarmor:leggings_galvorn",
		chance = 50,
		min = 1,
		max = 1,},
		{name = "lottarmor:boots_galvorn",
		chance = 50,
		min = 1,
		max = 1,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	attack_type = "dogfight",
	follow = "lottother:narya",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	on_rightclick = function(self, clicker)
		lottmobs.guard(self, clicker, "default:gold_ingot", "Gondor Guard", "human")
	end,
	do_custom = lottmobs.do_custom_guard,
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:gondor_guard", {"lottmapgen:gondor_grass"}, 20, -1, 6000, 3, 31000)
lottmobs.register_guard_craftitem("lottmobs:gondor_guard", "Gondor Guard", "lottmobs_gondor_guard_inv.png")

mobs:register_mob("lottmobs:ithilien_ranger", {
	type = "npc",
        race = "GAMEman",
        hp_min = 25,
	hp_max = 40,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	textures = {
		{"lottmobs_ithilien_ranger.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_ithilien_ranger.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottclothes_cloak_ranger.png"},
		{"lottmobs_ithilien_ranger_1.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_ithilien_ranger_1.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottclothes_cloak_ranger.png"},
	},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	makes_footstep_sound = true,
	view_range = 16,
	walk_velocity = 2.5,
	run_velocity = 4,
	armor = 100,
	damage = 6,
	drops = {
		{name = "default:steel_ingot",
		chance = 10,
		min = 2,
		max = 5,},
		{name = "lottweapons:galvorn_battleaxe",
		chance = 50,
		min = 1,
		max = 1,},
		{name = "default:steel_sword",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:steel_spear",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:steel_dagger",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottclothes:cloak_ranger",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "lottclothes:cap_chetwood",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottclothes:jacket_chetwood",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottclothes:pants_chetwood",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottclothes:boots_chetwood",
		chance = 20,
		min = 1,
		max = 1,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	attack_type = "dogfight",
	follow = "lottother:narya",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	on_rightclick = function(self, clicker)
		lottmobs.guard(self, clicker, "default:gold_ingot", "Ithilien Ranger", "human")
	end,
	do_custom = lottmobs.do_custom_guard,
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:ithilien_ranger", {"lottmapgen:ithilien_grass"}, 20, -1, 6000, 3, 31000)
lottmobs.register_guard_craftitem("lottmobs:ithilien_ranger", "Ithilien Ranger", "lottmobs_ithilien_ranger_inv.png")

mobs:register_mob("lottmobs:dunlending", {
        type = "npc",
        race = "GAMEorc",
        hp_min = 17,
	hp_max = 27,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	textures = {
		{"lottmobs_dunlending.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_dunlending_1.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_dunlending_2.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_dunlending_3.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	armor = 200,
	run_velocity = 3,
	damage = 3,
	drops = {
		{name = "lottores:tinpick",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottores:tinaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottores:tinshovel",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottores:tinspear",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:tin_battleaxe",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "lottweapons:tin_spear",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "lottweapons:tin_warhammer",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "lottweapons:tin_dagger",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "lottarmor:helmet_tin",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:chestplate_tin",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:leggings_tin",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:boots_tin",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottmobs:dirty_trousers",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottmobs:dirty_shirt",
		chance = 10,
		min = 1,
		max = 1,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		lottmobs.guard(self, clicker, "default:gold_ingot", "Dunlending", "human")
	end,
        do_custom = lottmobs.do_custom_guard,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_barbarian_yell2",
		death = "mobs_barbarian_death",
		attack = "default_punch2",
	},
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:dunlending", {"lottmapgen:dunland_grass"}, 20, -1, 6000, 3, 31000)
lottmobs.register_guard_craftitem("lottmobs:dunlending", "Dunlending", "lottmobs_dunlending_inv.png")

local orc_armor = "lottarmor_chestplate_steel.png^lottarmor_leggings_steel.png^lottarmor_helmet_steel.png^lottarmor_boots_steel.png^lottarmor_shield_steel.png^[colorize:#00000055"

mobs:register_mob("lottmobs:orc", {
	type = "npc",
        race = "GAMEorc",
        hp_min = 15,
	hp_max = 35,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	textures = {
		{"lottmobs_orc.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_orc.png", orc_armor, "lottweapons_orc_sword.png", "lottarmor_trans.png"},
		{"lottmobs_orc.png", orc_armor, "lottweapons_orc_sword.png", "lottclothes_cloak_mordor.png"},
		{"lottmobs_orc_1.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_orc_1.png", orc_armor, "lottweapons_orc_sword.png", "lottarmor_trans.png"},
		{"lottmobs_orc_1.png", orc_armor, "lottweapons_orc_sword.png", "lottclothes_cloak_mordor.png"},
		{"lottmobs_orc_2.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_orc_2.png", orc_armor, "lottweapons_orc_sword.png", "lottarmor_trans.png"},
		{"lottmobs_orc_2.png", orc_armor, "lottweapons_orc_sword.png", "lottclothes_cloak_mordor.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1.5,
	armor = 200,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "bones:bone",
		chance = 5,
		min = 1,
		max = 2,},
		{name = "lottmobs:meat_raw",
		chance = 7,
		min = 1,
		max = 3,},
		{name = "lottfarming:orc_food",
		chance = 17,
		min = 1,
		max = 3,},
		{name = "lottfarming:orc_medicine",
		chance = 17,
		min = 1,
		max = 3,},
		{name = "lottfarming:potato",
		chance = 14,
		min = 1,
		max = 2,},
		{name = "lottfarming:turnip",
		chance = 14,
		min = 1,
		max = 2,},
		{name = "lottfarming:red_mushroom",
		chance = 10,
		min = 1,
		max = 8,},
		{name = "lottclothes:cloak_mordor",
		chance = 17,
		min = 1,
		max = 1,},
		{name = "lottpotion:wine",
		chance = 26,
		min = 1,
		max = 2,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 10,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_death1",
		attack = "default_punch2",
	},
	on_rightclick = function(self, clicker)
		lottmobs.guard(self, clicker, "default:gold_ingot", "Orc", "orc")
	end,
	do_custom = lottmobs.do_custom_guard,
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:orc", {"lottmapgen:mordor_stone"}, 20, -1, 500, 3, 31000)
mobs:register_spawn("lottmobs:orc", {"default:snowblock"}, 15, -1, 8000, 3, 31000)
mobs:register_spawn("lottmobs:orc", {"default:dirt_with_snow"}, 15, -1, 8000, 3, 31000)
mobs:register_spawn("lottmobs:orc", {"lottmapgen:angsnowblock"}, 20, -1, 6000, 5, 31000)
lottmobs.register_guard_craftitem("lottmobs:orc", "Orc Guard", "lottmobs_orc_guard_inv.png")

mobs:register_mob("lottmobs:raiding_orc", {
	type = "npc",
        race = "GAMEorc",
        hp_min = 15,
	hp_max = 35,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	textures = {
		{"lottmobs_orc.png", orc_armor, "lottweapons_orc_sword.png", "lottarmor_trans.png"},
		{"lottmobs_orc_1.png", orc_armor, "lottweapons_orc_sword.png", "lottarmor_trans.png"},
		{"lottmobs_orc_2.png", orc_armor, "lottweapons_orc_sword.png", "lottarmor_trans.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	armor = 200,
	run_velocity = 3,
	damage = 3,
	drops = {
		{name = "lottweapons:orc_sword",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottarmor:helmet_steel",
		chance = 17,
		min = 1,
		max = 1,},
		{name = "lottarmor:chestplate_steel",
		chance = 17,
		min = 1,
		max = 1,},
		{name = "lottarmor:leggings_steel",
		chance = 17,
		min = 1,
		max = 1,},
		{name = "lottarmor:boots_steel",
		chance = 17,
		min = 1,
		max = 1,},
		{name = "lottarmor:shield_steel",
		chance = 17,
		min = 1,
		max = 1,},
		{name = "lottmobs:meat_raw",
		chance = 10,
		min = 1,
		max = 3,},
		{name = "lottfarming:orc_food",
		chance = 20,
		min = 1,
		max = 3,},
		{name = "farming:bread",
		chance = 10,
		min = 1,
		max = 3,},
		{name = "lottpotion:wine",
		chance = 25,
		min = 1,
		max = 5,},
		{name = "lottfarming:potato",
		chance = 10,
		min = 1,
		max = 5,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 10,
	light_damage = 2,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_death1",
		attack = "default_punch2",
	},
	on_rightclick = function(self, clicker)
		lottmobs.guard(self, clicker, "default:gold_ingot", "Raiding Orc", "orc", "lottmobs:orc")
	end,
	do_custom = lottmobs.do_custom_guard,
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:raiding_orc", {"lottmapgen:ithilien_grass"}, 2, -1, 4000, 5, 31000)
mobs:register_spawn("lottmobs:raiding_orc", {"lottmapgen:rohan_grass"}, 2, -1, 4000, 5, 31000)
mobs:register_spawn("lottmobs:raiding_orc", {"lottmapgen:gondor_grass"}, 2, -1, 4000, 5, 31000)

mobs:register_mob("lottmobs:uruk_hai", {
	type = "npc",
        race = "GAMEorc",
        hp_min = 25,
	hp_max = 40,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	textures = {
		{"lottmobs_uruk_hai.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_uruk_hai_1.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_uruk_hai_2.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
		{"lottmobs_uruk_hai_3.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	armor = 100,
	run_velocity = 3,
	damage = 4,
	drops = {
		{name = "default:bronze_sword",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottarmor:helmet_bronze",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:chestplate_bronze",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:leggings_bronze",
		chance = 20,
		min = 1,
		max = 1,},
		{name = "lottarmor:boots_bronze",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:bronze_warhammer",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "lottweapons:bronze_battleaxe",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "lottweapons:bronze_spear",
		chance = 15,
		min = 1,
		max = 1,},
		{name = "lottfarming:potato",
		chance = 5,
		min = 1,
		max = 5,},
		{name = "lottmobs:meat_raw",
		chance = 5,
		min = 1,
		max = 3,},
	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_barbarian_yell2",
		death = "mobs_death2",
		attack = "mobs_slash_attack",
	},
	on_rightclick = function(self, clicker)
		lottmobs.guard(self, clicker, "default:gold_ingot", "Uruk Hai", "orc")
	end,
	do_custom = lottmobs.do_custom_guard,
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:uruk_hai", {"lottmapgen:mordor_stone"}, 15, -1, 2000, 3, 31000)
mobs:register_spawn("lottmobs:uruk_hai", {"lottmapgen:fangorn_grass"}, 2, -1, 2000, 3, 31000)
lottmobs.register_guard_craftitem("lottmobs:uruk_hai", "Uruk Hai Guard", "lottmobs_uruk_hai_guard_inv.png")

mobs:register_mob("lottmobs:battle_troll", {
	type = "npc",
        race = "GAMEorc",
        hp_min = 45,
	hp_max = 60,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 2.6, 0.7},
	visual = "mesh",
	mesh = "troll_model.x",
	textures = {
		{"lottmobs_battle_troll.png"},
	},
	visual_size = {x=8, y=8},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 1,
	damage = 6,
	drops = {
		{name = "bones:bone",
		chance = 5,
		min = 1,
		max = 5,},
		{name = "lottmobs:meat_raw",
		chance = 5,
		min = 1,
		max = 5,},
		{name = "lottweapons:steel_warhammer",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:bronze_warhammer",
		chance = 10,
		min = 1,
		max = 5,},
		{name = "lottweapons:silver_warhammer",
		chance = 10,
		min = 1,
		max = 5,},
		{name = "lottweapons:tin_warhammer",
		chance = 10,
		min = 1,
		max = 5,},
		{name = "lottweapons:copper_warhammer",
		chance = 10,
		min = 1,
		max = 5,},
	},
	light_resistant = true,
	armor = 100,
	drawtype = "front",
	water_damage = 5,
	lava_damage = 1,
	light_damage = 0,
	on_rightclick = nil,
        do_custom = lottmobs.do_custom_guard,
	attack_type = "dogfight",
	animation = {
		stand_start = 0,
		stand_end = 19,
		walk_start = 20,
		walk_end = 35,
		punch_start = 36,
		punch_end = 48,
		speed_normal = 15,
		speed_run = 15,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_howl",
		attack = "mobs_stone_death",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
})
mobs:register_spawn("lottmobs:battle_troll", {"lottmapgen:mordor_stone"}, 10, -1, 10000, 5, 31000)

mobs:register_mob("lottmobs:half_troll", {
	type = "npc",
        race = "GAMEorc",
        hp_min = 20,
	hp_max = 30,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	textures = {
		{"lottmobs_half_troll.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 4,
	armor = 100,
	drops = {
		{name = "default:sword_steel",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "default:sword_bronze",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottores:coppersword",
		chance = 10,
		min = 1,
		max = 5,},
		{name = "lottores:tinsword",
		chance = 10,
		min = 1,
		max = 5,},
		{name = "lottores:goldsword",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottfarming:potato",
		chance = 10,
		min = 1,
		max = 2,},
		{name = "lottfarming:turnip",
		chance = 10,
		min = 1,
		max = 2,},
		{name = "lottfarming:red_mushroom",
		chance = 7,
		min = 1,
		max = 8,},
		{name = "lottpotion:wine",
		chance = 20,
		min = 1,
		max = 2,},

	},
	light_resistant = true,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	on_rightclick = nil,
        do_custom = lottmobs.do_custom_guard,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
})
mobs:register_spawn("lottmobs:half_troll", {"default:snow"}, 15, -1, 8000, 3, 31000)
mobs:register_spawn("lottmobs:half_troll", {"default:snowblock"}, 15, -1, 8000, 3, 31000)
mobs:register_spawn("lottmobs:half_troll", {"default:dirt_with_snow"}, 15, -1, 8000, 3, 31000)
mobs:register_spawn("lottmobs:half_troll", {"lottmapgen:angsnowblock"}, 20, -1, 6000, 5, 31000)

mobs:register_mob("lottmobs:nazgul", {
	type = "monster",
	hp_min = 90,
	hp_max = 110,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "ringwraith_model.x",
	textures = {
		{"lottmobs_nazgul.png"},
	},
	visual_size = {x=2, y=2},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 10,
	drops = {
		{name = "lottores:mithril_ingot",
		chance = 5,
		min = 1,
		max = 5,},
		{name = "lottarmor:chestplate_gold",
		chance = 3,
		min = 1,
		max = 11,},
		{name = "lottarmor:leggings_gold",
		chance = 3,
		min = 1,
		max = 1,},
		{name = "lottarmor:helmet_gold",
		chance = 3,
		min = 1,
		max = 1,},
		{name = "lottarmor:boots_gold",
		chance = 3,
		min = 1,
		max = 1,},
		{name = "lottweapons:gold_spear",
		chance = 3,
		min = 1,
		max = 1,},
		{name = "lottores:goldsword",
		chance = 3,
		min = 1,
		max = 1,},
	},
	drawtype = "front",
	armor = 100,
	water_damage = 10,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "shoot",
	arrow = "lottmobs:darkball",
	shoot_interval = 4,
	sounds = {
		attack = "lottmobs:darkball",
	},
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 1,
		walk_start = 20,
		walk_end = 60,
		punch_start = 70,
		punch_end = 110,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
})
mobs:register_spawn("lottmobs:nazgul", {"default:stone"}, 2, -1, 20000, 3, -50)

mobs:register_mob("lottmobs:witch_king", {
	type = "monster",
	hp_min = 250,
	hp_max = 350,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	textures = {
		{"lottmobs_witch_king.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	armor = 100,
	run_velocity = 3,
	damage = 12,
	drops = {
		{name = "lottores:mithril_ingot",
		chance = 7,
		min = 1,
		max = 10,},
		{name = "lottarmor:chestplate_mithril",
		chance = 6,
		min = 1,
		max = 1,},
		{name = "lottarmor:leggings_mithril",
		chance = 6,
		min = 1,
		max = 1,},
		{name = "lottarmor:helmet_mithril",
		chance = 6,
		min = 1,
		max = 1,},
		{name = "lottarmor:boots_mithril",
		chance = 6,
		min = 1,
		max = 1,},
		{name = "lottweapons:mithril_spear",
		chance = 6,
		min = 1,
		max = 1,},
		{name = "lottores:mithrilsword",
		chance = 6,
		min = 1,
		max = 1,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "shoot",
	arrow = "lottmobs:darkball",
	shoot_interval = 2,
	sounds = {
		attack = "lottmobs:darkball",
	},
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:witch_king", {"default:stone"}, 2, -1, 40000, 10, -1000)

mobs:register_mob("lottmobs:balrog", {
	type = "monster",
	rotate = 180,
	hp_min = 1000,
	hp_max = 1250,
	collisionbox = {-0.8, -2.1, -0.8, 0.8, 2.6, 0.8},
	visual_size = {x=2, y=2},
	visual = "mesh",
	mesh = "balrog_model.b3d",
	textures = {
		{"lottmobs_balrog.png"},
	},
	makes_footstep_sound = true,
	view_range = 15,
	armor = 100,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 30,
	drops = {
		{name = "lottweapons:balrog_whip",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottores:mithril_ingot",
		chance = 10,
		min = 1,
		max = 25,},
		{name = "lottores:mithrilsword",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottores:mithrilpickaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:mithril_battleaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:mithril_spear",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:mithril_battleaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:mithril_warhammer",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:mithril_dagger",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottthrowing:crossbow_mithril",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottthrowing:bolt_mithril",
		chance = 10,
		min = 10,
		max = 50,},
		{name = "lottarmor:helmet_mithril",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottarmor:chestplate_mithril",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottarmor:leggings_mithril",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottarmor:boots_mithril",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottarmor:shield_mithril",
		chance = 10,
		min = 1,
		max = 1,},
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		stand_start = 0,
		stand_end = 240,
		walk_start = 240,
		walk_end = 300,
		punch_start = 300,
		punch_end = 380,
		speed_normal = 15,
		speed_run = 15,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_howl",
		death = "mobs_howl",
		attack = "mobs_stone_death",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	on_die = lottmobs.guard_die,
})
mobs:register_spawn("lottmobs:balrog", {"default:stone"}, 2, -1, 100000, 10, -10000)

mobs:register_mob("lottmobs:dead_men", {
	type = "monster",
	hp_min = 1,
	hp_max = 1,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "lottarmor_character.b3d",
	textures = {
		{"lottmobs_dead_men.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png", "lottarmor_trans.png"},
	},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 1,
	run_velocity = 1,
	damage = 2,
	armor = 1,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 1,
	drawtype = "front",
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_die_yell",
		death = "default_death",
		attack = "default_punch2",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
	glow = 5,
})
mobs:register_spawn("lottmobs:dead_men", {"default:mossycobble"}, 2, -1, 6000, 10, -100)

mobs:register_mob("lottmobs:troll", {
	type = "npc",
        race = "GAMEorc",
        hp_min = 50,
	hp_max = 65,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 2.6, 0.7},
	visual = "mesh",
	mesh = "troll_model.x",
	textures = {
		{"lottmobs_troll.png"},
		{"lottmobs_troll_1.png"},
		{"lottmobs_troll_2.png"},
		{"lottmobs_troll_3.png"},
	},
	visual_size = {x=8, y=8},
	makes_footstep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 1,
	damage = 10,
	armor = 100,
	drops = {
		{name = "default:stone",
		chance = 5,
		min = 1,
		max = 7,},
		{name = "lottweapons:steel_battleaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:steel_warhammer",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:bronze_battleaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:bronze_warhammer",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:tin_battleaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:tin_warhammer",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:copper_battleaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:copper_warhammer",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:silver_battleaxe",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "lottweapons:silver_warhammer",
		chance = 10,
		min = 1,
		max = 1,},
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 60,
	on_rightclick = nil,
        do_custom = lottmobs.do_custom_guard,
	attack_type = "dogfight",
	animation = {
		stand_start = 0,
		stand_end = 19,
		walk_start = 20,
		walk_end = 35,
		punch_start = 36,
		punch_end = 48,
		speed_normal = 15,
		speed_run = 15,
	},
	jump = true,
	sounds = {
		war_cry = "mobs_barbarian_yell1",
		death = "mobs_barbarian_yell1",
		attack = "mobs_stone_death",
	},
	attacks_monsters = true,
	peaceful = true,
	group_attack = true,
	step = 1,
})
mobs:register_spawn("lottmobs:troll", {"default:stone"}, 2, -1, 8000, 5, -10)
mobs:register_spawn("lottmobs:troll", {"default:snow"}, 2, -1, 6000, 5, 31000)
mobs:register_spawn("lottmobs:troll", {"default:snowblock"}, 2, -1, 6000, 5, 31000)
mobs:register_spawn("lottmobs:troll", {"lottmapgen:angsnowblock"}, 2, -1, 6000, 5, 31000)

-- Arrows

mobs:register_arrow("lottmobs:darkball", {
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"lottmobs_darkball.png"},
	velocity = 5,
	hit_player = function(self, player)
		local s = self.object:getpos()
		local p = player:getpos()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=4},
		}, vec)
		local pos = self.object:getpos()
                local node1def = minetest.get_node(pos)
                local n = node1def.name
		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
                                        local node2def = minetest.get_node(p)
                                        local n2 = node2def.name
					if minetest.registered_nodes[n].groups.flammable or n2 == "air" then
						minetest.set_node(p, {name="fire:basic_flame"})
					end
				end
			end
		end
	end,
	hit_node = function(self, pos, node)
                local node1def = minetest.get_node(pos)
                local n = node1def.name
		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
                                        local node2def = minetest.get_node(p)
                                        local n2 = node2def.name
					if minetest.registered_nodes[n].groups.flammable or n2 == "air" then
						minetest.set_node(p, {name="fire:basic_flame"})
					end
				end
			end
		end
	end
})
