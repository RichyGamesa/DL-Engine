// obj_battle_transition Create Event
t_x = camera_get_view_x(view_camera[0]);
t_y = camera_get_view_y(view_camera[0]);

// Default position for Kris
target_player_x = t_x + 125;
target_player_y = t_y + 195;

// Default position for the enemy
target_enemy_x = t_x + 480;
target_enemy_y = t_y + 195;

// Initialize variables for NPCs even if there are no party members
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

// Initialize fake Kris
if (!instance_exists(obj_fake_kris))
{
    var fake_kris = instance_create_depth(obj_mainchara.x, obj_mainchara.y, obj_mainchara.depth, obj_fake_kris);
    obj_mainchara.image_alpha = 0;
    fake_kris.image_alpha = 1;
    fake_kris.sprite_index = spr_battle_k_start;
}

// Initialize party members if they exist
if (instance_exists(obj_follower_suzy) && !instance_exists(obj_suzy))
{
var fake_susie = instance_create_depth(obj_follower_suzy.x, obj_follower_suzy.y, obj_follower_suzy.depth, obj_suzy);
    obj_follower_suzy.image_alpha = 0;
    fake_susie.image_alpha = 1;
	fake_susie.sprite_index = spr_battle_s_start
}
if (instance_exists(obj_follower_ralsei) && !instance_exists(obj_ralsei)) {
    ralsei = instance_create_depth(obj_follower_ralsei.x, obj_follower_ralsei.y, obj_follower_ralsei.depth, obj_ralsei);
    obj_follower_ralsei.image_alpha = 0;
    ralsei.image_alpha = 1;
}
