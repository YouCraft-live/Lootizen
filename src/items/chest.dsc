#| I don't know if we should put ilore on it
#| Probably not, since it's only going to be used by ops

loot_chest:
  type: item
  material: chest
  display name: <yellow>Loot Chest

loot_chest_function:
  type: world
  events:
    on player places loot_chest:
    - flag player loot_chest_config:<context.location>
    - inventory open d:loot_table_gui o:<player.inventory>
    on player breaks chest location_flagged:loot_chest:
    - flag <context.location> loot_chest:!
    - flag server loot_chests:<-:<context.location>