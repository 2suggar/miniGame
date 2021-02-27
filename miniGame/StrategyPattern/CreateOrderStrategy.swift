//
//  CreateOrderStrategy.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 27.02.2021.
//

import Foundation

protocol CreateOrderStrategy {
    func createOrder(with quests: [Question]) -> [Question]
}

class RandomOrder: CreateOrderStrategy {
    func createOrder(with quests: [Question]) -> [Question] {
        quests.shuffled()
    }
    
    
}

class GradualOrder: CreateOrderStrategy {
    func createOrder(with quests: [Question]) -> [Question] {
        quests
    }
}
