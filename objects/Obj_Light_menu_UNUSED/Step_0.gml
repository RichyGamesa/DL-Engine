obj_mainchara.can_move = false 
obj_mainchara.move_spd = 0;
active = true
visible =  true



if image_index = 0 and keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter){
	keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
	image_index = 1;
}
if image_index = 1 and keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter){
	keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
	image_index = 2;
}
if image_index = 1 and keyboard_check_pressed(global.down) {
   	
}
if image_index = 2 and keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter){
	keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
	visible = false;
	instance_create_depth(0,0,-99,oTextbox_light)

	oTextbox_light.text[0] = "* You look at the ball of trash"
	
}
if image_index = 2 and keyboard_check_pressed(global.right){
	keyboard_clear(global.right)
	image_index = 3
}
if image_index = 3 and keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter){
	keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
	visible = false;
	instance_create_depth(0,0,-99,oTextbox_light)
	oTextbox_light.text[0] = "* An orb made of trash"
	
	
}
if image_index = 3 and keyboard_check_pressed(global.left){
	keyboard_clear(global.left)
	image_index = 2
}
if image_index = 3 and keyboard_check_pressed(global.right){
	keyboard_clear(global.right)
	image_index = 4
}
if image_index = 4 and keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter){
	visible = false;
	keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
	instance_create_depth(0,0,-99,oTextbox_light)
	oTextbox_light.text[0] = "* You don't want to throw it away"
	
}
if image_index = 4 and keyboard_check_pressed(global.left){
	keyboard_clear(global.left)
	image_index = 3
}
if image_index = 0 and keyboard_check_pressed(global.down){
	keyboard_clear(global.down)
	image_index = 5
}
if image_index = 5 and keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter){
	keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
	image_index = 6
}
if image_index = 6 and keyboard_check_pressed(vk_shift){
 image_index = 5	
}
if image_index = 5 and keyboard_check_pressed(global.down){
	keyboard_clear(global.down)
	image_index = 7
}
if image_index = 5 and keyboard_check_pressed(global.up){
	keyboard_clear(global.up)
	image_index = 0
}

if image_index = 7 and keyboard_check_pressed(global.up){
	keyboard_clear(global.up)
	image_index = 5;
}
if image_index = 7 and keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter){
keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
image_index = 8	
}
if image_index = 8 and keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter){
    visible = false;
	instance_create_depth(0,0,-99,oTextbox_light)
	audio_play_sound(snd_phone,7,false)
	oTextbox_light.text[0] = "* RING..."
	oTextbox_light.text[1] = "* RING..."
	oTextbox_light.text[2] = "* nobody picked up?"
	
}
if image_index = 8 and keyboard_check_pressed(global.cancel){
image_index = 7	
}
if keyboard_check_direct(ord("X")){
		obj_mainchara.can_move = true
	active = false
	instance_destroy()
	}

	if instance_exists(oTextbox_light)
	{instance_destroy()}
	if image_index != previous_image {audio_play_sound(snd_menumove,9, false)}
	previous_image = image_index;
	