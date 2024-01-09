//
//  main.swift
//  LazySwiftCycleAndArray
//
//  Created by Евгений Шилов on 09.01.2024.
//

import Foundation

//var a = [Int]()
//
//for _ in 0..<10 {
//    a.append(Int.random(in: 0..<100))
//}

//print(a)

func makeArray() -> [Int] {
    var array = [Int]()
    for _ in 0..<10 {
        array.append(Int.random(in: 0..<100))
    }
    return array
}
