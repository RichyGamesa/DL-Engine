if (going_up)
{
    textbox_image_index = min(
        textbox_image_index + 0.3,
        4
    );

    if (textbox_image_index >= 4)
    {
        going_up = false;
        alarm[0] = 60;
    }
}
else
{
    textbox_image_index = max(
        textbox_image_index - 0.3,
        0
    );

    if (textbox_image_index <= 0)
    {
        going_up = true;
        alarm[1] = 60;
    }
}


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