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

func day02Part1(_ input: String) -> Int {
    let table = ["1241", "2351", "3362", "1574", "2684", "3695", "4877", "5987", "6998"]
    let lines = input.components(separatedBy: .newlines)
    var index = 4
    for line in lines {
        let chars = Array(line)
        for char in chars {
            switch char {
            case "U": index = Int(table[index][1])!
                print(index)
            default: index = 0
            }
        }
    }
    return 0
}

func day02Part2(_ input: String) -> Int {

    return 0
}

