data:extend(
{
  {
    type = "item",
    name = "labor-1-precursor",
    icon = "__MoP__/graphics/icons/labor-1.png",
    icon_size = 32,
    --flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    stack_size = 10000
  },
  {
    type = "item",
    name = "human",
    icon = "__MoP__/graphics/icons/human.png",
    icon_size = 32,
    --flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    stack_size = 10000
  },
  {
    type = "item",
    name = "labor-1",
    icon = "__MoP__/graphics/icons/labor-1.png",
    icon_size = 32,
    --flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    fuel_category = "labor",
	fuel_value = "3.6MJ",		-- represents a single human working (100 Watt) for 10 hours, but timescale is 1:60, so this will run a 1 KW (e.a. 10 people) manufactory for exactly 60 in-game seconds
    burnt_result = "usedlabor-1",
    stack_size = 5
  },
  {
    type = "item",
    name = "infifuel",
    icon = "__MoP__/graphics/icons/labor-inf.png",
    icon_size = 32,
    --flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    fuel_category = "chemical",
	fuel_value = "42GJ",		-- for testing
    stack_size = 10000
  },
  {
    type = "item",
    name = "usedlabor-1",
    icon = "__MoP__/graphics/icons/usedlabor-1.png",
    icon_size = 32,
    --flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    stack_size = 1
  },
}
)