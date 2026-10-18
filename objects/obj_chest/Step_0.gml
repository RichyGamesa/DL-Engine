if place_meeting(x,y,obj_mainchara) and obj_mainchara.can_move and !instance_exists(oTextbox_dark)
{
if keyboard_check(global.confirm) or keyboard_check(vk_enter)
{
keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
if openable
{
obj_mainchara.can_move = false;
image_index = 1;

if open == false and flag == false
{
open = true
scr_sound_play(snd_locker)
if type == "Item"
{
inventory = global.items_dark
inventory_space = empty_longness_item
}
if type == "Weapon"
{
inventory = global.weapons
inventory_space = empty_longness_weapon
}
if type == "Armor"
{
inventory = global.armors
inventory_space = empty_longness_armor
}

if !instance_exists(oTextbox_dark)
{
instance_create_depth(x,y,-100,oTextbox_dark)	
}
oTextbox_dark.text[0] = "*You find {CY}" + string(contains) + "{CW}";
if inventory_space > 0
{
if type == "Item"
{
add_items_dark(contains)
}
if type == "Weapon"
{
add_weapon(contains)	
}
if type == "Armor"
{
add_armor(contains)	
}
oTextbox_dark.text[1] = "*You put {CY}" + string(contains) + "{CW} in your " +string(type) + "s";
global.flag[flag_index] = true;
}
else
{
oTextbox_dark.text[1] = "*Your Inventory is full so you put it back";
open = false;
alarm[0] = 30

}
obj_mainchara.can_move = true;
show_debug_message("inventory = " + string(inventory))
show_debug_message("Inventory space = " + string(inventory_space))
}
else
{
if !instance_exists(oTextbox_dark)
{
instance_create_depth(x,y,-100,oTextbox_dark)	
}
oTextbox_dark.text[0] = "*There is nothing more than dust in this chest"
}
}
}
}

//Update the empty space
empty_longness_item = 12 - count_non_empty_elements(global.items_dark)
empty_longness_weapon = 48 - count_non_empty_elements(global.weapons)
empty_longness_armor = 48 - count_non_empty_elements(global.armors)



if instance_exists(oTextbox_dark)
{
openable = false;
alarm[1] = 45;	
}

if global.flag[flag_index] == true
{
image_index = 1;	
}

//depth
if obj_mainchara.y < y - 35
{ 
depth = (obj_mainchara.depth - obj_mainchara.depth) - 3 
}
else
{
depth = obj_mainchara.depth + 3
}