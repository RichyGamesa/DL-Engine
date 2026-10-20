//obj_battle create event
global.battle = true
image_alpha = 1;
depth = -200
t_x = camera_get_view_x(view_camera[0]);
t_y = camera_get_view_y(view_camera[0]);
x = t_x-50
y = t_y
music = Deltarune_ch3_battle_theme;


if instance_exists(obj_fake_kris)
{obj_fake_kris.cutscene = true}


if !audio_is_playing(music)
{audio_play_sound(music,1,true)}

active = true;

bar_1_x = 0;
bar_2_x = 0;
bar_3_x = 0;

max_turns = global.num_active_members;

switch (global.num_active_members)
{
    case 1:
        bar_1_x = x + 260;
        break;

    case 2:
        bar_1_x = x + 50;
        bar_2_x = x + 475;
        break;

    case 3:
        bar_1_x = x + 10;
        bar_2_x = x + 260;
        bar_3_x = x + 510;
        break;
}

// Data structure for each member
/*
global.memberData = [
    {
        name: "Kris",
        hp_points: global.hp_K,
        maxHp: global.maxhp_K,
		face: spr_kris_head,
        faceSprite: spr_krisb_face,
        hpBarColor: c_aqua
        // No amessage for Kris
    },
    {
        name: "Susie",
        hp_points: global.hp_S,
        maxHp: global.maxhp_S,
		face: spr_suzy_head,
        faceSprite: spr_susieb_face,
        hpBarColor: c_fuchsia,
    },
    {
        name: "Ralsei",
        hp_points: global.hp_R,
        maxHp: global.maxhp_R,
		face: spr_ralsei_head,
        faceSprite: spr_ralseib_face,
        hpBarColor: c_lime,
    },
    {
        name: "Toriel",
        hp_points: global.hp_T,
        maxHp: global.maxhp_T,
		face: spr_kris_head,
        faceSprite: spr_torielb_face_shop,
        hpBarColor: c_orange,
    }
];
*/

selected_button = 0;
turn = 0;
last_selected_button_1 = 0;
last_selected_button_2 = 0;
last_selected_button_3 = 0;
enemy_turn = false;
fighting = false;

bar_1 = spr_battle_bar_Kris;
bar_1_hp = global.hp_K
bar_1_max_hp = global.maxhp_K;
bar_1_face = spr_krisb_face;
bar_1_face_hurt = spr_krisb_face;
bar_1_color = c_aqua;
atk_1 = global.real_atk_K;
def_1 = global.real_df_K;
mag_1 = global.real_mag_K;

bar_2 = spr_battle_bar_Susie;
bar_2_hp = global.hp_S;
bar_2_max_hp = global.maxhp_S;
bar_2_face = spr_susieb_face;
bar_2_face_hurt = spr_susieb_face_hurt;
bar_2_color = c_fuchsia;
atk_2 = global.real_atk_S;
def_2 = global.real_df_S;
mag_2 = global.real_mag_S;
bar_3 = spr_ralseiD;


member_0 = scr_battle_get_actor(global.party_order[0]);
member_1 = noone;
member_2 = noone;

soul_spawn_source = member_0;

if (array_length(global.party_order) > 1)
    member_1 = scr_battle_get_actor(global.party_order[1]);

if (array_length(global.party_order) > 2)
    member_2 = scr_battle_get_actor(global.party_order[2]);

selected_member = 0;

member_0_name = global.party_order[0]
member_1_name = 0;
member_2_name = 0;
if global.num_active_members == 2
{
member_1_name = global.party_order[1]
}
if global.num_active_members == 3
{
member_1_name = global.party_order[1]
member_2_name = global.party_order[2]
}

scr_info_battle_members(member_0_name,member_1_name,member_2_name)




//fight section
fight_selecting = false;
enemy_number = instance_number(obj_enemy_overworld)
enemy_selected = 0;
attack = 0;

if enemy_number == 1
{
enemy_0_name = obj_enemy_overworld.name	
}

//Item section
itemlist = false;
item_selected = 0;
max_items_per_row = 3;
item_height = 30; // Height of each item
item_spacing = 5; // Vertical spacing between items
item_width = 140; // Width of each item
longness = array_length(global.items_dark);
eaten = false;
selected_person_item = 0;
selecting_person_item = false;
list_1 = false;
list_2 = false;

act_menu_active = false;

if instance_exists(obj_fake_kris)
{
	with (obj_fake_kris)
	{
	  image_speed = 1;
      sprite_index = battle_loop_sprite;
	}
}

if instance_exists(obj_suzy)
{
	  with (obj_suzy)
 {
	 image_speed = 1;
	sprite_index = battle_loop_sprite
 }
}