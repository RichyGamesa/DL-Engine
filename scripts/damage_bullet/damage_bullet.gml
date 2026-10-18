function damage_bullet(argument0){
var damage = argument0

var k = random(8);
show_debug_message(k)
var s = random(8);
show_debug_message(s)
var r = random(8);
show_debug_message(r)
var t = random(8);
show_debug_message(t)
down = 0;

if global.num_active_members > 1 {
if down != (global.num_active_members - 1) {
if global.hp_K <= damage {k = 0; r = 2; s = 2}
if global.hp_S <= damage {s = 0}
if global.hp_R <= damage {r = 0}
if global.hp_T <= damage {t = 0}
}
else
{room_goto(rm_death)}
}

if global.num_active_members <= 1 
{
global.hp_K -= damage;	
draw_text(obj_mainchara.x,obj_mainchara.y,damage)
}
else
{
if global.member[0] == true 
{
	if k < 4 {global.hp_K -= damage}
	if global.hp_K <= damage {down +=1}
	draw_text(obj_mainchara.x,obj_mainchara.y,damage)

}
if global.member[1] == true
{
	if s < 4 {global.hp_S -= damage}
	if global.hp_S <= damage {down += 1}
	draw_text(obj_follower_suzy.x,obj_follower_suzy.y,damage)
}
if global.member[2] == true
{
	if r < 4 {global.hp_R -= damage}
	if global.hp_R <= damage {down += 1}
	draw_text(obj_follower_ralsei.x,obj_follower_ralsei.y,damage)
}
if global.member[3] == true
{
	if t < 4 {global.hp_T -= damage}
	if global.hp_T <= damage {down += 1}
	draw_text(obj_follower_Toriel_dark.x,obj_follower_Toriel_dark.y,damage)
}
}
}


