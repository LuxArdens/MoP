require('__core__/lualib/util')

 -- pass an anonymous (unnamed) function to the game.oninit function which is run when the mod is first loaded
script.on_init(function()
  global.housing1 = {} -- setup a table named housing within the glob table
end)

 -- -- pass an anonymous (unnamed) function to the game.onload function which is run when a save with the mod is loaded
-- script.on_load(function()
  -- if not housing1 then housing1 = {}
-- end)

-- add stasis pods and any other crucial items to player inventory
local item_list = {
	{  50, "wood"},
	{  1000, "human"},
}
local function InsertIntoInventory(event)
  local player = game.players[event.player_index]

	pcall(player.exit_cutscene)
	
	for _, item in pairs(item_list) do
		if game.item_prototypes[item[2]] ~= nil then
			player.insert{ name = item[2], count = item[1]}
		else
			player.print("Unable to add \"" .. item[2] .. "\" to inventory, please check spelling.")
		end
	end
end
-- add items to inventory
script.on_event(defines.events.on_player_created, InsertIntoInventory)
--script.on_event(defines.events.on_player_created, game.players["automation"].force.technologies)




-- link housing-reactor to housing-assembler whenever it is built


-- call script.onevent, tell it we want to do something when an entity is built, and give another anonymous function that will contain the code to actually do stuff
script.on_event(defines.events.on_built_entity, function(event)
  if event.created_entity.name == "housing-1" then -- if the entity that the player built was a house
    -- insert into the global.housing1 table an entry with a 'key' of housing that is the housing-1 entity, and a key of housing-reactor that is a new housing-1-reactor entity at the same position
    table.insert( global.housing1, { housing1=event.created_entity, housing1reactor=game.surfaces[1].create_entity{ name="housing-1-reactor", position=event.created_entity.position, force = game.forces.player}})
  end
end)
script.on_event(defines.events.on_tick, function(event) -- will change it to check way less than once per second later on
  if event.tick % 60 == 0 then
    for index, thetable in ipairs(global.housing1) do -- loop through the housing1 table
      -- if the player built housing no longer exists
      if not thetable.housing1.valid then
        if thetable.housing1reactor.valid then
          thetable.housing1reactor.destroy() -- destroy reactor
          table.remove(global.housing1, index) -- remove the current table (housing and reactor) from the glob.housing table.
        end
		-- elseif reactor underneath house no longer exists, destroy the house above it
      elseif not thetable.housing1reactor.valid then
        if thetable.housing1.valid then
          thetable.housing1.destroy() -- destroy reactor
          table.remove(global.housing1, index) -- remove the current table (housing and reactor) from the glob.housing table.
        end
	  -- now since both still exist, add elseif statement checking temperature is above 60%
	  elseif thetable.housing1reactor.temperature < 600 then
		thetable.housing1reactor.damage(1, game.forces.enemy, "impact") -- I probably won't be keeping this in, but it's useful for visually tracking things
		-- now reduce the heat in each reactor since there is no actual heat loss mechanic
		thetable.housing1reactor.temperature = thetable.housing1reactor.temperature - 6 -- pay a little less when the housing is not operational, allowing an increase in temperature
		thetable.housing1.crafting_progress = 0 -- you lose all crafting process
	  elseif thetable.housing1reactor.temperature > 600 then
		thetable.housing1reactor.temperature = thetable.housing1reactor.temperature - 7 -- pay full maintenance when the housing is operational; it will still slowly increase
      end
    end
  end
end
)






-- -- call game.onevent, tell it we want to do something when an entity is built, and give another anonymous function that will contain the code to actually do stuff
-- game.onevent(defines.events.on_built_entity, function(event)
  -- if event.createdentity.name == "housing-1" then -- if the entity that the player built was a house
    -- -- insert into glob.housing, a table with a 'key' of housing that is the housing-1 entity, and a key of housing-reactor that is a new housing-1-reactor entity at the same position
    -- table.insert(glob.housing, {housing-1=event.createdentity, housing-1-reactor=game.createentity{name="housing-1-reactor", position=event.createdentity.position}})
  -- end
-- end)
-- game.onevent(defines.events.ontick, function(event) -- a tick is 60 times per second
  -- -- there's probably no need to check 60 times per second so only check when the tick count is a multiple of 60 (aka once per second)
  -- -- if you are doing alot of different things you can check equality with any number between 0-59, 1 would be a multiple of 60+1 rather than +0
  -- -- which would spread the work over several ticks rather than all of them running on the same tick and theoretically slowing down Factorio
  -- if event.tick % 60 == 0 then
    -- for index, thetable in ipairs(glob.housing) do -- loop through the glob.housing table
      -- -- if the player built housing no longer exists
      -- if not thetable.housing.valid then
        -- -- just a safety check to avoid destroying a reactor that was somehow already destroyed (unlikely to happen but...)
        -- if thetable.housing-1-reactor.valid then
          -- thetable.housing-1-reactor.destroy() -- destroy the reactor
          -- table.remove(glob.housing, index) -- remove the current table (housing and reactor) from the glob.housing table.
        -- end
      -- end
    -- end
  -- end
-- end
-- )















