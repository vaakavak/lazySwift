//
//  main.swift
//  Calk
//
//  Created by Admin on 22.11.2023.
//

import Foundation
import Darwin

func getDataFromUser(description: String) -> String {
    print(description)
    return readLine() ?? ""
}

func showResult(_ result: Int) {
    print("Результат: " + String(result))
}

print("Добро пожаловать в программу калькулятор")

while true {
    let operation = getDataFromUser(description: "Выберите операцию: +, -, *, /. Для завершения работы введите q.")
    if operation == "q" {
        exit(0)
    }
    let firstNumber = getDataFromUser(description: "Введите целое число")
    let secondNumber = getDataFromUser(description: "Введите второе число")

    print("Идет вычисление примера: " + firstNumber + " " + operation + " " + secondNumber)

    if let firstNumber = Int(firstNumber) {
        if let secondNumber = Int(secondNumber) {
            culculate(opertion: operation, firstNumber: firstNumber, secondNumber: secondNumber)
        } else {
            print("Вы вели не верное первое число")
        }
    } else {
        print("Вы ввели не верное первое число")
    }
    
    print("")
    print("--------------------------------------------")
    print("")
}








func culculate (opertion: String, firstNumber: Int, secondNumber: Int ) {
    switch operation {
    case "+": showResult(firstNumber + secondNumber)
    case "-": showResult(firstNumber - secondNumber)
    case "*": showResult(firstNumber * secondNumber)
    case "/":
        if secondNumber != 0 {
            showResult(firstNumber / secondNumber)
        } else {
            print("Деление на 0 является недопустимой операцией")
        }
    default:
        print("Вы ввели недопустимую операцию")
    }
}
