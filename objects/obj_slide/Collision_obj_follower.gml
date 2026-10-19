
if (other.object_index == obj_follower)
{
    other.sliding = true;

    instance_create_depth(
        other.x + 20,
        other.y + 30,
        other.depth + 1,
        Obj_dust
    );

    with (Obj_dust)
    {
        vspeed = -6;
        hspeed = random_range(-1, 1);
        image_speed = 1.3;
    }

    if (!audio_is_playing(snd_paper_rumble))
    {
        audio_play_sound(snd_paper_rumble, 2, false);
    }
}
