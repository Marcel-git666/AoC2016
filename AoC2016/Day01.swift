//
//  Day01.swift
//  AoC2016
//
//  Created by Marcel Mravec on 17.01.2023.
//

import Foundation

enum Day01 {
    static func run() {
        let input = readFile("day01.test")
        print(input)
        let result = day01Part1(input)
        print(result)
        print(day01Part2(input))
    }
}

func day01Part1(_ input: String) -> Int {
    var x = 0
    var y = 0
    var orientation = 0
    let inputArray = input.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ", ")
    print(inputArray)
    for instruction in inputArray {
        switch instruction.prefix(1) {
        case "R": orientation = (orientation + 1)
            if orientation == 4 { orientation = 0 }
            switch orientation {
            case 0: y += Int(instruction.suffix(instruction.count - 1))!
            case 1: x += Int(instruction.suffix(instruction.count - 1))!
            case 2: y -= Int(instruction.suffix(instruction.count - 1))!
            case 3: x -= Int(instruction.suffix(instruction.count - 1))!
            default: print("Error: invalid orientation value.")
            }
        case "L": orientation = (orientation - 1)
            if orientation == -1 { orientation = 3 }
            switch orientation {
            case 0: y += Int(instruction.suffix(instruction.count - 1))!
            case 1: x += Int(instruction.suffix(instruction.count - 1))!
            case 2: y -= Int(instruction.suffix(instruction.count - 1))!
            case 3: x -= Int(instruction.suffix(instruction.count - 1))!
            default: print("Error: invalid orientation value.")
            }
        default: print("Error: invalid instruction \(instruction)")
        }
    }
    return abs(x) + abs(y)
}

func day01Part2(_ input: String) -> Int {
    var x = 0
    var y = 0
    var orientation = 0
    var visitedPlaces: [String] = []
    let inputArray = input.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ", ")
    print(inputArray)
    for instruction in inputArray {
        switch instruction.prefix(1) {
        case "R": orientation = (orientation + 1)
            if orientation == 4 { orientation = 0 }
            switch orientation {
            case 0: y += Int(instruction.suffix(instruction.count - 1))!
            case 1: x += Int(instruction.suffix(instruction.count - 1))!
            case 2: y -= Int(instruction.suffix(instruction.count - 1))!
            case 3: x -= Int(instruction.suffix(instruction.count - 1))!
            default: print("Error: invalid orientation value.")
            }
        case "L": orientation = (orientation - 1)
            if orientation == -1 { orientation = 3 }
            switch orientation {
            case 0: y += Int(instruction.suffix(instruction.count - 1))!
            case 1: x += Int(instruction.suffix(instruction.count - 1))!
            case 2: y -= Int(instruction.suffix(instruction.count - 1))!
            case 3: x -= Int(instruction.suffix(instruction.count - 1))!
            default: print("Error: invalid orientation value.")
            }
        default: print("Error: invalid instruction \(instruction)")
        }
        let visitedPlace = String(format: "%03d:%03d", x, y)
        if visitedPlaces.contains(visitedPlace) {
            return abs(x) + abs(y)
        } else {
            visitedPlaces.append(visitedPlace)
        }
    }
    return abs(x) + abs(y)
}
