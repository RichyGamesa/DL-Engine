/// @function damage_bullet(_damage, [_death_room])
/// @param {Real} _damage Damage dealt by the bullet.
/// @param {Id.Room} [_death_room=rm_death] Room to go to if the party is defeated.

function damage_bullet(_damage)
{
    var _death_room = (argument_count > 1)
        ? argument[1]
        : rm_death;

    var _eligible = [];
    var _active_count = 0;

    // Check only members currently in the party.
    for (var i = 0; i < array_length(global.party_order); i++)
    {
        var _member_name = global.party_order[i];
        var _member = scr_get_member_data(_member_name);

        if (is_undefined(_member))
            continue;

        _active_count++;

        var _hp = variable_global_get(_member.hpVar);

        // Members at 1 HP cannot be selected while others have more.
        if (_hp > 1)
        {
            array_push(_eligible, _member_name);
        }
    }

    // No active members, or everyone is at 1 HP or less: game over.
    if (_active_count == 0 || array_length(_eligible) == 0)
    {
        room_goto(_death_room);
        return;
    }

    // Choose randomly from eligible active members.
    var _chosen_index = irandom(array_length(_eligible) - 1);
    var _chosen_name = _eligible[_chosen_index];
    var _chosen_member = scr_get_member_data(_chosen_name);

    var _hp_var = _chosen_member.hpVar;
    var _hp = variable_global_get(_hp_var);

    // Damage cannot reduce the selected member below 1 HP.
    variable_global_set(_hp_var, max(1, _hp - _damage));
	
	var _new_hp = max(1, _hp - _damage);
	variable_global_set(_hp_var, _new_hp);

	// Return the member hit and the actual HP lost.
	return {
	    member: _chosen_name,
	    amount: _hp - _new_hp
			};
}