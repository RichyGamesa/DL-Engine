// --------------------------------------------------
// MAIN CHARACTER
// --------------------------------------------------

if (instance_exists(obj_mainchara))
{
    var _player = instance_find(obj_mainchara, 0);

    if (place_meeting(x, y, _player))
    {
        if (!_player.sliding)
        {
            if (!audio_is_playing(snd_paper_rumble))
            {
                audio_play_sound(snd_paper_rumble, 2, false);
            }
        }

        _player.sliding = true;

        instance_create_depth(
            _player.x,
            _player.y + 30,
            _player.depth + 1,
            Obj_dust
        );

        with (Obj_dust)
        {
            vspeed = -6;
            hspeed = random_range(-1, 1);
            image_speed = 1.3;
        }
    }
    else
    {
        _player.sliding = false;
    }
}


// --------------------------------------------------
// FOLLOWERS
// --------------------------------------------------

var _count = instance_number(obj_follower);

for (var i = 0; i < _count; i++)
{
    var _follower = instance_find(obj_follower, i);

    if (place_meeting(x, y, _follower))
    {
        _follower.sliding = true;

        instance_create_depth(
            _follower.x,
            _follower.y + 30,
            _follower.depth + 1,
            Obj_dust
        );

        with (Obj_dust)
        {
            vspeed = -6;
            hspeed = random_range(-1, 1);
            image_speed = 1.3;
        }
    }
    else
    {
        _follower.sliding = false;
    }
}