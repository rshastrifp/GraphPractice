//
//  Stack.swift
//  GraphPractice
//
//  Created by Ronak Shastri on 2019-09-26.
//  Copyright © 2019 Ronak Shastri. All rights reserved.
//

import Foundation

struct Stack<T> {
    
    var items : [T] = []
    
    mutating func push(element : T) {
        items.append(element)
    }
    
    func pop(element : T) -> T? {
        if items.isEmpty {
            return nil
        }
        else {
            return items.last
        }
    }
}

