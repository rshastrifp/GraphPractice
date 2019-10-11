//
//  GraphPracticeTests.swift
//  GraphPracticeTests
//
//  Created by Ronak Shastri on 2019-09-25.
//  Copyright © 2019 Ronak Shastri. All rights reserved.
//

import XCTest
@testable import GraphPractice

class GraphPracticeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGraphRepresentation() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Test cases
        let node = Node(value: 1)
        let graph = Graph(nodes: [node], edges: [])
        graph.insertEdgeWithValue(100, nodeFromValue: 1, nodeToValue: 2)
        graph.insertEdgeWithValue(101, nodeFromValue: 1, nodeToValue: 3)
        graph.insertEdgeWithValue(102, nodeFromValue: 1, nodeToValue: 4)
        graph.insertEdgeWithValue(103, nodeFromValue: 3, nodeToValue: 4)

        print(graph.getEdgeList()) // Should be [(100, 1, 2), (101, 1, 3), (102, 1, 4), (103, 3, 4)]
        print(graph.getAdjacencyList()) // Should be [[], [(2, 100), (3, 101), (4, 102)], [], [(4, 103)], []]
        print(graph.getAdjacencyMatrix()) // Should be [[0, 0, 0, 0, 0], [0, 0, 100, 101, 102], [0, 0, 0, 0, 0], [0, 0, 0, 0, 103], [0, 0, 0, 0, 0]]
    }
    
    func testDfsBfs() {
        //Test cases
        let graph = Graph(nodes: [], edges: [])
        graph.insertEdgeWithValue(100, nodeFromValue: 1, nodeToValue: 2)
        graph.insertEdgeWithValue(101, nodeFromValue: 1, nodeToValue: 3)
        graph.insertEdgeWithValue(102, nodeFromValue: 1, nodeToValue: 4)
        graph.insertEdgeWithValue(103, nodeFromValue: 3, nodeToValue: 4)
        
        print(graph.dfs(graph.nodes[0])) // Should be [1, 2, 3, 4]
        //print(graph.bfs(graph.nodes[0])) // Should be [1, 2, 3, 4]
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
