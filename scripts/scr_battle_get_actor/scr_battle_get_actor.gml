
function scr_battle_get_actor(_member_name)
{
    var _actor_object = scr_battle_transition_actor(_member_name);

    if (_actor_object == noone)
        return noone;

    if (instance_number(_actor_object) <= 0)
        return noone;

    return instance_find(_actor_object, 0);
}
