technic_uranium = false

if technic_uranium == false then
	dofile(minetest.get_modpath("display_blocks").."/uranium.lua")
elseif technic_uranium == true then
	minetest.register_alias("display_blocks:uranium_dust", "technic:uranium_block")
	minetest.register_alias("display_blocks:uranium_block", "technic:uranium_block")
end

function disp(base, name, light, rec, rp)
	minetest.register_node( "display_blocks:"..base.."_base", {
		description = name.."Display Base",
		tile_images = { "display_blocks_"..base.."_block.png" },
		is_ground_content = true,
		groups = {cracky=3,},
		light_source = light,
		sunlight_propagates = true,
		paramtype = "light",
		drawtype = "glasslike",
	})

	minetest.register_node( "display_blocks:"..base.."_crystal", {
		drawtype = "plantlike",
		description = name.." Display Crystal",
		tile_images = { "display_blocks_"..base.."_crystal.png" },
		is_ground_content = true,
		paramtype = "light",
		visual_scale = 1.2,
		groups = {immortal=1, not_in_creative_inventory=1},
	})

	minetest.register_abm({
		nodenames = {"display_blocks:"..base.."_base"},
		interval = 1.0,
		chance = 1.0,
		action = function(pos, node, active_object_count, active_object_count_wider)
			pos.y = pos.y + 1
			minetest.env:add_node(pos, {name="display_blocks:"..base.."_crystal"})
		end
	})

	function remove_crystal(pos, node, active_object_count, active_object_count_wider)
		if
		  node.name == "display_blocks:"..base.."_base"
		then
		  pos.y = pos.y + 1
		  minetest.env:remove_node(pos, {name="display_blocks:"..base.."_crystal"})
	  end
	end
	minetest.register_on_dignode(remove_crystal)

	minetest.register_craft({
		output = 'display_blocks:'..base..'_base 5',
		recipe = {
			{'', 'default:mese_crystal_fragment', ''},
			{rec, 'display_blocks:empty_display', rec},
			{'', rec, ''},
		},
		replacements = {{rec, rp}, {rec, rp},{rec, rp}},
	})
end

-- disp(base, name, rec, rp)
disp("mese", "Mese", 0, "default:mese_block", "")
disp("glass", "Glass", 0, "default:sand", "")
disp("fire", "Fire", 12, "bucket:bucket_lava" ,"bucket:bucket_empty")
disp("air", "Air", 5, "bucket:bucket_empty", "bucket:bucket_empty")
disp("water", "Water", 0, "bucket:bucket_water", "bucket:bucket_empty")
--[[
disp("uranium", "Uranium", 10, "display_blocks:uranium_block", "")
disp("earth", "Earth", 0, "display_blocks:compressed_earth", "")
disp("metal", "Metal", 2, "default:steel_block", "")
disp("universia", "Universia", 15, "", "")
]]

if minetest.get_modpath("titanium") then
	disp("titanium", "Titanium", 0, "titanium:block", "")
end

--
--Mese Giver Display
--

minetest.register_node( "display_blocks:mese_giver_base", {
	description = "Mese Giver Display Base",
	tile_images = { "display_blocks_mese_giver_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	drawtype = "glasslike",
	paramtype = "light",
})

minetest.register_abm({
	nodenames = {"display_blocks:mese_giver_base"},
	interval = 60.0,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		pos.y = pos.y + 1
		minetest.env:add_node(pos, {name="default:mese"})
	end
})

function remove_crystal(pos, node, active_object_count, active_object_count_wider)
	if
	  node.name == "display_blocks:mese_giver_base"
	then
	  pos.y = pos.y + 1
	  minetest.env:remove_node(pos, {name="default:mese"})
  end
end
minetest.register_on_dignode(remove_crystal)

minetest.register_craft({
	output = 'display_blocks:mese_giver_base',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'display_blocks:mese_base', 'default:mese_block', 'display_blocks:mese_base'},
		{'', 'display_blocks:mese_base', ''},
	}
})

minetest.register_craft({
	output = 'display_blocks:uranium_base 5',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'technic:uranium', 'default:glass', 'technic:uranium'},
		{'', 'technic:uranium', ''},
	}
})
--[[
minetest.register_node("display_blocks:compressed_earth", {
	description = "Compressed Dirt",
	tile_images = {"display_blocks_compressed_dirt.png"},
	groups = {crumbly=3,soil=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})
]]
minetest.register_node("display_blocks:empty_display", {
	description = "Empty Display",
	tile_images = {"display_blocks_empty_display.pmg"},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
--[[
minetest.register_node("display_blocks:industria_cube", {
	description = "Industria Cube"
	tile_images = "display_blocks_industria_cube.png",
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("display_blocks:natura_cube", {
	description = "Natura Cube",
	tile_images = {"display_blocks_natura_cube.png",
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output= "display_blocks:compressed_dirt",
	recipe = {
		{'default:gravel', 'default:dirt', 'default:gravel'},
		{'default:dirt', 'default:gravel', 'default:dirt'},
		{'default:gravel', 'default:dirt', 'default:gravel'},
	}
})
]]
minetest.register_craft({
	output = "display_blocks:empty_display",
	recipe = {
		{'default:desert_sand', 'default:glass', 'default:sand'},
		{'default:glass', '', 'default:glass'},
		{'default:sand', 'default:glass', 'default:desert_sand'},
	},
})
--[[
minetest.register_craft({
	output = "display_blocks:natura_cube",
	recipe = {
		{'', 'display_blocks:air_base', ''},
		{'display_blocks:fire_base', '', 'display_blocks:water_base'},
		{'', 'display_blocks:earth_base', ''},
	},
})

minetest.register_craft({
	output = "display_blocks:industria_cube",
	recipe = {
		{'', 'display_blocks:mese_base', ''},
		{'display_blocks:metal_base', '', 'display_blocks:glass_base'},
		{'', 'display_blocks:uranium_base', ''},
	},
})

minetest.register_craft({
	output = "display_blocks:universia_base",
	recipe = {{'display_blocks:natura_cube', 'deisplay_blocks:mese_giver', 'display_blocks:industria_cube'}},
})
]]
print("[Display Blocks] Loaded! by jojoa1997 :-)")
