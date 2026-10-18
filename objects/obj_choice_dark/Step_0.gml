//step event

 textbox_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - textbox_width) / 2;
 textbox_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - textbox_height - border;


//move the soul and change the selected variable
if choice_number != 1
{
if !instance_exists(obj_soul)
{
var soul = instance_create_depth(textbox_x + 230,textbox_y + 65,-1000,obj_soul)
soul.image_xscale = 1;
soul.image_yscale = 1;
}
else
{
var soul = obj_soul	
soul.image_xscale = 1;
soul.image_yscale = 1;
}

if choice_number > 1
{
if keyboard_check_pressed(global.left)
{
	keyboard_clear(global.left)
	soul.x = textbox_x + 110;
	if string_width(choice_1) > 60
	{
	soul.x = textbox_x + 140;	
	}
	soul.y = textbox_y + 55;
	selected_choice = 1;
	scr_sound_play(snd_menumove)
}
if keyboard_check(global.right)
{
	keyboard_clear(global.right)
	soul.x = textbox_x + 370;
	soul.y = textbox_y + 55;
	selected_choice = 2;
	scr_sound_play(snd_menumove)
}
if choice_number > 2
{
if keyboard_check(global.up)
{
	keyboard_clear(global.up)
	soul.x = textbox_x + 230;
	soul.y = textbox_y + 40;	
	selected_choice = 3
	scr_sound_play(snd_menumove)
}
}
if choice_number > 3
{
if keyboard_check(global.down)
{
	keyboard_clear(global.down)
    soul.x = textbox_x + 230;
	soul.y = textbox_y + 80;	
	selected_choice = 4;
	scr_sound_play(snd_menumove)
}
}
}
}
else
{
if !instance_exists(obj_soul)
{
var soul = instance_create_depth(textbox_x + 220,textbox_y + 65,-1000,obj_soul)
soul.image_xscale = 1;
soul.image_yscale = 1;
alarm[2] = 30;
}
else
{
var soul = obj_soul	
soul.image_xscale = 1;
soul.image_yscale = 1;
}	

}

if selected_choice != 0
{
if keyboard_check(vk_enter) or keyboard_check(global.confirm)
{
	keyboard_clear(vk_enter)
	keyboard_clear(global.confirm)
	

global.selected_choice = selected_choice;

scr_sound_play(snd_select)

}
}


if going_up
{
if textbox_image_index != 4
{
textbox_image_index += 0.3;
}
else
{
alarm[0] = 60;	
}
}
else
{
if textbox_image_index != 0
{
textbox_image_index -= 0.3	
}
else
{
alarm[1] = 60;
}
}

if global.selected_choice != 0
{

instance_destroy(obj_soul)
instance_destroy()
}