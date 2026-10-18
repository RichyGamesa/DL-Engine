// obj_music_controller Create Event
depth = -9999999999999999;
current_song = -1; // Variable to store the ID of the currently playing song
room_name = room_get_name(room);
newsong_rooms = ds_list_create(); // List to store multiple possible next rooms
song_persists = false; // Flag to indicate if the current song should persist
current_persistent_song = 0; // Variable to store the ID of the currently persistent song