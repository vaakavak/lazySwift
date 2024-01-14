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



//// 2) Возведение значений в массиве в квадрат
//
//var array = makeArray()
//print(array)
//
//for index in 0..<array.count {   //перебираю значения в массиве (типа индекс)
//    array[index] *= array[index] //возвожу в степень
//}
//
//print(array)



// 3) Удаление четных элементов из массива
//var array = makeArray()
//print(array)

//             //stride создает последовательность
////array.count - число элементов в массиве  through - куда должны прийти, к 0-му индексу   by - с каким шагом
//for index in stride(from: array.count - 1, through: 0, by: -1) {
//    if index % 2 == 0 {
//        array.remove(at: index)
//    }
//}


   //var index = 0
//while index < array.count {
//    if array[index] % 2 == 0 {
//        array.remove(at: index)
//    } else {
//        index += 1
//    }
//}
//
//print(array)
// 



//// 4) Создание нового массива путем фильтрации исходного
//
//let array = makeArray()
//var newArray = [Int]()
//
//print(array)
//print(newArray)
//
//for element in array {
//    if element % 2 != 0 {
//        newArray.append(element)
//    }
//}
//
//print(array)
//print(newArray)



//// 5) Сортировка массива по возрастанию
//var array = makeArray()
//
//for i in 0..<array.count - 1{
//    for j in (i+1)..<array.count{
//        if array[j] < array[i]{
//            let tmp = array[i]
//            array[i] = array[j]
//            array[j] = tmp
//        }
//    }
//}
//
//print(array)




//// 6) Обмен значениями между массивами
//var arrayA = makeArray()
//var arrayB = makeArray()
//
//print(arrayA)
//print("-------------------")
//print(arrayB)
//
//for index in stride(from: arrayA.count - 1, through: 0, by: -1) { //индекс от конца до начала
//    if arrayA[index] % 2 == 0 { //если в массиве "а" по индексу деление без остатка(четное)
//        arrayB.append(arrayA[index]) //тогда этот четный элемент добавляем в массив "б"
//        arrayA.remove(at: index)    //соответственно удаляем по этому же индексу
//    }
//}
//
//for index in stride(from: arrayB.count - 1, through: 0, by: -1) { //индекс от конца до начала
//    if arrayB[index] % 2 != 0 {
//        arrayA.append(arrayB[index])
//        arrayB.remove(at: index)
//    }
//}
//
//print("****************************************")
//print(arrayA)
//print("-------------------")
//print(arrayB)


//// 7) Создание новых массивов путем фильтрации исходных
//
//let arrayA = makeArray()
//let arrayB = makeArray()
//
//var newArrayC = [Int]()
//var newArrayD = [Int]()
//
//var index = 0
//
//print(arrayA)
//print(arrayB)
//
////for number in arrayA {
////    if number % 2 != 0 {
////        newArrayC.append(number)
////    } else {
////        newArrayD.append(number)
////    }
////}
////
////for number in arrayB {
////    if number % 2 != 0 {
////        newArrayC.append(number)
////    } else {
////        newArrayD.append(number)
////    }
////}
//
//while index < arrayA.count && index < arrayB.count { //вариант сокращения. Работает только если длина массивов одинаковая
//    if arrayA[index] % 2 != 0 {
//        newArrayC.append(arrayA[index])
//    } else {
//        newArrayD.append(arrayA[index])
//    }
//    if arrayB[index] % 2 != 0 {
//        newArrayC.append(arrayB[index])
//    } else {
//        newArrayD.append(arrayB[index])
//    }
//    index += 1
//}
//
//
//print("***************************")
//print(newArrayC)
//print(newArrayD)




func makeArray() -> [Int] {
    var array = [Int]()
    for _ in 0..<10 {
        array.append(Int.random(in: 0..<100))
    }
    return array
}
