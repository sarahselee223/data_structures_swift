//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by Sarah Lee on 8/29/21.
//

import Foundation

class Node<T> {
    var val: T
    var leftNode: Node?
    var rightNode: Node?
    
    init(val: T, leftNode: Node? = nil, rightNode: Node? = nil) {
        self.val = val
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

enum BinaryTree<T> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
}

extension BinaryTree {
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, val, right):
            return "value: \(val), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}

let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)

// print results
func seeTreeNods() {
    return print(tree)
}

// get the num of nodes
func getNodeNumber() -> Int {
    return tree.count
}
