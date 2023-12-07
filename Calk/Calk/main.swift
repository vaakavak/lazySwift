print("Добро пожаловать в программу калькулятор.")

var history: [String] = []

while true {
    let action = getDataFromUser(description: "Что вы хотите сделать: c - расчет примера. q - завершение работы. h - просмотр истории.")
    switch action {
    case "c":
        calculate()
    case "q":
        exit(0)
    case "h":
        showHistory()
    default:
        print("Недопустимое действие")
    }
    print("")
    print("___________________________________________")
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

func getDataFromUser(description: String) -> String {
    print(description)
    return readLine() ?? ""
}

func showResult(_ result: Int) {
    print("Результат: " + String(result))
}

func showHistory() {
    for example in history {
        print(example)
    }
}

func calculate() {
    let operation = getDataFromUser(description: "Выберите операцию: +, -, *, /.")
    guard operation == "+" || operation == "-" || operation == "*" || operation == "/" else {
        print("Вы ввели не верную операцию")
        return
    }
    
    let firstNumber = getDataFromUser(description: "Введите целое число")
    guard let firstNumber = Int(firstNumber) else {
        print("Вы ввели не верное число")
        return
    }
    
    let secondNumber = getDataFromUser(description: "Введите второе число")
    guard let secondNumber = Int(secondNumber) else {
        print("Вы ввели не верное второе число")
        return
    }
    
    let example = String(firstNumber) + " " + operation + " " + String(secondNumber)
    print("Идет вычисление примера: " + example)

    let result = calculate(operation: operation, firstNumber: firstNumber, secondMunber: secondNumber)
    guard let result = result else { return }
    
        showResult(result)
        history.append(example + " = " + String(result))
}
