obj_mainchara.can_move = false;
global.in_cutscene = true;
if ded == false
{
	global.dead += 1
    ded = true
}

audio_stop_all()
if instance_exists(obj_soul_break) != true {
instance_create_depth(304,304,-99,obj_soul_break)	
}
instance_destroy()
