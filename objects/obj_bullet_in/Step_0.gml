if place_meeting(x,y,obj_mainchara){
	if instance_exists(obj_kris_target) == false
{
global.bulletzone = true;
instance_create_depth(obj_mainchara.x,obj_mainchara.y,obj_mainchara.depth - 1,obj_kris_target);
instance_destroy()
}

}



