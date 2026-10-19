
depth = -y;

// Find the player actually touching Sans.
var _player = instance_place(x, y, obj_mainchara);

if (!instance_exists(_player))
{
    exit;
}

// Only interact when the player can move and no textbox is open.
if (!_player.can_move || instance_exists(oTextbox_light))
{
    exit;
}

// Require a new key press instead of a held key.
if (!keyboard_check_pressed(global.confirm)
    && !keyboard_check_pressed(vk_enter))
{
    exit;
}

// Reuse an existing textbox if it still exists; otherwise create one.
if (!instance_exists(tx))
{
    tx = instance_create_depth(x, y, -100, oTextbox_light);
}

if (!instance_exists(tx))
{
    exit;
}

// First conversation.
if (global.flag[3] == false)
{
    tx.text[0] = "*heya kiddo.";
    tx.text[1] = "*here is my number....call me.";

    tx.speaker_sprite[0] = spr_face_sans_normal;
    tx.speaker_sprite[1] = spr_face_sans_wink;

    tx.more_sounds = true;
    tx.txtb_sound[0] = snd_txtsans;
    tx.txtb_sound[1] = snd_txtsans;

    // Give the number only if it isn't already in the player's list.
    if (!array_contains(global.numbers, "sans's number"))
    {
        var _length = array_length(global.numbers);

        array_insert(
            global.numbers,
            _length,
            "sans's number"
        );

        tx.text[2] = "*You got {CY}sans's number{CW}.";
        tx.txtb_sound[2] = snd_text;
        tx.speaker_sprite[2] = noone;
    }
    else
    {
        tx.text[2] = "*looks like you already have it.";
        tx.text[3] = "*call me";

        tx.txtb_sound[2] = snd_txtsans;
        tx.txtb_sound[3] = snd_txtsans;

        tx.speaker_sprite[2] = spr_face_sans_normal;
        tx.speaker_sprite[3] = spr_face_sans_serious;
    }

    // Mark the first conversation as done.
    global.flag[3] = true;
}
else
{
    // Subsequent conversations.
    tx.txtb_sounds = snd_txtsans;

    tx.text[0] = "*heya kiddo.";
    tx.text[1] = "*i told you to came here?";
    tx.text[2] = "*nah, i'm busy, are you sure it was me?";

    tx.speaker_sprite[0] = spr_face_sans_normal;
    tx.speaker_sprite[1] = spr_face_sans_left;
    tx.speaker_sprite[2] = spr_face_sans_wink;
}
