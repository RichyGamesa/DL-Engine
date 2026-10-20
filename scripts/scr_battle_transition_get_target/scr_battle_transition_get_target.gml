
function scr_battle_transition_get_target(_member_index, _transition)
{
    var _target_x = _transition.target_player_x;
    var _target_y = _transition.target_player_y;

    if (_member_index == 0)
    {
        return {
            x: _target_x,
            y: _target_y
        };
    }

    if (global.num_active_members == 2)
    {
        _target_y = _transition.t_y + 195;
    }
    else if (global.num_active_members >= 3)
    {
        _target_y = _transition.target_player_y
            + 40 + ((_member_index - 1) * 80);
    }

    return {
        x: _target_x,
        y: _target_y
    };
}
