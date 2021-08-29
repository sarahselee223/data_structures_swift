//
//  Binary Search Tree.swift
//  Binary Search Tree
//
//  Created by Sarah Lee on 8/29/21.
//

import Foundation

class BNode<T> {
    var val: Int
    var leftNode: BNode?
    var rightNode: BNode?
    
    init(leftNode: BNode? = nil, val: Int, rightNode: BNode? = nil){
        self.val = val
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

enum BinarySearchTree<T> {
    case empty
    indirect case node(BinarySearchTree, Int, BinarySearchTree)
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
}

