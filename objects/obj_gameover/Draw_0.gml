//obj_gameover draw event
/*
var soul_scale = 1.2;

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
        soul_scale,
        soul_scale,
        0,
        c_white,
        0.5 * choice_alpha * image_alpha
    );

    // CONTINUE - LEFT
    draw_set_color(choice == 1 ? c_yellow : c_white);
    draw_text_transformed(105, 205, "CONTINUE",soul_scale,soul_scale,image_angle);

    // GIVE UP - RIGHT
    draw_set_color(choice == 2 ? c_yellow : c_white);
    draw_text_transformed(187, 205, "GIVE UP",soul_scale,soul_scale,image_angle);


    draw_set_alpha(1);
}