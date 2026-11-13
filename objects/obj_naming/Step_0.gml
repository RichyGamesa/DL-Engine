
/// obj_naming Step Event


// ==================================================
// MENU ANIMATION AND TRANSITION
// ==================================================

if (menu < 3)
{
    // Shake
    x = xstart + random_range(-0.3, 0.3);
    y = yprevious + random_range(-0.3, 0.3);

    // Horizontal scaling
    if (!go)
    {
        if (image_xscale < 2.5)
            image_xscale += 0.02;
    }
    else
    {
        if (image_xscale < 4.5)
            image_xscale += 0.05;
    }

    // Vertical movement
    if (!go)
    {
        if (y > -150)
            y -= 1;
    }
    else
    {
        if (y < -130)
            y += 1;
    }

    // Transition
    if (go)
    {
       // timer -= 1;

        if (!instance_exists(oTransition_room))
        {
            tran = instance_create_depth(
                x, y, -10000, oTransition_room
            );

            tran.colorfade = c_white;
            tran.target_room = rm_cutscene_start;
            tran.transition_number = 0.0085; //control the speed of the transition
			
			audio_stop_all()
			snd_play(transition_noise)
        }
        //else if (timer > 0)
        //{
            //if (tran.image_alpha >= 0.96)
             //   tran.image_alpha = 0.96;
        //}
    }

    // ==================================================
    // NAME CONFIRMATION SETTINGS
    // ==================================================

    if (menu == 1)
    {
        confirm_name = "Is this name correct?";
        can_name = true;
        confirm_font = fnt_dt_mono_BIG;
        confirm_scale = 1;
        confirm_color = #f78b90;
        _w = 240;
    }

    if (menu > 0)
    {
        var name_lower = string_lower(codename);

        confirm_name = "WE CALLED IT \"" + codename + "\".";
        confirm_font = fnt_dt_mono_BIG;
        confirm_scale = 1;
        confirm_color = #f78b90;
        can_name = true;

        switch (name_lower)
        {
            case "gaster":
                game_restart();
            break;

            case "berdly":
            case "catti":
            case "jockington":
            case "rudy":
            case "asriel":
            case "toriel":
            case "asgore":
            case "alphys":
            case "undyne":
            case "bratty":
            case "catty":
            case "sans":
            case "gerson":
            case "qc":
            case "papyrus":
            case "kris":
            case "susie":
            case "noelle":
                confirm_name = "\"" + codename + "\". AN INTERESTING COINCIDENCE.";
            break;
        }
    }
}


// ==================================================
// DETECT MENU CHANGES
// ==================================================

if (menu != menu_previous)
{
    if (menu == 2)
    {
        // Restart confirmation animation
        confirm_anim_timer = 0;

        // Reset name animation
        confirm_name_x = name_x;
        confirm_name_y = name_y;
        confirm_name_scale = 1;
    }

    menu_previous = menu;
}


// ==================================================
// CONFIRMATION ANIMATION
// ==================================================

    // Returning to name entry after choosing NO
    if (confirm_returning)
	{
	    confirm_return_timer++;

	    if (confirm_return_timer >= 20)
	    {
	        codename = "";
	        menu = 1;
	        sel = 27;

	        entry_fading_in = false;
	        entry_fade_timer = 20;

	        soul_draw_x = end_x + 5;
	        soul_draw_y = button_y;
	        soul_target_x = end_x + 5;
	        soul_target_y = button_y;

	        confirm_returning = false;
	        confirm_return_timer = 0;
	    }
	}
	else
{
    if (confirm_anim_timer < 100)
        confirm_anim_timer++;
}


// ==================================================
// NAME ANIMATION
// ==================================================

var name_progress = clamp(
    (confirm_anim_timer - 15) / 45,
    0,
    1
);

confirm_name_x = lerp(name_x, 160, name_progress);
confirm_name_y = lerp(name_y, 115, name_progress);
confirm_name_scale = lerp(1, 1.6, name_progress);


// ==================================================
// SOUL TARGET POSITION
// ==================================================

if (menu == 1)
{
    if (sel >= 0 && sel <= 25)
    {
        soul_target_x =
            letter_start_x
            + ((sel mod 10) * letter_spacing_x)
            - 5;

        soul_target_y =
            letter_start_y
            + (floor(sel / 10) * letter_spacing_y);
    }
    else if (sel == 26)
    {
        soul_target_x = back_x + 10;
        soul_target_y = button_y;
    }
    else if (sel == 27)
    {
        soul_target_x = end_x + 5;
        soul_target_y = button_y;
    }
}


// ==================================================
// CONFIRMATION SOUL
// ==================================================

if (menu == 2)
{
    // Keep the SOUL in the middle initially.
    if (confirm_anim_timer < 70 or sel == -1)
    {
        soul_target_x = 150;
        soul_target_y = 205;
    }
    else
    {
        if (can_name)
        {
            if (sel == 0)
            {
                // NO - left
                soul_target_x = 105;
                soul_target_y = 205;
            }
            else
            {
                // YES - right
                soul_target_x = 192;
                soul_target_y = 205;
            }
        }
        else
        {
            soul_target_x = 125;
            soul_target_y = 205;
        }
    }
}


// ==================================================
// SMOOTH SOUL MOVEMENT
// ==================================================

var current_soul_speed = soul_speed;

// Faster movement towards confirmation choices
if (menu == 2 && confirm_anim_timer >= 70)
{
    current_soul_speed = 0.55;
}

soul_draw_x = lerp(
    soul_draw_x,
    soul_target_x,
    current_soul_speed
);

soul_draw_y = lerp(
    soul_draw_y,
    soul_target_y,
    current_soul_speed
);


// ==================================================
// NAME ENTRY FADE-IN TIMER
// ==================================================

if (menu == 1 && entry_fading_in)
{
    entry_fade_timer++;

    if (entry_fade_timer >= 20)
    {
        entry_fading_in = false;
        entry_fade_timer = 20;
    }
}
