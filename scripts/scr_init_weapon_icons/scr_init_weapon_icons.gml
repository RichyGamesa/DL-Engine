// Script: scr_init_weapon_icons

// Initialize the ds_map for weapon icons
global.weapon_icons = ds_map_create();

// Add weapon icons to the map
ds_map_add(global.weapon_icons, " ", spr_symbol_mini_empty);
ds_map_add(global.weapon_icons, "Wood Blade", spr_symbol_mini_sword);
ds_map_add(global.weapon_icons, "Mane Ax", spr_symbol_mini_axe);
ds_map_add(global.weapon_icons, "Red Scarf", spr_symbol_mini_scarf);
ds_map_add(global.weapon_icons, "EverybodyWeapon", spr_symbol_mini_empty); // Assuming there's no specific icon for this
ds_map_add(global.weapon_icons, "Spookysword", spr_symbol_mini_sword);
ds_map_add(global.weapon_icons, "Brave Ax", spr_symbol_mini_axe);
ds_map_add(global.weapon_icons, "Devilsknife", spr_symbol_mini_axe);
ds_map_add(global.weapon_icons, "Trefoil", spr_symbol_mini_sword);
ds_map_add(global.weapon_icons, "Ragger", spr_symbol_mini_scarf);
ds_map_add(global.weapon_icons, "DaintyScarf", spr_symbol_mini_scarf);
ds_map_add(global.weapon_icons, "TwistedSwd", spr_symbol_mini_sword);
ds_map_add(global.weapon_icons, "SnowRing", spr_symbol_mini_ring);
ds_map_add(global.weapon_icons, "ThornRing", spr_symbol_mini_ring);
ds_map_add(global.weapon_icons, "BounceBlade", spr_symbol_mini_sword);
ds_map_add(global.weapon_icons, "CheerScarf", spr_symbol_mini_scarf);
ds_map_add(global.weapon_icons, "MechaSaber", spr_symbol_mini_sword);
ds_map_add(global.weapon_icons, "AutoAxe", spr_symbol_mini_axe);
ds_map_add(global.weapon_icons, "FiberScarf", spr_symbol_mini_scarf);
ds_map_add(global.weapon_icons, "Ragger2", spr_symbol_mini_scarf);
ds_map_add(global.weapon_icons, "BrokenSwd", spr_symbol_mini_sword); // Assuming there's no specific icon for this
ds_map_add(global.weapon_icons, "Kris's hand", spr_symbol_mini_sword) //you have to put the icon here as well.

// Add more weapons as needed
