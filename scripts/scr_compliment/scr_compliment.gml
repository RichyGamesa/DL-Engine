/// @desc Compliment Act
/// @param enemy

function scr_compliment(argument0)
{
var enemy = argument0;

if (enemy == "Ruddin") {
    global.mercymod[myself] += 10; // Increase mercy points
    return "*  You complimented Ruddin. It seems flattered!";
}
// Add other enemies here as needed
return "*  Nothing happens.";
}
