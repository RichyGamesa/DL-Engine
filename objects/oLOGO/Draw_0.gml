// oLogo Draw Event

// LOGO PIECES
if (logo_phase == 0 || logo_phase == 3)
{
    var _center_x = x + (logo_width * logo_scale / 2);
    var _center_y = y + (logo_height * logo_scale / 2);

    // DRAW REVEALED LOGO PIECES
    for (var _i = 0; _i < 9; _i++)
    {
        if (drawlogopart[_i])
        {
            draw_sprite_ext(
                IMAGE_LOGO_CENTER_SEPARATE,
                _i,
                _center_x,
                _center_y,
                logo_scale,
                logo_scale,
                0,
                c_white,
                1
            );
        }
    }

    // CHAPTER NUMBER

        draw_sprite_ext(
            chapter_sprite,
            chapter_index,
            chapter_x,
            chapter_y,
            logo_scale,
            logo_scale,
            0,
            c_white,
            chapter_alpha
        );
    
}

// RESET DRAW SETTINGS
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);