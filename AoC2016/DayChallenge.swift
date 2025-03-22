//
//  DayChallenge.swift
//  AoC2016
//
//  Created by Marcel Mravec on 21.03.2025.
//

import Foundation

protocol DayChallenge {
    static func run()
    static func part1(_ input: String) -> String  // Using String for flexibility
    static func part2(_ input: String) -> String
}

// Base implementation
extension DayChallenge {
    static func run() {
        let dayNumber = String(String(describing: Self.self).dropFirst(3))
        print("--- Day \(dayNumber) ---")

        do {
            let testInput = try readFile("day\(dayNumber).test")
            let realInput = try readFile("day\(dayNumber).input")

            print("Part 1 (Test): \(part1(testInput))")
            print("Part 1 (Real): \(part1(realInput))")

            print("Part 2 (Test): \(part2(testInput))")
            print("Part 2 (Real): \(part2(realInput))")
        } catch {
            print("Error: \(error)")
        }
    }
}
