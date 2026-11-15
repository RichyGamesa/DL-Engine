
// obj_gameover - Draw GUI Event

draw_sprite_ext(spr_gameover,image_index,0,0,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _center_x = _gui_w * 0.5;
var _choice_y = _gui_h * 0.72;

var _yes_x = _center_x - 80;
var _no_x = _center_x + 80;

var soul_scale = 1.2;

// -----------------------------------------
// DIALOGUE
// -----------------------------------------

if (event == 1)
{
    var _text;

    if (speak == 0)
        _text = "IS THAT ALL YOU GOT?!";
    else
        _text = "This is not your FATE";

    draw_set_alpha(image_alpha);

    draw_set_font(fnt_dt_mono_BIG);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    draw_text(
        120,
        350,
        string_copy(_text, 1, draw_char)
    );
}


// -----------------------------------------
// CONTINUE / GIVE UP CHOICES
// -----------------------------------------

if (event == 3)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fnt_dt_mono);

    draw_set_alpha(choice_alpha * image_alpha);

    // SOUL
    draw_sprite_ext(
        IMAGE_SOUL_BLUR,
        0,
        soul_draw_x,
        soul_draw_y,
        1,
        1,
        0,
        c_white,
        0.5 * choice_alpha * image_alpha
    );

    // CONTINUE - LEFT
    draw_set_color(choice == 1 ? c_yellow : c_white);
    draw_text(105, 205, "CONTINUE");

    // GIVE UP - RIGHT
    draw_set_color(choice == 2 ? c_yellow : c_white);
    draw_text(187, 205, "GIVE UP");

    draw_set_alpha(1);
}



// Reset drawing settings
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


