//scr_Gamestart();
global.fake = 0;
// Step Event
window_set_caption("Deltarune")
if !anim_start
{
if !confirmed_a_chapter
{
if (keyboard_check_pressed(global.up)) 
{
    audio_play_sound(snd_menumove,10,false)
	if selected_chapter != 1
	{
		selected_chapter--;
	}
	else
	selected_chapter = button_count

} 
else if (keyboard_check_pressed(global.down)) 
{
	audio_play_sound(snd_menumove,10,false)
   if selected_chapter != button_count
   {
		selected_chapter++
	}
    else
	selected_chapter = 1;

}

// Handle keyboard input for selecting the button
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.confirm)) {
    keyboard_clear(global.confirm)
	keyboard_clear(ord("Z"))
	scr_sound_play(snd_select)
	
	if selected_chapter != button_count
	confirmed_a_chapter = true;
	else
	game_end()
	
}

}
else
{

if (keyboard_check_pressed(vk_shift) || keyboard_check_pressed(global.cancel))
{
confirmed_a_chapter = false;
snd_play(snd_swing)
}



if keyboard_check(global.left)  //YES
{

scr_sound_play(snd_menumove)
selected_button = 0;
keyboard_clear(global.left)
}
if keyboard_check(global.right) //NO
{
scr_sound_play(snd_menumove)
selected_button = 1;
keyboard_clear(global.right)
}

if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm)
{
    keyboard_clear(global.confirm)
	keyboard_clear(ord("Z"))

if selected_button == 0 //If yes
{
scr_sound_play(snd_select)
anim_start = true
global.chapter = selected_chapter
}
else    //if no
{
snd_play(snd_swing)
confirmed_a_chapter = false;
selected_button = 0;
}
}



}
}

else
{
  
    menu_stretch = max(0, menu_stretch - 0.035);

    _alpha = max(0, _alpha - 0.02);

    audio_stop_sound(AUDIO_DRONE);
	snd_play_no_repeat(_chapter_noise[selected_chapter])
}

// Transition when nearly collapsed
if (anim_start && menu_stretch <= 0.01)
{
	x =99999; //just  make it so that it doesn't appear again
    if (!instance_exists(oTransition_room))
    {
        // Restore normal rendering before changing rooms
        application_surface_draw_enable(true);

        var trans = instance_create_depth(
            x, y, depth, oTransition_room
        );

        trans.target_room = rm_LOGO;
        trans.depth = -100;
        trans.target_y = -10000000;
    }
}

