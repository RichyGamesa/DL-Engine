
down = noone;
right = noone;
up = noone;
left = noone;
sliding_sprite = noone;

down_dark = noone;
right_dark = noone;
up_dark = noone;
left_dark = noone;
sliding_dark = noone;

// Choose the correct sprites for the current world.
if (global.darkworld)
{
    down = down_dark;
    right = right_dark;
    up = up_dark;
    left = left_dark;
    sliding_sprite = sliding_dark;
}

spd = 1;

var _num = instance_number(obj_follower);
if (_num < 1)
{
    _num = 1;
}

follow = true;
record = 20 * (2 * _num);

down_y = 0;

if (instance_exists(obj_mainchara))
{
    down_y = obj_mainchara.sprite_height - sprite_height;
}

down_y = max(0, down_y);

cutscene = false;
sliding = false;

depth = -y;
