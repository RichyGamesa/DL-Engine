function scr_save_checkpoint()
{
    // Remove the previous checkpoint.
    if (file_exists("checkpoint"))
    {
        file_delete("checkpoint");
    }

    var _checkpoint_x = obj_mainchara.x;
    var _checkpoint_y = obj_mainchara.y;
    var _checkpoint_room = room;

    ini_open("checkpoint");

    // Player position and room.
    ini_write_real("Checkpoint", "x", _checkpoint_x);
    ini_write_real("Checkpoint", "y", _checkpoint_y);
    ini_write_real("Checkpoint", "room", _checkpoint_room);
    ini_write_real("Checkpoint", "move", obj_mainchara.can_move);

    // Active party.
    var _party_count = array_length(global.party_order);

    ini_write_real("Checkpoint", "party_count", _party_count);

    for (var i = 0; i < _party_count; i++)
    {
        var _character = global.party_order[i];
        var _member = scr_get_member_data(_character);

        // Save the party order by name.
        ini_write_string("Party", "member_" + string(i), _character);

        // Save this member's HP.
        if (!is_undefined(_member))
        {
            ini_write_real(
                "Party",
                _character + "_hp",
                variable_global_get(_member.hpVar)
            );

            ini_write_real(
                "Party",
                _character + "_maxhp",
                variable_global_get(_member.maxHpVar)
            );
        }
    }

    // Close the checkpoint file.
    ini_close();
}