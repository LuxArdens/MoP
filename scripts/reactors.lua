local reactor = {}

-- Look for invalid entities every CLEANUP_DELAY ticks
CLEANUP_DELAY = 300

-- Enable/disable on_tick and on_nth_tick. Must be called from on_load and when the first entity has been built or the last entity has been removed.
function toggle_tick_events(enable)
  if enable then
    log("Activating on_tick!")
    script.on_event(defines.events.on_tick, check_temperature)
    log("Activating on_nth_tick!")
    script.on_nth_tick(CLEANUP_DELAY, cleanup_entities)
  else
    log("TUrning off on_tick!")
    script.on_event(defines.events.on_tick, nil)
    log("TUrning off  on_nth_tick!")
    script.on_nth_tick(CLEANUP_DELAY, nil)
  end
end

function init()
  global.housing1 = global.housing1 or {}
end

function register_entities(event)
  -- We use the same function for different events, so we must cover all different
  -- key names to get the entity!
  local entity = event.created_entity or -- on_built_entity/on_robot_built_entity
                  event.destination or    -- on_entity_cloned
                  event.entity            -- script_raised_*

  local player = event.player_index and game.get_player(event.player_index)
  local robot = event.robot

  local force = (player and player.valid and player.force) or
                (robot and robot.valid and robot.force) or
                entity.force

  local surface = entity.surface

  if force and force.valid and surface and surface.valid then

    -- If this is the first entity, activate on_tick and on_nth_tick!
    if not next(global.housing1) then
      local enable = true
      toggle_tick_events(enable)
    end

    -- Create reactor
    local reactor = surface.create_entity{
      name = "housing-1-reactor",
      position = entity.position,
      force = force,
      create_build_effect_smoke = false,
    }

    -- insert into the global.housing1 table an entry with a 'key' of housing that is the housing-1 entity, and a key of housing-reactor that is a new housing-1-reactor entity at the same position
    table.insert( global.housing1, { housing1 = entity, housing1reactor = reactor })
  end
end

function cleanup_entities()
  -- Removing elements from a table while looping over it with pairs() or ipairs() is
  -- not reliable because it will mess with the iterator. Instead, check a copy of the
  -- table and use the index to remove elements from the original.
  -- EDIT: Instead, move valid entities to temporary table and use that to replace
  -- the original when done.
  local tmp = {}
  for index, thetable in ipairs(global.housing1) do
    if not (thetable.housing1 and thetable.housing1.valid) then
      log(index..": Invalid housing")
      if (thetable.housing1reactor and thetable.housing1reactor.valid) then
        thetable.housing1reactor.destroy() -- destroy reactor
        --~ table.remove(global.housing1, index) -- remove the current table (housing and reactor) from the glob.housing table.
      end
		-- elseif reactor underneath house no longer exists, destroy the house above it
    elseif not (thetable.housing1reactor and thetable.housing1reactor.valid) then
      log(index..": Invalid reactor")
      if thetable.housing1.valid then
        thetable.housing1.destroy() -- destroy reactor
        --~ table.remove(global.housing1, index) -- remove the current table (housing and reactor) from the glob.housing table.
      end
    else
      log(index..": Keeping housing and reactor")
      table.insert(tmp, thetable)
    end
  end
  global.housing1 = table.deepcopy(tmp)

  -- If the last entity has been removed, cancel on_tick and on_nth_tick!
  if not next(global.housing1) then
    local enable = false
    toggle_tick_events(enable)
  end
end


function check_temperature(event)
  for index, thetable in ipairs(global.housing1) do -- loop through the housing1 table
    if thetable.housing1reactor.temperature < 600 then
      -- I probably won't be keeping this in, but it's useful for visually tracking things
      thetable.housing1reactor.damage(1, game.forces.enemy, "impact") 

      -- now reduce the heat in each reactor since there is no actual heat loss mechanic
      thetable.housing1reactor.temperature = thetable.housing1reactor.temperature - 6 -- pay a little less when the housing is not operational, allowing an increase in temperature
      thetable.housing1.crafting_progress = 0 -- you lose all crafting process

    elseif thetable.housing1reactor.temperature > 600 then
      thetable.housing1reactor.temperature = thetable.housing1reactor.temperature - 7 -- pay full maintenance when the housing is operational; it will still slowly increase
    end
  end
end


return reactors
