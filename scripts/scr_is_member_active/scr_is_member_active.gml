/// @function scr_is_member_active(_name)
/// @param {String} _name Character ID to check.
/// @returns {Bool} Whether the character is in the party.

function scr_is_member_active(_name)
{
    return scr_array_find_index(global.party_order, _name) != -1;
}