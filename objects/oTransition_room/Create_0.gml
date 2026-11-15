//oTransition_room create event
target_x = 0;    //x that the mainchara will be at
target_y = 0;	 //y that the mainchara will be at
target_room = 0; //room to reach

sound = snd_nosound;//sound to play when transitioning

mainchara = obj_mainchara; //the mainchara

can_move_after = true; //Can move after teleporting

if instance_exists(mainchara)
{
    mainchara_image = mainchara.sprite_index; //make the mainchara have the sprite we want
}

colorfade = c_black;     //control the colour of the transition


transition_number = 0.04; //control the speed of the transition

transition_state = 0;    //State of the transition
room_change_started = false; //if it read the change of room

image_alpha = 0;    //how visible is it? 0: invisible, 1 visible, in between

wait_sound = false; //if you have to wait for the sound to stop playing before the transition fades
does_fade = true  //if goes back to being transparent before being destroyed

sound_instance = -1;

transparent = false;