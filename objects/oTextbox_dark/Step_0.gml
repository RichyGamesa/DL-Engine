
/// oTextbox_dark - Step Event

// --------------------------------------------------
// TEXTBOX ANIMATION
// --------------------------------------------------

if (going_up)
{
    textbox_image_index = min(
        textbox_image_index + 0.3,
        4
    );

    if (textbox_image_index >= 4)
    {
        going_up = false;
        alarm[0] = 60;
    }
}
else
{
    textbox_image_index = max(
        textbox_image_index - 0.3,
        0
    );

    if (textbox_image_index <= 0)
    {
        going_up = true;
        alarm[1] = 60;
    }
}


// --------------------------------------------------
// AUDIO STOP
// --------------------------------------------------

if (audio_stop != noone)
{
    if (audio_is_playing(audio_stop))
    {
        audio_stop_sound(global.current_song);
        skippable = false;
    }
    else
    {
        audio_resume_sound(global.current_song);
        skippable = true;
    }
}


// --------------------------------------------------
// INITIALIZE DIALOGUE
// --------------------------------------------------

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
}


// --------------------------------------------------
// INPUT
// --------------------------------------------------

var confirm_key =
    keyboard_check_pressed(global.confirm)
    || keyboard_check_pressed(vk_enter);

var skip_key =
    keyboard_check_pressed(global.cancel)
    || keyboard_check_pressed(vk_shift);

var skip_everything_key =
    keyboard_check(global.menu)
    || keyboard_check(vk_control);


// --------------------------------------------------
// REVEAL TEXT
// --------------------------------------------------

if (draw_char < text_length[page])
{
    if (skip_everything_key)
    {
        punctuation_timer = 0;

        draw_char = min(
            draw_char + text_speed_skip,
            text_length[page]
        );
    }
    else
    {
        if (punctuation_timer > 0)
        {
            punctuation_timer--;
        }
        else
        {
            draw_char = min(
                draw_char + text_speed,
                text_length[page]
            );

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

    speaker_sprite_index += 1;
}


// --------------------------------------------------
// SKIP / ADVANCE / CLOSE
// --------------------------------------------------

if (skippable)
{
    if (skip_key && draw_char < text_length[page])
    {
        draw_char = text_length[page];
        punctuation_timer = 0;
    }

    if (confirm_key || skip_everything_key)
    {
		keyboard_clear(global.confirm);
		keyboard_clear(vk_enter);
        if (draw_char >= text_length[page])
        {
            if (page < page_number - 1)
            {
                page++;

                draw_char = 0;
                punctuation_timer = 0;
                speaker_sprite_index = 0;
            }
            else
            {
                instance_destroy();
                exit;
            }
        }
    }
}
