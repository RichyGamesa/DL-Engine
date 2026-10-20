function follower_remove(_character)
{
    var _count = instance_number(obj_follower);

    for (var i = _count - 1; i >= 0; i--)
    {
        var _follower = instance_find(obj_follower, i);

        if (instance_exists(_follower)
        && variable_instance_exists(_follower, "character")
        && _follower.character == _character)
        {
            with (_follower)
                instance_destroy();

            return true;
        }
    }

    return false;
}