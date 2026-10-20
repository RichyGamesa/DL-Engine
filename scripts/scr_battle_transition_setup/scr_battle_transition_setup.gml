
function scr_battle_transition_setup()
{
    var _party_count = min(array_length(global.party_order), 3);

    for (var i = 0; i < _party_count; i++)
    {
        var _member_name = global.party_order[i];
        var _actor_object = scr_battle_transition_actor(_member_name);

        if (_actor_object == noone)
        {
            show_debug_message(
                "BATTLE SETUP: No actor object mapped for " + _member_name
            );
            continue;
        }

        // Find this member's overworld character.
        var _follower = noone;

        if (i == 0 && _member_name == "Kris"
        && instance_exists(obj_mainchara))
        {
            _follower = instance_find(obj_mainchara, 0);
        }
        else
        {
            for (var j = 0; j < instance_number(obj_follower); j++)
            {
                var _f = instance_find(obj_follower, j);

                if (instance_exists(_f)
                && variable_instance_exists(_f, "character")
                && _f.character == _member_name)
                {
                    _follower = _f;
                    break;
                }
            }
        }

        // Reuse an existing actor if one exists.
        var _actor = noone;

        if (instance_number(_actor_object) > 0)
        {
            _actor = instance_find(_actor_object, 0);
        }

        // Create the actor only if it doesn't already exist.
        if (!instance_exists(_actor))
        {
            if (!instance_exists(_follower))
            {
                show_debug_message(
                    "BATTLE SETUP: No actor or overworld follower for "
                    + _member_name
                );
                continue;
            }

            _actor = instance_create_depth(
                _follower.x,
                _follower.y,
                _follower.depth,
                _actor_object
            );
        }

        if (!instance_exists(_actor))
        {
            show_debug_message(
                "BATTLE SETUP: Failed to create actor for " + _member_name
            );
            continue;
        }

        _actor.image_alpha = 1;

        if (instance_exists(_follower))
        {
            _follower.image_alpha = 0;
        }

        // Preserve your existing starting sprites.
        if (_member_name == "Kris")
        {
            _actor.sprite_index = spr_battle_k_start;
        }
        else if (_member_name == "Susie")
        {
            _actor.sprite_index = spr_battle_s_start;
        }
    }
}
