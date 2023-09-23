data:extend(
{
  {
    type = "item",
    name = "food-1",
    icon = "__MoP__/graphics/icons/food-1.png",
    icon_size = 32,
    --flags = {"goes-to-main-inventory"},
    subgroup = "mop-items",
    order = "a",
    fuel_category = "food",
	fuel_value = "10MJ",		-- 10 MJ  is roughly 2380kcal which is adequate for a single sedentary person and basically a slow starvation diet for a hard working male. At 60x timerate it can feed the 100 pops in basic housing for ~14.4 in-game seconds
    stack_size = 200
  },
}
)