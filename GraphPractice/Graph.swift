//
//  Graph.swift
//  GraphPractice
//
//  Created by Ronak Shastri on 2019-09-25.
//  Copyright © 2019 Ronak Shastri. All rights reserved.
//

import Foundation

class Graph {
    var nodes : [Node]
    var edges : [Edge]
    
    init(nodes: [Node], edges : [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }
    
    // Don't return an array of edge objects!
    // Return an array of arrays where inner arrays look like
    // (Edge Value, From Node Value, To Node Value)
    func getEdgeList() -> [[Int]] {
        var edgeList = [[Int]]()
        
        for edge in edges {
            var prm = [Int]()
            if let edgeValue = edge.value,
                let fromNode = edge.nodeFrom?.value,
                let toNode = edge.nodeTo?.value {
                prm.append(edgeValue)
                prm.append(fromNode)
                prm.append(toNode)
            }
            edgeList.append(prm)
        }
        
        return edgeList
    }
    
    // Don't return any Node or Edge objects!
    // You'll return a 3D array
    // The indices of the outer list represent "from" nodes.
    // Each section in the array will store an array of arrays where the inner-most arrays look like
    // (To Node Value, Edge Value)
    func getAdjacencyList() -> [[[Int]]] {
        let max = getMaxIndex()
        var adjacencyList = [[[Int]]]()
        
        for node in nodes {
            var nodeUnitList = [[Int]]()
            for edge in edges {
                var edgeUnit = [Int]()
                if let edgeValue = edge.value,
                    let fromNodeValue = edge.nodeFrom?.value,
                    let toNodeValue = edge.nodeTo?.value {
                    if (node.value == fromNodeValue) {
                        edgeUnit.append(toNodeValue)
                        edgeUnit.append(edgeValue)
                    }
                }
                if (edgeUnit.count > 0) {
                    nodeUnitList.append(edgeUnit)
                }
            }
            adjacencyList.append(nodeUnitList)
        }
        
        return adjacencyList
    }
    
    // Return a matrix, or 2D array.
    // Row numbers represent from nodes.
    // Column numbers represent to nodes.
    // Store the edge values in each spot, and a 0 if no edge exists.
    func getAdjacencyMatrix() -> [[Int]] {
        let max = getMaxIndex()
        var adjacencyMatrix = [[Int]]()
        
        return adjacencyMatrix
    }
    
    // Helper to be used with adjacency list and adjacency matrix
    // max node value determines the size of the array
    func getMaxIndex() -> Int {
        var maxIndex = 0
        
        for node in nodes {
            if node.value! > maxIndex {
                maxIndex = node.value!
            }
        }
        
        return maxIndex
    }
    
    // creates a node with a given value and inserts it into the graph
    func insertNodeWithValue(_ value: Int) {
        let newNode = Node(value: value)
        nodes.append(newNode)
    }
    
    // inserts an edge between the "to" and "from" nodes with the specified values
    func insertEdgeWithValue(_ newEdgeValue: Int, nodeFromValue: Int, nodeToValue: Int) {
        var fromFound: Node? = nil
        var toFound: Node? = nil
        
        for node in nodes {
            if nodeFromValue == node.value {
                fromFound = node
            }
            if nodeToValue == node.value {
                toFound = node
            }
        }
        
        if fromFound == nil {
            fromFound = Node(value: nodeFromValue)
            nodes.append(fromFound!)
        }
        if toFound == nil {
            toFound = Node(value: nodeToValue)
            nodes.append(toFound!)
        }
        
        let newEdge = Edge(value: newEdgeValue, nodeFrom: fromFound, nodeTo: toFound)
        fromFound?.edges.append(newEdge)
        toFound?.edges.append(newEdge)
        edges.append(newEdge)
    }
    
    
    // Create a recursive implementation.
    // Return a list of the node values.
    fileprivate func appendAndMove(_ dfsSequence: inout [Int], _ startNode: Node) {
        dfsSequence.append(startNode.value!)
        startNode.visited = true
        for edge in startNode.edges {
            if (edge.nodeTo?.value == startNode.value) {
                continue
            }
            if let toNode = edge.nodeTo, toNode.visited != true {
                appendAndMove(&dfsSequence, toNode)
            }
        }
    }
    
    func dfs(_ startNode: Node) -> [Int] {
        var dfsSequence = [Int]()
        appendAndMove(&dfsSequence, startNode)
        return dfsSequence
    }
    
    // Create an iterative implementation.
    // Return a list of the node values.
    fileprivate func appendUsingQuequeForBfs(_ bfsSequence: inout [Int], _ startNode: Node, _ nodeQueue: inout QueueCustom<Node>) {
        for edge in startNode.edges {
            if (edge.nodeTo?.value == startNode.value) {
                continue
            }
            if let toNode = edge.nodeTo, toNode.visited != true {
                bfsSequence.append(edge.nodeTo!.value!)
                edge.nodeTo!.visited = true
                nodeQueue.enqueue(element: edge.nodeTo!)
            }
        }
    }
    
    func bfs(_ startNode: Node) -> [Int] {
        var bfsSequence = [Int]()
        var nodeQueue = QueueCustom(items: [Node]())
        
        bfsSequence.append(startNode.value!)
        startNode.visited = true
        nodeQueue.enqueue(element: startNode)
        
       
        while (!nodeQueue.items.isEmpty) {
            if let node = nodeQueue.dequeque() {
                appendUsingQuequeForBfs(&bfsSequence, node, &nodeQueue)
            }
        }
        
        return bfsSequence
    }
    
    // helper method - use to implement DFS recursively
    func dfsHelper(_ current: Node, visited: [Int]) -> [Int] {
        var result = visited
        
        return result
    }
}

