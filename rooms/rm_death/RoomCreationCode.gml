obj_mainchara.x = 6666;
obj_mainchara.y = 6666;
audio_stop_all();

if instance_exists(obj_kris_target) {instance_destroy(obj_kris_target)}
if instance_exists(obj_follower_Toriel_dark) { instance_destroy(obj_follower_Toriel_dark)}
if instance_exists(obj_follower_ralsei) { instance_destroy(obj_follower_ralsei)}
if instance_exists(obj_follower_suzy) { instance_destroy(obj_follower_suzy)}