target_x = 999999;
target_y = 999999;
target_room = 0;
sound = snd_nosound;
_random = random_range(0,20) //This is just for that Tree Egg room, just put a condition in creation code that contains this (if random = 20)
mainchara = obj_mainchara
lock_character = true; //stops the character from moving after touching the stuff
can_move_after = true; //Can move after teleporting
if instance_exists(mainchara)
mainchara_image = mainchara.sprite_index
//create variables

// target x e y sono i punti cardinali della stanza mentre target room è la stanza desiderata.







