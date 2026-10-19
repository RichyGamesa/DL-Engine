
// obj_mainchara - Step event

depth = -y;
Moving = false;

// --------------------------------------------------
// INPUT
// --------------------------------------------------

var down_key  = keyboard_check(global.down);
var left_key  = keyboard_check(global.left);
var right_key = keyboard_check(global.right);
var up_key    = keyboard_check(global.up);

// Default movement.
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;


// --------------------------------------------------
// WALKING / RUNNING SPEEDS
// --------------------------------------------------

if (!global.darkworld)
{
    if (!autorun)
    {
        walk_spd = 1.2;
        run_spd = 2.4;
    }
    else
    {
        walk_spd = 2.4;
        run_spd = 1.2;
    }
}
else
{
    if (!autorun)
    {
        walk_spd = 2.4;
        run_spd = 3.6;
    }
    else
    {
        walk_spd = 3.6;
        run_spd = 2.4;
    }
}

if (!sliding)
{
    if (keyboard_check(vk_shift) || keyboard_check(global.cancel))
        move_spd = run_spd;
    else
        move_spd = walk_spd;
}


// --------------------------------------------------
// MOVEMENT LOCK
// --------------------------------------------------

if (!can_move || global.battle)
{
    xspd = 0;
    yspd = 0;
}


// --------------------------------------------------
// COLLISION
// --------------------------------------------------

if (place_meeting(x + xspd, y, oWall)
|| place_meeting(x + xspd, y, oCollision)
|| place_meeting(x + xspd, y, oWall_cutscene))
{
    xspd = 0;
}

if (place_meeting(x, y + yspd, oWall)
|| place_meeting(x, y + yspd, oCollision)
|| place_meeting(x, y + yspd, oWall_cutscene))
{
    yspd = 0;
}

if (instance_exists(obj_slide))
{
    if (obj_slide.interacted && !sliding && y > obj_slide.y)
    {
        if (place_meeting(x, y + yspd, obj_slide))
        {
            yspd = 0;
        }
    }
}


// --------------------------------------------------
// COLLISION MASK
// --------------------------------------------------

if (!sliding)
{
    if (global.darkworld)
        mask_index = sprite_down_dark;
    else
        mask_index = sprite_down;
}
else
{
    if (global.darkworld)
        mask_index = spr_kris_dark_slide;
    else
        mask_index = spr_kris_slide;
}


// --------------------------------------------------
// ANIMATION
// --------------------------------------------------

if (!sliding)
{
    if (can_move)
    {
        if (xspd > 0)
        {
            sprite_index = global.darkworld
                ? sprite_right_dark : sprite_right;
        }
        else if (xspd < 0)
        {
            sprite_index = global.darkworld
                ? sprite_left_dark : sprite_left;
        }
        else if (yspd > 0)
        {
            sprite_index = global.darkworld
                ? sprite_down_dark : sprite_down;
        }
        else if (yspd < 0)
        {
            sprite_index = global.darkworld
                ? sprite_up_dark : sprite_up;
        }
    }
}
else
{
    sprite_index = global.darkworld
        ? sprite_slide_dark : sprite_slide;
}


// --------------------------------------------------
// ANIMATION SPEED
// --------------------------------------------------


if (sliding)
{
    image_speed = 1;
}
else if (xspd != 0 || yspd != 0)
{
    image_speed = 1;
}
else
{
    image_speed = 0;
    image_index = 0;
}



// --------------------------------------------------
// APPLY MOVEMENT
// --------------------------------------------------

if (!sliding)
{
    x += xspd;
    y += yspd;
}
else
{
    // Horizontal movement while sliding.
    x += xspd * 0.5;

    // Automatic downward slide speed.
    var slide_speed = global.bulletzone ? 3 : 6;

    // Up/down input gives slower steering control.
    var slide_control = 1.2;
    var slide_input = down_key - up_key;

    y += slide_speed + (slide_input * slide_control);
}


// --------------------------------------------------
// POSITION HISTORY
// --------------------------------------------------

if (x != xprevious || y != yprevious)
{
    for (var i = array_size - 1; i > 0; i--)
    {
        pos_x[i] = pos_x[i - 1];
        pos_y[i] = pos_y[i - 1];
    }

    pos_x[0] = x;
    pos_y[0] = y;
}

if (x == xprevious && y == yprevious)
{
    image_index = 0;
}


// --------------------------------------------------
// DARKWORLD SCALE
// --------------------------------------------------

if (global.darkworld)
{
    image_xscale = 2;
    image_yscale = 2;
}
else
{
    image_xscale = 1;
    image_yscale = 1;
}


// --------------------------------------------------
// SLIDE COLLISION HANDLING
// --------------------------------------------------

if (image_index == sprite_slide
&& place_meeting(x, y, oCollision)
&& y == yprevious
&& x == xprevious
&& sliding)
{
    x = obj_slide.x;
}



// --------------------------------------------------
// DEBUG
// --------------------------------------------------
/*
if (keyboard_check(ord("H")))
{
    image_alpha = 0;
}
else
{
    image_alpha = 1;
}
