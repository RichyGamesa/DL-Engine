//create event
image_speed = 9;
image_xscale = 1;
image_yscale = 1;
xspd = 0;
yspd = 0;
can_move = true; // if the character can move
move_spd = 1; // how fast you move
walk_spd = 1.2;
run_spd = 2.4;

sprite_up     = spr_suzyU;
sprite_right  = spr_suzyR;
sprite_down   = spr_suzyD;
sprite_left   = spr_suzyL;
sprite_slide  = spr_suzy_slide

sprite_up_dark    = spr_suzyU_dark;
sprite_right_dark = spr_suzyR_dark;
sprite_down_dark  = spr_suzyD_dark;
sprite_left_dark  = spr_suzyL_dark;
sprite_slide_dark = spr_suzy_slide

sprite_index = sprite_down_dark
xprevious = obj_mainchara.x - 20;
name = "Susie";
talked = false;
alar = false;


hp = 130;
maxHp = 130;
global.hp_S = hp
global.max_hp_S = maxHp

battle_loop_sprite = spr_battle_loop_Susie
fight_sprite = spr_battle_fight_Kris;
defend_sprite = spr_battle_defend_Kris;

position = -1;

