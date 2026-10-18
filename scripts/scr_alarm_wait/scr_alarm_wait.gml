function scr_alarm_wait()
{



if room == rm_town_beach
{
if global.sideb == false
{
if !instance_exists(obj_chest_empty)
instance_create_depth(obj_mainchara.x - 20,obj_mainchara.y,-1,obj_chest_empty)
global.flag[flag_index] = true;	
}
}

}