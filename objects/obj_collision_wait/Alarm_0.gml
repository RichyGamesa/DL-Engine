//obj_collision_wait alarm[0]

triggered = true;
if instance_exists(obj_menu_dark)
{
instance_destroy(obj_menu_dark)	
}
if instance_exists(obj_Light_menu)
{
instance_destroy(obj_Light_menu)	
}
if instance_exists(obj_soul)
{
instance_destroy(obj_soul)	
}
if instance_exists(obj_heart)
instance_destroy(obj_heart)

scr_alarm_wait()
