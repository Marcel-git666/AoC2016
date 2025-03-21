//
//  Day01.swift
//  AoC2016
//
//  Created by Marcel Mravec on 17.01.2023.
//

import Foundation

enum Day01 {
    static func run() {
        let input = try! readFile("day01.input")
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
        let direction = instruction.prefix(1)
        let steps = Int(instruction.dropFirst())!
        if direction == "R" {
            orientation = (orientation + 1) % 4
        } else {
            orientation = (orientation - 1 + 4) % 4
        }
        switch orientation {
        case 0: y += steps
        case 1: x += steps
        case 2: y -= steps
        case 3: x -= steps
        default: print("Error: invalid orientation value.")
        }
    }
    return abs(x) + abs(y)
}
//sscanf(inputArray[i],"%c%d,",where, how_many);
func day01Part2(_ input: String) -> Int {
    var x = 0
    var y = 0
    var visitedPlaces = Set<String>()
    var orientation = 0
    let inputArray = input.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ", ")
    visitedPlaces.insert("\(x):\(y)")
    print(inputArray)
    for instruction in inputArray {
        let direction = instruction.prefix(1)
        let steps = Int(instruction.dropFirst())!

        // Změna orientace
        if direction == "R" {
            orientation = (orientation + 1) % 4
        } else {
            orientation = (orientation - 1 + 4) % 4
        }

        // Pohyb po jednom kroku a kontrola návštěv
        for _ in 0..<steps {
            switch orientation {
            case 0: y += 1
            case 1: x += 1
            case 2: y -= 1
            case 3: x -= 1
            default: print("Error: invalid orientation value.")
            }

            let position = "\(x):\(y)"
            if visitedPlaces.contains(position) {
                return abs(x) + abs(y)
            }
            visitedPlaces.insert(position)
        }
    }
    return abs(x) + abs(y)
}
