
/// obj_mainchara - Create Event

character = "Kris";

// --------------------------------------------------
// SPRITES
// --------------------------------------------------

sprite_up     = KrisU;
sprite_right  = KrisR;
sprite_down   = KrisD;
sprite_left   = KrisL;
sprite_slide  = spr_kris_slide;

sprite_up_dark    = KrisU_dark;
sprite_right_dark = KrisR_dark;
sprite_down_dark  = KrisD_dark;
sprite_left_dark  = KrisL_dark;
sprite_slide_dark = spr_kris_dark_slide;


// --------------------------------------------------
// MOVEMENT
// --------------------------------------------------

can_move = true;

xspd = 0;
yspd = 0;

walk_spd = 3;
run_spd = 4;
move_spd = walk_spd;

autorun = false;
Moving = false;

// Facing:
// 0 = Down
// 1 = Right
// 2 = Up
// 3 = Left

if (!variable_global_exists("facing"))
{
    global.facing = 0;
}


// --------------------------------------------------
// ANIMATION
// --------------------------------------------------

walktimer = 0;
walkbuffer = 0;

walk_frame_delay = 6;


// --------------------------------------------------
// SLIDING
// --------------------------------------------------

sliding = false;


// --------------------------------------------------
// OTHER STATES
// --------------------------------------------------

dialogue = false;
flag[3] = false;


// --------------------------------------------------
// POSITION HISTORY
// --------------------------------------------------

array_size = 94;

pos_x = array_create(array_size, x);
pos_y = array_create(array_size, y);


// --------------------------------------------------
// COLLISION
// --------------------------------------------------

is_solid_at = function(check_x, check_y)
{
    return
        place_meeting(check_x, check_y, oWall)
        || place_meeting(check_x, check_y, oCollision)
        || place_meeting(check_x, check_y, oWall_cutscene);
};


// --------------------------------------------------
// INITIAL SPRITE SETTINGS
// --------------------------------------------------

image_xscale = 1;
image_yscale = 1;

image_speed = 0;
image_index = 0;
