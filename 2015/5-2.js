var _ = require('underscore');
var fs = require('fs');
var S = require('string');

var data = fs.readFileSync("5-1-input.txt", "utf8");

data = data.trim();

var array = data.split("\n");

var count = 0;

function double_pair(string) {
  var string_size = string.length;
  for(var i = 0; i < string_size - 1; i++) {
    if(i === string_size -2) return false;
    var target = string[i] + string[i+1];
    for(var j = i+2; j < string_size - 1; j++) {
      var potential_match = string[j] + string[j+1];
      if(target === potential_match) return true;
    }
  }
}

function one_off(string) {
  var string_size = string.length;
  for(var i = 0; i < string_size - 2; i++) {
    if(string[i] === string[i+2]) return true;
  }
  return false;
}

array.forEach(function(string){
  console.log(typeof(string));
  if(double_pair(string) && one_off(string)){
    count = count + 1;
  }
});

console.log(count);
