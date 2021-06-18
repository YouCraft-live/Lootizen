lootizen:
  type: world
  events:
    after reload scripts:
    - if <script[loot_config].data_key[enabled]>:
      - debug log "Hello, world!"