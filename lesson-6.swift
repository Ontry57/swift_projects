//
//  main.swift
//  lesson-6
//
//  Created by korolev-ap on 17.07.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import Foundation

struct Queue<T> {
    private var myList: [T] = []
    
    mutating func push(_ elements: [T]) {
        for element in elements  {
            myList.append(element)
        }
    }
    
    mutating func get() -> T? {
        guard myList.count > 0 else {
            return nil
        }
        return myList.removeFirst()
    }
   
    
    func myFilter(predicate: (T) -> Bool ) -> [T] {
        var tmpList = [T]()
        for element in myList {
            if predicate(element) {
                tmpList.append(element)
            }
        }
        return tmpList
    }

    subscript(_ index: Int) -> T? {
         return myList.indices.contains(index) ? myList[index] : nil
    }
}

var queue1 = Queue<Int>()
queue1.push([1])
print(queue1.get())
queue1.push([2,4,5])
print(queue1.get())
print(queue1.get())

print("filter \n")

queue1.push([2,4,5])
var queueFiltred = queue1.myFilter(){
    $0 % 2 == 0
}

print(queueFiltred)

print("by index \n")

var queue2 = Queue<Int>()
queue2.push([100,200,300])
print(queue2[2])
