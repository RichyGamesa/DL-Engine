if image_index = 0 and keyboard_check(vk_enter) or keyboard_check(ord("Z"))
{
   image_index = 1
   keyboard_clear(vk_enter)
   keyboard_clear(ord("Z"))
} else if image_index = 1 and keyboard_check(vk_enter) or keyboard_check(ord("Z")){
   image_index = 2
   keyboard_clear(vk_enter)
   keyboard_clear(ord("Z"))
}  else if image_index = 2 and keyboard_check(global.down){
     image_index = 3	
	 keyboard_clear(global.down)
} else if image_index = 3 and keyboard_check(global.up){
	image_index = 2
} else if image_index = 3 and keyboard_check(global.down){
	image_index = 4
	keyboard_clear(global.down)
} else if image_index = 4 and keyboard_check(global.up){
	image_index = 3
	keyboard_clear(global.up)
}
       if image_index = 2 and keyboard_check(vk_enter) or keyboard_check(ord("Z")){
       keyboard_clear(vk_enter);
	   keyboard_clear(ord("Z"));
	   image_index = 5;
	   Save_before = 2;
	   global.filechoiche = 1;
}
       if image_index = 3 and keyboard_check(vk_enter) or keyboard_check(ord("Z")){
       keyboard_clear(vk_enter);
	   keyboard_clear(ord("Z"));
	   image_index = 5;
	   Save_before = 3;
	   global.filechoiche = 2;
}
       if image_index = 4 and keyboard_check(vk_enter) or keyboard_check(ord("Z")){
       keyboard_clear(vk_enter);
	   keyboard_clear(ord("Z"));
	   image_index = 5;
	   Save_before = 4;
	   global.filechoiche = 3;
}
       if image_index = 5 and keyboard_check(global.right){
		   keyboard_clear(global.right);
		   image_index = 6;
	   }
	   if image_index = 6 and keyboard_check(global.left){
	image_index = 5
} else if image_index = 6 and keyboard_check(vk_enter) or keyboard_check(ord("Z")){
	image_index = 7
	keyboard_clear(vk_enter)
	keyboard_clear(ord("Z"))
} else if image_index = 7 and keyboard_check(vk_shift) or keyboard_check(global.cancel){
   image_index = 6
   keyboard_clear(vk_shift)
   keyboard_clear(ord("X"))
} else if image_index = 7 and keyboard_check(vk_enter) or keyboard_check(ord("Z")){
	file_delete("save.sav")
	file_delete("File_"+global.filechoiche)
		room_goto(startRoom)
	var instantiated = instance_create_layer(startX,startY,"Player",obj_mainchara);
		keyboard_clear(vk_enter)
		keyboard_clear(ord("Z"))

	}

if image_index = 2
{global.filechoiche = "File_1"}
if image_index = 3
{global.filechoiche = "File_2"}
if image_index = 4
{global.filechoiche = "File_3"}

if image_index = 5 or image_index = 6 and keyboard_check(vk_shift) or keyboard_check(global.cancel)
{
	keyboard_clear(vk_shift);
	keyboard_clear(ord("X"));
	image_index = Save_before}

