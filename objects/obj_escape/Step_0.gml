if keyboard_check(vk_escape)
{
	image_speed = 4
	if image_index  > 3 and image_index < 5
	{image_speed = 1}
    
	if image_index > 6 and image_index < 8
	{game_end()}
}

else 
{
image_index = 0;
image_speed = 0;
instance_destroy()
}

escape_x = camera_get_view_x(view_camera[0])+ 10;
escape_y = camera_get_view_y(view_camera[0])+ 140;
