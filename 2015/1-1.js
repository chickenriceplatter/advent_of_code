var fs = require('fs');

var data = fs.readFileSync("1-1-input.txt", "utf8");

data = data.trim();

console.log(typeof(data));

var array = data.split("");

console.log(array.length);

var total = 0;

array.forEach(function(letter) {
  if(letter == "("){
    total = total + 1;
  } else {
    total = total -1;
  }
});

console.log(total);

// console.log(string.length);
