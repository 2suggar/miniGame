//
//  Game.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 24.02.2021.
//

import Foundation

protocol GameDelegate: class {
    
    func getCurrentQuestion() -> Question?
    
    func returnAnswer(_ isCorrect: Bool)
    
    func getResultsString() -> String
}

class Game {
    public static let shared = Game()
    private init() {
        results = resultsCaretaker.loadResults()
    }
    
    var session: GameSession? {
        didSet {
            guard session != nil else {
                return
            }
        }
    }
    
    var results: [Double] = [] {
        didSet {
            resultsCaretaker.saveResults(results)
        }
    }
    
    private var resultsCaretaker = ResultCaretaker()
}

extension Game: GameDelegate {
    func getCurrentQuestion() -> Question? {
        session?.currentQuestion
    }
    
    func returnAnswer(_ isCorrect: Bool) {
        guard let session = session else {
            return
        }
        if session.analyzeAnswerToEndGame(isCorrect) {
            results.append(session.getResult())
            self.session = nil
        }
    }
    
    func getResultsString() -> String {
        var string = "\n"
        for i in 0..<results.count {
            string.append("\(i + 1): \(results[i].truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%0.0f", results[i]) : String(results[i])) %\n")
        }
        return string
    }
}

