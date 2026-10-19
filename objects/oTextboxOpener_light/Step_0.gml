
// oTextboxOpener_light - Step event

// Check whether the player is touching the opener.
var _touching = place_meeting(x, y, mainchara);

// Check the required sprite.
var _correct_sprite = false;

if (instance_exists(mainchara))
{
    _correct_sprite =
        (needed_sprite == "everysprite")
        || (mainchara.sprite_index == asset_get_index(needed_sprite));
}

// Allow interaction only when the player can move.
if (instance_exists(mainchara)
&& _touching
&& mainchara.can_move
&& _correct_sprite)
{
    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(global.confirm)
    || start)
    {
        // Prevent creating a second textbox.
        if (!instance_exists(_instantiated))
        {
            _instantiated = instance_create_depth(
                0, 0, -9998, oTextbox_light
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

            mainchara.can_move = false;
            global.dialogue = true;

            // Avoid repeatedly triggering this opener.
            start = false;
        }
    }
}
