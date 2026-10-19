
/// Scr_healtarget(_member_name, _amount, _can_revive)
/// Returns the amount of HP actually changed.

function Scr_healtarget(_member_name, _amount, _can_revive)
{
    var _member = scr_get_member_data(_member_name);

    if (is_undefined(_member))
        return 0;

    var _hp_var = _member.hpVar;
    var _max_hp_var = _member.maxHpVar;

    var _current_hp = variable_global_get(_hp_var);
    var _max_hp = variable_global_get(_max_hp_var);

    // Ordinary healing cannot revive a fallen character.
    if (_current_hp <= 0 && !_can_revive)
        return 0;

    var _new_hp = clamp(_current_hp + _amount, 0, _max_hp);
    variable_global_set(_hp_var, _new_hp);

    return _new_hp - _current_hp;
}
