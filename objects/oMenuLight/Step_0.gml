
if keyboard_check_pressed(vk_control) or keyboard_check_pressed(ord("C")) && obj_mainchara.can_move{
	instance_create_depth(0,0,-9997, obj_menuL)
}
if instance_exists(obj_menuL) and keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift){
	instance_destroy(obj_menuL)
	obj_mainchara.can_move = true
}
