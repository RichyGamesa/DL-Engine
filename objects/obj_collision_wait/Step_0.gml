//obj_collision_wait step event

if place_meeting(x,y,obj_mainchara)
{

if triggered == false and alarm_activated == false and global.flag[flag_index] == false
{	
	alarm[0] = timer;
	alarm_activated = true;
}
	
}
else
{
if global.flag[flag_index] == false
{
alarm_activated = false;
alarm[0] = timer;
}
}

show_debug_message("Alarm = " + string(alarm[0]))


	
	