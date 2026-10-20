
/// obj_battle_transition Step Event

// Move the first active party member.
if (array_length(global.party_order) > 0)
{
    var _leader_name = global.party_order[0];
    var _leader_object = scr_battle_transition_actor(_leader_name);

    if (_leader_object != noone && instance_exists(_leader_object))
    {
        var _leader_target = scr_battle_transition_get_target(0, id);

        with (_leader_object)
        {
            if (!global.battle)
            {
                var _image_leader = instance_create_depth(
                    x, y, depth, obj_afterimage
                );

                _image_leader.image_xscale = image_xscale;
                _image_leader.image_yscale = image_yscale;
                _image_leader.sprite_index = sprite_index;
                _image_leader.image_index = image_index;
            }

            var _leader_target_x = _leader_target.x;
			var _leader_target_y = _leader_target.y;

			with (_leader_object)
			{
			    x = lerp(x, _leader_target_x, 0.1);
			    y = lerp(y, _leader_target_y, 0.1);
			}
        }
    }
}

// Move the enemy.
if (instance_exists(obj_enemy_overworld))
{
    with (obj_enemy_overworld)
    {
        if (!global.battle)
        {
            var _image_enemy = instance_create_depth(
                x, y, depth, obj_afterimage
            );

            _image_enemy.image_xscale = image_xscale;
            _image_enemy.image_yscale = image_yscale;
            _image_enemy.sprite_index = sprite_index;
            _image_enemy.image_index = image_index;
        }

        x = lerp(x, other.target_enemy_x, 0.1);
        y = lerp(y, other.target_enemy_y, 0.1);
    }
}

// Move every active party member after Kris.
var _party_count = array_length(global.party_order);

for (var i = 1; i < _party_count; i++)
{
    var _member_name = global.party_order[i];
    var _actor_object = scr_battle_transition_actor(_member_name);

    if (_actor_object == noone)
        continue;

    // Get this party member's target position.
    var _target = scr_battle_transition_get_target(i, id);

    // Find and move the corresponding battle/cutscene actor.
    var _actor_count = instance_number(_actor_object);

    for (var j = 0; j < _actor_count; j++)
    {
        var _actor = instance_find(_actor_object, j);

        if (!instance_exists(_actor))
            continue;

        // Preserve the existing afterimage conditions.
        var _make_afterimage = (_member_name == "Ralsei")
            ? global.battle
            : !global.battle;

        if (_make_afterimage)
        {
            var _image_actor = instance_create_depth(
                _actor.x,
                _actor.y,
                _actor.depth,
                obj_afterimage
            );

            _image_actor.image_xscale = _actor.image_xscale;
            _image_actor.image_yscale = _actor.image_yscale;
            _image_actor.sprite_index = _actor.sprite_index;
            _image_actor.image_index = _actor.image_index;
        }

        _actor.x = lerp(_actor.x, _target.x, 0.1);
        _actor.y = lerp(_actor.y, _target.y, 0.1);
    }
}

// Start the battle once the enemy reaches its target.
if (instance_exists(obj_enemy_overworld)
&& obj_enemy_overworld.x >= target_enemy_x - 10
&& obj_enemy_overworld.y >= target_enemy_y - 10
&& !instance_exists(obj_battle))
{
    with (obj_afterimage)
    {
        instance_destroy();
    }

    show_debug_message("Transition to battle scene");

    instance_create_depth(x - 50, y, -200, obj_battle);
	obj_battle.soul_spawn_source = soul_spawn_source

    instance_destroy();
}
