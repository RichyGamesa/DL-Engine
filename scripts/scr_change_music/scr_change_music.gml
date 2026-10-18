function scr_change_music(argument0)
{
    var room_name = argument0;
	

    // Stop the persistent song if it's not the current song
    if (current_persistent_song != current_song)
	{
        audio_stop_sound(current_persistent_song);

    }

    // Stop the currently playing song if it's not meant to persist
    if (!song_persists && current_song != -1) 
	{
        audio_stop_sound(current_song);
    }
	
	
	
    // Set the current song based on the room name
    switch (room_name) 
	{
        case "rm_chapters":   //the name of the room that the song starts in
            if (!audio_is_playing(AUDIO_DRONE)) //the name of the song
			{
                current_song = audio_play_sound(AUDIO_DRONE, 2, true); 
				song_persists = false;
            }
            ds_list_add(newsong_rooms, "rm_LOGO");  //The name of the room the song stops in.(or the room where there is a new song)
            break;
        case "rm_LOGO": //In this case there are no songs
            ds_list_add(newsong_rooms, "rm_naming");  //In this case is the room that will contain a song.
			song_persists = false;
            break;
        case "rm_naming":
            if (!audio_is_playing(AUDIO_NAME))
			{
                current_song = audio_play_sound(AUDIO_NAME, 2, true);
				song_persists = false;
            }
            ds_list_add(newsong_rooms, "rm_cutscene_start");
            break;
       case "rm_kris_home":
            if (!audio_is_playing(mus_home)) 
			{
                current_song = audio_play_sound(mus_home, 2, true);
                current_persistent_song = current_song; // Update current_persistent_song when persistent song starts
		   }
            ds_list_add(newsong_rooms, "rm_outside"); //The song stops in this room.
            song_persists = true; //This is if the song persists in other rooms (If it continues in other rooms)
            break;
        case "rm_outside":
            if (!audio_is_playing(mus_Hometown_Day))
			{
                current_song = audio_play_sound(mus_Hometown_Day, 2, true);
				current_persistent_song = current_song;
            }
            ds_list_add(newsong_rooms, "rm_castle_kris");
            song_persists = true;
            break;
        case "rm_school_hallway":
            if (!audio_is_playing(mus_Hometown_Day))
			{
                current_song = audio_play_sound(mus_Hometown_Day, 2, true);
				current_persistent_song = current_song;
            }
            ds_list_add(newsong_rooms, "rm_castle_kris");
            song_persists = true;
            break;
            case "rm_green":
            if (!audio_is_playing(mus_Green_Room))
			{
                current_song = audio_play_sound(mus_Green_Room, 2, true);
				song_persists = false;
            }
            ds_list_add(newsong_rooms, "rm_cutscene_start");
            break;
    }





// Stop the persistent song if it's not the current song
    if (current_persistent_song != current_song) 
	{
        audio_stop_sound(current_persistent_song);

    }
}

