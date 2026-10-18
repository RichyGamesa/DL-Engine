obj_mainchara.can_move = false;
image_index = 0;

if image_index = 0 and keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"))
{
	image_index = 1;
}
if image_index = 1 and keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"))
{
	image_index = 2
}
if image_index = 2 and keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"))
{
	visible = false;
	instance_destroy()
    instance_create_depth(0,0,20,oTextbox)
	oTextbox.text[0] = "*You look at the ball of junk with admiration"
}