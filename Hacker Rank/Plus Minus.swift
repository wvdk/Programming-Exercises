// https://www.hackerrank.com/challenges/plus-minus

// number of elements
var n = Int(readLine()!)!

// read array and map the elements to integer
var arr = readLine()!.characters.split(" ").map{Int(String($0))!}

var countOfNegative: Double = 0
var countOfPositive: Double = 0
var countOfZero: Double = 0

for i in arr {
    if i == 0 {
        countOfZero += 1
    }
    
    if i < 0 {
        countOfNegative += 1
    }
    
    if i > 0 {
        countOfPositive += 1
    }
}

let count = Double(arr.count)

print(countOfPositive / count)
print(countOfNegative / count)
print(countOfZero / count)

