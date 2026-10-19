
function scr_dark_transform_position(_actor, _main_character)
{
    // Build the active party order, with the main character first.
    var _party = [_main_character];

    for (var i = 0; i < array_length(global.party_order); i++)
    {
        var _party_member = global.party_order[i];
        var _found = false;

        for (var j = 0; j < array_length(_party); j++)
        {
            if (_party[j] == _party_member)
            {
                _found = true;
                break;
            }
        }

        if (!_found)
        {
            array_push(_party, _party_member);
        }
    }

    // Find this character's formation slot.
    var _index = 0;

    for (var i = 0; i < array_length(_party); i++)
    {
        if (_party[i] == _actor.character)
        {
            _index = i;
            break;
        }
    }

    var _total = array_length(_party);
    var _offset_x = 0;
    var _offset_y = 0;

    if (_total <= 1)
    {
        // One character: centered.
        _offset_x = 0;
        _offset_y = 0;
    }
    else if (_total == 2)
    {
        // Two characters: left and right.
        _offset_x = (_index == 0) ? -24 : 24;
    }
    else if (_total == 3)
    {
        // Three characters: left, right, top.
        switch (_index)
        {
            case 0: _offset_x = -28; break;
            case 1: _offset_x =  28; break;
            case 2: _offset_y = -26; break;
        }
    }
    else if (_total == 4)
    {
        // Four characters: left, right, top, bottom.
        switch (_index)
        {
            case 0: _offset_x = -30; break;
            case 1: _offset_x =  30; break;
            case 2: _offset_y = -28; break;
            case 3: _offset_y =  28; break;
        }
    }
    else
    {
        // Five or more characters.
        switch (_index)
        {
            case 0: _offset_x = -30; break;
            case 1: _offset_x =  30; break;
            case 2: _offset_y = -28; break;
            case 3: _offset_y =  28; break;

            default:
                var _angle = (_index - 4) * (360 / max(1, _total - 4));
                _offset_x = lengthdir_x(38, _angle);
                _offset_y = lengthdir_y(38, _angle);
            break;
        }
    }

    return {
        x: _offset_x,
        y: _offset_y
    };
}
