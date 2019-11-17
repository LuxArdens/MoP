script.on_init(function()
	global.potential_population = 0
end)

data.raw.recipe["beacon"].enabled = false

script.on_event(defines.events.on_built_entity, function(event)
if game.entity_prototypes["housing-1"] then
	
	global.potential_population = global.potential_population+10 -- set variable potential_population +10
	
	if global.potential_population >9 then 		-- add an if statement to check what potential_population is. If population <10, add none.
		iteminsert{name="labor-1-precursor", count=10}		-- insert an secret item that is the required precursor to make initial labor  (maybe make it so you can't take out the precursor by hand)
	end
	
	-- set recipe to produce labor
	
end




script.on_event(defines.events.on_robot_built_entity, function(event)
if game.entity_prototypes["housing-1"] then
	-- same exact shit but for bot-built houses
end

script.on_event(defines.events.on_player_mined_entity, function(event)
if game.entity_prototypes["housing-1"] then
	global.potential_population = global.potential_population-10 --set variable potential_population -10
end

script.on_event(defines.events.on_entity_died, function(event)
if game.entity_prototypes["housing-1"] then
	global.potential_population = global.potential_population-10 --set variable potential_population -10
end


script.on_event(defines.events.on_built_entity, function(event)
if game.entity_prototypes["mop-beacon"] then
  event.createdentity.insert{name='infifuel', count=1}
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
if game.entity_prototypes["mop-beacon"] then
  event.createdentity.insert{name='infifuel', count=1}
end)


script.on_event(defines.events.on_robot_mined_entity, function(event)
if game.entity_prototypes["housing-1"] then
	global.potential_population = global.potential_population-10 --set variable potential_population -10
end





-- noted untested
removed_items = {"beacon"} -- list of all item/fluid names to be removed
disabled_recipes = {"beacon"} -- table to store name of disabled recipes in, for technologies
-- this loop handles disabling recipes that have ingredients in the removed_items table
for name, recipe in pairs(data.raw.recipe) do
    if recipe.result then
      for _, removeName in ipairs(removed_items) do
          if recipe.result == removeName then
              recipe.enabled = false
              disabled_recipes[name] = name -- remember that we disabled this one
          end
      end
    elseif recipe.results then
      for ingredientIndex, ingredient in pairs(recipe.results) do
        for _, removeName in ipairs(removed_items) do
          -- fluids will be indexed by name, items typically by numeric index
          if (ingredient.name and ingredient.name == removeName) or (ingredient[1] and ingredient[1] == removeName ) then
              recipe.enabled = false
              disabled_recipes[name] = name -- remember that we disabled this one
              -- you might want to be more generous here and simply set
              -- recipe.results[ingredientIndex] = nil
              -- though, in that case there should probably be a check after
              -- the loop for if #recipe.results == 0 then disable the recipe
              -- if that caused any issues you'd likely need to loop over
              -- recipe.results backwards and use table.remove like I do below
              -- though I wouldn't expect it to cause issues, I'm not 100% certain
          end
        end
      end
    end
end

for name, technology in pairs(data.raw.technology) do
  if technology.effects then -- if there is an effects table, most do, not all
    -- loop through effects table backwards, since indexes are numeric
    -- and we will be deleting things the indexes would change
    -- though if nils are ignored, as I would expect, then that could be
    -- done here instead, just wanted it this way for reference mainly
    -- fyi, table = {}; table[1] = nil; results in #table == 1
    -- whereas table = {}; table['something'] = nil; results in #table == 0
    for index=#technology.effects,1,-1 do
      local effect = technology.effects[index]
      if effect.type == "unlock_recipe" then
        if disabled_recipes[effect.recipe] then -- we disabled this recipe
            table.remove(technology.effects, index) -- remove it from the table
        end
      end
    end
  end
end