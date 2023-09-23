RECIPE {
    type = "recipe",
    name = "road-4",
    energy_required = 0.01,
    enabled = true,
    ingredients = {
        {"labor-1", 1},
        {"car", 120},
        {"rail-signal", 400},
        {"refined-concrete", 16000},
        -- iets van bitumen toevoegen die je ook nog nodig hebt ipv beton
        {"steel-plate", 3200}
    },
    results = {
        {"road-4", 1600}
    }
}
RECIPE {
    type = "recipe",
    name = "deconstruct-road-4",
    energy_required = 0.01,
    enabled = true,
    ingredients = {
        {"road-4", 1600}
    },
    results = {
        {"labor-1", 1}
    }
}

ITEM {
    type = "item",
    name = "road-4",
    icon = "__MoP__/graphics/icons/road-4.png",
    icon_size = 32,
    subgroup = "mop-items",
    order = "f",
    place_result = "road-4",
    stack_size = 10000
}


ENTITY  {
    type = "transport-belt",
    name = "road-4",
    icon = "__MoP__/graphics/icons/road-4.png",
    icon_size = 32, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.001, result = "road-4"},
    max_health = 1,
    --corpse = "transport-belt-remnants",
    --dying_explosion = "transport-belt-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    animation_speed_coefficient = 256,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    related_underground_belt = "underground-belt",
    next_upgrade = "fast-transport-belt",
    speed = 0.25,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
}
