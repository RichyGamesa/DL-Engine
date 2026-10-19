
depth = -y;

// Ensure Kris exists before accessing position history.
if (!instance_exists(obj_mainchara))
{
    image_speed = 0;
    exit;
}

var _player = obj_mainchara;

// Calculate the vertical offset.
down_y = max(0, _player.sprite_height - sprite_height);

// Follow Kris's recorded positions.
if (follow)
{
    // Clamp the history index to avoid out-of-range array access.
    var _record = clamp(record, 0, array_length(_player.pos_x) - 1);
    var _record_y = clamp(record, 0, array_length(_player.pos_y) - 1);

    x = _player.pos_x[_record];
    y = _player.pos_y[_record_y] - down_y;
}

// Determine the correct sprites for the current world.
if (global.darkworld)
{
    down = down_dark;
    right = right_dark;
    up = up_dark;
    left = left_dark;
    sliding_sprite = sliding_dark;
}
else
{
    // These should be your normal-world sprite assets.
    // Keep the normal-world assignments made in the Create event.
}

// Update the follower's animation.
if (sliding)
{
    if (sliding_sprite != noone)
    {
        sprite_index = sliding_sprite;
    }
}
else
{
    var _dx = x - xprevious;
    var _dy = y - yprevious;

    // Use the dominant movement axis to determine direction.
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

// Stop animation during cutscenes only if the follower isn't moving.
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
