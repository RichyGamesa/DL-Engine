// Step event
if !global.battle and !global.cutscene
{
if global.darkworld == false 
{
    // changing sprites
    if (x != xprevious) {
        if (x > xprevious) {
            sprite_index = sprite_right;
        } else if (x < xprevious) {
            sprite_index = sprite_left;
        }
    }

    if (y != yprevious) {
        if (y < yprevious) {
            sprite_index = sprite_up;
        } else if (y > yprevious) {
            sprite_index = sprite_down;
        }
    }
} 
else 
{
    if (x != xprevious) {
        if (x > xprevious) {
            sprite_index = sprite_right_dark;
        } else if (x < xprevious) {
            sprite_index = sprite_left_dark;
        }
    }
    if (y != yprevious) {
        if (y < yprevious) {
            sprite_index = sprite_up_dark;
        } 
	else if (y > yprevious) {
            sprite_index = sprite_down_dark;
        }
    }
}

if (x == xprevious && y == yprevious)
{
    image_index = 0;
}
}

// depth
if (obj_mainchara.y < y) {
    depth = obj_mainchara.depth - 2;
} else if (obj_mainchara.y == y) {
    depth = obj_mainchara.depth + 1;
} else if (obj_mainchara.y > y) {
    depth = obj_mainchara.depth + 1;
}

if (global.darkworld == true) {
    image_xscale = 2;
    image_yscale = 2;
}

if (room == rm_kris_corridor) {
    scr_goto(x, y, obj_mainchara.x, obj_mainchara.y);
}

if (room == rm_sliding) {
	image_index = 0;
    if (place_meeting(x, y, obj_mainchara) && (keyboard_check_pressed(global.confirm) || keyboard_check_pressed(vk_enter))) {
        if (!talked && !alar && obj_mainchara.can_move) and !global.member[1] {
            global.member[1] = true;
			position = global.num_active_members;
            global.num_active_members++;
            talked = true;
            alar = true;
            alarm[0] = 3;

            instance_create_depth(0, 0, -999, oTextbox_dark);
            oTextbox_dark.text[0] = "Susie joined the party";
            instance_create_depth(obj_mainchara.x, obj_mainchara.y, obj_mainchara.depth, obj_follower_suzy);
            array_insert(global.party_order,position, name);
			array_insert(global.real_party, position, self);
			show_debug_message("got");
            show_debug_message(global.num_active_members);
        } else if (talked && !alar && obj_mainchara.can_move) {
            var index = scr_array_find_index(global.party_order, name);
            if (index != -1) {
                array_delete(global.party_order, index, 1);
            }
            global.member[1] = false;
            global.num_active_members--;
            show_debug_message(global.num_active_members);
            talked = false;
            alar = true;
            alarm[0] = 3;

            instance_create_depth(0, 0, -999, oTextbox_dark);
            oTextbox_dark.text[0] = "Susie left the party";
            var follower = instance_find(obj_follower_suzy, 0);
            if (follower != noone) {
                with (follower) {
                    instance_destroy();
                }
            }
        }
    }
}


// Update previous position variables
xprevious = x;
yprevious = y;

/*
if keyboard_check(ord("H"))
{
if sprite_index == sprite_up_dark
sprite_index = sprite_right_dark
else
if sprite_index == sprite_left_dark
sprite_index = sprite_up_dark	
else
if sprite_index == sprite_down_dark
sprite_index = sprite_left_dark
else
if sprite_index == sprite_right_dark
sprite_index = sprite_down_dark

keyboard_clear(ord("H"))
}
*/

global.hp_S = hp
global.max_hp_S = maxHp