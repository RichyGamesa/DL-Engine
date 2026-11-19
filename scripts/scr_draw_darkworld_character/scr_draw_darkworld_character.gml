/// scr_draw_darkworld_character(_x, _y, _character, _text_color)

function scr_draw_darkworld_character(_x, _y, _character, _text_color)
{
    draw_set_alpha(1);

    var _shadow_top = make_color_rgb(128, 128, 128);
    var _shadow_bottom = make_color_rgb(0, 0, 64);

    // SHADOW
    draw_text_color(
        _x + 1, _y + 1, _character,
        _shadow_top, _shadow_top,
        _shadow_bottom, _shadow_bottom,
        1
    );

    // FOREGROUND
    if (_text_color == c_white)
    {
        draw_set_color(c_white);
        draw_text(_x, _y, _character);
    }
    else
    {
        draw_text_color(
            _x, _y, _character,
            c_white, c_white,
            _text_color, _text_color,
            1
        );
    }

    draw_set_color(c_white);
    draw_set_alpha(1);
}