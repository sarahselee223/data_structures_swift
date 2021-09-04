//
//  Binary Search Tree.swift
//  Binary Search Tree
//
//  Created by Sarah Lee on 8/29/21.
//

import Foundation

class BNode<T> {
    var val: T
    var leftNode: BNode?
    var rightNode: BNode?
    
    init(leftNode: BNode? = nil, val: T, rightNode: BNode? = nil){
        self.val = val
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}
// comparable protocol enforces a guarantee that the type to build
// the binary tree can be compared using the comparison operators
enum BinarySearchTree<T: Comparable> {
    case empty
    indirect case node(BinarySearchTree, T, BinarySearchTree)
}

extension BinarySearchTree {
    var countAllNodes: Int {
        switch self {
        case .empty:
            return 0
        case let .node(left, _, right):
            return left.countAllNodes + 1 + right.countAllNodes
        }
    }

    private func newTreeWithInsertedValue(newVal: T) -> BinarySearchTree {
        switch self {
        case .empty:
            return .node(.empty, newVal, .empty)
        case let .node(left, val, right):
            if newVal < val {
                return .node(left.newTreeWithInsertedValue(newVal: newVal), val, right)
            } else {
                return .node(left, val, right.newTreeWithInsertedValue(newVal: newVal))
            }
        }
    }
    
    mutating func insert(newVal: T) {
        self = newTreeWithInsertedValue(newVal:  newVal)
    }
    
    // all the way left, then current node, then right side
    func traverseInorder(process: (T) -> Void){
        switch self {
        case .empty:
            return
        case let .node(left, val, right):
            left.traverseInorder(process: process)
            process(val)
            right.traverseInorder(process: process)
        }
    }
    
    // current node first, then left, then right
    func traversePreOrder(process: (T) -> Void) {
        switch self {
        case .empty:
            return
        case let .node(left, val, right):
            process(val)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    func traversePostOrder(process: (T) -> Void) {
        switch self {
        case .empty:
            return
        case let .node(left, val, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(val)
        }
    }
}

var binarySearchTree: BinarySearchTree<Int> = .empty
// Test Insert Func
// binarySearchTree.insert(newVal: 7)
// binarySearchTree.insert(newVal: 2)
// binarySearchTree.insert(newVal: 10)
// binarySearchTree.insert(newVal: 1)
// binarySearchTree.insert(newVal: 5)
// binarySearchTree.insert(newVal: 9)

// print(binarySearchTree)
// value: 7, left = [value: 2, left = [value: 1, left = [], right = []], right = []], right = [value: 10, left = [value: 9, left = [], right = []], right = []]

// Test TraverseInorder Func
// binarySearchTree.insert(newVal: 7)
// binarySearchTree.insert(newVal: 2)
// binarySearchTree.insert(newVal: 10)
// binarySearchTree.insert(newVal: 1)
// binarySearchTree.insert(newVal: 5)
// binarySearchTree.insert(newVal: 9)
// binarySearchTree.traverseInorder{ print($0) }
// 1 -> 2 -> 5 -> 7 -> 9 -> 10
// Test traversePreOrder Func
// 7 -> 2 -> 1 -> 5 -> 10 -> 9
// Test traversePostOrder Func
// 1 -> 5 -> 2 -> 9 -> 10 -> 7
