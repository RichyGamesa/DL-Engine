
// obj_gameover - Step Event

// Only exist in death room
if (room != rm_death)
{
    instance_destroy();
    exit;
}

// Prevent movement
if (instance_exists(obj_mainchara))
{
    obj_mainchara.can_move = false;
}


// -----------------------------------------
// EVENT 0 - Fade in
// -----------------------------------------

if (event == 0)
{
    if (!failure_started)
    {
        audio_play_sound(AUDIO_FAILURE, 10, true);
        failure_started = true;
    }

    image_alpha = min(image_alpha + 0.1, 1);

    if (image_alpha >= 1)
    {
        event = 1;
    }
}


// -----------------------------------------
// EVENT 1 - Dialogue
// -----------------------------------------

if (event == 1)
{
    var _text;
    var _sound;

    if (speak == 0)
    {
        _text = "IS THAT ALL YOU GOT?!";
        _sound = snd_txtsus;
    }
    else
    {
        _text = "This is not your FATE";
        _sound = snd_txtral;
    }

    var _length = string_length(_text);

    if (draw_char < _length)
    {
        draw_char = min(draw_char + text_speed, _length);

        // Play typing sound
        audio_play_sound(_sound, 10, false);
    }

    // Continue to choices after dialogue
    if (draw_char >= _length)
    {
        if (keyboard_check_pressed(global.confirm)
        || keyboard_check_pressed(vk_enter))
        {
            event = 3;
            choice = 0;

            cursor_x = display_get_gui_width() * 0.5;
            cursor_y = display_get_gui_height() * 0.72;
        }
    }
}


// -----------------------------------------
// EVENT 3 - CONTINUE / GIVE UP
// -----------------------------------------

if (event == 3)
{
    // LEFT = CONTINUE
    if (keyboard_check_pressed(global.left))
    {
        if (choice != 1)
        {
            choice = 1;
            audio_play_sound(snd_menumove, 7, false);
        }
    }

    // RIGHT = GIVE UP
    if (keyboard_check_pressed(global.right))
    {
        if (choice != 2)
        {
            choice = 2;
            audio_play_sound(snd_menumove, 7, false);
        }
    }

    // Soul destination
    var target_x = 145;

    if (choice == 1)
        target_x = 80;
    else if (choice == 2)
        target_x = 162;

    // Smooth movement
    soul_draw_x = lerp(soul_draw_x, target_x, 0.2);

    // Fade in choices
    choice_alpha = min(choice_alpha + 0.1, 1);

    // CONFIRM
    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(global.confirm))
    {
        if (choice != 0)
        {
            audio_stop_sound(AUDIO_FAILURE);
            audio_play_sound(snd_select, 7, false);

            event = 4;
        }
    }
}


// -----------------------------------------
// EVENT 4 - HANDLE SELECTION
// -----------------------------------------

if (event == 4)
{
// CONTINUE - LOAD CHECKPOINT WITH TRANSITION
if (choice == 1 and (keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter)))
{
    var _checkpoint_room = scr_load_checkpoint();

    if (_checkpoint_room != -1)
    {
        if (!instance_exists(oTransition_room))
        {
            var tran = instance_create_depth(
                x, y, -10000, oTransition_room
            );

            tran.colorfade = c_white;
            tran.target_room = _checkpoint_room;
            tran.transition_number = 0.0085;
            tran.does_fade = false;

            audio_stop_all();
            tran.wait_sound = true;

            tran.sound_instance = audio_play_sound(
                transition_noise, 1, false
            );
		}
	}
}

// GIVE UP - NO TRANSITION
else if (choice == 2 and (keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter)))
{
    room_goto(rm_giveup);
}

if instance_exists(oTransition_room)
image_alpha = 1-oTransition_room.image_alpha
}
