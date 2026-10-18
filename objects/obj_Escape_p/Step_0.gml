if keyboard_check_direct(vk_escape)
{
    escape_x = camera_get_view_x(view_camera[0]);
    escape_y = camera_get_view_y(view_camera[0]);
	if instance_exists(obj_escape) != true {
	instance_create_depth(escape_x,escape_y,-9997,obj_escape);
	}
}