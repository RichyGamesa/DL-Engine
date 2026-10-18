if place_meeting(x,y, obj_mainchara) and !instance_exists(oTransition_room)
{
	if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
{
	keyboard_clear(ord("Z"))
	keyboard_clear(vk_enter)
	var instantiated = instance_create_depth(0, 0, -9999, oTransition_room);
    instantiated.target_x = target_x;
	instantiated.target_y = target_y;
	instantiated.target_room = target_room;
	instantiated.sound = sound;
	global.last_x = obj_mainchara.x;
	global.last_y = obj_mainchara.y;
	global.last_depth = obj_mainchara.depth;
	global.last_room = room;
instance_create_depth(obj_mainchara.x,obj_mainchara.y,0,oWall)
audio_play_sound(sound,1,false)



}
}