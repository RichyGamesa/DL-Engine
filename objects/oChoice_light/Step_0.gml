//Setup
if keyboard_check(global.left){
current_button = 1;	
}
if keyboard_check(global.right){
current_button = 2;	
}
if keyboard_check(global.up) and impossible3 != false{
current_button = 3;	
}
if keyboard_check(global.down)and impossible4 != false{
current_button = 4;	
}
	
	if choices != 4
	{
		if choices = 3 {text[3] = " "; impossible4 = true}
		if choices = 2 {text[3] = " "; text[2] = " ";impossible3 = true;impossible4 = true}
	}
	
	
if impossible3 = true {impossible4 = true}


