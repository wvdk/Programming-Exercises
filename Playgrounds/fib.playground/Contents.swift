
func fib(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1{
        return 1
    }
    
    return fib(n: n - 1) + fib(n: n - 2)
}

for i in 0...10 {
    fib(n: i)
}
