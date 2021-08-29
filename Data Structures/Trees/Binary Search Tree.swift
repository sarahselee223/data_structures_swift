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

    private func newTreeWithInsertedValue(newValue: T) -> BinarySearchTree {
      switch self {
      // 1
      case .empty:
        return .node(.empty, newValue, .empty)
      // 2
      case let .node(left, value, right):
        if newValue < value {
          return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
        } else {
          return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
        }
      }
    }
    
    mutating func insert(newValue: T) {
      self = newTreeWithInsertedValue(newValue: newValue)
    }
    
}
