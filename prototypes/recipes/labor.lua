
data:extend(
{

RECIPE {
    type = "recipe",
    name = "labor-1-increase",
    category = "housing",
    enabled = true,
    energy_required = 10,
    ingredients = {
        {type = "item", name = "food-1", amount = 10}
    },
    results = {
        {type = "item", name = "labor-1", amount = 1}
    },
    icon = "__MoP__/graphics/icons/labor-1.png",
    icon_size = 32,
    subgroup = "mop-items",
    order = "a"
},
RECIPE {
    type = "recipe",
    name = "labor-1-rest",
    category = "housing",
    enabled = true,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "usedlabor-1", amount = 1},
        {type = "item", name = "food-1", amount = 1}
    },
    results = {
        {type = "item", name = "labor-1", amount = 1}
    },
    icon = "__MoP__/graphics/icons/rest-1.png",
    icon_size = 32,
    subgroup = "mop-items",
    order = "a"
},

}
)