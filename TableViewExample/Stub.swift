//
//  Stub.swift
//  TableViewExample
//
//  Created by Leanid Hubarenka on 29.04.21.
//

import Foundation

struct Order {
    let date: Date
    let products: [Product]
}

struct Product {
    let name: String
    let description: String
    let price: Double
}

class Stub {
    private let macbook = Product(name: "MacBook Pro 13", description: "The Apple M1 chip gives the 13‑inch MacBook Pro speed and power beyond belief. With up to 2.8x CPU performance. Up to 5x the graphics speed. Our most advanced Neural Engine for up to 11x faster machine learning. And up to 20 hours of battery life — the longest of any Mac ever. It’s our most popular pro notebook, taken to a whole new level.", price: 1099.99)
    
    private let imac = Product(name: "Apple iMac M1 2021 24", description: "Система на чипе (SoC) \n Чип Apple M1 \n 8‑ядерный процессор \n (4 ядра произво­ди­тель­ности и 4 ядра эффективности) \n 8‑ядерный графический процессор \n 16‑ядерная система Neural Engine", price: 1599.99)
    
    func getOrders() -> [Order] {
        let firstOrder = Order(date: Date(), products: [macbook, imac])
        
        let calendar = Calendar.current
        let twoDaysAgo = calendar.date(byAdding: .day, value: -2, to: Date()) ?? Date()
        let secondOrder = Order(date: twoDaysAgo, products: [macbook])
        return [secondOrder, firstOrder]
    }
}
