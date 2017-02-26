var _ = require('underscore');
var fs = require('fs');

var data = fs.readFileSync("5-1-input.txt", "utf8");

data = data.trim();

var array = data.split("\n");

var count = 0;

function bad_string(string) {
  if(string.indexOf('ab') != -1){
    return true;
  }

  if(string.indexOf('cd') != -1){
    return true;
  }

  if(string.indexOf('pq') != -1){
    return true;
  }

  if(string.indexOf('xy') != -1){
    return true;
  }
  return false;
}

function repeated_letter(string) {
  var string_size = string.length;

  for(var i = 0; i < string_size; i++) {
    var letter = string[i];
    var substring = letter + letter;

    if(string.indexOf(substring) != -1){
      return true;
    }
  }
  return false;
}

function number_of_vowels(string) {
  var array = [];
  var vowels = 'aeiou';
  var string_size = string.length;

  for(var i = 0; i < string_size; i++) {
    var letter = string[i];

    if(vowels.indexOf(letter) != -1){
      array.push(letter)
    }
  }
  return array.length;
}

var count = 0;

array.forEach(function(string){
  console.log(typeof(string));
  if(!bad_string(string) && repeated_letter(string) && number_of_vowels(string) > 2){
    count = count + 1;
  }
});

console.log(count);
