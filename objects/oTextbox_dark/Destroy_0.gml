//oTextbox_dark destroy event
global.dialogue = false;

if (can_move_after && instance_exists(mainchara))
{
    mainchara.can_move = true;
}