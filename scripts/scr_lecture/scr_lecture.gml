/// @desc Lecture Act
/// @param enemy

function scr_lecture(argument0)
{
var enemy = argument0;

if (enemy == "Ruddin") {
    global.mercymod[myself] += 15; // Increase mercy points more than compliment
    return "*  You lectured Ruddin. It listens intently.";
}
// Add other enemies here as needed
return "*  Nothing happens.";
}
