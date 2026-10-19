
/// scr_trasform_dark(_con, _actor, _is_main)

function scr_trasform_dark(_door, _con, _actor, _is_main)
{
    if (!instance_exists(_actor))
        return;

    // Get the character's identity.
    var _character = _actor.character;
    var _config;

    // Character-specific transformation configuration.
    switch (_character)
    {
        case "Kris":
            _config = {
                object: obj_fake_kris,
                up: KrisU,
                run: spr_kris_transform_run,
                jump: spr_kris_jumps,
                transform: spr_kris_transform,
                fall: spr_kris_d_fall,
                final: spr_kris_transform_final,
                falling: spr_kris_falling,
                getting_up: spr_kris_d_gettingup
            };
        break;

        case "Susie":
            _config = {
                object: obj_suzy,
                up: spr_suzyU,
                run: spr_suzy_run_up,
                jump: spr_suzy_jump,
                transform: spr_suzy_transform,
                fall: spr_suzy_fall,
                final: spr_suzy_final,
                falling: spr_suzy_falling,
                getting_up: spr_suzy_falling
            };
        break;

        // Add other characters here.
    }

    if (is_undefined(_config))
        return;

    // Only transform active party members.
    if (!_is_main)
    {
        var _in_party = false;

        for (var i = 0; i < array_length(global.party_order); i++)
        {
            if (global.party_order[i] == _character)
            {
                _in_party = true;
                break;
            }
        }

        if (!_in_party)
            return;
    }

    // Get or create this character's temporary transformation instance.
    var _target = noone;

    if (variable_instance_exists(_actor, "dark_transform_target"))
        _target = _actor.dark_transform_target;

    if (!instance_exists(_target))
    {
        _target = instance_create_depth(
            _actor.x,
            _actor.y,
            _actor.depth,
            _config.object
        );

        _actor.dark_transform_target = _target;

        _target.dark_transform_jumped = false;
        _actor.image_alpha = 0;
    }

    if (!instance_exists(_target))
        return;

    // STATE 1: Initial pose.
    if (_con == 1)
    {
        _target.cutscene = true;
        _target.x = 290;
        _target.y = 90;
        _target.sprite_index = _config.up;
        _target.image_index = 0;
        _target.image_speed = 0;
        _target.vspeed = 3;
        _target.image_alpha = 1;
    }

    // STATE 3: Stop.
    if (_con == 3)
    {
        _target.image_index = 0;
        _target.image_speed = 0;
        _target.vspeed = 0;
    }

    // STATE 5: Run upward.
    if (_con == 5)
    {
        _target.sprite_index = _config.run;
        _target.image_speed = 3.5;
        _target.vspeed = -6;
    }

    // STATE 7: Stop before jumping.
    if (_con == 7)
    {
        _target.vspeed = 0;
        _target.image_speed = 0;
        _target.image_index = 0;
    }

// STATE 8: Jump.
		if (_con == 8)
	{
	    _target.sprite_index = _config.jump;
	    _target.image_speed = 1.5;

	    if (!_target.dark_transform_jumped)
	    {
	        // Continue jumping until the character reaches y = 85.
	        if (_target.y > 85)
	        {
	            _target.vspeed = -8;
	        }
	        else
	        {
	            _target.y = 85;
	            _target.vspeed = 0;
	            _target.dark_transform_jumped = true;

	            _door.con = 9;
	            _door.alarm[4] = 30;
	        }
	    }
	}

    // STATE 10: Transformation animation.
    if (_con == 10)
    {
        _target.sprite_index = _config.transform;
        _target.image_speed = 0.8;

        if (_target.image_index >= 8)
            _door.con = 11;
    }

    // STATE 11: Falling animation.
    if (_con == 11)
    {
        _target.sprite_index = _config.fall;
        _target.image_speed = 1.2;

        alarm[4] = 110;
        _door.con = 12;
    }

    // STATE 13: Final transformation animation.
    if (_con == 13)
    {
        _target.sprite_index = _config.final;
        _target.image_speed = 0.5;

        if (_target.image_index > 1)
            _door.con += 1;
    }

    // STATE 14: Fall.
    if (_con == 14)
    {
        _target.sprite_index = _config.falling;
        _target.image_speed = 0.9;
        _target.vspeed = 10;
    }

    // STATE 15: Move the protagonist to the landing area.
    if (_con == 15 && _is_main)
    {
        _actor.x = 327;
        _actor.y = 1217;
        _target.y = 1100;
    }

    // STATE 16: Get back up.
    if (_con == 16 && _is_main)
    {
        if (_target.y >= 1231)
        {
            _target.vspeed = 0;
            _target.sprite_index = _config.getting_up;
            _target.image_speed = 0.9;

            if (_target.image_index >= 1)
            {
                _target.image_speed = 0;
                alarm[4] = 30;
                _door.con = 17;
            }
        }
    }

    // STATE 17: Restore the actual protagonist.
    if (_con == 17 && _is_main)
    {
        _actor.x = _target.x;
        _actor.y = _target.y;

        instance_destroy(_target);
        _actor.dark_transform_target = noone;
        _actor.image_alpha = 1;
    }
}
