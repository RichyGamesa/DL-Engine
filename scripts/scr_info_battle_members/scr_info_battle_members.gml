
function scr_info_battle_members(argument0, argument1, argument2)
{
    var _member_count = min(array_length(global.party_order), 2);

    for (var i = 0; i < _member_count; i++)
    {
        var _member_name = global.party_order[i];
        var _data = scr_get_member_data(_member_name);

        if (is_undefined(_data))
            continue;

        var _actor = scr_battle_get_actor(_member_name);

        // Assign the actor.
        switch (i)
        {
            case 0: member_0 = _actor; break;
            case 1: member_1 = _actor; break;
        }

        // Read HP and maximum HP.
        var _hp = variable_global_get(_data.hpVar);
        var _max_hp = variable_global_get(_data.maxHpVar);

        // Build the variable names for this member's HUD bar.
        var _bar_prefix = "bar_" + string(i + 1);

        // Select the correct bar and hurt-face sprite.
        var _bar_sprite;
        var _hurt_face;

        switch (_member_name)
        {
            case "Kris":
                _bar_sprite = spr_battle_bar_Kris;
                _hurt_face = _data.faceSprite;
                break;

            case "Susie":
                _bar_sprite = spr_battle_bar_Susie;
                _hurt_face = spr_susieb_face_hurt;
                break;

            default:
                continue;
        }

        // Configure the HUD bar.
        variable_instance_set(id, _bar_prefix, _bar_sprite);
        variable_instance_set(id, _bar_prefix + "_hp", _hp);
        variable_instance_set(id, _bar_prefix + "_max_hp", _max_hp);
        variable_instance_set(id, _bar_prefix + "_face", _data.faceSprite);
        variable_instance_set(id, _bar_prefix + "_face_hurt", _hurt_face);
        variable_instance_set(id, _bar_prefix + "_color", _data.hpBarColor);
    }
}
