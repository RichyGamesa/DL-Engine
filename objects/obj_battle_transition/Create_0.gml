// obj_battle_transition Create Event
t_x = camera_get_view_x(view_camera[0]);
t_y = camera_get_view_y(view_camera[0]);

// Default position for leader
target_player_x = t_x + 125;
target_player_y = t_y + 195;

// Default position for the enemy
target_enemy_x = t_x + 480;
target_enemy_y = t_y + 195;

// Initialize variables for NPCs/partymembers 
target_npc_1_x = target_player_x;
target_npc_1_y = target_player_y;
target_npc_2_x = target_player_x;
target_npc_2_y = target_player_y;

// Adjust positions for multiple party members
if (global.num_active_members > 1)
{
    target_player_y = t_y + 70;

}

if global.num_active_members == 2
{
target_npc_1_x = target_player_x;
target_npc_1_y = t_y + 195	
}

if global.num_active_members == 3
{
	target_npc_1_x = target_player_x;
	target_npc_2_x = target_player_x;
	target_npc_1_y = target_player_y + 40;
    target_npc_2_y = target_npc_1_y + 80;
}

transition_speed = 5; // Adjust speed as necessary

// Stop other sounds and play transition sound
audio_stop_all();
if (!audio_is_playing(snd_weaponpull))
{
    audio_play_sound(snd_weaponpull, 1, false);
}



scr_battle_transition_setup();