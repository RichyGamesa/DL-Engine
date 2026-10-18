
function Scr_cellphone(argument0){

if argument0 = "Call home"
{
	if instance_exists(oTextbox_light) == false {instance_create_depth(0,0,-99999,oTextbox_light)}
			        oTextbox_light.skippable = true;
					oTextbox_light.txtb_sounds = snd_txttor
					oTextbox_light.speaker_sprite[0] = spr_face_t_normal;
					oTextbox_light.speaker_sprite[1] = spr_face_t_normal;
				
				
			    
				oTextbox_light.text[0] = "* Hi honey, hope you are having fun"
				oTextbox_light.text[1] = "* See you soon"
				
				
				

	
	
}
if argument0 = "Mike"
{
	if instance_exists(oTextbox_light) == false {instance_create_depth(0,0,-99999,oTextbox_light)}
	audio_play_sound(snd_smile,2,false)
	oTextbox_light.text[0] = "* You dial a number on your phone";
	oTextbox_light.text[1] = "* Nothing but garbage noise";
	oTextbox_light.audio_stop = snd_smile; //this can be used with any textbox just make it play the sound and tell the sound name
	//It makes it so that if you press Z or C or anything it won't proceed until the sound ended.
}
if argument0 = "sans's number"
{
	if instance_exists(oTextbox_light) == false {instance_create_depth(0,0,-99999,oTextbox_light)}
					if room != rm_kris_home
					{
					oTextbox_light.txtb_sounds = snd_txtsans
					oTextbox_light.speaker_sprite[0] = spr_face_sans_normal;
					oTextbox_light.speaker_sprite[1] = spr_face_sans_normal;
				
				
			    
				oTextbox_light.text[0] = "* heya kiddo,i'm busy right now"
				oTextbox_light.text[1] = "* hear ya later"
					}
					else
					{
					oTextbox_light.txtb_sounds = snd_txtsans
					oTextbox_light.speaker_sprite[0] = spr_face_sans_normal;
					oTextbox_light.speaker_sprite[1] = spr_face_sans_serious;
				
				
			    
				oTextbox_light.text[0] = "* Hey kiddo come outside"
				oTextbox_light.text[1] = "* i have to tell you something"
				global.flag[3] = true;
					}
				
				
				//this will be our example of the phone cal...but we can also do something else
				

	
	
}















}