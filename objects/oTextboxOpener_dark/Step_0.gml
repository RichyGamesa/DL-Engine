//oTextboxOpener_dark step Event

if (!instance_exists(mainchara))
{
    mainchara = instance_find(obj_mainchara, 0);
}

if (!instance_exists(mainchara))
{
    exit;
}

var _player = mainchara;
var _touching = place_meeting(x, y, _player);

var _correct_sprite = true;

if (needed_sprite != "everysprite")
{
    var _required_sprite = asset_get_index(needed_sprite);

    _correct_sprite = (_required_sprite != -1)
        && (_player.sprite_index == _required_sprite);
}

if ((_touching && _player.can_move && _correct_sprite) || start)
{
    if (keyboard_check_pressed(vk_enter)
        || keyboard_check_pressed(global.confirm)
        || start)
    {
        if (!instance_exists(_instantiated))
        {
            _instantiated = instance_create_depth(
                0, 0, -9998, oTextbox_dark
            );

            _instantiated.text = text;
            _instantiated.speaker_sprite = speaker_sprite;
            _instantiated.txtb_sound = txtb_sound;
            _instantiated.txtb_sounds = txtb_sounds;
            _instantiated.audio_stop = audio_stop;
            _instantiated.more_sounds = more_sounds;

            _instantiated.speaker_mini = speaker_mini;
            _instantiated.textbox_only_up = textbox_only_up;
            _instantiated.textbox_only_down = textbox_only_down;

            _instantiated.text_speed = text_speed;
            _instantiated.text_speed_skip = text_speed_skip;
            _instantiated.pitches = pitches;
            _instantiated.pitch = pitch;

            _instantiated.color = color;
            _instantiated.font = font;
            _instantiated.border_theme = border_theme;
            _instantiated.border_color = border_color;
            _instantiated.portrait_color = portrait_color;
            _instantiated.can_move_after = can_move_after;

            _player.can_move = false;
            global.dialogue = true;

            start = false;
        }
    }
}
