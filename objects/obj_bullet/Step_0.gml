// Step Event of Bullet Object

// Movement
motion_set(bullet_direction, speed);

// Destroy if outside the room
if (x < -sprite_width / 2
|| x > room_width + sprite_width / 2
|| y < -sprite_height / 2
|| y > room_height + sprite_height / 2)
{
    instance_destroy();
    exit;
}


// Check collision with the SOUL.
var _soul = instance_place(x, y, obj_soul);

if (_soul != noone)
{ 
	if (_soul.invincible_timer <= 0)
    {
        // Apply damage here, using your existing damage code.
        _soul.hit_by_bullet = true;
		_soul.hit_by_bullet = true;

		audio_play_sound(snd_hurt, 2, false);

		var _hit = damage_bullet(damage);

		if (is_struct(_hit))
		    {
		        var _popup_x = _soul.x;
		        var _popup_y = _soul.y - 12;

		        // Position the popup above the character who was hit.
		        if (_hit.member == "Kris" && instance_exists(obj_mainchara))
		        {
		            _popup_x = obj_mainchara.x;
		            _popup_y = obj_mainchara.y - 20;
		        }
		        else
		        {
		            var _count = instance_number(obj_follower);

		            for (var i = 0; i < _count; i++)
		            {
		                var _follower = instance_find(obj_follower, i);

		                if (instance_exists(_follower)
		                && variable_instance_exists(_follower, "character")
		                && _follower.character == _hit.member)
		                {
		                    _popup_x = _follower.x;
		                    _popup_y = _follower.y - 20;
		                    break;
		                }
		            }
		        }

		        var _popup = instance_create_depth(
		            _popup_x,
		            _popup_y,
		            -10000,
		            obj_damage_popup
		        );

		        _popup.value = _hit.amount;

				var _member = scr_get_member_data(_hit.member);

				if (!is_undefined(_member))
				{
				    _popup.popup_color = _member.hpBarColor;
				}
		    }
		
    }
  

    instance_destroy();
    exit;
}