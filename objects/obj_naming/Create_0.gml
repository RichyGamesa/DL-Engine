
/// obj_naming Create Event

al_ucase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
codename = "";
sel = 0;
siner = 0;
text = "ENTER YOUR OWN NAME.";

confirm_name = "Is this name correct?";
confirm_font = fnt_dt_mono_BIG;
confirm_scale = 1;
confirm_color = c_white;
can_name = true;

menu = 1;
time_ch = 0;
timer = 220;
go = false;
_w = 240;
tran = noone;

image_xscale = 1;

volume = false;

uc_letters = array_create(26);

for (var i = 0; i < 26; i++)
{
    uc_letters[i] = string_char_at(al_ucase, i + 1);
}

controls = false;
selected_a_control = false;
selected_color = c_aqua;

// Window caption
window_set_caption("Deltarune Chapter " + string(global.chapter));


// ==================================================
// NAME AND ALPHABET POSITIONS
// ==================================================

name_x = 160;
name_y = 56;

letter_spacing_x = 20;
letter_spacing_y = 20;

letter_start_x = 68;
letter_start_y = 70;

back_x = letter_start_x + 6 * letter_spacing_x;
end_x = letter_start_x + 8 * letter_spacing_x;
button_y = letter_start_y + 2 * letter_spacing_y;


// ==================================================
// SMOOTH SOUL MOVEMENT
// ==================================================

soul_draw_x = 63;
soul_draw_y = 70;

soul_target_x = 63;
soul_target_y = 70;

soul_speed = 0.28;


// ==================================================
// CONFIRMATION TRANSITION
// ==================================================

menu_previous = menu;

confirm_anim_timer = 0;

confirm_name_x = name_x;
confirm_name_y = name_y;
confirm_name_scale = 1;


// Return transition
confirm_returning = false;
confirm_return_timer = 0;

// Naming screen fade-in
entry_fading_in = false;
entry_fade_timer = 0;

// Confirmation SOUL movement
confirm_soul_started = false;

transition_noise = Deltarune_Intro_noise;