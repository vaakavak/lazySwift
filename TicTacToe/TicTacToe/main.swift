//
//  main.swift
//  TicTacToe
//
//  Created by Евгений Шилов on 20.01.2024.
//

import Foundation

let symbols = (
    empty: " ",
    player1: "X",
    player2: "O"
)
var field = [[String]]()

print("Добро пожаловать в игру крестики нолики")
while true {
    let playerName1 = getDataFromUser(description: "Введите имя первого игрока")
    guard !playerName1.isEmpty else {
        print("Вы ввели неверное имя первого игрока")
        continue
    }
    let playerName2 = getDataFromUser(description: "Введите имя второго игрока")
    guard !playerName2.isEmpty else {
        print("Вы ввели неверное имя второго игрока")
        continue
    }
    let fieldSize = getDataFromUser(description: "Введите размер игрового поля")
    guard let fieldSize = Int(fieldSize), fieldSize > 0 else {
        print("Вы ввели неверный размер игрового поля")
        continue
    }
    
    var field = [[String]]()
    for _ in 0..<fieldSize {
        var row = [String]()
        for _ in 0..<fieldSize {
            row.append(symbols.empty)
        }
        field.append(row)
    }
    printField()
    
    var winnerSymbol: String?
    while true {
        playerTurn(playerName: playerName1, symbol: symbols.player1)
        printField()
        if let symbol = checkPlayerWon() {
            winnerSymbol = symbol
            break
        }
        if checkIfGameOver() { break }
        
        playerTurn(playerName: playerName2, symbol: symbols.player2)
        printField()
        if let symbol = checkPlayerWon() {
            winnerSymbol = symbol
            break
        }
        if checkIfGameOver() { break }
    }
    
    if winnerSymbol == symbols.player1 {
        print("Победил: \(playerName1)")
    } else if winnerSymbol == symbols.player2 {
        print("Победил: \(playerName2)")
    } else {
        print("Игра окончилась в ничью")
    }
    
   let shouldStartNewgame = getDataFromUser(description: "Если хотите начать новую игру введите - да")
    if shouldStartNewgame != "да" {
        exit(0)
    }
}

func checkPlayerWon() -> String? {
    return checkPlayerWonByRows()
        ?? checkPlayerWonByColumn()
        ?? checkPlayerWonByFirstDiagonal()
        ?? checkPlayerWonBySecondDiagonal()
}

func checkPlayerWonBySecondDiagonal() -> String? {
    let fieldSize = field.count
    let lastIndex = fieldSize - 1
    let firsSymbol = field[0][lastIndex]
    guard firsSymbol != symbols.empty else {
        return nil
    }
    var isWin = true
    for i in 0..<fieldSize {
        if field[i][lastIndex - 1] != firsSymbol {
            isWin = false
            break
        }
    }
    if isWin {
        return firsSymbol
    }
    return nil
}

func checkPlayerWonByFirstDiagonal() -> String? {
    let fieldSize = field.count
    let firstSymbol = field[0][0]
    guard firstSymbol != symbols.empty else {
        return nil
    }
    
    var isWin = true
    for i in 0..<fieldSize {
        if field[i][i] != firstSymbol {
            isWin = false
            break
        }
    }
    if isWin {
        return firstSymbol
    }
    return nil
}

func checkPlayerWonByColumn() -> String? {
    let fieldSize = field.count
    for i in 0..<fieldSize {
        let firstSymbol = field[0][i]    //берем первый символ. Строка всегда 0, столбец просматривается от 0 до длины массива (например 3-х)
        if firstSymbol == symbols.empty {//проверяем что символ он не пустой
            break
        }
        var isWin = true
        for j in 0..<fieldSize {
            if field[i][j] != firstSymbol {
                isWin = false
                break
            }
        }
        if isWin {
            return firstSymbol
        }
    }
    return nil
}

func checkPlayerWonByRows() -> String? {
    let fieldSize = field.count
    for i in 0..<fieldSize {
        let firstSimbol = field[i][0]    //берем первый символ.
        if firstSimbol == symbols.empty {//проверяем что символ он не пустой
            return nil
        }
        var isWin = true
        for j in 0..<fieldSize {
            if field[i][j] != firstSimbol {
                isWin = false
                break
            }
        }
        if isWin {
            return firstSimbol
        }
    }
    return nil
}

func checkIfGameOver() -> Bool {
    for row in field {
        for cell in row {
            if cell == symbols.empty {
                return false
            }
        }
    }
    return true
}

func playerTurn(playerName: String, symbol: String) {
    let fieldSize = field.count
    while true {
        print("\(playerName) Делает ход")
        let row = getDataFromUser(description: "Введите номер строки")
        guard let row = Int(row), row > 0, row <= fieldSize else {
            print("Введен не верный номер строки")
            continue
        }
        let column = getDataFromUser(description: "Введите номер столбца")
        guard let column = Int(column), column > 0, column <= fieldSize else {
            print("Введен не верный номер столбца")
            continue
        }
        let fieldRow = row - 1
        let fieldColumn = column - 1
        guard field[fieldRow][fieldColumn] == symbols.empty else {
            print("Такой ход уже был")
            continue
        }
        field[fieldRow][fieldColumn] = symbol
        break
    }
}

func printField() {
    let fieldSize = field.count
    var fieldFormatedString = ""
    for row in field {
        fieldFormatedString += "|"
        for cell in row {
            fieldFormatedString += cell + "|"
        }
        fieldFormatedString += "\n"
        for _ in 0..<(fieldSize * 2 + 1) {
            fieldFormatedString += "-"
        }
        fieldFormatedString += "\n"
    }
    print(fieldFormatedString)
}


func getDataFromUser(description: String) -> String {
    print(description)
    return readLine() ?? " "
}
