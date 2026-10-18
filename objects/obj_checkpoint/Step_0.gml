//step event
if place_meeting(x,y,obj_mainchara) and interacted == false
{

   //if file_exists("Checkpoint") {file_delete("Checkpoint")}
   //game_save("Checkpoint")
	scr_save_checkpoint()
	interacted = true

}


if interacted == true
{
  instance_destroy()	
}


