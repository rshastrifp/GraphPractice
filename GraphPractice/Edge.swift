//
//  Edge.swift
//  GraphPractice
//
//  Created by Ronak Shastri on 2019-09-25.
//  Copyright © 2019 Ronak Shastri. All rights reserved.
//

import Foundation

class Edge {
    var value: Int?
    var nodeFrom: Node?
    var nodeTo: Node?
    
    init(value: Int?, nodeFrom: Node?, nodeTo: Node?) {
        self.value = value
        self.nodeFrom = nodeFrom
        self.nodeTo = nodeTo
    }
}

