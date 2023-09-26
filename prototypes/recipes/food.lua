
data:extend(
{


RECIPE {
    type = "recipe",
    name = "food-1",
    category = "farms",
    enabled = true,
    energy_required = 13.09,
    ingredients = {
        --{type = "item", name = "labor-1", amount = 10}
    },
    results = {
        {type = "item", name = "food-1", amount = 1}
    },
    icon = "__MoP__/graphics/icons/food-1.png",
    icon_size = 32,
    subgroup = "mop-items",
    order = "a"
},

RECIPE {
    type = "recipe",
    name = "wood-1",
    category = "farms",
    enabled = true,
    energy_required = 13.09,
    ingredients = {
        --{type = "item", name = "labor-1", amount = 10}
    },
    results = {
        {type = "item", name = "wood", amount = 1}
    },
    icon = "__base__/graphics/icons/wood.png",
    icon_size = 64,
    subgroup = "mop-items",
    order = "a"
},

RECIPE {
    type = "recipe",
    name = "food-1-handcrafted",
    --category = "farms",
    enabled = true,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "wood", amount = 1}
    },
    results = {
        {type = "item", name = "food-1", amount = 1}
    },
    icon = "__MoP__/graphics/icons/food-1.png",
    icon_size = 32,
    subgroup = "mop-items",
    order = "a"
}

}
)