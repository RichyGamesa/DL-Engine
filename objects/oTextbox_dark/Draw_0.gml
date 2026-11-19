/// oTextbox_dark - Draw Event

// --------------------------------------------------
// POSITION
// --------------------------------------------------

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

var textbox_x = 80 + floor(_cam_x + (_cam_w - textbox_width) * 0.5);
var textbox_y = floor(_cam_y + _cam_h - textbox_height - border);

// Move to the top if the player is behind the textbox.
if (instance_exists(mainchara))
{
    if (mainchara.y >= textbox_y - 48)
    {
        textbox_y = floor(_cam_y + 16);
    }
}


// --------------------------------------------------
// DRAW SETTINGS
// --------------------------------------------------

draw_set_font(font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);


// --------------------------------------------------
// DRAW TEXTBOX
// --------------------------------------------------

draw_sprite_ext(
    txtb_sprite,
    0,
    textbox_x,
    textbox_y,
    1.5,
    1.5,
    0,
    c_white,
    1
);


// --------------------------------------------------
// SPEAKER PORTRAIT
// --------------------------------------------------

var _has_portrait = (speaker_sprite[page] != noone);

if (_has_portrait)
{
    var _portrait_sprite = speaker_sprite[page];

    if (draw_char >= text_length[page])
        speaker_sprite_index = 0;

    var _portrait_w = sprite_get_width(_portrait_sprite);
    var _portrait_h = sprite_get_height(_portrait_sprite);

    // Target height: 72 pixels
    var _portrait_scale = 72 / _portrait_h;

    var _portrait_draw_w = _portrait_w * _portrait_scale;
    var _portrait_draw_h = _portrait_h * _portrait_scale;

    var _portrait_color = c_white;

    if (is_array(portrait_color))
    {
        if (page < array_length(portrait_color))
            _portrait_color = portrait_color[page];
    }
    else
    {
        _portrait_color = portrait_color;
    }

    var _portrait_x = textbox_x + 24;
    var _portrait_y = textbox_y + (textbox_height * 1.5 - _portrait_draw_h) * 0.5;

    draw_sprite_ext(
        _portrait_sprite,
        speaker_sprite_index,
        _portrait_x,
        _portrait_y,
        _portrait_scale,
        _portrait_scale,
        0,
        _portrait_color,
        1
    );
}


// --------------------------------------------------
// TEXT AREA
// --------------------------------------------------

var draw_x;
var draw_y;
var width;

// These values are relative to the drawn textbox.
var _text_top = textbox_y + 19;
var _text_bottom = textbox_y + textbox_height * 1.5 - 12;

if (_has_portrait)
{
    draw_x = textbox_x + 112;
    draw_y = _text_top;

    width = textbox_width * 1.5 - 140;
}
else
{
    draw_x = textbox_x + 27;
    draw_y = _text_top;

    width = textbox_width * 1.5 - 54;
}

var line_start_x = draw_x;
var max_x = draw_x + width;


// --------------------------------------------------
// COMBINE TEXT FOR WORD WRAPPING
// --------------------------------------------------

var _full_text = "";

for (var _s = 0; _s < array_length(text_segments[page]); _s++)
{
    _full_text += text_segments[page][_s].text;
}

var _full_length = string_length(_full_text);


// --------------------------------------------------
// TEXT SPACING
// --------------------------------------------------

// Additional horizontal spacing between characters.
// This does not resize the font glyphs themselves.
var _character_spacing = 1;

var drawn_chars = 0;

for (var i = 0; i < array_length(text_segments[page]); i++)
{
    var _segment = text_segments[page][i];
    var _segment_text = _segment.text;

    for (var j = 1; j <= string_length(_segment_text); j++)
    {
        if (drawn_chars >= floor(draw_char))
        {
            break;
        }

        var _ch = string_char_at(_segment_text, j);

        drawn_chars++;

        // MANUAL LINE BREAK
        if (_ch == "&")
        {
            draw_x = line_start_x;
            draw_y += line_sep;
            continue;
        }

        // CHARACTER WIDTH
        var _char_width = string_width(_ch) + _character_spacing;

        // WORD WRAPPING
        if (_ch == " ")
        {
            var _next_word = "";
            var _look = drawn_chars + 1;

            while (_look <= _full_length)
            {
                var _next_char = string_char_at(_full_text, _look);

                if (_next_char == " " || _next_char == "&")
                {
                    break;
                }

                _next_word += _next_char;
                _look++;
            }

            var _next_word_width = string_width(_next_word)
                + string_length(_next_word) * _character_spacing;

            if (draw_x + _char_width + _next_word_width > max_x)
            {
                draw_x = line_start_x;
                draw_y += line_sep;
                continue;
            }
        }

        // LONG WORD FALLBACK
        if (draw_x + _char_width > max_x)
        {
            draw_x = line_start_x;
            draw_y += line_sep;
        }

        // DRAW CHARACTER
        scr_draw_darkworld_character(
            draw_x,
            draw_y,
            _ch,
            _segment.color
        );

        draw_x += _char_width;
    }

    if (drawn_chars >= floor(draw_char))
    {
        break;
    }
}


// --------------------------------------------------
// RESTORE DRAW STATE
// --------------------------------------------------

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);