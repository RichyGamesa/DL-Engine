
function follower_exists(_character)
{
    var _count = instance_number(obj_follower);

    for (var i = 0; i < _count; i++)
    {
        var _follower = instance_find(obj_follower, i);

        if (instance_exists(_follower)
        && variable_instance_exists(_follower, "character")
        && _follower.character == _character)
        {
            return true;
        }
    }

    return false;
}
