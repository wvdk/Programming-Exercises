import UIKit

var str = "Hello, playground"


/**
 
 Let's reshape a matrix
 You're given a matrix represented by a two-dimensional array, and two positive integers r and c representing the row number and column number of the wanted reshaped matrix, respectively.
 The reshaped matrix needs to be filled with all the elements of the original matrix in the same row-traversing order as they were.
 If the 'reshape' operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.
 Example 1:
 Input:
 nums =
 [[1,2],
 [3,4]]
 r = 1, c = 4
 Output:
 [[1,2,3,4]]
 Explanation:
 The row-traversing of nums is [1,2,3,4]. The new reshaped matrix is a 1 * 4 matrix, fill it row by row by using the previous list.
 Example 2:
 Input:
 nums =
 [[1,2],
 [3,4]]
 r = 2, c = 4
 Output:
 [[1,2],
 [3,4]]
 Explanation:
 There is no way to reshape a 2 * 2 matrix to a 2 * 4 matrix. So output the original matrix.
 
 */



func reshape(inputMatrix input: [[Int]], targetRowCount r: Int, targetColumnCount c: Int) -> [[Int]] {
    
    
    // 1. Flatten input
    var flatInput: [Int] = []
    
    for row in input {
        for element in row {
            flatInput.append(element)
        }
    }
    
    
    // 2. Assemble result
    var result: [[Int]] = []
    
    for i in 0..<r {
        
        result.append([])
        
        for j in 0..<c {
            let nextElement = flatInput[i+j]
            result[i].append(nextElement)
        }
    }
    
    return result
}


let result1 = reshape(inputMatrix: [[1,2], [3,4]], targetRowCount: 1, targetColumnCount: 4)
result1 == [[1,2,3,4]]

let result2 = reshape(inputMatrix: [[1,2], [3,4]], targetRowCount: 2, targetColumnCount: 2)
result2 == [[1,2], [3,4]]

[[1,2], [3,4]] == [[1,2], [3,4]]
