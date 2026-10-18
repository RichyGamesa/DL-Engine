show_debug_message("I EXIST!");
if room != rm_giveup {
    show_debug_message("Room is not rm_giveup.");
    instance_destroy();
}
if instance_exists(obj_FAILURE) {
    show_debug_message("Instance of obj_FAILURE exists.");
}

if !audio_is_playing(AUDIO_DARKNESS)
{
if time = 0
{
 audio_play_sound(AUDIO_DARKNESS,2,false)
 time = 1;
}
if time = 1 and !audio_is_playing(AUDIO_DARKNESS)
{
 game_end()	
}
}
  