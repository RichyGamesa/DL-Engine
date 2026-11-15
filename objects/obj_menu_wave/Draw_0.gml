// obj_menu_wave Draw Event

if (BGMADE == 1 && SUBTYPE == 1)
{
    // WAVY BACKGROUND
    for (var i = 0; i < __WAVEHEIGHT; i += 1)
    {
        var wave_minus = BGMAGNITUDE * (i / __WAVEHEIGHT) * 1.3;

        var wave_mag = 0;

        if (wave_minus <= BGMAGNITUDE)
            wave_mag = BGMAGNITUDE - wave_minus;

        draw_sprite_part_ext(
            IMAGE_MENU,
            0,
            0, i,
            __WAVEWIDTH, 1,
            sin((i / 8) + (BG_SINER / 30)) * wave_mag,
            (10 + i) - (BG_ALPHA * 20),
            1, 1,
            image_blend,
            BG_ALPHA * 0.8
        );

        draw_sprite_part_ext(
            IMAGE_MENU,
            0,
            0, i,
            __WAVEWIDTH, 1,
            -sin((i / 8) + (BG_SINER / 30)) * wave_mag,
            (10 + i) - (BG_ALPHA * 20),
            1, 1,
            image_blend,
            BG_ALPHA * 0.8
        );
    }

    // ANIMATED OVERLAY

        draw_sprite_ext(
            IMAGE_MENU_ANIMATION,
            ANIM_SINER / 12,
            0,
            ((10 + (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70,
            1, 1, 0,
            image_blend,
            BG_ALPHA * 0.46
        );
       /*
        draw_sprite_ext(
            IMAGE_MENU_ANIMATION,
            (ANIM_SINER / 12) + 0.4,
            0,
            ((10 + (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70,
            1, 1, 0,
            image_blend,
            BG_ALPHA * 0.56
        );

        draw_sprite_ext(
            IMAGE_MENU_ANIMATION,
            (ANIM_SINER / 12) + 0.8,
            0,
            ((10 + (BG_ALPHA * 20)) + __WAVEHEIGHT) - 70,
            1, 1, 0,
            image_blend,
            BG_ALPHA * 0.7
        );
		*/
		
		    // DARKEN THE GAP BETWEEN THE BACKGROUND AND ANIMATION   let's brute force itttttt
		    draw_set_alpha(BG_ALPHA * 0.2);
		    draw_set_color(c_black);

		    draw_rectangle(
		        0,
		        ((10 + (BG_ALPHA * 20)) + __WAVEHEIGHT) - 69.8,
		        __WAVEWIDTH,
		        ((10 + (BG_ALPHA * 20)) + __WAVEHEIGHT) - 20,
		        false
		    );

		    draw_set_alpha(1);
		    draw_set_color(c_white);
    
}

