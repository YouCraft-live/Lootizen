loot_table_gui:
  type: inventory
  inventory: chest
  title: Choose Table
  gui: true
  procedural items:
  - foreach <script[loot_config].data_key[tables]> key:name as:data:
    # Generate item data
    - define item_lore "<[data].get[items].parse_value_tag[<white><item[<[parse_key]>].material.name> <gray><[parse_value]><&pc>]>"
    - define item_data display=<&r><[name]>;lore=<[item_lore].values>
    # Assemble item
    - define item <item[<[data].get[button]>].with[<[item_data]>]>
    # Append result
    - define result:->:<[item]>

  # Determine result
  - determine <[result]>

loot_table_gui_function:
  type: world
  events:
    after player closes loot_table_gui flagged:loot_chest_config:
    - inventory open d:loot_table_gui o:<player.inventory>
    on player clicks !air in loot_table_gui flagged:loot_chest_config:
    - define loc <player.flag[loot_chest_config]>

    # Flag location and server
    - flag <[loc]> loot_chest:<context.item.display>
    - flag server loot_chests:->:<[loc]>

    # Exit process
    - flag player loot_chest_config:!
    - inventory close