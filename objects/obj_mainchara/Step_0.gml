
/// obj_mainchara - Step Event

depth = -y;
Moving = false;


// --------------------------------------------------
// WORLD SCALE AND SPEED
// --------------------------------------------------

if (global.darkworld)
{
    image_xscale = 2;
    image_yscale = 2;

    walk_spd = 4;
    run_spd = 5;
}
else
{
    image_xscale = 1;
    image_yscale = 1;

    walk_spd = 3;
    run_spd = 4;
}


// --------------------------------------------------
// INPUT
// --------------------------------------------------

var down_key  = keyboard_check(global.down);
var left_key  = keyboard_check(global.left);
var right_key = keyboard_check(global.right);
var up_key    = keyboard_check(global.up);

var horizontal_input = right_key - left_key;
var vertical_input = down_key - up_key;


// --------------------------------------------------
// WALKING / RUNNING
// --------------------------------------------------

var run_pressed =
    keyboard_check(vk_shift)
    || keyboard_check(global.cancel);

// Autorun reverses the normal run behaviour.
if (autorun)
    run_pressed = !run_pressed;

move_spd = run_pressed ? run_spd : walk_spd;


// --------------------------------------------------
// MOVEMENT SPEED
// --------------------------------------------------

xspd = horizontal_input * move_spd;
yspd = vertical_input * move_spd;


// --------------------------------------------------
// MOVEMENT LOCK
// --------------------------------------------------

if (!can_move || global.battle)
{
    xspd = 0;
    yspd = 0;
}


// --------------------------------------------------
// FACING
// --------------------------------------------------

if (horizontal_input != 0 || vertical_input != 0)
{
if (can_move && !global.battle && !sliding)
{
    if (horizontal_input > 0)
        global.facing = 1;
    else if (horizontal_input < 0)
        global.facing = 3;
    else if (vertical_input > 0)
        global.facing = 0;
    else if (vertical_input < 0)
        global.facing = 2;
}
}


// --------------------------------------------------
// COLLISION MASK
// --------------------------------------------------

if (!sliding)
{
    mask_index = global.darkworld
        ? sprite_down_dark
        : sprite_down;
}
else
{
    mask_index = global.darkworld
        ? sprite_slide_dark
        : sprite_slide;
}


// --------------------------------------------------
// SLIDE OBJECT CHECK
// --------------------------------------------------

var slide_instance = instance_nearest(x, y, obj_slide);

if (instance_exists(slide_instance))
{
    if (slide_instance.interacted && !sliding && y > slide_instance.y)
    {
        if (place_meeting(x, y + yspd, slide_instance))
        {
            yspd = 0;
        }
    }
}


// --------------------------------------------------
// SPRITE SELECTION
// --------------------------------------------------

if (sliding)
{
    sprite_index = global.darkworld
        ? sprite_slide_dark
        : sprite_slide;
}
else
{
    switch (global.facing)
    {
        case 0:
            sprite_index = global.darkworld
                ? sprite_down_dark
                : sprite_down;
        break;

        case 1:
            sprite_index = global.darkworld
                ? sprite_right_dark
                : sprite_right;
        break;

        case 2:
            sprite_index = global.darkworld
                ? sprite_up_dark
                : sprite_up;
        break;

        case 3:
            sprite_index = global.darkworld
                ? sprite_left_dark
                : sprite_left;
        break;
    }
}


// --------------------------------------------------
// APPLY MOVEMENT
// --------------------------------------------------

var movement_x = xspd;
var movement_y = yspd;


// Sliding changes the movement behaviour.
if (sliding)
{
    movement_x *= 0.5;

    var slide_speed = global.bulletzone ? 3 : 6;
    var slide_control = 1.2;

    movement_y = slide_speed + (vertical_input * slide_control);
}


// --------------------------------------------------
// HORIZONTAL COLLISION
// --------------------------------------------------

var remaining_x = movement_x;

while (abs(remaining_x) > 0)
{
    var step_x = sign(remaining_x) * min(1, abs(remaining_x));

    if (!is_solid_at(x + step_x, y))
    {
        x += step_x;
        remaining_x -= step_x;
    }
    else
    {
        break;
    }
}


// --------------------------------------------------
// VERTICAL COLLISION
// --------------------------------------------------

var remaining_y = movement_y;

while (abs(remaining_y) > 0)
{
    var step_y = sign(remaining_y) * min(1, abs(remaining_y));

    if (!is_solid_at(x, y + step_y))
    {
        y += step_y;
        remaining_y -= step_y;
    }
    else
    {
        break;
    }
}


// --------------------------------------------------
// SLIDE COLLISION HANDLING
// --------------------------------------------------

if (sliding)
{
    // If blocked while sliding, align with the slide object.
    if (sprite_index == sprite_slide
    || sprite_index == sprite_slide_dark)
    {
        if (is_solid_at(x, y)
        && x == xprevious
        && y == yprevious)
        {
            if (instance_exists(slide_instance))
                x = slide_instance.x;
        }
    }

    // Stop sliding after leaving the slide object.
    if (!place_meeting(x, y, obj_slide))
    {
        sliding = false;
    }
}


// --------------------------------------------------
// POSITION HISTORY
// --------------------------------------------------

if (x != xprevious || y != yprevious)
{
    Moving = true;

    for (var i = array_size - 1; i > 0; i--)
    {
        pos_x[i] = pos_x[i - 1];
        pos_y[i] = pos_y[i - 1];
    }

    pos_x[0] = x;
    pos_y[0] = y;
}


// --------------------------------------------------
// WALK ANIMATION
// --------------------------------------------------

if (sliding)
{
    // Sliding uses its own animation.
    walktimer++;

    if (walktimer >= 4)
    {
        walktimer = 0;
        image_index = (image_index + 1) mod image_number;
    }
}
else if (Moving)
{
    walktimer++;

    walk_frame_delay = run_pressed ? 4 : 6;

    if (walktimer >= walk_frame_delay)
    {
        walktimer = 0;

        image_index = (image_index + 1) mod image_number;
    }
}
else
{
    walktimer = 0;
    image_index = 0;
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
*/
