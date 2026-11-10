
/// obj_namescreen Draw Event


/// Animated Deltarune-style heading effect

var glow_pulse = 0.5 + (sin(current_time / 600) * 0.5);
var glow_flicker = 0.85 + (sin(current_time / 250) * 0.15);

var heading_alpha = 0.75 + glow_pulse * 0.25;
var glow_alpha = (0.12 + glow_pulse * 0.16) * glow_flicker;


var sep = 25;

// Name positions
var name_x = 160;
var name_y = 48;

// Original Deltarune English alphabet layout
var letter_spacing_x = 20;
var letter_spacing_y = 20;
var letter_start_x = 68;
var letter_start_y = 70;

// Special button positions
var back_x = letter_start_x + (6 * letter_spacing_x);
var end_x = letter_start_x + (8 * letter_spacing_x);
var button_y = letter_start_y + (2 * letter_spacing_y);

if (menu == 0)
{
    draw_set_font(fnt_dt_mono_BIG);

    ha = draw_get_halign();
    draw_set_halign(fa_center);
    va = draw_get_valign();
    draw_set_valign(fa_middle);

    draw_set_font(fnt_dt_mono);
    draw_text(320, 390, "PRESS " + key_to_string(global.confirm) + " TO START");

    draw_set_halign(ha);
    draw_set_valign(va);

    if (keyboard_check_pressed(global.confirm) || keyboard_check_pressed(vk_enter))
    {
        menu = 1;

        if (file_exists("Save"))
        {
            /*
            LOAD();
            menu = 3;
            snd_play(mus_START_better)
            */
        }

        exit;
    }
}


if (menu == 1)
{
    draw_set_color(c_white);
    siner += 0.12;

    ha = draw_get_halign();
    va = draw_get_valign();

    // -----------------------------
    // ENTER YOUR OWN NAME
    // -----------------------------

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fnt_dt_mono_BIG);
    draw_set_color(c_white);

	var heading = "ENTER YOUR OWN NAME.";

	draw_set_font(fnt_dt_mono_BIG);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	// Soft glow around the text
	draw_set_color(c_white);
	draw_set_alpha(glow_alpha);

	draw_text(60, 20, heading);
	draw_text(60, 20, heading);
	draw_text(60, 19, heading);
	draw_text(60, 21, heading);

	// Main text
	draw_set_color(c_white);
	draw_set_alpha(heading_alpha);

	draw_text(
	    60,
	    20,// + sin(current_time / 300) * 0.5,
	    heading
	);

	draw_set_alpha(1);
	draw_set_color(c_white);


    // -----------------------------
    // CURRENT NAME
    // -----------------------------

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_dt_mono);

    if (string_length(codename) < 12)
        draw_set_color(c_white);
    else
        draw_set_color(c_yellow);

    draw_text_transformed(
        name_x,
        name_y,  //+ sin(siner) * 1.5,
        codename,
		1,
		1,
		0
    );

    // -----------------------------
    // ALPHABET
    // -----------------------------

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fnt_dt_mono);
    draw_set_color(c_white);

    for (var j = 0; j < 26; j++)
    {
        var letter_x = letter_start_x + ((j mod 10) * letter_spacing_x);
        var letter_y = letter_start_y + (floor(j / 10) * letter_spacing_y);

        draw_text(
            letter_x,
            letter_y,
            uc_letters[j]
        );
    }

    // -----------------------------
    // BACK
    // -----------------------------

    draw_set_color(sel == 26 ? c_yellow : c_white);
    draw_text(back_x, button_y, "BACK");

    // -----------------------------
    // END
    // -----------------------------

    if (codename == "")
        draw_set_color(c_gray);
    else
        draw_set_color(sel == 27 ? c_yellow : c_white);

    draw_text(end_x, button_y, "END");

    // -----------------------------
    // SOUL CURSOR
    // -----------------------------

    var selected_x = 0;
    var selected_y = 0;
    var selected_width = 0;

    if (sel >= 0 && sel <= 25)
    {
        selected_x = letter_start_x + ((sel mod 10) * letter_spacing_x);
        selected_y = letter_start_y + (floor(sel / 10) * letter_spacing_y);
        selected_width = string_width(uc_letters[sel]);

        draw_sprite_ext(
            IMAGE_SOUL_BLUR, 0,
            selected_x + (selected_width / 2) - 10,
            selected_y,
            1.2, 1.2, 0,
            c_white, 0.5
        );

        draw_set_color(c_yellow);
        draw_text(selected_x, selected_y, uc_letters[sel]);
    }
    else if (sel == 26)
    {
        draw_sprite_ext(
            IMAGE_SOUL_BLUR, 0,
            back_x + (string_width("BACK") / 2) - 10,
            button_y,
            1.2, 1.2, 0,
            c_white, 0.5
        );

        draw_set_color(c_yellow);
        draw_text(back_x, button_y, "BACK");
    }
    else if (sel == 27)
    {
        draw_sprite_ext(
            IMAGE_SOUL_BLUR, 0,
            end_x + (string_width("END") / 2) - 10,
            button_y,
            1.2, 1.2, 0,
            c_white, 0.5
        );

        if (codename != "")
        {
            draw_set_color(c_yellow);
            draw_text(end_x, button_y, "END");
        }
    }

    // -----------------------------
    // NAVIGATION: UP
    // -----------------------------

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

        snd_play(snd_menumove);
    }

    // -----------------------------
    // NAVIGATION: DOWN
    // -----------------------------

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

        snd_play(snd_menumove);
    }

    // -----------------------------
    // NAVIGATION: LEFT
    // -----------------------------

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

        snd_play(snd_menumove);
    }

    // -----------------------------
    // NAVIGATION: RIGHT
    // -----------------------------

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

        snd_play(snd_menumove);
    }

    // -----------------------------
    // CONFIRM SELECTION
    // -----------------------------

    bkspflag = false;

    if (keyboard_check_pressed(global.confirm) ||
        keyboard_check_pressed(vk_enter))
    {
        if (sel == 26)
        {
            bkspflag = true;
            snd_play(snd_select);
        }
        else if (sel == 27)
        {
            if (codename != "")
            {
                menu = 2;
                sel = 0;

                snd_play(snd_select);

                image_xscale = 1;
                y = -130;
            }

            draw_set_halign(ha);
            draw_set_valign(va);
            exit;
        }
        else if (sel >= 0 && sel <= 25 &&
                 string_length(codename) < 12)
        {
            codename += uc_letters[sel];
            snd_play(snd_select);
        }
    }

    // -----------------------------
    // BACKSPACE / CANCEL
    // -----------------------------

    if (keyboard_check_pressed(global.cancel) ||
        bkspflag ||
        keyboard_check_pressed(vk_shift))
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

    draw_set_color(c_white);
    draw_set_halign(ha);
    draw_set_valign(va);
}



