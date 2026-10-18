if keyboard_check(vk_escape){
	image_speed = 1
	if image_index  > 0 and image_index < 2
	{image_speed = 0.7}
    
	if image_index > 6 and image_index < 8
	{game_end()}
	
	//since this doesn't work i'll just make it close if you press it once (it stopped working for no reason)
	

 
}

else 
{
image_index = 0;
image_speed = 0;
instance_destroy()
}

if x != camera_get_view_x(view_camera[0]) + 10 or y != camera_get_view_y(view_camera[0]) + 140 {
    escape_x = camera_get_view_x(view_camera[0]);
    escape_y = camera_get_view_y(view_camera[0]);
	instance_create_depth(escape_x,escape_y,-9997,obj_escape);
	obj_escape.image_index = image_index
	obj_escape.image_speed = image_speed
	instance_destroy()
}
