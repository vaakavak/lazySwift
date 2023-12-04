func getDataFromUser(description: String) -> String {
    print(description)
    return readLine() ?? ""
}

func showResult(_ result: Int) {
    print("Результат: " + String(result))
}

print("Добро пожаловать в программу калькулятор.")

while true {
    let operation = getDataFromUser(description: "Выберите операцию: +, -, *, /")
    let firstNumber = getDataFromUser(description: "Введите целое число")
    let secondNumber = getDataFromUser(description: "Введите второе число")

    print("Идет вычисление примера: " + firstNumber + " " + operation + " " + secondNumber)

    if let firstNumber = Int(firstNumber) {
        if let secondNumber = Int(secondNumber) {
            calculate(operation: operation, firstNumber: firstNumber, secondMunber: secondNumber)
        } else {
            print("Вы ввели не верное второе значение")
        }
    } else {
        print("Вы ввели не верное первое число")
    }
    
    print("")
    print("-----------------------------------")
    print("")
}


func calculate(operation: String, firstNumber first: Int, secondMunber second: Int) {
    switch operation {
    case "+": showResult(first + second)
    case "-": showResult(first - second)
    case "*": showResult(first * second)
    case "/":
        if second != 0 {
            showResult(first / second)
        } else {
            print("Деление на 0 является недопустимой операцией")
        }
    default: print("Вы ввели не верную операцию")
    }
}
