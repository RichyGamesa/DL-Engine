//obj_slide step event

// --------------------------------------------------
// MAIN CHARACTER
// --------------------------------------------------

if (instance_exists(obj_mainchara))
{
    var player = instance_find(obj_mainchara, 0);

    if (place_meeting(x, y, player))
    {
        if (!player.sliding)
        {
            if (!audio_is_playing(snd_paper_rumble))
            {
                audio_play_sound(snd_paper_rumble, 2, false);
            }
        }

        // Activate sliding.
        player.sliding = true;

        // Dust effect.
        if (player.sliding && timer <= 0)
        {
            var dust = instance_create_depth(
                player.x,
                player.y + 30,
                player.depth + 1,
                Obj_dust
            );

            dust.vspeed = -6;
            dust.hspeed = random_range(-1, 1);
            dust.image_speed = 1.3;

            timer = 4;
        }
    }
}

if (timer > 0)
{
    timer--;
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