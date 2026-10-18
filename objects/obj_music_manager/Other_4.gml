// obj_music room start event
room_name = room_get_name(room);
var old_song = current_song;

if ds_list_size(newsong_rooms) >= 0
{
    scr_change_music(room_name)
}

if old_song != current_song or old_song != current_persistent_song
{
	audio_stop_sound(old_song)
}

if (audio_is_playing(april_2012)) and room_name != "rm_dojo"   // This is a bug that for some reason has happen ever since i imported that sound
{
    audio_stop_sound(april_2012);
}


global.current_song = current_song;