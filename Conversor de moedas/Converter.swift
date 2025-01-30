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
            .BRL: 0.1707,
            .EUR: 1.0423,
            .USD: 1,
            .BTC: 104466.9,
            .ETH: 3146.16,
            .SOL: 235.205,
        ]
        //last update 01/29/2025 22:35
        
        guard let rateFrom = rateToUSD[from], let rateTo = rateToUSD[to] else {
            fatalError("Coins not supported")
        }
        
        let result = amount * rateFrom / rateTo
        
        return result
    }
}
