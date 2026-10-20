if (!variable_global_exists("fake")) {
    global.fake = true;
}

if (global.fake) {
    /* if (keyboard_check_direct(ord("S"))) {
        game_save("Debug_file")
    }

    if (keyboard_check_direct(ord("L"))) {
        game_load("Debug_file")
    }
    */

    if (keyboard_check_direct(ord("R"))) {
        game_restart();
    }

    


if (keyboard_check_pressed(ord("P")))
{
    if (!follower_exists("Susie"))
    {
        // Create the follower with its character set before its Create Event.
        var _follower = instance_create_depth(
            obj_mainchara.x,
            obj_mainchara.y,
            2,
            obj_follower,
            { character: "Susie" }
        );

        // Add Susie to the party only if she isn't already there.
        if (scr_array_find_index(global.party_order, "Susie") == -1)
        {
            //global.member[1] = true;
            array_push(global.party_order, "Susie");
            array_push(global.real_party, obj_suzy);
        }

        // Recalculate the active party count instead of incrementing it
        // inside the loop.
        global.num_active_members = 0;

        for (var i = 0; i < array_length(global.member); i++)
        {
            if (global.member[i])
                global.num_active_members++;
        }

        /*
        show_debug_message("Follower created: " + string(_follower));
        show_debug_message("Party members: " + string(global.num_active_members));
		
		show_debug_message("Follower ID: " + string(_follower));
		show_debug_message("Character: " + string(_follower.character));
		show_debug_message("X: " + string(_follower.x) + " Y: " + string(_follower.y));
		show_debug_message("Sprite: " + string(_follower.sprite_index));
		show_debug_message("Visible: " + string(_follower.visible));
		show_debug_message("Image alpha: " + string(_follower.image_alpha));
		show_debug_message("Depth: " + string(_follower.depth));
		show_debug_message("Susie down sprite: " + string(_follower.down_light));
		*/
    }
    else
    {
        show_debug_message("Susie follower already exists");
    }
}




    if (keyboard_check_direct(ord("J"))) {
        room_goto(rm_school_hallway);

        obj_mainchara.x = 305;
        obj_mainchara.y = 175;
    }

    if (keyboard_check_direct(ord("H")))
	
	{
        room_goto(rm_green);
		obj_mainchara.x = 618;
		obj_mainchara.y = 227;
    }
	
	if keyboard_check(vk_f2)
	{
	 room_goto(rm_shop)	
	}

    if (keyboard_check(ord("T"))) {
        instance_create_depth(0, 0, -9999, oChoice_light);
    }

    if (keyboard_check(ord("Y"))) {
        room_goto(rm_saves);
    }

    if (keyboard_check(ord("M"))) {
        keyboard_clear(ord("M"));

        if (object_get_visible(oWall) == true) {
            object_set_visible(oWall, false);
        } else {
            object_set_visible(oWall, true);
        }

        if (object_get_visible(oWall_cutscene) == true) {
            object_set_visible(oWall_cutscene, false);
        } else {
            object_set_visible(oWall_cutscene, true);
        }

        if (object_get_visible(oCollision) == true) {
            object_set_visible(oCollision, false);
        } else {
            object_set_visible(oCollision, true);
        }

        if (object_get_visible(oWarp) == true) {
            object_set_visible(oWarp, false);
        } else {
            object_set_visible(oWarp, true);
        }
    }

    if (keyboard_check_pressed(ord("F"))) {
        instance_create_depth(0, 0, -999, oTransition_room);
        oTransition_room.target_x = 349.5;
        oTransition_room.target_y = 209;
        oTransition_room.target_room = rm_castle_kris;
        global.darkworld = true;
        obj_mainchara.sprite_index = KrisD_dark;
    }

    if (keyboard_check_pressed(ord("G"))) {
        instance_create_depth(0, 0, -999, oTransition_room);
        oTransition_room.target_x = 320;
        oTransition_room.target_y = 338;
        oTransition_room.target_room = rm_sliding;
        global.darkworld = true;
        obj_mainchara.sprite_index = KrisD_dark;
    }

    if (keyboard_check_pressed(ord("I"))) {
        instance_create_depth(0, 0, -999, oTransition_room);
        oTransition_room.target_x = 320;
        oTransition_room.target_y = 110;
        oTransition_room.target_room = rm_dark_area_1;
        global.darkworld = true;
        obj_mainchara.sprite_index = KrisD_dark;
    }

    if (keyboard_check(ord("D"))) {
        window_set_caption("THE DEATH");
        room_goto(rm_death);
        obj_mainchara.x = 700;
        obj_mainchara.y = 191;
    }

    if (instance_exists(obj_battle)) {
        if (keyboard_check_pressed(vk_f10)) {
            global.tp = 0;
        }
        if (keyboard_check(vk_f11)) {
            global.tp += 1;
        }
    }
}
