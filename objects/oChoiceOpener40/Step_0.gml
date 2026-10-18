if place_meeting(x,y,obj_mainchara) and obj_mainchara.can_move && (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm)){
   var _instantiated = instance_create_depth(0,0,-9998,oChoice_light);
   _instantiated.text = text;
  _instantiated.choices = choices;
  _instantiated.txtb_sound = txtb_sound;
}