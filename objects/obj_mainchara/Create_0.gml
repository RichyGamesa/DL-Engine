//obj_mainchara create event

sprite_up     = KrisU;
sprite_right  = KrisR;
sprite_down   = KrisD;
sprite_left   = KrisL;
sprite_slide  = spr_kris_slide

sprite_up_dark    = KrisU_dark;
sprite_right_dark = KrisR_dark;
sprite_down_dark  = KrisD_dark;
sprite_left_dark  = KrisL_dark;
sprite_slide_dark = spr_kris_dark_slide;

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
autorun = false;


dialogue = false;
flag[3] = false;



array_size = 94; //how many position to record

for(var i = array_size-1; i >= 0; i--){
	
        pos_x[i] = x;
		pos_y[i] = y;

}



image_xscale = 1;
image_yscale = 1;
//depth = 0;


sliding = false;
/*
overlap = instance_create_depth(x,y,depth-1,obj_overlap_chara)
overlap.chara = self;
overlap.sprite_index = sprite_down_dark