-- script.on_init(function()
	-- global.potential_population = 0
-- end)

-- data.raw.recipe["beacon"].enabled = false

-- script.on_event(defines.events.on_built_entity, function(event)
-- if game.entity_prototypes["housing-1"] then
	
	-- global.potential_population = global.potential_population+10 -- set variable potential_population +10
	
	-- if global.potential_population >9 then 		-- add an if statement to check what potential_population is. If population <10, add none.
		-- iteminsert{name="labor-1-precursor", count=10}		-- insert an secret item that is the required precursor to make initial labor  (maybe make it so you can't take out the precursor by hand)
	-- end
	
	-- -- set recipe to produce labor
	
-- end




-- script.on_event(defines.events.on_robot_built_entity, function(event)
-- if game.entity_prototypes["housing-1"] then
	-- -- same exact shit but for bot-built houses
-- end

-- script.on_event(defines.events.on_player_mined_entity, function(event)
-- if game.entity_prototypes["housing-1"] then
	-- global.potential_population = global.potential_population-10 --set variable potential_population -10
-- end

-- script.on_event(defines.events.on_entity_died, function(event)
-- if game.entity_prototypes["housing-1"] then
	-- global.potential_population = global.potential_population-10 --set variable potential_population -10
-- end


-- script.on_event(defines.events.on_built_entity, function(event)
-- if game.entity_prototypes["mop-beacon"] then
  -- event.createdentity.insert{name='infifuel', count=1}
-- end)

-- script.on_event(defines.events.on_robot_built_entity, function(event)
-- if game.entity_prototypes["mop-beacon"] then
  -- event.createdentity.insert{name='infifuel', count=1}
-- end)


-- script.on_event(defines.events.on_robot_mined_entity, function(event)
-- if game.entity_prototypes["housing-1"] then
	-- global.potential_population = global.potential_population-10 --set variable potential_population -10
-- end
	
	


-- -- noted untested
-- removed_items = {"beacon"} -- list of all item/fluid names to be removed
-- disabled_recipes = {"beacon"} -- table to store name of disabled recipes in, for technologies
-- -- this loop handles disabling recipes that have ingredients in the removed_items table
-- for name, recipe in pairs(data.raw.recipe) do
    -- if recipe.result then
      -- for _, removeName in ipairs(removed_items) do
          -- if recipe.result == removeName then
              -- recipe.enabled = false
              -- disabled_recipes[name] = name -- remember that we disabled this one
          -- end
      -- end
    -- elseif recipe.results then
      -- for ingredientIndex, ingredient in pairs(recipe.results) do
        -- for _, removeName in ipairs(removed_items) do
          -- -- fluids will be indexed by name, items typically by numeric index
          -- if (ingredient.name and ingredient.name == removeName) or (ingredient[1] and ingredient[1] == removeName ) then
              -- recipe.enabled = false
              -- disabled_recipes[name] = name -- remember that we disabled this one
              -- -- you might want to be more generous here and simply set
              -- -- recipe.results[ingredientIndex] = nil
              -- -- though, in that case there should probably be a check after
              -- -- the loop for if #recipe.results == 0 then disable the recipe
              -- -- if that caused any issues you'd likely need to loop over
              -- -- recipe.results backwards and use table.remove like I do below
              -- -- though I wouldn't expect it to cause issues, I'm not 100% certain
          -- end
        -- end
      -- end
    -- end
-- end

-- for name, technology in pairs(data.raw.technology) do
  -- if technology.effects then -- if there is an effects table, most do, not all
    -- -- loop through effects table backwards, since indexes are numeric
    -- -- and we will be deleting things the indexes would change
    -- -- though if nils are ignored, as I would expect, then that could be
    -- -- done here instead, just wanted it this way for reference mainly
    -- -- fyi, table = {}; table[1] = nil; results in #table == 1
    -- -- whereas table = {}; table['something'] = nil; results in #table == 0
    -- for index=#technology.effects,1,-1 do
      -- local effect = technology.effects[index]
      -- if effect.type == "unlock_recipe" then
        -- if disabled_recipes[effect.recipe] then -- we disabled this recipe
            -- table.remove(technology.effects, index) -- remove it from the table
        -- end
      -- end
    -- end
  -- end
-- end