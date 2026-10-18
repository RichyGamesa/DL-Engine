////oTextbox_dark step event
if old_draw_char != draw_char
{
	if more_sounds == true
	{
audio_play_sound(txtb_sound[page], 10, false)
	}
	else
	{
audio_play_sound(txtb_sounds, 10, false)		
	}
}

image_speed = 1;


if audio_stop != noone
{
	if audio_is_playing(audio_stop)
	{
	  audio_stop_sound(global.current_song)
	  skippable = false	
	}
	else
	{
		audio_resume_sound(global.current_song)
		skippable = true
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