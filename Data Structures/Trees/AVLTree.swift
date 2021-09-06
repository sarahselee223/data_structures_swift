//
//  AVLTree.swift
//  AVLTree
//
//  Created by Sarah Lee on 9/6/21.
//

import Foundation

// balanced tree - every level of the tree must be filled,
// except for the bottom level

class AVLNode<T> {
    var val: T
    var leftNode: AVLNode?
    var rightNode: AVLNode?
    
    init(leftNode: AVLNode? = nil, val: T, rightNode: AVLNode? = nil) {
        self.leftNode = leftNode
        self.val = val
        self.rightNode = rightNode
    }
}

enum AVLTree<T: Comparable> {
    case empty
    indirect case node(AVLTree, T, AVLTree)
}

extension AVLTree {
    private func newTreeWithInsertedValue(newVal : T) -> AVLTree {
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
    
    mutating func insert(newVal: T){
        self.newTreeWithInsertedValue(newVal: newVal)
    }
}

