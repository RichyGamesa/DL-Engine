global.cutscene = true


var ox = camera_get_view_x(view_camera[0])
var oy = camera_get_view_y(view_camera[0])

if instance_exists(obj_BLACK) != true and event = 1
{
	instance_create_depth(0,0, -7, obj_BLACK)
}

if instance_exists(oTextbox_none_2) != true and event = 1 {
instance_create_depth(18,28,-8, oTextbox_none_2)
oTextbox_none_2.txtb_sound = snd_txtecho
oTextbox_none_2.text[0] = "KRIS!"
oTextbox_none_2.text[1] = "WAKE UP KRIS!!"
oTextbox_none_2.text[2] = "KRIS!"
event = 2
}

if event = 2 and instance_exists(oTextbox_none_2) != true {
 event = 3	
}

if event = 3 {
if instance_exists(oTransition_room_white_exit) != true {
	
     instance_create_depth(0,0,-9999,oTransition_room_white_exit) 
	 if oTransition_room_white_exit.image_index = 14 {
	 room_goto(rm_kris_home)
	 }
  }
}

if instance_exists(oTransition_room_white_exit) = true {
	 if oTransition_room_white_exit.image_index = 14 {
	 oTransition_room_white_exit.target_x = 999999999	 
	 oTransition_room_white_exit.target_room = rm_kris_home
	 }
}








//this is for a random FUN
global.FUN = random_range(1,60)
