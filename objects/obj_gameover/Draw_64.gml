
// obj_gameover - Draw GUI Event

draw_sprite_ext(spr_gameover,image_index,0,0,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _center_x = _gui_w * 0.5;
var _choice_y = _gui_h * 0.72;

var _yes_x = _center_x - 80;
var _no_x = _center_x + 80;

var room_scale = room_width / 320 * 1.5;

var soul_scale = room_scale * 0.6;
var text_scale = room_scale * 0.5;

var CONTINUE_GIVEUP_Y = 350;

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

	    draw_text_transformed(
	    120,
	    350,
	    string_copy(_text, 1, draw_char),
	    text_scale,
	    text_scale,
	    0
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
        CONTINUE_GIVEUP_Y,
        soul_scale,
        soul_scale,
        0,
        c_white,
        1 * image_alpha
    );

		// CONTINUE - LEFT
		draw_set_color(choice == 1 ? c_yellow : c_white);

		draw_text_transformed(
		    175, CONTINUE_GIVEUP_Y,
		    "CONTINUE",
		    text_scale, text_scale,
		    0
		);

		// GIVE UP - RIGHT
		draw_set_color(choice == 2 ? c_yellow : c_white);

		draw_text_transformed(
		    375, CONTINUE_GIVEUP_Y,
		    "GIVE UP",
		    text_scale, text_scale,
		    0
		);
    draw_set_alpha(1);
}



// Reset drawing settings
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


