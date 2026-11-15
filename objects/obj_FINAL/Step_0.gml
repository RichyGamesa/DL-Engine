//obj_FINAL step event
//show_debug_message("I EXIST!");
if (room != rm_giveup)
{
    instance_destroy();
    exit;
}

// Start music
if (music_instance == -1)
{
    music_instance = audio_play_sound(
        AUDIO_DARKNESS,
        2,
        false
    );
}

// End game when music finishes
else if (!audio_is_playing(music_instance))
{
    game_end();
}