instance_create_depth((other.x + 20), (other.y + 30),(other.depth + 1), Obj_dust)
        with(Obj_dust)
        {
            vspeed = -6
            hspeed = (-1 + random(2))
			image_speed = 1.3
        }
	if other.sliding = true	
	if !audio_is_playing(snd_paper_rumble)
	audio_play_sound(snd_paper_rumble,2,false)
	