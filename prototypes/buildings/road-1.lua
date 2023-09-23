RECIPE {
    type = "recipe",
    name = "road-1",
    energy_required = 0.01,
    enabled = true,
    ingredients = {
        {"labor-1", 1}
    },
    results = {
        {"road-1", 100}
    }
}
RECIPE {
    type = "recipe",
    name = "deconstruct-road-1",
    energy_required = 0.01,
    enabled = true,
    ingredients = {
        {"road-1", 100}
    },
    results = {
        {"labor-1", 1}
    }
}

ITEM {
    type = "item",
    name = "road-1",
    icon = "__MoP__/graphics/icons/road-1.png",
    icon_size = 32,
    subgroup = "mop-items",
    order = "f",
    place_result = "road-1",
    stack_size = 10000
}


ENTITY  {
    type = "transport-belt",
    name = "road-1",
    icon = "__MoP__/graphics/icons/road-1.png",
    icon_size = 32, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.001, result = "road-1"},
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
    animation_speed_coefficient = 16,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    related_underground_belt = "underground-belt",
    next_upgrade = "fast-transport-belt",
    speed = 0.015,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
}
