var fs = require('fs');
var log = "0";

function fib(n) {
  if (n <= 1) {
    return 1;
  } else {
    return (fib(n - 1) + fib(n - 2));
  }
}

for (i = 1; i <= 40; i++) {
  log = log + "," + fib(i);
}

fs.writeFile('fib 3 log.csv', log, function (err) {
  if (err) {
    return console.log(err);
  } else {
    console.log("fib 3 log.cvs");
  }
});
