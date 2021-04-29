//
//  Formatter.swift
//  TableViewExample
//
//  Created by Leanid Hubarenka on 29.04.21.
//

import Foundation

class Formatter {
    static func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
