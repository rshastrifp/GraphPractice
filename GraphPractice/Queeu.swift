//
//  Queeu.swift
//  GraphPractice
//
//  Created by Ronak Shastri on 2019-09-26.
//  Copyright © 2019 Ronak Shastri. All rights reserved.
//

import Foundation

struct QueueCustom<T> {
    var items : [T] = []
    
    mutating func enqueue(element : T) {
        items.append(element)
    }
    
    mutating func dequeque() -> T? {
        if items.isEmpty {
            return nil
        }
        else {
            let first = items.first
            items.remove(at: 0)
            return first
        }
    }
}
