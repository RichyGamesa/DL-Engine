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

image_speed = 2;


if audio_stop != noone
{
	if audio_is_playing(audio_stop)
	{
	  skippable = false	
	}
	else
	{
		skippable = true
	}
	
}



