//
//  Pascals trianagle.swift
//  Data Structures
//
//  Created by Sarah Lee on 12/31/21.
//

import Foundation

// Given an integer numRows, return the first numRows of Pascal's Triangle.
// In Pascal's Triangle, each number is the sum of the two numbers directly above it as shown

func pascalsTriangleFunc(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else {
        return []
    }
    
    if numRows == 1 {
        return [[1]]
    }
    
    var output = [[Int]]()
    output.reserveCapacity(numRows)
    output.append([1])
    for num in 1..<numRows {
        var newRow = [1]
        let prevRow = output[num - 1]
        for val in 1..<prevRow.count {
            let sum = prevRow[val] + prevRow[val - 1]
            newRow.append(sum)
        }
        newRow.append(1)
        output.append(newRow)
    }
    return output
}

let result = pascalsTriangleFunc(5)

