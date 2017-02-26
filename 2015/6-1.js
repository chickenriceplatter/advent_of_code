var _ = require('underscore');
var fs = require('fs');

var data = fs.readFileSync("6-1-input.txt", "utf8");


data = data.trim();

var array = data.split("\n");

var grid = [];

for(var i = 0; i < 1000; i++){
  var list = [];
  for(var j = 0; j < 1000; j++){
    list.push(0);
  }
  grid.push(list);
}

function toggle(grid, row, column){
  if(grid[row][column] === 0){
    grid[row][column] = 1;
  } else {
    grid[row][column] = 0;
  }
}

function off(grid, row, column) {
  grid[row][column] = 0;
}

function on(grid, row, column) {
  grid[row][column] = 1;
}

array.forEach(function(string) {
  var instructions = string.split(" ");

  if(instructions.length === 5){
    instructions = instructions.slice(1,5);
  }

  var instruction = instructions[0];

  var action;

  if(instruction === "toggle") { action = toggle; }
  if(instruction === "on") { action = on; }
  if(instruction === "off") { action = off; }

  var start = instructions[1].split(",");
  var end = instructions[3].split(",");

  var start_x = parseInt(start[0]);
  var start_y = parseInt(start[1]);

  var end_x = parseInt(end[0]);
  var end_y = parseInt(end[1]);

  for(var x = start_x; x <= end_x; x++){
    for(var y = start_y; y <= end_y; y++) {

      action(grid, y, x);
    }
  }
});

function get_count(grid) {
  var count = 0;

  for(var i=0; i<1000; i++){
    for(var j=0; j<1000; j++){
      count = count += grid[i][j]
    }
  }
  return count;
}

console.log(get_count(grid));

debugger;
