// Change sprite based on movement direction
if global.darkworld == true {
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
        } else if (y > yprevious) {
            sprite_index = sprite_down_dark;
        }
    }
}
if (x == xprevious && y == yprevious) {
    image_index = 0;
    image_speed = 0;
} else {
    image_speed = 9;
}

// Depth management
if (obj_mainchara.y < y) {
    depth = (obj_mainchara.depth - 2);
} else {
    depth = obj_mainchara.depth + 1;
}

// Adding/removing party member in rm_sliding room

// Adding/removing party member in rm_sliding room

if (room == rm_sliding) //and global.fake
{
    if (place_meeting(x, y, obj_mainchara)
    && (keyboard_check_pressed(global.confirm) || keyboard_check_pressed(vk_enter))
    && !alar
    && obj_mainchara.can_move)
    {
        var _index = scr_array_find_index(global.party_order, "Ralsei");

        if (_index == -1)
        {
            // JOIN PARTY
            array_push(global.party_order, "Ralsei");
            global.num_active_members = array_length(global.party_order);

            talked = true;
            alar = true;
            alarm[0] = 3;

            if (!array_contains(global.spells_Ralsei, "Destroy everything"))
            {
                global.spells_Ralsei =
                [
                    { name: "Pacify", description: "SPARE a TIRED enemy by putting them to SLEEP.", tpCost: 20 },
                    { name: "Heal Prayer", description: "Heal a Party Member with HEAVENLY light", tpCost: 35 },
                    { name: "Destroy everything", description: "Destroy the DARKNERS", tpCost: 100 }
                ];
            }

            var _textbox = instance_create_depth(0, 0, -999, oTextbox_dark);
            _textbox.text[0] = "Ralsei joined the party";

            if (!follower_exists("Ralsei"))
            {
                instance_create_depth(
                    obj_mainchara.x,
                    obj_mainchara.y,
                    2,
                    obj_follower,
                    { character: "Ralsei" }
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
            _textbox.text[0] = "Ralsei left the party";

            follower_remove("Ralsei");
        }
    }
}



if keyboard_check(ord("G"))
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

keyboard_clear(ord("G"))
}