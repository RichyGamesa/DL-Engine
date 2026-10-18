if room = target_room and image_index < 1
{
	instance_destroy(); //kill intself	
}
if image_index > 15 and room != target_room 
{
	room_goto(target_room);
	if instance_exists(mainchara)
	{
       mainchara.x = target_x;
       mainchara.y = target_y;
	   mainchara.sprite_index = mainchara_image
	}
}


var menu = 0;
if global.darkworld 
menu = obj_menu_dark;
else
menu = obj_Light_menu

if instance_exists(menu)
{
if instance_exists(obj_soul)
{instance_destroy(obj_soul)}
if instance_exists(obj_heart)
instance_destroy(obj_heart)
	
	if instance_exists(mainchara)
	{ 
		mainchara.can_move = true;
	}
	instance_destroy(menu)
}
	
