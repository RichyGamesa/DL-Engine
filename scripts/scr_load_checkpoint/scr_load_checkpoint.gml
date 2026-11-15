function scr_load_checkpoint()
{
    if (!file_exists("checkpoint"))
        return -1;

    ini_open("checkpoint");

    // Restore player position and movement.
    global.checkpoint_x = ini_read_real("Checkpoint", "x", 0);
    global.checkpoint_y = ini_read_real("Checkpoint", "y", 0);
    var _room = ini_read_real("Checkpoint", "room", room);
    global.checkpoint_move = ini_read_real("Checkpoint", "move", true);

    // Mark checkpoint position as waiting to be applied.
    global.checkpoint_pending = true;

    // Restore party order.
    var _party_count = ini_read_real("Checkpoint", "party_count", 1);

    global.party_order = [];

    for (var i = 0; i < _party_count; i++)
    {
        var _character = ini_read_string(
            "Party",
            "member_" + string(i),
            ""
        );

        if (_character != "")
        {
            array_push(global.party_order, _character);
        }
    }

    global.num_active_members = array_length(global.party_order);

    // Restore HP for saved party members.
    for (var i = 0; i < array_length(global.party_order); i++)
    {
        var _character = global.party_order[i];
        var _member = scr_get_member_data(_character);

        if (!is_undefined(_member))
        {
            var _hp = ini_read_real(
                "Party",
                _character + "_hp",
                variable_global_get(_member.hpVar)
            );

            var _max_hp = ini_read_real(
                "Party",
                _character + "_maxhp",
                variable_global_get(_member.maxHpVar)
            );

            variable_global_set(_member.hpVar, _hp);
            variable_global_set(_member.maxHpVar, _max_hp);
        }
    }

    ini_close();

    // Update total HP.
    global.total_hp = 0;

    for (var i = 0; i < array_length(global.party_order); i++)
    {
        var _member = scr_get_member_data(global.party_order[i]);

        if (!is_undefined(_member))
        {
            global.total_hp += variable_global_get(_member.hpVar);
        }
    }

    // Return the room for the transition.
    return _room;
}