if (menu == 2)
{
    siner += 0.12;

    ha = draw_get_halign();
    va = draw_get_valign();

    // -----------------------------
    // THIS IS YOUR NAME
    // -----------------------------

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fnt_dt_mono_BIG);
    draw_set_color(c_white);

	var heading = "THIS IS YOUR NAME.";

	draw_set_font(fnt_dt_mono_BIG);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	// Glow
	draw_set_color(c_white);
	draw_set_alpha(glow_alpha);

	draw_text(60, 20, heading);
	draw_text(60, 20, heading);
	draw_text(60, 19, heading);
	draw_text(60, 21, heading);

	// Main text
	draw_set_color(c_white);
	draw_set_alpha(heading_alpha);

	draw_text(
	    60,
	    20,// + sin(current_time / 300) * 0.5,
	    heading
	);

	draw_set_alpha(1);
	draw_set_color(c_white);

    // -----------------------------
    // CONFIRMATION NAME
    // -----------------------------

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_font(fnt_dt_mono);
    draw_set_color(c_white);

    draw_text_transformed(
        name_x,
        name_y,  //+ sin(siner) * 1.5,
        codename,
		1,
		1,
		0
    );

    // -----------------------------
    // YES / NO / GO BACK
    // -----------------------------

    if (!go)
    {
        if (can_name)
        {
            // SOUL
            draw_sprite_ext(
                IMAGE_SOUL_BLUR, 0,
                82 + (sel * 130),
                93,
                1, 1, 0,
                c_white, 0.5
            );

            draw_set_font(fnt_dt_mono);

            // YES
            draw_set_color(sel == 0 ? c_yellow : c_white);
            draw_text(90, 100, "YES");

            // NO
            draw_set_color(sel == 1 ? c_yellow : c_white);
            draw_text(220, 100, "NO");
        }
        else
        {
            // GO BACK SOUL
            draw_sprite_ext(
                IMAGE_SOUL_BLUR, 0,
                room_width / 2 - 55,
                296,
                2, 2, 0,
                c_white, 0.5
            );

            draw_set_font(fnt_dt_mono);
            draw_set_color(c_yellow);

            draw_text(room_width / 2, 296, "GO BACK");
        }
    }

    draw_set_color(c_white);
    draw_set_halign(ha);
    draw_set_valign(va);

    // -----------------------------
    // NAVIGATION
    // -----------------------------

    if (!go)
    {
        if (can_name)
        {
            if (keyboard_check_pressed(vk_left))
            {
                sel = max(0, sel - 1);
                snd_play(snd_menumove);
            }

            if (keyboard_check_pressed(vk_right))
            {
                sel = min(1, sel + 1);
                snd_play(snd_menumove);
            }
        }
        else
        {
            sel = 1;
        }
    }

    // -----------------------------
    // CONFIRM
    // -----------------------------

    if ((keyboard_check_pressed(global.confirm) ||
         keyboard_check_pressed(vk_enter)) && !go)
    {
        if (sel == 0)
        {
            go = true;
            sel = 0;

            global.PlayerName = codename;
            global.PlayerFont = fnt_dt_mono;
            global.plot = -1;
        }

        if (sel == 1)
        {
            menu = 1;
            sel = 27;
        }

        snd_play(snd_select);
        exit;
    }

    // -----------------------------
    // CANCEL
    // -----------------------------

    if ((keyboard_check_pressed(global.cancel) ||
         keyboard_check_pressed(vk_shift)) && !go)
    {
        menu = 1;
        sel = 27;

        keyboard_clear(ord("X"));
        keyboard_clear(vk_shift);
    }
}
