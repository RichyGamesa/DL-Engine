//obj_chest create event
open = false;
openable = true;
contains = " "
type = " ";
empty_longness_item = 12 - count_non_empty_elements(global.items_dark)
empty_longness_weapon = 48 - count_non_empty_elements(global.weapons)
empty_longness_armor = 48 - count_non_empty_elements(global.armors)
inventory = global.items_dark
inventory_space = empty_longness_item

image_xscale = 2;
image_yscale = 2;
wall = instance_create_depth(x,y,depth,oWall)
wall.image_xscale = 0.3;
wall.image_yscale = 0.3;



flag_index = 4;
flag = global.flag[flag_index]