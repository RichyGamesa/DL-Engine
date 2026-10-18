down = noone;
right = noone
up = noone;
left = noone;

spd = 1;

num = instance_number(obj_follower)
if num < 1
num = 1

follow = true;

record = 20 * (2*num);

down_y = 0;

if instance_exists(obj_mainchara)
down_y = obj_mainchara.sprite_height - sprite_height;

if down_y < 0
down_y = 0;

cutscene = false


