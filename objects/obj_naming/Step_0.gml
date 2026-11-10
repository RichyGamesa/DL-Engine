//obj_NamingScreen step event
/*
if (global.border == "Dynamic")
{
    obj_border_ui.sprite_tobe = noone;
}*/


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
        timer -= 1;

        if (!instance_exists(oTransition_room))
        {
            tran = instance_create_depth(
                x, y, -10000, oTransition_room
            );

            tran.color = c_white;
            tran.target_room = rm_cutscene_start;
            tran.transition_number = 0.03;

        }
        else if (timer > 0)
        {
            if (tran.image_alpha >= 0.96)
                tran.image_alpha = 0.96;
        }
    }

    // ==================================================
    // NAME CONFIRMATION
    // ==================================================

    // Reset values when entering the confirmation menu
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

	    // Default vessel response
	    confirm_name = "WE CALLED IT \"" + codename + "\".";
	    confirm_font = fnt_dt_mono_BIG;
	    confirm_scale = 1;
	    confirm_color = #f78b90;
	    can_name = true;

	    switch (name_lower)
	    {
	        // --------------------------------------
	        // GASTER
	        // --------------------------------------

	        case "gaster":
	            game_restart();
	        break;

	        // --------------------------------------
	        // INTERESTING COINCIDENCE
	        // --------------------------------------

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

