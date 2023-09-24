
data:extend(
{

RECIPE {
    type = "recipe",
    name = "labor-1-initial",
    --category = "housing",
    enabled = true,
    energy_required = 0.01,
    ingredients = {
        {type = "item", name = "human-1", amount = 1}
    },
    results = {
        {type = "item", name = "labor-1", amount = 1}
    },
    icon = "__MoP__/graphics/icons/open-pod.png",
    icon_size = 32,
    subgroup = "mop-items",
    order = "a"
},

RECIPE {
    type = "recipe",
    name = "labor-1-rest",
    category = "housing",
    enabled = true,
    energy_required = 14.4,
    ingredients = {
        {type = "item", name = "usedlabor-1", amount = 1}
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