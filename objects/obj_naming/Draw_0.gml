
/// obj_naming Draw Event


// ==================================================
// GLOBAL DRAW ANIMATION
// ==================================================
/*
var glow_pulse = 0.5 + (sin(current_time / 600) * 0.5);
var glow_flicker = 0.85 + (sin(current_time / 250) * 0.15);

var heading_alpha = 0.75 + glow_pulse * 0.25;
var glow_alpha = (0.12 + glow_pulse * 0.16) * glow_flicker;

var sep = 25;
*/


// ==================================================
// MENU 0 - START
// ==================================================

if (menu == 0)
{
    draw_set_font(fnt_dt_mono_BIG);

    var ha = draw_get_halign();
    var va = draw_get_valign();

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_font(fnt_dt_mono);
    draw_text(320, 390, "PRESS " + key_to_string(global.confirm) + " TO START");

    draw_set_halign(ha);
    draw_set_valign(va);

    if (keyboard_check_pressed(global.confirm)
    || keyboard_check_pressed(vk_enter))
    {
        menu = 1;

        if (file_exists("Save"))
        {
            /*
            LOAD();
            menu = 3;
            snd_play(mus_START_better);
            */
        }

        exit;
    }
}


// ==================================================
// MENU 1 - NAME ENTRY
// ==================================================

if (menu == 1)
{
	var entry_alpha = 1;

	if (entry_fading_in)
	    entry_alpha = clamp(entry_fade_timer / 20, 0, 1);

	draw_set_alpha(entry_alpha);
	
    siner += 0.12;

    var ha = draw_get_halign();
    var va = draw_get_valign();

    draw_set_color(c_white);
    draw_set_alpha(1);

    // --------------------------------------------------
    // HEADING
    // --------------------------------------------------

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fnt_dt_mono_BIG);

	var glow_alpha = 0.18;

	draw_set_font(fnt_dt_mono_BIG);
	draw_set_color(c_white);

	// Glow
	for (var i = 1; i <= 3; i++)
	{
	    draw_set_alpha(glow_alpha / i);
	    draw_text(60 - i, 25, "ENTER YOUR OWN NAME.");
	    draw_text(60 + i, 25, "ENTER YOUR OWN NAME.");
	    draw_text(60, 25 - i, "ENTER YOUR OWN NAME.");
	    draw_text(60, 25 + i, "ENTER YOUR OWN NAME.");
	}

	// Main text
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(60, 25, "ENTER YOUR OWN NAME.");


    // --------------------------------------------------
    // CURRENT NAME
    // --------------------------------------------------

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_dt_mono);

    if (string_length(codename) < 12)
        draw_set_color(c_white);
    else
        draw_set_color(c_yellow);

    draw_text_transformed(
        name_x,
        name_y,
        codename,
        1,
        1,
        0
    );


    // --------------------------------------------------
    // ALPHABET
    // --------------------------------------------------

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fnt_dt_mono);
    draw_set_color(c_white);

    for (var j = 0; j < 26; j++)
    {
        var letter_x =
            letter_start_x + ((j mod 10) * letter_spacing_x);

        var letter_y =
            letter_start_y + (floor(j / 10) * letter_spacing_y);

        draw_text(
            letter_x,
            letter_y,
            uc_letters[j]
        );
    }


    // --------------------------------------------------
    // BACK
    // --------------------------------------------------

    draw_set_color(sel == 26 ? c_yellow : c_white);
    draw_text(back_x, button_y, "BACK");


    // --------------------------------------------------
    // END
    // --------------------------------------------------

    if (codename == "")
        draw_set_color(c_gray);
    else
        draw_set_color(sel == 27 ? c_yellow : c_white);

    draw_text(end_x, button_y, "END");


    // --------------------------------------------------
    // SMOOTH SOUL CURSOR
    // --------------------------------------------------

    draw_sprite_ext(
        IMAGE_SOUL_BLUR,
        0,
        soul_draw_x,
        soul_draw_y,
        1.2,
        1.2,
        0,
        c_white,
        0.5
    );


    // --------------------------------------------------
    // SELECTED LETTER HIGHLIGHT
    // --------------------------------------------------

    draw_set_color(c_yellow);

    if (sel >= 0 && sel <= 25)
    {
        var selected_x =
            letter_start_x + ((sel mod 10) * letter_spacing_x);

        var selected_y =
            letter_start_y + (floor(sel / 10) * letter_spacing_y);

        draw_text(
            selected_x,
            selected_y,
            uc_letters[sel]
        );
    }
    else if (sel == 26)
    {
        draw_text(back_x, button_y, "BACK");
    }
    else if (sel == 27 && codename != "")
    {
        draw_text(end_x, button_y, "END");
    }


    // --------------------------------------------------
    // NAVIGATION: UP
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_up))
    {
        if (sel >= 0 && sel <= 9)
        {
            var col = sel mod 10;

            if (col <= 6)
                sel = 20 + col;
            else if (col == 8)
                sel = 27;
            else
                sel = 10 + col;
        }
        else if (sel >= 10 && sel <= 19)
        {
            sel -= 10;
        }
        else if (sel >= 20 && sel <= 27)
        {
            if (sel == 26)
                sel = 16;
            else if (sel == 27)
                sel = 18;
            else
                sel -= 10;
        }

        //snd_play(snd_menumove);
    }


    // --------------------------------------------------
    // NAVIGATION: DOWN
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_down))
    {
        if (sel >= 0 && sel <= 9)
        {
            sel += 10;
        }
        else if (sel >= 10 && sel <= 19)
        {
            var col = sel mod 10;

            if (col <= 6)
                sel = 20 + col;
            else if (col == 8)
                sel = 27;
            else
                sel = col;
        }
        else if (sel >= 20 && sel <= 25)
        {
            sel -= 20;
        }
        else if (sel == 26)
        {
            sel = 16;
        }
        else if (sel == 27)
        {
            sel = 18;
        }

        //snd_play(snd_menumove);
    }


    // --------------------------------------------------
    // NAVIGATION: LEFT
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_left))
    {
        if (sel == 27)
        {
            sel = 26;
        }
        else if (sel == 26)
        {
            sel = 25;
        }
        else if (sel >= 0 && sel <= 9)
        {
            sel = (sel == 0) ? 9 : sel - 1;
        }
        else if (sel >= 10 && sel <= 19)
        {
            sel = (sel == 10) ? 19 : sel - 1;
        }
        else if (sel >= 20 && sel <= 25)
        {
            sel = (sel == 20) ? 27 : sel - 1;
        }

        //snd_play(snd_menumove);
    }


    // --------------------------------------------------
    // NAVIGATION: RIGHT
    // --------------------------------------------------

    if (keyboard_check_pressed(vk_right))
    {
        if (sel == 26)
        {
            sel = 27;
        }
        else if (sel == 27)
        {
            sel = 20;
        }
        else if (sel >= 0 && sel <= 9)
        {
            sel = (sel == 9) ? 0 : sel + 1;
        }
        else if (sel >= 10 && sel <= 19)
        {
            sel = (sel == 19) ? 10 : sel + 1;
        }
        else if (sel >= 20 && sel <= 25)
        {
            sel = (sel == 25) ? 26 : sel + 1;
        }

        //snd_play(snd_menumove);
    }


    // --------------------------------------------------
    // CONFIRM SELECTION
    // --------------------------------------------------

    var bkspflag = false;

    if (keyboard_check_pressed(global.confirm)
    || keyboard_check_pressed(vk_enter))
    {
        // BACK
        if (sel == 26)
        {
            bkspflag = true;
            //snd_play(snd_select);
        }

        // END
        else if (sel == 27)
        {
            if (codename != "")
            {
                menu = 2;
                sel = -1;

                //snd_play(snd_select);

                image_xscale = 1;
                y = -130;
            }

            draw_set_halign(ha);
            draw_set_valign(va);
            exit;
        }

        // LETTER
        else if (sel >= 0 && sel <= 25
        && string_length(codename) < 12)
        {
            codename += uc_letters[sel];
            //snd_play(snd_select);
        }
    }


    // --------------------------------------------------
    // BACKSPACE / CANCEL
    // --------------------------------------------------

    if (keyboard_check_pressed(global.cancel)
    || bkspflag
    || keyboard_check_pressed(vk_shift))
    {
        if (string_length(codename) > 0)
        {
            codename = string_copy(
                codename,
                1,
                string_length(codename) - 1
            );
        }
        else
        {
            if (file_exists("Save"))
            {
                menu = 3;
                sel = 1;

                draw_set_halign(ha);
                draw_set_valign(va);
                exit;
            }
        }
    }


    // --------------------------------------------------
    // RESTORE DRAW SETTINGS
    // --------------------------------------------------

    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(ha);
    draw_set_valign(va);
}

