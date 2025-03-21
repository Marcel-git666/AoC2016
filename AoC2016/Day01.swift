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
//sscanf(inputArray[i],"%c%d,",where, how_many);
func day01Part2(_ input: String) -> Int {
    var x = 0
    var y = 0
    func isVisited(x: Int, y: Int, visitedPlaces: inout [String]) -> Bool {
        let visitedPlace = String(format: "%03d:%03d", x, y)
        if visitedPlaces.contains(visitedPlace) {
            return true
        } else {
            visitedPlaces.append(visitedPlace)
            return false
        }
    }
    var orientation = 0
    var visitedPlaces: [String] = []
    let inputArray = input.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ", ")
    print(inputArray)
    for instruction in inputArray {
        switch instruction.prefix(1) {
            case "R": orientation = (orientation + 1) % 4
                switch orientation {
                case 0: for _ in 0..<Int(instruction.suffix(instruction.count - 1))! {
                    y += 1
                    if isVisited(x: x, y: y, visitedPlaces: &visitedPlaces) { return abs(x) + abs(y)}
                }
                case 1: for _ in 0..<Int(instruction.suffix(instruction.count - 1))! {
                    x += 1
                    if isVisited(x: x, y: y, visitedPlaces: &visitedPlaces) { return abs(x) + abs(y)}
                }
                case 2: for _ in 0..<Int(instruction.suffix(instruction.count - 1))! {
                    y -= 1
                    if isVisited(x: x, y: y, visitedPlaces: &visitedPlaces) { return abs(x) + abs(y)}
                }
                case 3: for _ in 0..<Int(instruction.suffix(instruction.count - 1))! {
                    x -= 1
                    if isVisited(x: x, y: y, visitedPlaces: &visitedPlaces) { return abs(x) + abs(y)}
                }
                default: print("Error: invalid orientation value R \(orientation).")
                }
            case "L": orientation = (orientation - 1)
                if orientation == -1 { orientation = 3 }
                switch orientation {
                case 0: for _ in 0..<Int(instruction.suffix(instruction.count - 1))! {
                    y += 1
                    if isVisited(x: x, y: y, visitedPlaces: &visitedPlaces) { return abs(x) + abs(y)}
                }
                case 1: for _ in 0..<Int(instruction.suffix(instruction.count - 1))! {
                    x += 1
                    if isVisited(x: x, y: y, visitedPlaces: &visitedPlaces) { return abs(x) + abs(y)}
                }
                case 2: for _ in 0..<Int(instruction.suffix(instruction.count - 1))! {
                    y -= 1
                    if isVisited(x: x, y: y, visitedPlaces: &visitedPlaces) { return abs(x) + abs(y)}
                }
                case 3: for _ in 0..<Int(instruction.suffix(instruction.count - 1))! {
                    x -= 1
                    if isVisited(x: x, y: y, visitedPlaces: &visitedPlaces) { return abs(x) + abs(y)}
                }
                default: print("Error: invalid orientation value L \(orientation).")
                }
            default: print("Error: invalid instruction \(instruction)")
            }
    }
    return abs(x) + abs(y)
}
