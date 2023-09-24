RECIPE {
    type = "recipe",
    name = "housing-1-reactor",
    energy_required = 1,
    enabled = false,
    ingredients = {
    },
    results = {
        {"housing-1-reactor", 1}
    }
}

ITEM {
    type = "item",
    name = "housing-1-reactor",
    icon = "__MoP__/graphics/icons/housing-1.png",
    icon_size = 32,
    --flags = {"goes-to-quickbar"},
    subgroup = "mop-items",
    order = "f",
    place_result = "housing-1-reactor",
    stack_size = 10
}

ENTITY {
    type = "reactor",
    name = "housing-1-reactor",
    icon = "__MoP__/graphics/icons/housing-1.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1 },
    fast_replaceable_group = "housing",
    max_health = 1000,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-1.5, -1.5}, {4.5, 4.5}},
    module_specification = {
        module_slots = 0
    },
    consumption = "700kW",-- desired rate is 694.44 KW, in practice the maximum consumption rate will be met if no control circuits are used, but it is a marginal loss in efficiency
    energy_source = {
      type = "burner",
      effectivity = 1,
	  fuel_category = "food",
      fuel_inventory_size = 1,
      --emissions = 0.00,
	  --scale_energy_usage = false,
    },
    ingredient_count = 1,
    animation = {
        filename = "__MoP__/graphics/entity/housing-1/housing-1.png",
        width = 260,
        height = 254,
        line_length = 7,
        frame_count = 35,
        animation_speed = 0.4,
        run_mode = "forward-then-backward",
        shift = {0.1, 0.1}
    },
	
	working_light_picture = {
        filename = "__MoP__/graphics/entity/housing-1/hr-housing-1-lights-color.png",
        width = 320,
        height = 320,
        shift = {0.1, 0.1}
    },
    heat_buffer =
    {
      max_temperature = 1000, -- Elke seconde verliest deze 7 graden via een script. Dit is 7*99 = 693 KJ, de gewenste consumptiesnelheid. De maximale consumptiesnelheid ligt daarentegen iets hoger zodat het proces ook kan opwarmen.
      specific_heat = "99KJ", -- food-1 is 10MJ, dus dit is 10 voedsel in totaal, of ~144 seconde aan productie
      max_transfer = "10GW",
      minimum_glow_temperature = 900,	-- onder 900 gaan de lichten figuurlijk uit
    },
	
	
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.5
        }
      },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
}
