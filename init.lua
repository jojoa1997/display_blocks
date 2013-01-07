--Loads dependencies so there is no need to have the other mods
dofile(minetest.get_modpath("display_blocks").."/ores.lua");

--
--Mese Display
--

minetest.register_node( "display_blocks:mese_base", {
	description = "Mese Display Base",
	tile_images = { "display_blocks_mese_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
})

minetest.register_node( "display_blocks:mese_crystal", {
	drawtype = "plantlike",
	description = "Mese Display Crystal",
	tile_images = { "default_mese_crystal.png" },
	is_ground_content = true,
	paramtype = "light",
	visual_scale = 1.2,
	groups = {immortal=1, not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"display_blocks:mese_base"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		pos.y = pos.y + 1
		minetest.env:add_node(pos, {name="display_blocks:mese_crystal"})
	end
})

function remove_crystal(pos, node, active_object_count, active_object_count_wider)
	if
	  node.name == "display_blocks:mese_base"
	then
	  pos.y = pos.y + 1
	  minetest.env:remove_node(pos, {name="display_blocks:mese_crystal"})
  end
end
minetest.register_on_dignode(remove_crystal)

minetest.register_craft({
	output = 'display_blocks:mese_base 5',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'default:mese_crystal', 'default:mese_block', 'default:mese_crystal'},
		{'', 'default:mese_crystal', ''},
	}
})


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
	interval = 600.0,
	chance = 6,
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


--
--Titanium Display
--

minetest.register_node( "display_blocks:titanium_base", {
	description = "Titanium Display Base",
	tile_images = { "display_blocks_titanium_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
})

minetest.register_node( "display_blocks:titanium_crystal", {
	drawtype = "plantlike",
	description = "Titanium Display Crystal",
	tile_images = { "display_blocks_titanium_crystal.png" },
	is_ground_content = true,
	paramtype = "light",
	visual_scale = 1.2,
	groups = {immortal=1, not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"display_blocks:titanium_base"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		pos.y = pos.y + 1
		minetest.env:add_node(pos, {name="display_blocks:titanium_crystal"})
	end
})

function remove_crystal(pos, node, active_object_count, active_object_count_wider)
	if
	  node.name == "display_blocks:titanium_base"
	then
	  pos.y = pos.y + 1
	  minetest.env:remove_node(pos, {name="display_blocks:titanium_crystal"})
  end
end
minetest.register_on_dignode(remove_crystal)

minetest.register_craft({
	output = 'display_blocks:titanium_base 5',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'titanium:tougher_titanium', 'titanium:block', 'titanium:tougher_titanium'},
		{'', 'titanium:tougher_titanium', ''},
	}
})


--
--Uranium Display
--

minetest.register_node( "display_blocks:uranium_base", {
	description = "Uranium Display Base",
	tile_images = { "display_blocks_uranium_block.png" },
	is_ground_content = true,
	light_source = 15,
	groups = {cracky=3},
})

minetest.register_node( "display_blocks:uranium_crystal", {
	drawtype = "plantlike",
	description = "Uranium Display Crystal",
	tile_images = { "display_blocks_uranium_crystal.png" },
	is_ground_content = true,
	paramtype = "light",
	visual_scale = 1.2,
	groups = {immortal=1, not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"display_blocks:uranium_base"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		pos.y = pos.y + 1
		minetest.env:add_node(pos, {name="display_blocks:uranium_crystal"})
	end
})

function remove_crystal(pos, node, active_object_count, active_object_count_wider)
	if
	  node.name == "display_blocks:uranium_base"
	then
	  pos.y = pos.y + 1
	  minetest.env:remove_node(pos, {name="display_blocks:uranium_crystal"})
  end
end
minetest.register_on_dignode(remove_crystal)

minetest.register_craft({
	output = 'display_blocks:uranium_base 5',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'display_blocks:uranium_dust', 'display_blocks:uranium_block', 'display_blocks:uranium_dust'},
		{'', 'display_blocks:uranium_dust', ''},
	}
})


--
--Glass Display
--

minetest.register_node( "display_blocks:glass_base", {
	description = "Glass Display Base",
	tile_images = { "display_blocks_glass_block.png" },
	is_ground_content = true,
	groups = {cracky=3,},
	sunlight_propagates = true,
	paramtype = "light",
	drawtype = "glasslike",
})

minetest.register_node( "display_blocks:glass_crystal", {
	drawtype = "plantlike",
	description = "Glass Display Crystal",
	tile_images = { "display_blocks_glass_crystal.png" },
	is_ground_content = true,
	paramtype = "light",
	visual_scale = 1.2,
	groups = {immortal=1, not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"display_blocks:glass_base"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		pos.y = pos.y + 1
		minetest.env:add_node(pos, {name="display_blocks:glass_crystal"})
	end
})

function remove_crystal(pos, node, active_object_count, active_object_count_wider)
	if
	  node.name == "display_blocks:glass_base"
	then
	  pos.y = pos.y + 1
	  minetest.env:remove_node(pos, {name="display_blocks:glass_crystal"})
  end
end
minetest.register_on_dignode(remove_crystal)

minetest.register_craft({
	output = 'display_blocks:glass_base 5',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'default:sand', 'default:glass', 'default:sand'},
		{'', 'default:sand', ''},
	}
})