// ==================================================
// MENU 2 - NAME CONFIRMATION
// ==================================================

if (menu == 2)
{
	var return_alpha = 1;

	if (confirm_returning)
	    return_alpha = 1 - clamp(confirm_return_timer / 20, 0, 1);
	
    siner += 0.12;

    var ha = draw_get_halign();
    var va = draw_get_valign();

    // --------------------------------------------------
    // FADE OUT ORIGINAL NAME ENTRY SCREEN
    // --------------------------------------------------

    var fade_out = 1 - clamp(confirm_anim_timer / 15, 0, 1);

    if (confirm_anim_timer < 15)
    {
        draw_set_alpha(fade_out);

        // Alphabet
        draw_set_font(fnt_dt_mono);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);

        for (var j = 0; j < 26; j++)
        {
            var letter_x =
                letter_start_x + ((j mod 10) * letter_spacing_x);

            var letter_y =
                letter_start_y + (floor(j / 10) * letter_spacing_y);

            draw_text(
                letter_x,
                letter_y,
                uc_letters[j]
            );
        }

        draw_text(back_x, button_y, "BACK");
        draw_text(end_x, button_y, "END");

        // Original name
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(name_x, name_y, codename);

        // Original SOUL fades out too
        draw_sprite_ext(
            IMAGE_SOUL_BLUR,
            0,
            soul_draw_x,
            soul_draw_y,
            1.2,
            1.2,
            0,
            c_white,
            0.5 * fade_out
        );

        draw_set_alpha(1);
    }


    // --------------------------------------------------
    // CONFIRMATION HEADING
    // --------------------------------------------------

    var heading_alpha_confirm =
        clamp(confirm_anim_timer / 20, 0, 1);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
	var glow_alpha = 0.18;

	draw_set_font(fnt_dt_mono_BIG);
	draw_set_color(c_white);

	// Glow
	for (var i = 1; i <= 3; i++)
	{
	    draw_set_alpha((glow_alpha / i) * return_alpha);
	    draw_text(60 - i, 25, "THIS IS YOUR NAME.");
	    draw_text(60 + i, 25, "THIS IS YOUR NAME.");
	    draw_text(60, 25 - i, "THIS IS YOUR NAME.");
	    draw_text(60, 25 + i, "THIS IS YOUR NAME.");
	}

	// Main text
	draw_set_alpha(return_alpha);
	draw_set_color(c_white);
	draw_text(60, 25, "THIS IS YOUR NAME.");


    // --------------------------------------------------
    // NAME FADES IN, MOVES AND GROWS
    // --------------------------------------------------

    var name_alpha =
        clamp((confirm_anim_timer - 15) / 25, 0, 1);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_dt_mono);
    draw_set_color(c_white);
    draw_set_alpha(name_alpha * return_alpha);

    // Rightward name shake
	var name_shake = abs(sin(current_time / 35)) * 2.5;

	draw_text_transformed(
	    confirm_name_x + name_shake,
	    confirm_name_y,
	    codename,
	    confirm_name_scale,
	    confirm_name_scale,
	    0
	);

    draw_set_alpha(1);


    // --------------------------------------------------
    // NO / YES CHOICES
    // --------------------------------------------------

    var choice_alpha =
        clamp((confirm_anim_timer - 40) / 15, 0, 1);

    if (!go && confirm_anim_timer >= 40)
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_font(fnt_dt_mono);
        draw_set_alpha(choice_alpha * return_alpha);

        if (can_name)
        {
            // NO - LEFT
            draw_set_color(sel == 0 ? c_yellow : c_white);
            draw_text(105, 205, "NO");

            // YES - RIGHT
            draw_set_color(sel == 1 ? c_yellow : c_white);
            draw_text(187, 205, "YES");

            // SOUL
            draw_sprite_ext(
                IMAGE_SOUL_BLUR,
                0,
                soul_draw_x,
                soul_draw_y,
                1,
                1,
                0,
                c_white,
                0.5 * choice_alpha * return_alpha
            );
        }
        else
        {
            draw_set_halign(fa_center);
            draw_set_color(c_yellow);

            draw_text(160, 190, "GO BACK");

            draw_sprite_ext(
                IMAGE_SOUL_BLUR,
                0,
                soul_draw_x,
                soul_draw_y,
                1,
                1,
                0,
                c_white,
                0.5 * choice_alpha * return_alpha
            );
        }

        draw_set_alpha(1);
    }


    // --------------------------------------------------
    // RESTORE DRAW SETTINGS
    // --------------------------------------------------

    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(ha);
    draw_set_valign(va);


    // --------------------------------------------------
    // NAVIGATION
    // --------------------------------------------------

    if (!go && !confirm_returning && confirm_anim_timer >= 55)
    {
        if (can_name)
        {
            // LEFT = NO
            if (keyboard_check_pressed(vk_left))
            {   
				if sel != -1
                sel = max(0, sel - 1);
				else
				sel = 0;
                //snd_play(snd_menumove);
            }

            // RIGHT = YES
            if (keyboard_check_pressed(vk_right))
            {
				if sel != -1
                sel = min(1, sel + 1);
				else
				sel = 1;
                //snd_play(snd_menumove);
            }
        }
        else
        {
            sel = 1;
        }
    }


    // --------------------------------------------------
    // CONFIRM
    // --------------------------------------------------

    if ((keyboard_check_pressed(global.confirm)
    || keyboard_check_pressed(vk_enter))
    && !go
    && confirm_anim_timer >= 55
	&& !confirm_returning)
    {
        // NO - RETURN TO NAME ENTRY
        if (sel == 0 && can_name)
		{
		    // Start fading out the confirmation screen
		    confirm_returning = true;
		    confirm_return_timer = 0;

		   // snd_play(snd_select);

		    exit;
		}
		
        // YES - ACCEPT NAME
        if (sel == 1 || !can_name)
        {
            go = true;
            sel = 0;

            global.PlayerName = codename;
            global.PlayerFont = fnt_dt_mono;
            global.plot = -1;
        }

       // snd_play(snd_select);
        exit;
    }


    // --------------------------------------------------
    // CANCEL
    // --------------------------------------------------

    if ((keyboard_check_pressed(global.cancel) && (!go && !confirm_returning && confirm_anim_timer >= 55)
    || keyboard_check_pressed(vk_shift))
    && !go
    && confirm_anim_timer >= 55)
    {
        menu = 1;
        sel = 27;

        keyboard_clear(ord("X"));
        keyboard_clear(vk_shift);
    }

}




