function scr_info_battle_members(argument0,argument1,argument2)
{

if argument0 != 0
{
if argument0 == "Kris"
{
member_0 = obj_fake_kris;
bar_1 = spr_battle_bar_Kris;
bar_1_hp = global.hp_K
bar_1_max_hp = global.maxhp_K;
bar_1_face = spr_krisb_face;
bar_1_face_hurt = spr_krisb_face;
bar_1_color = c_aqua;
atk_1 = global.real_atk_K;
def_1 = global.real_df_K;
mag_1 = global.real_mag_K;
}
if argument0 == "Susie"
{
member_0 = obj_suzy
bar_1 = spr_battle_bar_Susie;
bar_1_hp = global.hp_S;
bar_1_max_hp = global.maxhp_S;
bar_1_face = spr_susieb_face;
bar_1_face_hurt = spr_susieb_face_hurt;
bar_1_color = c_fuchsia;
atk_1 = global.real_atk_S;
def_1 = global.real_df_S;
mag_1 = global.real_mag_S;
}

}

if argument1 != 0
{
if argument1 == "Kris"
{
member_1 = obj_fake_kris
bar_2 = spr_battle_bar_Kris;
bar_2_hp = global.hp_K
bar_2_max_hp = global.maxhp_K;
bar_2_face = spr_krisb_face;
bar_2_face_hurt = spr_krisb_face;
bar_2_color = c_aqua;
atk_2 = global.real_atk_K;
def_2 = global.real_df_K;
mag_2 = global.real_mag_K;
}
if argument1 == "Susie"
{
member_1 = obj_suzy;
bar_2 = spr_battle_bar_Susie;
bar_2_hp = global.hp_S;
bar_2_max_hp = global.maxhp_S;
bar_2_face = spr_susieb_face;
bar_2_face_hurt = spr_susieb_face_hurt;
bar_2_color = c_fuchsia;
atk_2 = global.real_atk_S;
def_2 = global.real_df_S;
mag_2 = global.real_mag_S;
}

}







}