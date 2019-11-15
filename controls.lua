-- give energy to "labor-producing" buildings

--require "defines" -- makes defines table with events available
 --   game.onevent(defines.events.onbuiltentity, function(event)
 --     if event.createdentity.name == "housing-1" then
 --          event.createdentity.insert{name='infifuel', count=1}
 --     end
 --   end)
 --   game.onevent(defines.events.onrobotbuiltentity, function(event)
 --     -- I'm assuming this is createdentity as well, could test with game.player.print(serpent.block(event))
 --     if event.createdentity.name == "housing-1" then
 --          event.createdentity.insert{name='infifuel', count=1}
 --     end
 --   end)


--script.an_event_name_should_be_here(function()
	--a_function_name_this_is()
	
	-- here you can also directly do stuff
--end)

--function a_function_name_this_is()
	-- here you do your function which does stuff
--end


script.on_init(function()
	global.potential_population = 0
end)


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

script.on_event(defines.events.on_robot_mined_entity, function(event)
if game.entity_prototypes["housing-1"] then
	global.potential_population = global.potential_population-10 --set variable potential_population -10
end







