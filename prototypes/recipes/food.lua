
data:extend(
{


RECIPE {
    type = "recipe",
    name = "food-1",
    category = "farms",
    enabled = true,
    energy_required = 10,
    ingredients = {
        {type = "item", name = "labor-1", amount = 1}
    },
    results = {
        {type = "item", name = "food-1", amount = 1},
        {type = "item", name = "usedlabor-1", amount = 1},
		{
			name = "food-1",
			probability = 0.1,
			amount = 1
		},
    },
    icon = "__MoP__/graphics/icons/food-1.png",
    icon_size = 32,
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