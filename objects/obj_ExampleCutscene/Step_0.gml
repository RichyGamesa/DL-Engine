obj_mainchara.can_move = false;
obj_mainchara.image_speed = 0;
global.cutscene = true
if event == 1 {
	
   instance_create_depth(0,0,-9998,oTextbox_light)
oTextbox_light.text[0] = "wait"
oTextbox_light.speaker_sprite[0] = spr_face_s_what;
event = 2
}
if instance_exists(obj_suzy){
if obj_suzy.x = obj_mainchara.x - 2
		{instance_destroy(obj_suzy)
		instance_create_depth(394, obj_mainchara.y,2,obj_follower_suzy)}
}

	if event == 2 {
		oTextbox_light.txtb_sounds = snd_txtsus;
		if flug != true {instance_create_depth(obj_mainchara.x - 70 ,obj_mainchara.y,2,obj_suzy);}
        flug = true;

		event = 3
	}

if instance_exists(obj_suzy){
if obj_suzy.x = obj_mainchara.x - 2
		{instance_destroy(obj_suzy)
		instance_create_depth(394, obj_mainchara.y,2,obj_follower_suzy)}
}
	if event = 3 {
		oTextbox_light.text[1] = "Kris,i'll come with you";
		oTextbox_light.speaker_sprite[1] = spr_face_s_happy;
		alarm[1] = 1;
	}
	if instance_exists(obj_suzy){
if obj_suzy.x = obj_mainchara.x - 2
		{instance_destroy(obj_suzy)
		instance_create_depth(394, obj_mainchara.y,2,obj_follower_suzy)}
}
	if event = 4{
	
	obj_mainchara.can_move = true;
obj_mainchara.image_speed = 1;
obj_mainchara.flag[3] = true;
alarm[2] = 2;
}
if event = 5 {
	
instance_create_depth(obj_suzy.x,obj_suzy.y, 2, obj_follower_suzy);
instance_destroy(obj_suzy);
obj_follower_suzy.sprite_index = spr_suzyR
obj_follower_suzy.record = 19;
instance_destroy(oCutscene_trigger);
global.flag[1] = true;
global.cutscene = false;
instance_destroy()
	}

if instance_exists(obj_suzy){
if obj_suzy.x = obj_mainchara.x - 2
		{instance_destroy(obj_suzy)
		instance_create_depth(394, obj_mainchara.y,2,obj_follower_suzy)}
}


