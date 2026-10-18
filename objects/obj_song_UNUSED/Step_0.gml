// Step Event

if (!song_exists && current_song == 0) {
    show_debug_message("Starting new song.");
    audio_play_sound(new_song, 9, true);
    song_exists = true;
    current_song = new_song;
    current_room = room;
}

if (room != current_room) {
    if (room == stop_room) {
        show_debug_message("Stopping current song.");
        audio_stop_sound(current_song);
		current_song = 0;
    }
}


// Additional check if song needs to start again
if (!song_exists && current_song == 1) {
    show_debug_message("Restarting song.");
    audio_play_sound(new_song, 9, true);
    song_exists = true;
    current_song = 1;
}




// Handle transitions between different rooms and songs
switch (room) {
    case rm_chapters:
     new_song = AUDIO_DRONE;
	 stop_room = rm_LOGO;
        break;
    // Add cases for other rooms...
}