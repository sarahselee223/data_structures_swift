//
//  AdjacencyList.swift
//  Data Structures
//
//  Created by Sarah Lee on 2/12/22.
//

import Foundation

// Adgacency list (인접 목록)
// For every vertex in the graph, the graph stores a list of outgoing edges
// Create an adjacency list by storing a dictionary of arrays
// Key: vertex, Value: corresponding arrays of edges

public class AdjacencyList<T: Hashable>: Graph {
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    // creating a vertex
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    // creating a direct edge
    public func addDirectedEdge(from source: Vertex<T>,
                         to destination: Vertex<T>,
                         weight: Double?) {
        let edge = Edge(source: source,
                        destination: destination,
                        weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    // creating an undirected edge
    // reason: every edge in an undirected graph can be traversed in both directions
    // added addUndirectedEdge in Graph extention below
    
    // add
    public func add(_ edge: EdgeType,
             from source: Vertex<Element>,
             to destination: Vertex<Element>,
             weight: Double?) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
    
    // retrieving the outgoing edges from a vertex
    public func edges(from soure: Vertex<T>) -> [Edge<T>] {
        adjacencies[soure] ?? []
    }
    
    // retrieving the weight of an edge
    public func weight(from source: Vertex<T>,
                       to destination: Vertex<T>) -> Double? {
      edges(from: source)
         .first { $0.destination == destination }?
         .weight
    }

}

extension Graph {
    public func addUndirectedEdge(between source: Vertex<Element>,
                           and destination: Vertex<Element>,
                           weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
}

extension AdjacencyList: CustomStringConvertible {

    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies { // 1
          var edgeString = ""
          for (index, edge) in edges.enumerated() { // 2
            if index != edges.count - 1 {
              edgeString.append("\(edge.destination), ")
            } else {
              edgeString.append("\(edge.destination)")
            }
          }
          result.append("\(vertex) ---> [ \(edgeString) ]\n") // 3
        }
        return result
      }
}


