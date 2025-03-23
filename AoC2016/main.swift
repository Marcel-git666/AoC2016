//
//  main.swift
//  AoC2016
//
//  Created by Marcel Mravec on 19.10.2022.
//

import Foundation

func runAllDays() {
    let days: [DayChallenge.Type] = [
        Day01.self,
        Day02.self,
        Day03.self
        // Add more days as you progress
    ]

    for day in days {
        day.run()
        print() // Empty line between days
    }
}

runAllDays()
