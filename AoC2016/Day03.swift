//
//  Day03.swift
//  AoC2016
//
//  Created by Marcel Mravec on 17.01.2023.
//

import Foundation

enum Day03: DayChallenge {
    static func part1(_ input: String) -> String {
        "\(day03Part1(input))"
    }

    static func part2(_ input: String) -> String {
        "\(day03Part2(input))"
    }
}

func isTriangle(_ a: Int, _ b: Int, _ c: Int) -> Bool {
    (a + b) > c && (a + c) > b && (b + c) > a
}

func day03Part1(_ input: String) -> String {
    let numbers = input.lines.map { line in
        line.split(separator: " ").compactMap { Int($0) }
    }
    return numbers.filter { isTriangle($0[0], $0[1], $0[2]) }.count.description
}

func aiDay03Part2(_ input: String) -> String {
    let numbers = input.lines.map { line in
        line.split(separator: " ").compactMap { Int($0) }
    }
    // Collect numbers by column and then check triangles
    let count = (0..<3).flatMap { col in
        stride(from: 0, to: numbers.count, by: 3).map { row -> [Int] in
            // Check if we have 3 complete rows
            guard row + 2 < numbers.count else { return [] }
            return [numbers[row][col], numbers[row+1][col], numbers[row+2][col]]
        }
    }
        .filter { !$0.isEmpty && isTriangle($0[0], $0[1], $0[2]) }
        .count
    return "\(count)"
}


func day03Part2(_ input: String) -> String {
    let numbers = input.lines.map { line in
        line.split(separator: " ").compactMap { Int($0) }
    }
    var count = 0
    var flatNumbers = [Int]()
    for col in 0..<3 {
        for row in 0..<numbers.count {
            flatNumbers.append(numbers[row][col])
        }
    }
    for i in stride(from: 0, to: flatNumbers.count, by: 3) {
        if isTriangle(flatNumbers[i], flatNumbers[i + 1], flatNumbers[i + 2]) {
            count += 1
        }
    }
    return "\(count)"
}
