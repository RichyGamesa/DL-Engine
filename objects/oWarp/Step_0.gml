if place_meeting(x,y, obj_mainchara) and !instance_exists(oTransition_room)
{
	var instantiated = instance_create_depth(0, 0, -9999, oTransition_room);
    instantiated.target_x = target_x;
	instantiated.target_y = target_y-16; //the -16 is just because i changed the origin from the feet to the head so it's temporary
	instantiated.target_room = target_room;
	instantiated.sound = sound;
	if instance_exists(mainchara)
	{
	instantiated.mainchara = mainchara
    instantiated.mainchara_image = mainchara_image
instance_create_depth(mainchara.x,mainchara.y,0,oWall)
	}
audio_play_sound(sound,1,false)



}