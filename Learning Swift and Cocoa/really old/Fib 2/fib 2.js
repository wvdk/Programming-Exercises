function fib(n) {
  if (n <= 1) {
    return 1;
  } else {
    return (fib(n - 1) + fib(n - 2));
  }
}

for (i = 1; i <= 40; i++) {
  console.time("Level " + i);
  console.log("Fib.: " + fib(i));
  console.timeEnd("Level " + i);
  console.log("\n");
}
