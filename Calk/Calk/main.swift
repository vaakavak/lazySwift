func getDataFromUser(description: String) -> String {
    print(description)
    return readLine() ?? ""
}

func showResult(_ result: Int) {
    print("Результат: " + String(result))
}

print("Добро пожаловать в программу калькулятор.")

var history: [String] = []

while true {
    let operation = getDataFromUser(description: "Выберите операцию: +, -, *, /. Для завершения введите q. Для просмотра истории введите h")
    if operation == "q" {
        exit(0)
    } else if operation == "h" {
        for example in history {
            print(example)
        }
        continue
    }
    let firstNumber = getDataFromUser(description: "Введите целое число")
    let secondNumber = getDataFromUser(description: "Введите второе число")

    let example = firstNumber + " " + operation + " " + secondNumber
    print("Идет вычисление примера: " + example)

    if let firstNumber = Int(firstNumber) {
        if let secondNumber = Int(secondNumber) {
            let result = calculate(operation: operation, firstNumber: firstNumber, secondMunber: secondNumber)
            if let result = result {
                showResult(result)
                history.append(example + " = " + String(result))
            }
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


func calculate(operation: String, firstNumber first: Int, secondMunber second: Int) -> Int? {
    switch operation {
    case "+": return first + second
    case "-": return first - second
    case "*": return first * second
    case "/":
        if second != 0 {
            return first / second
        } else {
            print("Деление на 0 является недопустимой операцией")
            return nil
        }
    default: print("Вы ввели не верную операцию")
        return nil
    }
}
