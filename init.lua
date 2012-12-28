--Loads dependencies so there is no need to have the other mods
dofile(minetest.get_modpath("display_blocks").."/depends.lua");

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
	tile_images = { "display_blocks_mese_crystal.png" },
	is_ground_content = true,
	paramtype = "light",
	visual_scale = 1.2,
	groups = {immortal=1},
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
	output = 'display_blocks:mese_base',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'default:mese_crystal', 'default:mese_block', 'default:mese_crystal'},
		{'', 'default:mese_crystal', ''},
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
	groups = {immortal=1},
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
	output = 'display_blocks:titanium_base',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'display_blocks:tougher_titanium', 'display_blocks:titanium_block', 'display_blocks:tougher_titanium'},
		{'', 'display_blocks:tougher_titanium', ''},
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
	groups = {immortal=1},
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
	output = 'display_blocks:uranium_base',
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
	groups = {immortal=1},
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
	output = 'display_blocks:glass_base',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'default:sand', 'default:glass', 'default:sand'},
		{'', 'default:sand', ''},
	}
})
