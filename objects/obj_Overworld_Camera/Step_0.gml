if !instance_exists(obj_ExampleCutscene) and room != rm_death and instance_exists(obj_mainchara)
{
	if !global.darkworld
    {
	x = obj_mainchara.x - 160;
	y = obj_mainchara.y - 120;
	}
	else
	{
	x = obj_mainchara.x - (160*2);
	y = obj_mainchara.y - (120*2);	
	}
}

if !global.darkworld
{
x = clamp(x, 0, room_width - 320);
y = clamp(y, 0, room_height - 240);
}
else
{
x = clamp(x, 0, room_width  - (320*2));
y = clamp(y, 0, room_height - (240*2));	
}
camera_set_view_pos(view_camera[0], x, y);
