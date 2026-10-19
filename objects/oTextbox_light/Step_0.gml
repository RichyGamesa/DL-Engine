////oTextbox_dark step event

if (txtb_sounds != snd_text)
{
    txtb_sound[page] = txtb_sounds;
}

if (old_draw_char != draw_char)
{
    audio_play_sound(txtb_sound[page], 10, false);
}

image_speed = 2;

if (audio_stop != noone)
{
    if (audio_is_playing(audio_stop))
    {
        skippable = false;
    }
    else
    {
        skippable = true;
    }
}

old_draw_char = draw_char;
