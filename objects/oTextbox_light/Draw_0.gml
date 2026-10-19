// Draw event

var confirm_key = keyboard_check_pressed(global.confirm)
    || keyboard_check_pressed(vk_enter);

var skip_key = keyboard_check_pressed(global.cancel)
    || keyboard_check_pressed(vk_shift);

var skip_everything_key = keyboard_check(global.menu)
    || keyboard_check(vk_control);

// Refresh the player reference if necessary.
if (!instance_exists(mainchara))
{
    mainchara = instance_find(obj_mainchara, 0);
}

// Camera position.
var _camera = instance_find(obj_Overworld_Camera, 0);

if (!instance_exists(_camera))
{
    exit;
}

var textbox_x = _camera.x + 13;
var textbox_y = _camera.y + 165;

// Move the textbox to the top when the player is near the bottom.
if (instance_exists(mainchara))
{
    if ((mainchara.y >= textbox_y - 48 && !textbox_only_down)
        || textbox_only_up)
    {
        textbox_y = _camera.y + 10;
    }
}

draw_set_font(font);

var speaker_sprite_index = 0;
var textbox_sprite_index = 0
if textbox_sprite_index > 1
{
textbox_sprite_index = 0;	
}
if speaker_sprite_index > 1
{
speaker_sprite_index = 0;	
}


if (!setup)
{
    setup = true;

    if (instance_exists(mainchara))
    {
        mainchara.can_move = false;
    }

    page_number = array_length(text);

    for (var _p = 0; _p < page_number; _p++)
    {
        text_segments[_p] = parse_colored_text(text[_p]);

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

    page = clamp(page, 0, max(0, page_number - 1));
    draw_char = 0;
    punctuation_timer = 0;
}


if (draw_char < text_length[page])
{
    // Fast-forward ignores punctuation pauses.
    if (skip_everything_key)
    {
        punctuation_timer = 0;
        draw_char += text_speed_skip;
        draw_char = clamp(draw_char, 0, text_length[page]);
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
            // Reveal the next character.
            draw_char += text_speed;
            draw_char = clamp(draw_char, 0, text_length[page]);
            speaker_sprite_index += 1;

            // Find the character that was just revealed.
            var _revealed = floor(draw_char);

            if (_revealed > 0)
            {
                // Get the actual character from the parsed text.
                var _count = 0;
                var _ch = "";

                for (var _s = 0; _s < array_length(text_segments[page]); _s++)
                {
                    var _segment_text = text_segments[page][_s].text;
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

                // Pause after punctuation.
                if (_ch == ",")
                {
                    punctuation_timer = comma_pause;
                }
                else if (_ch == "." || _ch == "!" || _ch == "?")
                {
                    punctuation_timer = sentence_pause;
                }
				else if (_ch == "&")
				punctuation_timer = break_pause
            }
        }
    }
}

if (skippable) 
{
	if skip_everything_key
	{
	draw_char = text_length[page];
	}
    if (confirm_key) or skip_everything_key
	{

        if (draw_char == text_length[page]) 
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
	if (skip_key && draw_char != text_length[page]) 
	{
        draw_char = text_length[page];
    }
}

// Draw the textbox
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);


var _border_theme = "Normal";
var _border_color = c_white;

if (is_array(border_theme))
{
    if (page >= 0 && page < array_length(border_theme))
        _border_theme = border_theme[page];
}

if (is_array(border_color))
{
    if (page >= 0 && page < array_length(border_color))
        _border_color = border_color[page];
}

draw_set_color(_border_color);


    draw_rectangle(
        obj_Overworld_Camera.x + 7,
        textbox_y - 3,
        obj_Overworld_Camera.x + 310,
        textbox_y + 65,
        false
    );

    draw_set_color(c_black);

    draw_rectangle(
        textbox_x-3,
        textbox_y,
        obj_Overworld_Camera.x + 307,
        textbox_y + 62,
        false
    );




// Draw portrait if any

var _portrait_sprite = speaker_sprite[page];
var _portrait_frame = 0;

if (_portrait_sprite != noone)
{
    var _portrait_frames = sprite_get_number(_portrait_sprite);

    if (draw_char < text_length[page] && _portrait_frames > 1)
    {
        _portrait_frame = floor(draw_char) mod _portrait_frames;
    }

    var _pos_x = 21;
    var _pos_y = 30;

    if (speaker_mini[page])
    {
        _pos_x = 12;
        _pos_y = 10;
    }

    var _portrait_color = c_white;

    if (is_array(portrait_color))
    {
        if (page < array_length(portrait_color))
        {
            _portrait_color = portrait_color[page];
        }
    }
    else
    {
        _portrait_color = portrait_color;
    }

    draw_sprite_ext(
        _portrait_sprite,
        _portrait_frame,
        textbox_x + _pos_x,
        textbox_y + _pos_y,
        1, 1, 0,
        _portrait_color,
        1
    );
}


 // Draw the text
var draw_x, draw_y;
var drawn_chars = 0;
var width = 0;

if (speaker_sprite[page] == noone)
{
    draw_x = textbox_x + border + 2;
    draw_y = textbox_y + 5;
    width = 295;
}
else if (speaker_mini[page] == false)
{
    draw_x = textbox_x + 50;
    draw_y = textbox_y + 5;
    width = 245;
}
else
{
    draw_x = textbox_x + border + 18;
    draw_y = textbox_y + 5;
    width = 279;
}

// Start of each line
if (speaker_sprite[page] == noone)
var line_start_x = draw_x+18;
else
line_start_x = draw_x+18;
var max_x = draw_x + width;

for (var i = 0; i < array_length(text_segments[page]); i++)
{
    var segment = text_segments[page][i];
    var segment_text = segment.text;

    draw_set_color(segment.color);

    for (var j = 1; j <= string_length(segment_text); j++)
    {
        if (drawn_chars >= draw_char)
            break;

        var ch = string_char_at(segment_text, j);
        drawn_chars++;

        // Explicit line break
        if (ch == "&")
        {
            draw_x = line_start_x;
            draw_y += line_sep;
            continue;
        }

        var char_width = string_width(ch);

        // Automatic line wrapping
        if (draw_x + char_width > max_x)
        {
            draw_x = line_start_x;
            draw_y += line_sep;
        }

        draw_text(draw_x, draw_y, ch);
        draw_x += char_width;
    }

    if (drawn_chars >= draw_char)
        break;
}

