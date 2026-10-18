

// Create soul fragments
if play == false  {
    
if (image_index > 0 and image_index < 2) {
	audio_play_sound(snd_break1, 1, false);
	image_speed = 0.40;
	play = true
	}
	
} 
if pluy == false {
if (image_index > 2 and image_index< 3) {
    audio_play_sound(snd_break2, 1, false);
	pluy = true
	}
} 
if (image_index > 2 && i < 5) {
	// Ensure i is less than 4 to create up to 4 fragments
	image_speed = 0;
    
    var fragment = instance_create_layer(x, y, "Instances", obj_heartshards);
	show_debug_message(i)
	alarm[0] = 76;
}

