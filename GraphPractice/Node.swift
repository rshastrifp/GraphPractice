//
//  Node.swift
//  GraphPractice
//
//  Created by Ronak Shastri on 2019-09-25.
//  Copyright © 2019 Ronak Shastri. All rights reserved.
//

import Foundation

class Node {
    var value: Int?
    var edges: [Edge]
    var visited = false
    
    init(value: Int?) {
        self.value = value
        self.edges = []
    }
}

