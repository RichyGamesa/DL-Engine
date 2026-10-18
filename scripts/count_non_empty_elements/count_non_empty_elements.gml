// Function to count non-empty elements
function count_non_empty_elements(argument0) 
{
    var arr = argument0;
	var count = 0;
    var len = array_length(arr);
    for (var i = 0; i < len; i++) {
        if (arr[i] != "" && arr[i] != " ") {
            count++;
        }
    }
    return count;
}