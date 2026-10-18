down = spr_suzyD;
right = spr_suzyR;
up = spr_suzyU;
left = spr_suzyL;

slide_sprite = spr_suzy_slide

if global.darkworld
{
down = spr_suzyD_dark;
right = spr_suzyR_dark;
up = spr_suzyU_dark;
left = spr_suzyL_dark;	
slide_sprite = spr_suzy_slide
}

spd = 1;

num = instance_number(obj_follower)
if num < 1
num = 1;

follow = true;

record = 15 * (2*num);

down_y = 0;

if instance_exists(obj_mainchara)
down_y = obj_mainchara.sprite_height - sprite_height;

if down_y < 0
down_y = 0;

sliding = false;
cutscene = false;