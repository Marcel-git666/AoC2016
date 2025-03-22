//
//  Day02.swift
//  AoC2016
//
//  Created by Marcel Mravec on 17.01.2023.
//

import Foundation

enum Day02: DayChallenge {
    static func part1(_ input: String) -> String {
        "\(day02Part1(input))"
    }

    static func part2(_ input: String) -> String {
        "\(day02Part2(input))"
    }
}

/*

Dial:
1 2 3
4 5 6
7 8 9


   URDL
1: 1241
2: 2351
3: 3362
4: 1574
5: 2684
6: 3695
7: 4877
8: 5987
9: 6998

*/

func day02Part1(_ input: String) -> String {
    let table = ["1241", "2351", "3362", "1574", "2684", "3695", "4877", "5987", "6998"]
    let lines = input.components(separatedBy: .newlines).filter { !$0.isEmpty }
    var index = "5"
    var code = ""
    for line in lines {
        for char in line {
            index = getCode(for: char, index, table)
        }
        code += index
    }
    return code
}

func getCode(for char: Character, _ index: String, _ table: [String]) -> String {
    let position: Int
    switch index {
    case "1", "2", "3", "4", "5", "6", "7", "8", "9":
        position = Int(index)! - 1
    case "A":
        position = 9
    case "B":
        position = 10
    case "C":
        position = 11
    case "D":
        position = 12
    default:
        fatalError("Invalid index: \(index)")
    }
    let directions = Array(table[position])
    switch char {
    case "U":
        return String(directions[0])
    case "D":
        return String(directions[2])
    case "L":
        return String(directions[3])
    case "R":
        return String(directions[1])
    default:
        return index
    }
}

/*
      1
    2 3 4
  5 6 7 8 9
    A B C
      D

 URDL
*/

func day02Part2(_ input: String) -> String {
    let table = ["1131", "2362", "1472", "4483", "5655", "27A5", "38B6", "49C7", "9998", "6BAA", "7CDA", "8CCB", "BDDD"]
    let lines = input.components(separatedBy: .newlines).filter { !$0.isEmpty }
    var index = "5"
    var code = ""
    for line in lines {
        for char in line {
            index = getCode(for: char, index, table)
        }
        code += index
    }
    return code
}

