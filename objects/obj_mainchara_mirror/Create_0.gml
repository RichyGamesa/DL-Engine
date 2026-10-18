x = obj_mainchara.x
y = 89;
can_move = true
xspd = 0;
yspd = 0;
//in which axis (Y and x) you and how far
can_move = true 
//if the character can move
move_spd = 1;
//how fast you move

walk_spd = 1.2;
run_spd = 2.4;




dialogue = false;
flag[3] = false;



array_size = 94; //how many position to record

for(var i = array_size-1; i >= 0; i--){
	
        pos_x[i] = x;
		pos_y[i] = y;

}

darkworld = false;