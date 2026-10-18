//step event

depth = -902

 textbox_x = obj_Overworld_Camera.x + 13;
 
 

//move the soul and change the selected variable
if choice_number != 1
{
if !instance_exists(obj_heart)
{
var soul = instance_create_depth(textbox_x + 140,textbox_y + 28,-903,obj_heart)
soul.image_xscale = 0.5;
soul.image_yscale = 0.5;
}
else
{
var soul = obj_heart	
}

if choice_number > 1
{
if keyboard_check_pressed(global.left)
{
	keyboard_clear(global.left)
	soul.x = textbox_x + 51 + (string_length(choice_1)*2.45)
	soul.y = textbox_y + 28;
	selected_choice = 1;
	play_sound(snd_menumove)
}
if keyboard_check_pressed(global.right)
{
	keyboard_clear(global.right)
	soul.x = textbox_x + 220;
	soul.y = textbox_y + 28;	
	selected_choice = 2;
	play_sound(snd_menumove)
}
if choice_number > 2
{
if keyboard_check_pressed(global.up)
{
	keyboard_clear(global.up)
	soul.x = textbox_x + 140;
	if string_width(choice_3) <= 200
	soul.y = textbox_y + 25
	else
	soul.y = textbox_y + 30
	selected_choice = 3
	play_sound(snd_menumove)
}
}
if choice_number > 3
{
if keyboard_check_pressed(global.down)
{
	keyboard_clear(global.down)
    soul.x = textbox_x + 140;
	if string_width(choice_4) <= 200 
	soul.y = textbox_y + 45
	else
	soul.y = textbox_y + 38;	
	selected_choice = 4;
	play_sound(snd_menumove)
}
}
}
}
else
{
if !instance_exists(obj_heart)
{
var soul = instance_create_depth(textbox_x + 140,textbox_y + 28,-1000,obj_heart)
soul.image_xscale = 0.5;
soul.image_yscale = 0.5;
}
else
{
var soul = obj_heart	
}	
selected_choice = 1;
}

//confirming the choice
if selected_choice != 0
{
if keyboard_check(vk_enter) or keyboard_check(global.confirm)
{
	keyboard_clear(vk_enter)
	keyboard_clear(global.confirm)
	

global.selected_choice = selected_choice;

play_sound(snd_select)

if instance_exists(obj_heart)
instance_destroy(obj_heart)

instance_destroy()
}
}

/*if global.selected_choice != 0
{

instance_destroy(obj_heart)
instance_destroy()
}