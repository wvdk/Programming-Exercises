import Cocoa

func fib(n: Int) -> Int {
    if n < 2 {
        return 1
    } else {
        return fib(n - 1) + fib(n - 2)
    }
}

for i in 0...20 {
    let start = NSDate()
    let f = fib(i)
    i
    let end = NSDate()
    let elapsedTime = end.timeIntervalSinceDate(start)
}

