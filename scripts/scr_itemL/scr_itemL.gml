function scr_itemL(argument0) 
{
	global.use_and_delete = false;
	if argument0 == " " 
	{
    global.Litem_description = " "; //the description of the item when you press INFO
    global.Litem_drop = " "; //The message when you click the DROP button
    global.Litem_usage = " "; //the message when you click the USE button
	global.droppable = false; //if the item is removed when you drop it.
	global.use_and_delete = false; //if the item is removed when used (it is off by default you have to write it)
	}

    if argument0 == "Ball of junk"
	{
    global.Litem_description = "BALL OF JUNK - A small orb of things accumulated on your journey.";
    global.Litem_drop = "You won't."; //the message that appears when you drop it
    global.Litem_usage = "You look at the junk ball in admiration."; //The message when you use it.
	
	global.droppable = false;//if you can drop the item, or it disappears when you use it.
    }
	
	if argument0 == "Cards"
	{
    global.Litem_description = "The jack of spades, and Rules card.";
    global.Litem_drop = "You won't throw them away.";
    global.Litem_usage = "You look at the cards.";
	global.droppable = false;
    }

    if argument0 == "Egg"
	{
    global.Litem_description = "Not too important, not too unimportant.";
    global.Litem_drop = "What egg?";
    global.Litem_usage = "You used the egg.";
	global.droppable = true; // in this case it can be dropped and it removed from the inventory.
    }
	
   
    if argument0 == "Glass"
	{
    global.Litem_description = "A shard of glass.";
    global.Litem_drop = "You feel it would be a very bad idea.";
    global.Litem_usage = "You look through the glass, you can't see anything.";
	global.droppable = false;
	}
	

    if argument0 == "CD"
	{
    global.Litem_description = "A CD of a clown show.";
    global.Litem_drop = "* You drop the CD";
    global.Litem_usage = "You threw the CD because you could";
	global.droppable = true; //i forgot to set it to true
	global.use_and_delete = true;
	}
}
