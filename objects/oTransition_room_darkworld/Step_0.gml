if room = target_room and image_index < 1{
//kill intself	
	instance_destroy();
}
if image_index > 15 and room != target_room {
	room_goto(target_room);
		if instance_exists(obj_mainchara)
	{
obj_mainchara.x = target_x;
obj_mainchara.y = target_y;
	}
global.darkworld = true;
}