//obj_follower creat
if (!variable_instance_exists(id, "character"))
    character = "Noone";

// Character-specific sprites.
down_light = noone;
right_light = noone;
up_light = noone;
left_light = noone;
slide_sprite_light = noone;

down_dark = noone;
right_dark = noone;
up_dark = noone;
left_dark = noone;
slide_sprite_dark = noone;

// Configure this follower's sprites.
scr_follower_setup(id, character);

// Choose the sprites for the current world.
if (global.darkworld)
{
    down = down_dark;
    right = right_dark;
    up = up_dark;
    left = left_dark;
    sliding_sprite = slide_sprite_dark;
	
	image_xscale = 2;
	image_yscale = 2;
	
    // Start with a valid dark-world sprite.
    sprite_index = down_dark;
}
else
{
    down = down_light;
    right = right_light;
    up = up_light;
    left = left_light;
    sliding_sprite = slide_sprite_light;
	image_xscale = 1;
	image_yscale = 1;
   
   // Start with a valid light-world sprite.
    sprite_index = down_light;
}

image_index = 0;
image_speed = 0;

spd = 1;

var _num = instance_number(obj_follower);
if (_num < 1)
    _num = 1;

follow = true;
record = 10 * (2 * _num);

down_y = 0;

if (instance_exists(obj_mainchara))
    down_y = max(0, obj_mainchara.sprite_height - sprite_height);

cutscene = false;
sliding = false;

depth = -y;
