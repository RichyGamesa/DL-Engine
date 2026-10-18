//create event
if instance_number(obj_fake_kris) > 1
{instance_destroy()}
if global.darkworld == false
{
 image_xscale = 1
 image_yscale = 1
}
else
{
 image_xscale = 2
 image_yscale = 2
}
cutscene = false;
image_alpha = 0;


hp = 90;
maxHp = 90;
global.hp_K = hp
global.max_hp_K = maxHp

battle_loop_sprite = spr_battle_loop_Kris;
fight_sprite = spr_battle_fight_Kris;
defend_sprite = spr_battle_defend_Kris;
