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
    
    while true {
        playerTurn(playerName: playerName1, symbol: symbols.player1)
        printField()
        if checkIfGameOver() { break }
        
        playerTurn(playerName: playerName2, symbol: symbols.player2)
        printField()
        if checkIfGameOver() { break }
    }
    
    readLine()
}



func checkPlayerWonByRows() -> String? {
    let fieldSize = field.count
    for i in 0..<fieldSize {
        let firstSimbol = field[i][0]
        if firstSimbol == symbols.empty {
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
