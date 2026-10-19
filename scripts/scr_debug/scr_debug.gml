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
        var _follower = instance_create_depth(
            obj_mainchara.x,
            obj_mainchara.y,
            2,
            obj_follower,
            {
                character: "Susie"
            }
        );

        global.member[1] = true;
        array_insert(global.party_order, 1, "Susie");
        array_insert(global.real_party, 1, obj_suzy);
    }
    else if (!follower_exists("Ralsei"))
    {
        var _follower = instance_create_depth(
            obj_mainchara.x,
            obj_mainchara.y,
            2,
            obj_follower,
            {
                character: "Ralsei"
            }
        );

        global.member[2] = true;
        array_insert(global.party_order, 2, "Ralsei");
        array_insert(global.real_party, 2, obj_ralsei);
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
