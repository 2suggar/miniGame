//
//  Question.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 24.02.2021.
//

import Foundation

struct Question: Codable {
    var quest: String?
    var answers: [String]?
    var correctAnswer: String?
}
