if instance_exists(mainchara)
if place_meeting(x,y,mainchara){
	if instance_exists(obj_kris_target) == false
{
global.bulletzone = true;
instance_create_depth(mainchara.x,mainchara.y,mainchara.depth - 1,obj_kris_target);

if destroy_after
instance_destroy()
}

}



