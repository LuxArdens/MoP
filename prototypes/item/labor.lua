data:extend(
{
  {
    type = "item",
    name = "labor-1-precursor",
    icon = "__MoP__/graphics/icons/labor-1.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    stack_size = 10000
  },
  {
    type = "item",
    name = "labor-1",
    icon = "__MoP__/graphics/icons/labor-1.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    fuel_category = "labor",
	fuel_value = "4.32MJ",		-- represents human working (100 Watt) for 12 hours
    stack_size = 1
  },
  {
    type = "item",
    name = "infifuel",
    icon = "__MoP__/graphics/icons/labor-1.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    fuel_category = "chemical",
	fuel_value = "0.0315576MJ",		-- used to keep buildings that are supposed to be zero-energy-usage running
    stack_size = 1
  },
  {
    type = "item",
    name = "food-1",
    icon = "__MoP__/graphics/icons/food-1.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    stack_size = 50
  },
  {
    type = "item",
    name = "usedlabor-1",
    icon = "__MoP__/graphics/icons/usedlabor-1.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    stack_size = 1
  },
}
)