down = spr_asgoreD;
right = spr_asgoreR
up = spr_asgoreU;
left = spr_asgoreL;

spd = 1;

num = instance_number(obj_follower)
if num < 1
num = 1;

follow = true;

record = 12 * (2*num);

down_y = 0;

if instance_exists(obj_mainchara)
{
if obj_mainchara.sprite_height > sprite_height
down_y = obj_mainchara.sprite_height - sprite_height;
else
down_y = sprite_height - obj_mainchara.sprite_height;
}



cutscene = false;