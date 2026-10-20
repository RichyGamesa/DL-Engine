function scr_battle_transition_setup()
{
    var _party_count = array_length(global.party_order);

    for (var i = 0; i < _party_count; i++)
    {
        var _member_name = global.party_order[i];
        var _actor_object = scr_battle_transition_actor(_member_name);

        if (_actor_object == noone)
            continue;

        // Find the corresponding overworld follower.
        var _follower = noone;

        if (i == 0 && _member_name == "Kris"
        && instance_exists(obj_mainchara))
        {
            _follower = obj_mainchara;
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

        // If the actor already exists, don't create a duplicate.
        if (instance_exists(_actor_object))
        {
            var _existing_actor = instance_find(_actor_object, 0);

            if (instance_exists(_existing_actor))
            {
                if (instance_exists(_follower))
                    _follower.image_alpha = 0;

                _existing_actor.image_alpha = 1;
            }

            continue;
        }

        // We need a starting position to create the actor.
        if (!instance_exists(_follower))
            continue;

        var _actor = instance_create_depth(
            _follower.x,
            _follower.y,
            _follower.depth,
            _actor_object
        );

        _follower.image_alpha = 0;
        _actor.image_alpha = 1;

        if (_member_name == "Kris")
            _actor.sprite_index = spr_battle_k_start;
        else if (_member_name == "Susie")
            _actor.sprite_index = spr_battle_s_start;
    }
}