function scr_battle_transition_actor(_member_name)
{
    switch (_member_name)
    {
		case "Kris": return obj_fake_kris
        case "Susie": return obj_suzy;
        case "Ralsei": return obj_ralsei;

        // Add new character mappings here.
        // Example:
        // case "Toriel": return obj_toriel;
    }

    return noone;
}