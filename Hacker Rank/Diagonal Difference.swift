// https://www.hackerrank.com/challenges/diagonal-difference

var sizeOfSquareMatrix = Int(readLine()!)!

var matrix : [[Int]] = []

for (var i = 0; i < sizeOfSquareMatrix; i++) {
    matrix.append(readLine()!.characters.split(" ").map{Int(String($0))!})
}

func getSumOfDiagonalStartingFromTopLeft(matrix: [[Int]]) -> Int {
    var sum = 0
    var column = 0
    
    for row in matrix {
        if column < row.count {
            sum += row[column]
            column += 1
        }
    }
    
    return sum
}

func getSumOfDiagonalStartingFromTopRight(matrix: [[Int]]) -> Int {
    var sum = 0
    var column = matrix[0].count
    
    for row in matrix {
        if column > 0 {
            sum += row[column - 1]
            column -= 1
        }
    }
    
    return sum
}

let difference = abs(getSumOfDiagonalStartingFromTopLeft(matrix) - getSumOfDiagonalStartingFromTopRight(matrix))

print(difference)