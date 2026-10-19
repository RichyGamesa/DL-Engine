function follower_exists(_character)
{
    for (var i = 0; i < instance_number(obj_follower); i++)
    {
        var _follower = instance_find(obj_follower, i);

        if (_follower.character == _character)
            return true;
    }

    return false;
}