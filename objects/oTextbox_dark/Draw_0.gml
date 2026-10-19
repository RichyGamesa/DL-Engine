
/// oTextbox_dark - Draw event

var confirm_key = keyboard_check_pressed(global.confirm)
    or keyboard_check_pressed(vk_enter);

var skip_key = keyboard_check_pressed(global.cancel)
    or keyboard_check_pressed(vk_shift);

var skip_everything_key = keyboard_check(global.menu)
    or keyboard_check(vk_control);


// --------------------------------------------------
// POSITION
// --------------------------------------------------

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

var textbox_x = _cam_x + (_cam_w - textbox_width) / 1.5;
var textbox_y = _cam_y + _cam_h - textbox_height - border;

if (instance_exists(mainchara))
{
    if (mainchara.y >= textbox_y - 48)
    {
        textbox_y = _cam_y + 50;
    }
}

draw_set_font(font);


// --------------------------------------------------
// INITIALIZE DIALOGUE
// --------------------------------------------------

var speaker_sprite_index = 0;

if (!setup)
{
    setup = true;
    mainchara.can_move = false;

    page_number = array_length(text);

    for (var _p = 0; _p < page_number; _p++)
    {
        text_segments[_p] = parse_colored_text(text[_p]);

        // Count only visible characters after parsing.
        var _length = 0;

        for (var _s = 0;
             _s < array_length(text_segments[_p]);
             _s++)
        {
            _length += string_length(
                text_segments[_p][_s].text
            );
        }

        text_length[_p] = _length;
    }
}


// --------------------------------------------------
// REVEAL TEXT + PUNCTUATION PAUSES
// --------------------------------------------------

if (draw_char < text_length[page])
{
    if (skip_everything_key)
    {
        punctuation_timer = 0;

        draw_char += text_speed_skip;
        draw_char = clamp(
            draw_char, 0, text_length[page]
        );

        speaker_sprite_index += 1;
    }
    else
    {
        if (punctuation_timer > 0)
        {
            punctuation_timer -= 1;
        }
        else
        {
            draw_char += text_speed;
            draw_char = clamp(
                draw_char, 0, text_length[page]
            );

            speaker_sprite_index += 1;

            // Find the last revealed character.
            var _revealed = floor(draw_char);
            var _count = 0;
            var _ch = "";

            if (_revealed > 0)
            {
                for (var _s = 0;
                     _s < array_length(text_segments[page]);
                     _s++)
                {
                    var _segment_text =
                        text_segments[page][_s].text;

                    var _len = string_length(_segment_text);

                    if (_revealed <= _count + _len)
                    {
                        _ch = string_char_at(
                            _segment_text,
                            _revealed - _count
                        );
                        break;
                    }

                    _count += _len;
                }

                if (_ch == ",")
                {
                    punctuation_timer = comma_pause;
                }
                else if (_ch == "."
                      || _ch == "!"
                      || _ch == "?")
                {
                    punctuation_timer = sentence_pause;
                }
                else if (_ch == "&")
                {
                    punctuation_timer = break_pause;
                }
            }
        }
    }
}


// --------------------------------------------------
// SKIP / ADVANCE / CLOSE
// --------------------------------------------------

if (skippable)
{
    if (skip_everything_key)
    {
        draw_char = text_length[page];
    }

    if (confirm_key || skip_everything_key)
    {
        if (draw_char >= text_length[page])
        {
            if (page < page_number - 1)
            {
                page++;
                draw_char = 0;
                punctuation_timer = 0;
            }
            else
            {
                instance_destroy();
                exit;
            }
        }
    }

    if (skip_key && draw_char < text_length[page])
    {
        draw_char = text_length[page];
        punctuation_timer = 0;
    }
}


// --------------------------------------------------
// DRAW DARK TEXTBOX WITHOUT DISTORTING ITS SPRITE
// --------------------------------------------------

/* i'm tired,no stretching
draw_sprite_ext(
    txtb_sprite,
    textbox_image_index,
    textbox_x,
    textbox_y,
    textbox_width / sprite_get_width(txtb_sprite),
    textbox_height / sprite_get_height(txtb_sprite),
    0,
    c_white,
    1
);
*///just use sprite

draw_sprite_ext(
            sTextbox_dark, 0,
            textbox_x,
            textbox_y + 28,
            1.5, 1.3, 0, c_white, 1
        );

// --------------------------------------------------
// DRAW PORTRAIT
// --------------------------------------------------

if (speaker_sprite[page] != noone)
{
    sprite_index = speaker_sprite[page];

    if (draw_char >= text_length[page])
    {
        speaker_sprite_index = 0;
    }

    var _portrait_w = sprite_get_width(sprite_index);
    var _portrait_h = sprite_get_height(sprite_index);

    // Fit within 55x55 without stretching the portrait.
    var _portrait_scale = min(
        55 / _portrait_w,
        55 / _portrait_h
    );

    var _portrait_color = c_white;

    if (is_array(portrait_color))
    {
        if (page >= 0 && page < array_length(portrait_color))
        {
            _portrait_color = portrait_color[page];
        }
    }
    else
    {
        _portrait_color = portrait_color;
    }

    draw_sprite_ext(
        sprite_index,
        speaker_sprite_index,
        textbox_x + 60,
        textbox_y + 75,
        _portrait_scale,
        _portrait_scale,
        0,
        _portrait_color,
        1
    );
}


// --------------------------------------------------
// DRAW TEXT CHARACTER BY CHARACTER
// --------------------------------------------------

var draw_x;
var draw_y;
var width;

if (speaker_sprite[page] == noone)
{
    draw_x = textbox_x + 25;
    draw_y = textbox_y + 43;
    width = 338;
}
else
{
    draw_x = textbox_x + 105;
    draw_y = textbox_y + border + 12;
    width = 300;
}

var line_start_x = draw_x;
var max_x = draw_x + width;

var drawn_chars = 0;

for (var i = 0;
     i < array_length(text_segments[page]);
     i++)
{
    var _segment = text_segments[page][i];
    var _segment_text = _segment.text;

    for (var j = 1;
         j <= string_length(_segment_text);
         j++)
    {
        if (drawn_chars >= floor(draw_char))
        {
            break;
        }

        var _ch = string_char_at(_segment_text, j);
        drawn_chars++;

        // Explicit line break.
        if (_ch == "&")
        {
            draw_x = line_start_x;
            draw_y += line_sep;
            continue;
        }

        var _char_width = string_width(_ch);

        // Automatic line wrapping.
        if (draw_x + _char_width > max_x)
        {
            draw_x = line_start_x;
            draw_y += line_sep;
        }

        // Dark textbox text shadow.
        draw_set_color(c_navy);
        draw_text(draw_x + 1.5, draw_y + 1.5, _ch);

        // Actual character color from the parsed segment.
        draw_set_color(_segment.color);
        draw_text(draw_x, draw_y, _ch);

        draw_x += _char_width;
    }

    if (drawn_chars >= floor(draw_char))
    {
        break;
    }
}

draw_set_color(c_white);
