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



if (room == rm_sliding) //and global.fake
{
    if (place_meeting(x, y, obj_mainchara)
    && (keyboard_check_pressed(global.confirm) || keyboard_check_pressed(vk_enter))
    && !alar
    && obj_mainchara.can_move)
    {
        var _index = scr_array_find_index(global.party_order, "Susie");

        if (_index == -1)
        {
            // JOIN PARTY
            array_push(global.party_order, "Susie");
            global.num_active_members = array_length(global.party_order);

            talked = true;
            alar = true;
            alarm[0] = 3;

            var _textbox = instance_create_depth(0, 0, -999, oTextbox_dark);
            _textbox.text[0] = "Susie joined the party";

            if (!follower_exists("Susie"))
            {
                instance_create_depth(
                    obj_mainchara.x,
                    obj_mainchara.y,
                    2,
                    obj_follower,
                    { character: "Susie" }
                );
            }
        }
        else
        {
            // LEAVE PARTY
            array_delete(global.party_order, _index, 1);
            global.num_active_members = array_length(global.party_order);

            talked = false;
            alar = true;
            alarm[0] = 3;

            var _textbox = instance_create_depth(0, 0, -999, oTextbox_dark);
            _textbox.text[0] = "Susie left the party";

            follower_remove("Susie")

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

//global.hp_S = hp
//global.max_hp_S = maxHp