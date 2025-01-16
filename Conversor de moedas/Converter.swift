//
//  Converter.swift
//  Conversor de moedas
//
//  Created by Pedro Henrique Freire de Oliveira on 15/01/25.
//

import Foundation

enum Coins: String, CaseIterable {
    case BRL = "BRL"
    case EUR = "EUR"
    case USD = "USD"
    case BTC = "BTC"
    case ETH = "ETH"
    case SOL = "SOL"
}

struct Converter {
    func convert(amount: Double, from: Coins, to: Coins) -> Double {
        guard from != to else { return amount }
        
        let rateToUSD: [Coins: Double] = [
            .BRL: 0.016,
            .EUR: 1.03,
            .USD: 1,
            .BTC: 100000,
            .ETH: 3400,
            .SOL: 203,
        ]
        
        guard let rateFrom = rateToUSD[from], let rateTo = rateToUSD[to] else {
            fatalError("Coins not supported")
        }
        
        let result = amount * rateFrom / rateTo
        
        return result
    }
}
