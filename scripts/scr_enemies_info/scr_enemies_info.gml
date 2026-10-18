function scr_enemies_info(argument0)
{

var name = argument0;

switch (argument0)

{

case "Ruddin":
        global.monstername[myself] = "Ruddin"
        global.monstermaxhp[myself] = 120
        global.monsterhp[myself] = 120
        global.monsterat[myself] = 5
        global.monsterdf[myself] = 0
        global.monsterexp[myself] = 0
        global.monstergold[myself] = 30
        global.sparepoint[myself] = 10
        global.mercymod[myself] = 0
        global.mercymax[myself] = 100
        global.canact[myself][0] = true
        global.actname[myself][0] = "Check"
        global.canact[myself][1] = true
        global.actname[myself][1] = "Compliment";
        global.canact[myself][2] = true
        global.actname[myself][2] = "Lecture";
        global.battlemsg[0] = "*  Ruddin shines in the dim light.";
		break

}

}