// Check if the image index has changed
window_set_caption("Deltarune Chapter " + string(global.chapter))

if image_index = 1 or image_index = 3 or image_index = 5 or image_index = 7 or image_index = 9  or image_index = 11 or image_index = 13 or image_index = 15
{
	audio_play_sound(snd_noise,1,false);
	
}

if image_index > 16 and event = 0 
{

audio_play_sound(Mlaught,10,false);
event = 1

}
 if image_index > 25 {
  
  if instance_exists(oTransition_dark) != true {
	  instance_create_depth(0,0,-300,oTransition_dark);
  }
  
 }

if instance_exists(oTransition_dark) = true {
	  if oTransition_dark.image_index > 17
	  if file_exists("File_1") = false and file_exists("File_2") = false and file_exists("File_3") = false and file_exists("save.savFile_1") = false and file_exists("save.savFile_2") = false and file_exists("save.savFile_3") = false {
	
	room_goto(rm_naming);
	global.filechoiche = 1;
	
	}
	else 
	  {room_goto(Title)}
  } 
	
if keyboard_check(global.confirm) or keyboard_check(vk_enter){
	 if instance_exists(oTransition_room) != true {
	  instance_create_depth(0,0,-300,oTransition_dark);
	  audio_stop_all()
  }
	}
	
	
	
	