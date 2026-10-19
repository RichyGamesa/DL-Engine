
needed_sprite = KrisU

var _found = false;

with (obj_follower)
{
    if (character == "Toriel")
        _found = true;
}

if (!_found)
{
    text[0] = "* KRIS STOP LOOKING AT THE KITCHEN!";
	speaker_sprite[0] = spr_face_s_angy;
	txtb_sounds = snd_txtsus;
}
else
{
text[0] = "* It's our kitchen?";

txtb_sounds = snd_txttor;	
}