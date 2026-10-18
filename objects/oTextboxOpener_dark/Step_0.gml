//oTextboxOpener_dark step Event
if place_meeting(x,y,obj_mainchara) and obj_mainchara.can_move && (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm)){
   var _instantiated = instance_create_depth(0,0,-9998,oTextbox_dark);
   _instantiated.text = text;
  _instantiated.speaker_sprite = speaker_sprite; //The sprite of who is talking
  _instantiated.txtb_sound = txtb_sound; //The sound of who is talking
  _instantiated.txtb_sounds = txtb_sounds
  _instantiated.audio_stop = audio_stop //Thr audio that stops the skippable of the textbox
  _instantiated.more_sounds = more_sounds  //If there are more than one person speaking
  global.dialogue = true;
}