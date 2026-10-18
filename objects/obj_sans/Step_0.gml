//obj_sans step event

if place_meeting(x,y,obj_mainchara) and obj_mainchara.can_move and !instance_exists(oTextbox_light)
{
if keyboard_check(global.confirm) or keyboard_check(vk_enter)
{
keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
{
if !instance_exists(tx)
{
tx = instance_create_depth(x,y,-100,oTextbox_light)	
}
if global.flag[3] == false
{
tx.text[0] = "*heya kiddo."
tx.text[1] = "*here is my number....call me..."
tx.speaker_sprite[0] = spr_face_sans_normal;
tx.speaker_sprite[1] = spr_face_sans_wink;
tx.more_sounds = true //this if there are more than one sound of people speaking
tx.txtb_sound[0] = snd_txtsans;
tx.txtb_sound[1] = snd_txtsans;
if !array_contains(global.numbers,"sans's number")
{
var lenght = array_length(global.numbers)
array_insert(global.numbers,lenght,"sans's number")
tx.text[2] = "*You got {CY}sans's number{CW}." // this is how the colored text works, you put {} and inside the color, i added white,red,yellow,blue,green,purple,magenta,brown and grey. everytime you have to put C and then the first letter
tx.txtb_sound[2] = snd_text;
tx.speaker_sprite[2] = noone;
}
else
{
tx.text[2] = "*looks like you already have it."
tx.text[3] = "*call me"
tx.txtb_sound[2] = snd_txtsans;
tx.txtb_sound[3] = snd_txtsans;
tx.speaker_sprite[2] = spr_face_sans_normal;
tx.speaker_sprite[3] = spr_face_sans_serious;
}

}
else
{
tx.txtb_sounds = snd_txtsans
tx.text[0] = "*heya kiddo."
tx.text[1] = "*i told you to came here?"
tx.text[2] = "*nah, i'm busy, are you sure it was me?"
tx.speaker_sprite[0] = spr_face_sans_normal;
tx.speaker_sprite[1] = spr_face_sans_left;
tx.speaker_sprite[2] = spr_face_sans_wink;
}
}
}
}

//depth
depth = -y;
