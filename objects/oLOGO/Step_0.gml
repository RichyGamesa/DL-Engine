// oLogo Step Event

// LOGO REVEAL
if (logo_phase == 0)
{
    logotimer++;

    // REVEAL ONE PIECE EVERY 8 FRAMES
    if ((logotimer mod 8) == 0 && logotimer < 80 && logopieces < 9)
    {
        drawlogopart[reveal_order[logopieces]] = true;

        var _sound = audio_play_sound(letter_noise, 0, false);
        audio_sound_pitch(_sound, 0.5 + random(1));

        logopieces++;
    }

    // CHAPTER SOUND
    if (logotimer == 120 && !logo_sound_played)
    {
        audio_play_sound(Chapter_noise, 10, false);
        logo_sound_played = true;
    }

    // CHAPTER NUMBER FADE-IN
    if (logotimer >= 120 && chapter_alpha < 1)
    {
        chapter_alpha = 1;
    }

    // FINISH REVEAL
    if (logotimer >= 145)
    {
        logo_phase = 3;
        logo_timer = 0;
    }
}


// PHASE 3: FINISHED
if (logo_phase == 3)
{
    logo_timer++;

    if (logo_timer >= 90 && !transition_started)
    {
        transition_started = true;

        if (!instance_exists(oTransition_dark))
        {
            instance_create_depth(0, 0, -300, oTransition_dark);
        }
    }
}


// TRANSITION
if (transition_started && instance_exists(oTransition_dark))
{
    if (oTransition_dark.image_index > 17)
    {
        if (
            !file_exists("File_1") &&
            !file_exists("File_2") &&
            !file_exists("File_3") &&
            !file_exists("save.savFile_1") &&
            !file_exists("save.savFile_2") &&
            !file_exists("save.savFile_3")
        )
        {
            global.filechoiche = 1;
            room_goto(rm_naming);
        }
        else
        {
            room_goto(Title);
        }
    }
}


// SKIP
if (
    keyboard_check_pressed(global.confirm) ||
    keyboard_check_pressed(vk_enter)
)
{
    if (!transition_started)
    {
        transition_started = true;
        audio_stop_all();

        if (!instance_exists(oTransition_dark))
        {
            instance_create_depth(0, 0, -300, oTransition_dark);
        }
    }
}