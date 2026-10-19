//obj_follower step event

depth = -y;

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
}

// Ensure Kris exists.
if (!instance_exists(obj_mainchara))
{
    image_speed = 0;
    exit;
}

var _player = obj_mainchara;

// Calculate vertical offset.
down_y = max(0, _player.sprite_height - sprite_height);

// Save the follower's position before updating it.
var _old_x = x;
var _old_y = y;

// Follow Kris's recorded movement.
if (follow && !global.cutscene)
{
    if (array_length(_player.pos_x) > 0
    && array_length(_player.pos_y) > 0)
    {
        var _record_x = clamp(record, 0, array_length(_player.pos_x) - 1);
        var _record_y = clamp(record, 0, array_length(_player.pos_y) - 1);

        x = _player.pos_x[_record_x];
        y = _player.pos_y[_record_y] - down_y;
		
		/*
		show_debug_message(
    "Kris history: "
    + string(_player.pos_x[_record_x])
    + ", "
    + string(_player.pos_y[_record_y])
);*/
    }
}



// Calculate actual movement this Step.
var _dx = x - _old_x;
var _dy = y - _old_y;

// Update direction and sprite.
if (sliding && sliding_sprite != noone)
{
    sprite_index = sliding_sprite;
}
else
{
    if (abs(_dx) > abs(_dy))
    {
        if (_dx > 0 && right != noone)
            sprite_index = right;
        else if (_dx < 0 && left != noone)
            sprite_index = left;
    }
    else if (abs(_dy) > 0)
    {
        if (_dy < 0 && up != noone)
            sprite_index = up;
        else if (_dy > 0 && down != noone)
            sprite_index = down;
    }
}

// Animate only when moving.
if (_dx == 0 && _dy == 0)
{
    image_speed = 0;
    image_index = 0;
}
else
{
    image_speed = 1;
}

/*
// Stop animation if the follower isn't moving.
if (!cutscene)
{
    if (x == xprevious && y == yprevious)
    {
        image_speed = 0;
        image_index = 0;
    }
    else
    {
        image_speed = 1;
    }
}