--
--Fire Display
--

minetest.register_node( "display_blocks:fire_base", {
	description = "Fire Display Base",
	tile_images = { "display_blocks_fire_block.png" },
	is_ground_content = true,
	groups = {cracky=3,},
	sunlight_propagates = true,
	paramtype = "light",
	drawtype = "glasslike",
})

minetest.register_node( "display_blocks:fire_crystal", {
	drawtype = "plantlike",
	description = "Fire Display Crystal",
	tile_images = { "display_blocks_fire_crystal.png" },
	is_ground_content = true,
	paramtype = "light",
	visual_scale = 1.2,
	light_source = 10,
	groups = {immortal=1, not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"display_blocks:fire_base"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		pos.y = pos.y + 1
		minetest.env:add_node(pos, {name="display_blocks:fire_crystal"})
	end
})

function remove_crystal(pos, node, active_object_count, active_object_count_wider)
	if
	  node.name == "display_blocks:fire_base"
	then
	  pos.y = pos.y + 1
	  minetest.env:remove_node(pos, {name="display_blocks:fire_crystal"})
  end
end
minetest.register_on_dignode(remove_crystal)

minetest.register_craft({
	output = 'display_blocks:fire_base 5',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'bucket:bucket_lava', 'default:glass', 'bucket:bucket_lava'},
		{'', 'bucket:bucket_lava', ''},
	}
})


--
--Air Display
--

minetest.register_node( "display_blocks:air_base", {
	description = "Air Display Base",
	tile_images = { "display_blocks_air_block.png" },
	is_ground_content = true,
	groups = {cracky=3,},
	sunlight_propagates = true,
	paramtype = "light",
	drawtype = "glasslike",
})

minetest.register_node( "display_blocks:air_crystal", {
	drawtype = "plantlike",
	description = "Air Display Crystal",
	tile_images = { "display_blocks_air_crystal.png" },
	is_ground_content = true,
	paramtype = "light",
	visual_scale = 1.2,
	groups = {immortal=1, not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"display_blocks:air_base"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		pos.y = pos.y + 1
		minetest.env:add_node(pos, {name="display_blocks:air_crystal"})
	end
})

function remove_crystal(pos, node, active_object_count, active_object_count_wider)
	if
	  node.name == "display_blocks:air_base"
	then
	  pos.y = pos.y + 1
	  minetest.env:remove_node(pos, {name="display_blocks:air_crystal"})
  end
end
minetest.register_on_dignode(remove_crystal)

minetest.register_craft({
	output = 'display_blocks:air_base 5',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'bucket:bucket', 'default:glass', 'bucket:bucket'},
		{'', 'bucket:bucket', ''},
	}
})


--
--Water Display
--

minetest.register_node( "display_blocks:water_base", {
	description = "Water Display Base",
	tile_images = { "display_blocks_water_block.png" },
	is_ground_content = true,
	groups = {cracky=3,},
	sunlight_propagates = true,
	paramtype = "light",
	drawtype = "glasslike",
})

minetest.register_node( "display_blocks:water_crystal", {
	drawtype = "plantlike",
	description = "Water Display Crystal",
	tile_images = { "display_blocks_water_crystal.png" },
	is_ground_content = true,
	paramtype = "light",
	visual_scale = 1.2,
	groups = {immortal=1, not_in_creative_inventory=1},
})

minetest.register_abm({
	nodenames = {"display_blocks:water_base"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		pos.y = pos.y + 1
		minetest.env:add_node(pos, {name="display_blocks:water_crystal"})
	end
})

function remove_crystal(pos, node, active_object_count, active_object_count_wider)
	if
	  node.name == "display_blocks:water_base"
	then
	  pos.y = pos.y + 1
	  minetest.env:remove_node(pos, {name="display_blocks:water_crystal"})
  end
end
minetest.register_on_dignode(remove_crystal)

minetest.register_craft({
	output = 'display_blocks:water_base 5',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'bucket:bucket_water', 'default:glass', 'bucket:bucket_water'},
		{'', 'bucket:bucket_water', ''},
	}
})


--Aliases
minetest.register_alias("mesebase", "display_blocks:mese_base")
minetest.register_alias("mesegiverbase", "display_blocks:mese_giver_base")
minetest.register_alias("titaniumbase", "display_blocks:titanium_base")
minetest.register_alias("uraniumbase", "display_blocks:uranium_base")
minetest.register_alias("glassbase", "display_blocks:glass_base")
minetest.register_alias("firebase", "display_blocks:fire_base")
minetest.register_alias("airbase", "display_blocks:air_base")
minetest.register_alias("waterbase", "display_blocks:water_base")




print("[Display Blocks] Loaded! by jojoa1997 :-)")
