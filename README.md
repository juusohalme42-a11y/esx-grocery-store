# ESX Grocery Store

A simple ESX grocery store script compatible with ox_inventory.

## Features
- ESX-based money handling
- ox_inventory item delivery
- marker interaction
- easy item configuration
- clean menu-based shopping

## Installation
1. Put the `esx_grocery` folder into your `resources` folder.
2. Make sure `es_extended` is installed.
3. Make sure `ox_inventory` is installed and running.
4. Add this in your `server.cfg`:

```cfg
ensure es_extended
ensure ox_inventory
ensure esx_grocery
```

## Important
This script uses the item names listed in `config.lua`.
If an item is not defined in your ox_inventory item list, add it there first.

Example item names:
- `bread`
- `water`
- `milk`
- `sandwich`
- `energy`
- `sprunk`
- `donut`

## Notes
This is a simple starter version intended for semi-chill RP servers. It can be expanded with stock, sales, discounts, or a more custom shop layout.
