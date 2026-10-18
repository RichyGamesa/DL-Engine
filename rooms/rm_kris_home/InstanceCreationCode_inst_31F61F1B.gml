if !instance_exists(obj_follower_Toriel_dark) 
{
text[0] = "* KRIS STOP LOOKING AT THE KITCHEN!";
speaker_sprite[0] = spr_face_s_angy;
txtb_sounds = snd_txtsus;
}
else if instance_exists(obj_follower_Toriel_dark) = true
{
text[0] = "* It's our kitchen?";

txtb_sounds = snd_txttor;
}

needed_sprite = KrisU