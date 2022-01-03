//
//  Number of Islands.swift
//  Data Structures
//
//  Created by Sarah Lee on 1/2/22.
//

import Foundation

// https://leetcode.com/problems/number-of-islands/
// Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

func countIslands(_ grid: [[Character]]) -> Int {
    var numberOfIslands = 0
    var matrix = grid
    
    for i in 0..<matrix.count {
        let row = matrix[i]
        for j in 0..<row.count {
            let val = matrix[i][j]
            if val == "1" {
                numberOfIslands += 1
                search(i, j, &matrix)
            }
        }
    }
    return numberOfIslands
}

func search(_ row: Int, _ col: Int, _ grid: inout [[Character]]) {
    // Verify base case
    guard row >= 0, row < grid.count, col >= 0, col < grid[0].count else {
        return
    }
    guard grid[row][col] == "1" else {
        return
    }
    
    // Update value to 0
    grid[row][col] = "0"
    
    // Search all neighbors
    search(row + 1, col, &grid)
    search(row - 1, col, &grid)
    search(row, col + 1, &grid)
    search(row, col - 1, &grid)
}

let grid1: [[Character]] = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
] // should return 3

let grid2: [[Character]] = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
] // should return 1

let output = countIslands(grid1)
