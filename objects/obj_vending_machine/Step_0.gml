if place_meeting(x,y,obj_mainchara) and obj_mainchara.can_move 
{
	if keyboard_check_pressed(global.confirm) or keyboard_check(vk_enter)
    {
	keyboard_clear(vk_enter)
	keyboard_clear(global.confirm)
if !instance_exists(oTextbox_dark) and !interacted
{
instance_create_depth(0,0,-300,oTextbox_dark)
interacted = true;
}

if instance_exists(oTextbox_dark)
oTextbox_dark.text[0] = "Do you want to buy something?";
draw_square = true
    }
}
if place_meeting(x,y,obj_mainchara) 
{
if global.gold <= 0 
{
if instance_exists(oTextbox_dark)
{
oTextbox_dark.text[1] = "You have no money";
interacted = false;
draw_square = false;
}
}
else
if !instance_exists(oTextbox_dark) and interacted 
if !instance_exists(obj_choice_dark)
{
var	longness = count_non_empty_elements(global.items_dark)
if longness >= 12
{
longness = count_non_empty_elements(global.items_dark_save)
if longness >= 45
buyable = false;
}
    if buyable 
    {
	var choice = instance_create_depth(x,y,depth,obj_choice_dark)
	choice.choice_1 = "YES"
	choice.choice_2 = "NO"
	choice.choice_number = 2;
	interacted = false;
	}
	else
	{
	if !instance_exists(oTextbox_dark)
	instance_create_depth(x,y,depth,oTextbox_dark)
	oTextbox_dark.text[0] = "* You have no space left."
	interacted = false;
	buyable = true;
	}
}

//show_debug_message("Global selected = " + string(global.selected_choice) + ", Interacted = " + string(interacted) + ", Buyable = " + string(buyable));

      if global.selected_choice == 1
	  {
	  if !instance_exists(oTextbox_dark) 
      {
          instance_create_depth(0,0,-300,oTextbox_dark)
		  oTextbox_dark.text[0] = "* You got the " + string(item) + "."
		  global.gold -= cost
		  var longness = array_length(global.items_dark)

if longness < 12
{
	array_insert(global.items_dark,longness,item)
	 oTextbox_dark.text[1] = "* You put the " + string(item) + " in your ITEMs."
	 global.selected_choice = 0;
	 draw_square = false;
}
else
{
longness = array_length(global.items_dark_save)
if longness < 48
{
array_insert(global.items_dark_save,longness,item)	
oTextbox_dark.text[1] = "* The " + string(item) + " were put in your SAVE ITEMs."
global.selected_choice = 0;
 draw_square = false;
}
}
	  }
	  }
	  if global.selected_choice == 2
	  {
		obj_mainchara.can_move = true;
		 draw_square = false;
	  }
}



