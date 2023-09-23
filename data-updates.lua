-- require("prototypes.overides")


-- testing basic commands
if settings.startup["mop-labor"].value == true then
  --bobmods.lib.recipe.add_new_ingredient("transport-belt", "labor-1")
end


-- VANILLA recipe updates
--RECIPE("transport-belt"):remove_ingredient({type = "item", name = "iron-gear-wheel", amount = 1}):remove_ingredient({type = "item", name = "iron-plate", amount = 1}):add_ingredient({type = "item", name = "wood", amount = 1})
--RECIPE("iron-plate"):add_ingredient({type = "item", name = "labor-1", amount = 1})


-- VANILLA entity updates
--ENTITY("stone-furnace"):source_inventory_size = 2