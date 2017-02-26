var _ = require('underscore');
var fs = require('fs');

var data = fs.readFileSync("3-1-input.txt", "utf8");

data = data.trim();

var string_size = data.length;

var position = [0,0];

var locations = ["0,0"];

for(var i=0; i < string_size; i++) {
  var letter = data[i];

  if(letter == "^") {
    position[1] = position[1] + 1;
  } else if(letter == "v") {
    position[1] = position[1] - 1;
  } else if(letter == "<") {
    position[0] = position[0] - 1;
  } else if(letter == ">") {
    position[0] = position[0] + 1;
  } else {
    continue;
  }

  var position_string = position[0] + "," + position[1];

  locations.push(position_string);
}

var uniques = _.uniq(locations);

console.log(string_size);
console.log(locations.length);
console.log(uniques.length);
