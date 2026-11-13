//oTransition_room create event
target_x = 0;    //x that the mainchara will be at
target_y = 0;	 //y that the mainchara will be at
target_room = 0; //room to reach

sound = snd_nosound;//sound to play when transitioning

mainchara = obj_mainchara; //the mainchara

if instance_exists(mainchara)
{
    mainchara_image = mainchara.sprite_index; //make the mainchara have the sprite we want
}

colorfade = c_black;     //control the colour of the transition

destroy_when_visible = true; //if it's destroyed when it fully covered the screen

transition_number = 0.04; //control the speed of the transition

transition_state = 0;    //State of the transition
room_change_started = false; //if it read the change of room

image_alpha = 0;    //how visible is it? 0: invisible, 1 visible, in between