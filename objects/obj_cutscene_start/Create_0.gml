x = 0;
y = 0;
event = 1;

if audio_is_playing(Deltarune_Intro_noise)
audio_stop_sound(Deltarune_Intro_noise)

if instance_exists(obj_mainchara)
{
obj_mainchara.x = -999999999999  //just make the mainchara be off screen	
}