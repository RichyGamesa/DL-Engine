// Fullscreen toggle

ini_open("configurations.ini")

if keyboard_check_pressed(vk_f4)
{
    global.fullscreen = !global.fullscreen;
    
	ini_write_real("SCREEN","Fullscreen",global.fullscreen)
	keyboard_clear(vk_f4)

}
window_set_fullscreen(global.fullscreen);



//Quitting
if keyboard_check_direct(vk_escape)
{
   var  escape_x = camera_get_view_x(view_camera[0]);
   var  escape_y = camera_get_view_y(view_camera[0]);
	if instance_exists(obj_escape) != true 
	{
	instance_create_depth(escape_x,escape_y,-9997,obj_escape);
	}
}

if !object_exists(obj_mainchara) 
{
	instance_create_depth(0, 0, 0, obj_mainchara)
}

if room != rm_naming 
{scr_debug()}

//the weird cursor thing in debug (still working on it)
if global.fake
{
 if keyboard_check(vk_control) and keyboard_check(ord("O"))
 {
	 keyboard_clear(vk_control)
	 keyboard_clear(ord("O"))
	 if instance_exists(obj_debug_cursor)
	{instance_destroy(obj_debug_cursor)}
	else
	{
	  instance_create_depth(mouse_x,mouse_y,-1000000000,obj_debug_cursor)
	  scr_sound_play(snd_select_debug)
	  audio_sound_pitch(snd_select_debug,0.8)
	}
 }
}
if global.fake
{
 if mouse_check_button(mb_middle)
 {
	mouse_clear(mb_middle)
	if instance_exists(obj_debug_cursor)
	{instance_destroy(obj_debug_cursor)}
	else
	{
	  instance_create_depth(mouse_x,mouse_y,-1000000000,obj_debug_cursor)
	  scr_sound_play(snd_select_debug)
	  audio_sound_pitch(snd_select_debug,0.8)
	}
 }	
}

//debug mode activate
if keyboard_check(vk_f1)
{
	keyboard_clear(vk_f1)
if global.fake == true
{global.fake = false}
else
{global.fake = true}
scr_sound_play(snd_select_debug)
 audio_sound_pitch(snd_select_debug,0.8)
}

//Open the menus
if object_exists(obj_mainchara) = true
{
	if global.dialogue == false
	{
	if obj_mainchara.can_move = true and room != rm_shop and room != rm_shop_nomal
	  {
	if keyboard_check_pressed(global.menu) or keyboard_check_pressed(vk_control)
	    {
		if global.darkworld == false 
		{
		if !instance_exists(obj_Light_menu) 
		{instance_create_depth(0,0,-9995,obj_Light_menu)}
		}
		else
		{
	    if !instance_exists(obj_menu_dark) and !global.bulletzone 
		{
			instance_create_depth(0,0,-9995,obj_menu_dark)
		}
		}
	    }
	  }
	}
}


 if !done
 {
	 scr_memb()
	 done = true;
 }
 for (var i = 1; i < array_length(global.memberData); i++) 
{
    if (global.member[i]) {
        var member = global.memberData[i];
        var member_name = member.name;
        var hp = member.hp_points;
        var max_hp = member.maxHp;
        var sprite_face = member.faceSprite;
        var hp_bar_color = member.hpBarColor;

global.total_hp = global.hp_K 

}

 }
global.num_active_members = global.member[0] + global.member[1] + global.member[2] + global.member[3] 
if global.num_active_members > 3 {global.num_active_members = 3}


//show_debug_message("Num active member = " + string(global.num_active_members))
var clamped_volume = clamp(global.volume, 0, 60);
audio_group_set_gain(audiogroup_default, clamped_volume / 100.0, 0)


//show_debug_message("Volume = " + string(global.volume))


if room != rm_chapters
{
scr_spell_map()
}