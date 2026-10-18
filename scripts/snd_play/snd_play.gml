//@audio to play

function snd_play_no_repeat(argument0) //gml_Script_snd_play
{
	if !audio_is_playing(argument0)
    return audio_play_sound(argument0, 50, false);
}

