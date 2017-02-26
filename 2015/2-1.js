var _ = require('underscore');
var fs = require('fs');

var data = fs.readFileSync("2-1-input.txt", "utf8");

data = data.trim();

var array = data.split("\n");

console.log(array.length);

var total = 0;

array.forEach(function(numbers) {
  var list = numbers.split("x");
  console.log(list);
  list = list.map(function(letter) { return parseInt(letter); });

  var sorted = _.sortBy(list, function(num){ return num; });
  console.log(sorted);

  var sum = 0;

  sum = sum + (3 * sorted[0] * sorted[1]);
  sum = sum + (2 * sorted[1] * sorted[2]);
  sum = sum + (2 * sorted[0] * sorted[2]);

  total = total + sum;
});

console.log(total);
