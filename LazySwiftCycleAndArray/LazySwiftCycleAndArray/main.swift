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


////  1) Найти максимальный элемент
//let a = makeArray()
//var maximumNumber = a[0] //для сравнения беру первый элемент массива
//
//for elements in a {              //беру каждый элемент из массива
//    if elements > maximumNumber{ //сравниваю его с переменной maximumNumber
//        maximumNumber = elements //и если max больше, кладу туда элемент массива
//    }
//}
//print(a)
//print(maximumNumber)



// 2) Возведение значений в массиве в квадрат

var array = makeArray()
print(array)

for index in 0..<array.count {   //перебираю значения в массиве (типа индекс)
    array[index] *= array[index] //возвожу в степень
}

print(array)




func makeArray() -> [Int] {
    var array = [Int]()
    for _ in 0..<10 {
        array.append(Int.random(in: -100..<(-10)))
    }
    return array
}
