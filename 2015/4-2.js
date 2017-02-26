var Hashes = require('jshashes');


// var str = 'abcdef609043';

// var s2 = 'pqrstuv1048970';

var prefix = 'yzbqklnj';

var MD5 = new Hashes.MD5;

// console.log(MD5.hex(str));
// console.log(MD5.hex(s2));


var number = 0;

while(true){

  // if(number % 100000 == 0) {
  //   console.log(number);
  // }

  var string = prefix + number;

  hashed = MD5.hex(string);

  substring = hashed.substring(0,6);

  if(substring == "000000") {
    console.log(number);
    break;
  }

  number++;
}
