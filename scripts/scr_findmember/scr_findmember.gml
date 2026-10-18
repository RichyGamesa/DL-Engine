
function scr_findmember(argument0){

var name = argument0

//Make sure the variables are reset because otherwise when you select a member after another they are both true
equipping_kris = false;   
equipping_susie = false;
equipping_ralsei = false;
equipping_toriel = false;

switch (name)
{
case "Kris":
equipping_kris = true;

break

case "Susie":
equipping_susie = true;
break

case "Ralsei":
equipping_ralsei = true;
break

case "Toriel":
equipping_toriel = true;
break

}
}