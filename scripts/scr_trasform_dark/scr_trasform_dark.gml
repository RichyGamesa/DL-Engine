
/// scr_trasform_dark(_con, _actor, _is_main)

function scr_trasform_dark(_door, _con, _actor, _is_main)
{
    if (!instance_exists(_actor))
        return;

    // STATE 17: Restore the real character and clean up.
	// Handle this BEFORE target creation.

	if (_con == 17)
	{
	    var _target = noone;

	    if (variable_instance_exists(_actor, "dark_transform_target"))
	    {
	        _target = _actor.dark_transform_target;
	    }

	    // Restore position before destroying the temporary character.
	    if (instance_exists(_target))
	    {
	        _actor.x = _target.x;
	        _actor.y = _target.y;
	        instance_destroy(_target);
	    }
		
		//Change the sprite to the dark version
        switch (_actor.character)
		{
		    case "Kris":
		        _actor.sprite_index = KrisD_dark;
		    break;

		    case "Susie":
		        _actor.sprite_index = spr_suzyD_dark;
		    break;
		}

        
	    _actor.dark_transform_target = noone;
	    _actor.image_alpha = 1;

		
		

	    if (_is_main)
	    {
	        // Restore movement.
	        if (variable_instance_exists(_actor, "dark_transform_previous_can_move"))
	        {
	            _actor.can_move = _actor.dark_transform_previous_can_move;
	        }
	        else
	        {
	            _actor.can_move = true;
	        }

	        // End the cutscene.
	        global.cutscene = false;

	        // Ensure the player isn't left with residual movement.
	        _actor.xspd = 0;
	        _actor.yspd = 0;
			
			if instance_exists(obj_darkdoor)
			instance_destroy(obj_darkdoor)
	    }

	    return;
	}
    
    // Get the character's identity.
    var _character = _actor.character;
	if (_is_main)
	{
	    _door.dark_transform_main_character = _character;
	}
	
    var _config = undefined;

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
               object: obj_fake_suzy,
                up: spr_suzyU,
                run: spr_suzy_run_up,
                jump: spr_suzy_jump,
                transform: spr_suzy_transform,
                fall: spr_suzy_fall,
                final: spr_suzy_final,
                falling: spr_suzy_falling,
                getting_up: spr_suzy_getting_up
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
	{
	    _target = _actor.dark_transform_target;
	}

	if (!instance_exists(_target))
	{
	    // Save the original state only once.
	    if (variable_instance_exists(_actor, "can_move"))
	    {
	        _actor.dark_transform_previous_can_move = _actor.can_move;
	        _actor.can_move = false;
	    }

	    if (_is_main)
	    {
	        _actor.dark_transform_previous_cutscene = global.cutscene;
	        global.cutscene = true;
	    }

	    _target = instance_create_depth(
	        _actor.x,
	        _actor.y,
	        _actor.depth,
	        _config.object
	    );
		
		_target.sprite_index = _config.up;

	    _actor.dark_transform_target = _target;

		_target.dark_transform_jumped = false;
		_target.dark_transform_state10_started = false;
		_target.cutscene = true;
		_target.image_alpha = 1;

		_actor.image_alpha = 0;
	}
		// Calculate this character's party formation.
		var _formation = scr_dark_transform_position(
		    _actor,
		    _door.dark_transform_main_character
		);

		// Keep the party spread out during the cutscene.
		// The vertical offsets are used too, so larger parties
		// can occupy the upper and lower positions.
		if (_con >= 1 && _con <= 14)
		{
		    _target.x = 290 + _formation.x;
		}

    // STATE 1: Initial pose.
	if (_con == 1)
	{
	    _target.cutscene = true;

	    _target.x = 290 + _formation.x;
	    _target.y = 90 + _formation.y;

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
	        if (_target.y >= 85)
	        {
	            _target.vspeed = -8;
	        }
	        else
	        {
	            _target.y = 85;
	            _target.vspeed = 0;
	            _target.dark_transform_jumped = true;

	            if (_is_main)
				{
				    _door.con = 9;
				    _door.alarm[4] = 30;
				}
	        }
	    }
	}

    // STATE 10: Transformation animation.
	if (_con == 10)
	{
	    _target.cutscene = true;
	    _target.sprite_index = _config.transform;
	    _target.image_speed = 0.8;

	    var _last_frame = sprite_get_number(_config.transform) - 1;

	    if (_target.image_index >= _last_frame)
	    {
	        _target.image_index = _last_frame;
	        _target.image_speed = 0;
	        _door.con = 11;
			_door.image_alpha = 0;
	    }
	}

    // STATE 11: Falling animation.
    if (_con == 11)
    {
        _target.sprite_index = _config.fall;
        _target.image_speed = 1.2;
		
		_door.alarm[4] = 110;
		_door.con = 12;
    }

    // STATE 13: Final transformation animation.
	if (_con == 13)
	{
	    _target.cutscene = true;
	    _target.sprite_index = _config.final;
	    _target.image_speed = 0.5;

	    var _last_frame = sprite_get_number(_config.final) - 1;

	    if (_target.image_index >= _last_frame)
	    {
	        _target.image_index = _last_frame;
	        _target.image_speed = 0;
	        _door.con = 14;
	    }
	}


	// STATE 14: Fall toward the Dark World landing zone.
	if (_con == 14)
	{
	    _target.cutscene = true;
	    _target.sprite_index = _config.falling;
	    _target.image_speed = 0.9;
		

	    // Stop each character when they reach the landing zone.
	    if (_target.y >= 1217)
	    {
	        _target.y = 1217;
	        _target.vspeed = 0;
            //global.darkworld = true;
	        // Only the main character advances the cutscene.
	        if (_is_main)
	        {
	            _door.con = 15;
	        }
	    }
	    else
	    {
	        _target.vspeed = 10;
	    }
	}

    // STATE 15: Move the protagonist to the landing area.

	if (_con == 15)
	{
	    global.darkworld = true;

	    _target.x = 256 + _formation.x;
	    _target.y = 320 + _formation.y;
	    _target.vspeed = 0;

	    _actor.x = _target.x;
	    _actor.y = _target.y;

	    // Only the main character triggers the room transition.
	    if (_is_main)
	    {
	        _door.con = 16;
	        room_goto(rm_dark_area_1);
	    }
	}

    // STATE 16: Get back up.
	if (_con == 16 )
	{
		if (_is_main)
		{
	    _target.vspeed = 0;
	    _target.sprite_index = _config.getting_up;
	    _target.image_speed = 0.9;

	    if (_target.image_index >= sprite_get_number(_config.getting_up) - 1)
	    {
	        _target.image_index = sprite_get_number(_config.getting_up) - 1;
	        _target.image_speed = 0;

	        _door.con = 17;
	    }
		}
		else
		{
		_target.vspeed = 0;
	    _target.sprite_index = _config.getting_up;
	    _target.image_speed = 0.9;
		}
	}

    // STATE 17: Is at the top to prevent duplications
}
