minetest.register_node('mcl:campfire_lit', {
	description = 'Campfire',
	drawtype = 'mesh',
	mesh = 'campfire_lit.obj',
	tiles = {{name='mcl_campfire_fire.png', animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=2.0}},{name='mcl_campfire_log_lit.png', animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=2.0}}},
	groups = {cracky=2, oddly_breakable_by_hand=5, not_in_creative_inventory = 1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	drop = "mcl:campfire",
	light_source = 15,
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = 'fixed',
		fixed = {-.5, -.5, -.5, .5, -.05, .5}, --left, bottom, front, right, top
		},
	collision_box = {
		type = 'fixed',
		fixed = {-.5, -.5, -.5, .5, -.05, .5},
		},
})

minetest.register_node('mcl:campfire', {
	description = 'Campfire',
	drawtype = 'mesh',
	mesh = 'campfire.obj',
	tiles = {{name='mcl_campfire_log.png'},},
	groups = {cracky=2, oddly_breakable_by_hand=5},
	paramtype = 'light',
	paramtype2 = 'facedir',
	on_rightclick = function (pos, node, player, itemstack, pointed_thing)
     for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'fire:flint_and_steel' then
            node.name = "mcl:campfire_lit"
               minetest.set_node(pos, node)
        else
        end
    end
end,
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = 'fixed',
		fixed = {-.5, -.5, -.5, .5, -.05, .5}, --left, bottom, front, right, top
		},
	collision_box = {
		type = 'fixed',
		fixed = {-.5, -.5, -.5, .5, -.05, .5},
		},
})

minetest.register_node('mcl:smooth_stone', {
	description = 'Smooth Stone',
	drawtype = 'nodebox',
	tiles = {
		"mcl_smooth_stone.png"
	},
	groups = {cracky=2, oddly_breakable_by_hand=5},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("mcl:stonecutter", {
	description = "Stone Cutter",
	tiles = {
		"mcl_stonecutter_top.png",
		"mcl_stonecutter_bottom.png",
		"mcl_stonecutter_side.png",
		"mcl_stonecutter_side.png",
		{name='mcl_stonecutter_saw.png', animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=1}},
		{name='mcl_stonecutter_saw.png', animation={type='vertical_frames', aspect_w=16, aspect_h=16, length=1}}
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = 'facedir',
	groups = {cracky=2, oddly_breakable_by_hand=5},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox1
			{-0.4375, 0.0625, 0, 0.4375, 0.5, 0}, -- NodeBox2
		}
	}
})

minetest.register_node('mcl:barrel', {
	description = "Barrel",
	drawtype = 'nodebox',
	tiles = {
		"mcl_barrel_side.png",
		"mcl_barrel_side.png",
		"mcl_barrel_side.png^[transformR90", --Right
		"mcl_barrel_side.png^[transformR90", --Left
		"mcl_barrel_bottom.png",
		"mcl_barrel_top.png"
	},
	groups = {choppy=2, oddly_breakably_by_hand=2, flammable=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('storage', 9*3)
		meta:set_string('formspec',
			'size [9,10]'..
			'bgcolor[#080808BB;true]'..
			'list[current_name;storage;0,1.5;9,3;]'..
			'list[current_player;main;0.5,6.5;8,4;]')
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty('storage') and inv:is_empty('storage1')
	end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, 
		}
	}
})

minetest.register_node("mcl:p1", {
	description = "Painting",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"p1.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakably_by_hand=2, flammable=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
		}
	}
})

minetest.register_node("mcl:p2", {
	description = "Painting",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"p2.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakably_by_hand=2, flammable=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
		}
	}
})

minetest.register_node("mcl:p3", {
	description = "Painting",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"p3.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakably_by_hand=2, flammable=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
		}
	}
})

minetest.register_node("mcl:p4", {
	description = "Painting",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"p4.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakably_by_hand=2, flammable=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
		}
	}
})

minetest.register_node("mcl:p5", {
	description = "Painting",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"p5.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakably_by_hand=2, flammable=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
		}
	}
})

minetest.register_node("mcl:p6", {
	description = "Painting",
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"p6.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=2, oddly_breakably_by_hand=2, flammable=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
		}
	}
})