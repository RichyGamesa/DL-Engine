obj_mainchara.x = 6666;
obj_mainchara.y = 6666;
audio_stop_all();

if instance_exists(obj_kris_target) {instance_destroy(obj_kris_target)}
if instance_exists(obj_follower) 
{   
	for (var i = 0; i<=instance_number(obj_follower);i++)
	instance_destroy(obj_follower)
}
