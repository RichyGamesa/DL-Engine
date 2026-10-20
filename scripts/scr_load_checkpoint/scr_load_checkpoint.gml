function scr_load_checkpoint()
{
    if (!file_exists("checkpoint"))
        return;

    ini_open("checkpoint");

    // Restore player position and movement.
    var _x = ini_read_real("Checkpoint", "x", 0);
    var _y = ini_read_real("Checkpoint", "y", 0);
    var _room = ini_read_real("Checkpoint", "room", room);
    var _can_move = ini_read_real("Checkpoint", "move", true);

    // Restore party order.
    var _party_count = ini_read_real("Checkpoint", "party_count", 1);

    global.party_order = [];

    for (var i = 0; i < _party_count; i++)
    {
        var _character = ini_read_string("Party", "member_" + string(i), "");

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

    // Restore the room before positioning the player.
    if (room != _room)
    {
        room_goto(_room);
    }

    // Apply position and movement state.
    if (instance_exists(obj_mainchara))
    {
        obj_mainchara.x = _x;
        obj_mainchara.y = _y;
        obj_mainchara.can_move = _can_move;
    }

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
}