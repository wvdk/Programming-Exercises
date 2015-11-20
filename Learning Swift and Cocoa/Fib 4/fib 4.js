var fs = require("fs");

function fib(n) {
  if (n < 1) {
    return 1;
  } else {
    return (fib(n-1) + fib(n-2));
  }
}

var log = "level,fib,time\n";

for (i = 0; i < 40; i++) {
  var result;
  var start;
  var end;
  var totalTime;


  start = new Date().getTime();
  result = fib(i);
  end = new Date().getTime();
  totalTime = (end - start);

  log = log + (i + 1) + "," + result + "," + totalTime + "\n";

  console.log("Fib level " + (i + 1) + ": " + result);
  console.log("Execution time: " + totalTime + "ms\r\n");
}

fs.writeFile("fib 4 log.cvs", log, function (err) {
  if (err) {
    return console.log(err);
  } else {
    console.log("wrote to \"fib 4 log.csv\"");
  }
});

//console.log(log);
