// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function goto(x,y,go_x,go_y){
while x != go_x
{
	if x< go_x {x=x+move_spd}
	else if x> go_x {x=x-move_spd}
}
while y != go_y 
{
    if y< go_y {y=y+move_spd}
    else if x> go_y {y=y-move_spd}		
}
return 0;
}