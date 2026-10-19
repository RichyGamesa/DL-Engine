//obj_darkdoor step event
 xa = camera_get_view_x(view_camera[0])
 ya = camera_get_view_y(view_camera[0])
 

if (started)
{
    scr_trasform_dark(id, con, obj_mainchara, true);

    with (obj_follower)
    {
        scr_trasform_dark(other.id, other.con, id, false);
    }
}

 
if (place_meeting(x, y, obj_mainchara))
{
    if (keyboard_check(ord("Z")) || keyboard_check(vk_enter)) 
	{
        started = true;
        con = 1;
        obj_mainchara.y += 20;
        obj_mainchara.image_alpha = 0;
		if silence
		audio_stop_all()
    }
}

switch (con)
{
    case 1:
        image_index = 1;

        if (!audio_is_playing(snd_locker))
            audio_play_sound(snd_locker, 1, false);

        con = 2;
        alarm[4] = 30;
    break;

    case 3:
        con = 4;
        alarm[4] = 30;
        image_index = 1;
    break;

    case 4:
        if (!instance_exists(obj_dw_transition))
            instance_create_depth(x - 25, y - 10, 20000, obj_dw_transition);
    break;

    case 5:
        con = 6;
        alarm[4] = 15;
        depth = 100;
    break;

    case 7:
        con = 8;
    break;

    case 11:
        alarm[4] = 110;
        con = 12;
    break;

    case 14:
       // con = 15;
        //alarm[4] = 60;
    break;

    case 18:
        if (instance_exists(obj_dw_transition))
            instance_destroy(obj_dw_transition);

        instance_destroy();
    break;
}
