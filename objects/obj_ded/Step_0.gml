//obj_ded step event
mainchara.can_move = false;
global.cutscene = true;
if ded == false
{
	global.dead += 1
    ded = true
}

audio_stop_all()
if !instance_exists(obj_soul_break) 
instance_create_depth(320,540,-99,obj_soul_break)	

instance_destroy()
