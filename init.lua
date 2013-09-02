dofile(minetest.get_modpath("display_blocks").."/config.txt")

function disp(base, name, light, rp)
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
			{rec, 'default:glass', rec},
			{'', rec, ''},
		},
		replacements = {rp},
	})
end

-- disp(base, name, rec, rp)
disp("mese", "Mese", 0, "default:mese_block", "")
disp("glass", "Glass", 0, "default:sand", "")
disp("fire", "Fire", 15, "bucket:bucket_lava", {{"bucket:bucket_lava", "bucket:bucket_empty"}, {"bucket:bucket_lava", "bucket:bucket_empty"}, {"bucket:bucket_lava", "bucket:bucket_empty"}})
disp("air", "Air", 5, "bucket:bucket_empty", {{"bucket:bucket_empty", "bucket:bucket_empty"}, {"bucket:bucket_empty", "bucket:bucket_empty"}, {"bucket:bucket_empty", "bucket:bucket_empty"}})
disp("water", "Water", 0, "bucket:bucket_water", {{"bucket:bucket_water", "bucket:bucket_empty"}, {"bucket:bucket_water", "bucket:bucket_empty"}, {"bucket:bucket_water", "bucket:bucket_empty"}})

if minetest.get_modpath("technic") and uranium_with_technic == false then
	dofile(minetest.get_modpath("display_blocks").."/technic.lua")
else
	dofile(minetest.get_modpath("display_blocks").."/uranium.lua")
end

if minetest.get_modpath("titanium") then
	disp("titanium", "Titanium", 0, "titanium:block", '')
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

print("[Display Blocks] Loaded! by jojoa1997 :-)")
