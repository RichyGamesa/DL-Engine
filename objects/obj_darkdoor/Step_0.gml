//obj_darkdoor step event
 xa = camera_get_view_x(view_camera[0])
 ya = camera_get_view_y(view_camera[0])
 
 if started == true
 {
 scr_trasform_dark(con)
 }
 
if (place_meeting(x, y, obj_mainchara)) {
    if (keyboard_check(ord("Z")) || keyboard_check(vk_enter)) 
	{
        started = true;
        con = 1;
        obj_mainchara.y += 20;
        obj_mainchara.image_alpha = 0;
    }
}

switch (con) {
    case 1:
        image_index = 1;
        if (!audio_is_playing(snd_locker)) 
		{
            audio_play_sound(snd_locker, 1, false);
        }
        with (k)
		{
            can_move = false;
            cutscene = true;
            image_alpha = 1;
            x = 290;
            y = 90;
            sprite_index = KrisU;
            vspeed = 3;
        }
        con = 2;
        alarm[4] = 30;
        break;

    case 3:
        with (k) {
            image_index = 0;
            image_speed = 0;
            vspeed = 0;
        }
        con = 4;
        alarm[4] = 30;
        image_index = 1;
        break;

    case 4:
        if (!instance_exists(obj_dw_transition)) 
		{
            instance_create_depth(x - 25, y - 10, 20000, obj_dw_transition);
        }
        break;

    case 5:
        with (k) {
            sprite_index = spr_kris_transform_run;
            image_speed = 3.5;
            vspeed = -6;
        }
        con = 6;
        alarm[4] = 15;
        depth = 100;
        break;

    case 7:
        with (k) {
            vspeed = 0;
            image_speed = 0;
            image_index = 0;
        }
        con = 8;
        break;

    case 8:
        with (k) {
            if (!obj_darkdoor.kris_jumped) 
			{
                if (y < 85) {
                    vspeed = -8;
                } else {
                    vspeed = 0;
                    obj_darkdoor.con++;
                    obj_darkdoor.kris_jumped = true;
                    obj_darkdoor.alarm[4] = 30;
                }
            }
            sprite_index = spr_kris_jumps;
            image_speed = 1.5;
        }
        break;

    case 10:
        with (k) {
            sprite_index = spr_kris_transform;
            image_speed = 0.8;
            if (image_index >= 8) {
                obj_darkdoor.con = 11;
            }
        }
        break;

    case 11:
        with (k) {
            sprite_index = spr_kris_d_fall;
            image_speed = 1.2;
        }
        alarm[4] = 110;
        con = 12;
        break;

    case 13:
        with (k) {
            sprite_index = spr_kris_transform_final;
            image_speed = 0.5;
            if (image_index > 1) {
                obj_darkdoor.con++;
            }
        }
        break;

    case 14:
        with (k) {
            sprite_index = spr_kris_falling;
            image_speed = 0.9;
            vspeed = 10;
        }
        con = 15;
        alarm[4] = 60;
        break;

    case 15:
        obj_mainchara.x = 327;
        obj_mainchara.y = 1217;
        k.y = 1100;
        break;

    case 16:
        with (k) {
            if (y >= 1231) {
                vspeed = 0;
                sprite_index = spr_kris_d_gettingup;
                image_speed = 0.9;
                if (image_index >= 1) {
					image_speed = 0;
					
					alarm[4] = 30;
                    con = 17;
                }
            }
        }
        break;
		
        case 17:
        obj_mainchara.x = k.x;
        obj_mainchara.y = k.y;
        instance_destroy(k);
        obj_mainchara.image_alpha = 1;
		break;
		
        case 18:
        instance_destroy(obj_dw_transition);
        instance_destroy();
        break;
}
