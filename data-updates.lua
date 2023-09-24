-- require("prototypes.overides")


-- testing basic commands
if settings.startup["mop-labor"].value == true then
  --bobmods.lib.recipe.add_new_ingredient("transport-belt", "labor-1")
end


-- VANILLA recipe updates
RECIPE("burner-inserter"):remove_ingredient({type = "item", name = "iron-gear-wheel", amount = 1}):remove_ingredient({type = "item", name = "iron-plate", amount = 1}) -- free burner inserters
--RECIPE("transport-belt"):remove_ingredient({type = "item", name = "iron-gear-wheel", amount = 1}):remove_ingredient({type = "item", name = "iron-plate", amount = 1}):add_ingredient({type = "item", name = "wood", amount = 1})
--RECIPE("iron-plate"):add_ingredient({type = "item", name = "labor-1", amount = 1})


-- VANILLA entity updates
--RECIPE("steel-plate"):set_fields {energy_required = 15}
--ENTITY("stone-furnace"):source_inventory_size = 2


local function modify_energy(name, inserter)
	  data.raw["inserter"]["burner-inserter"].energy_source = { type = "void" }
   end