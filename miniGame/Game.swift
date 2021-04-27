//
//  Game.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 24.02.2021.
//

import Foundation

enum QuestsOrder {
    case random
    case gradual
}

protocol GameDelegate: class {
    func startNewSession()
    
    func getCurrentQuestion() -> Question?
    
    func returnAnswer(_ isCorrect: Bool)
    
    func getResultsString() -> String
    
    func getCorrectAnswersCount() -> (correct: Int, all: Int)
    
    func changeQuestsOrder(with: QuestsOrder)
    
    func getCurrentQuestOrder() -> QuestsOrder
    
    func addNewQuestion(_ question: Question)
}

// MARK: Game
class Game {
    public static let shared = Game()
    private init() {
        results = resultsCaretaker.loadResults()
        userQuests = questionsCaretaker.loadQuestions()
    }
    
    var session: GameSession?
    
    private var createQuestsStrategy: CreateOrderStrategy {
        switch questsOrder {
        case .gradual:
            return GradualOrder()
        case .random:
            return RandomOrder()
        }
    }
    
    var questsOrder: QuestsOrder = .gradual
    
    var results: [Double] = [] {
        didSet {
            resultsCaretaker.saveResults(results)
        }
    }
    
    private var resultsCaretaker = ResultCaretaker()
    private var questionsCaretaker = QuestionsCaretaker()
}

extension Game: GameDelegate {
    func startNewSession() {
        session = GameSession(with: createQuestsStrategy)
    }
    
    func getCurrentQuestion() -> Question? {
        session?.currentQuestion
    }
    
    func returnAnswer(_ isCorrect: Bool) {
        guard let session = session else {
            return
        }
        if session.analyzeAnswerToEndGame(isCorrect) {
            results.append(session.getResult())
        }
    }
    
    func getResultsString() -> String {
        var string = "\n"
        for i in 0..<results.count {
            string.append("\(i + 1): \(results[i].truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%0.0f", results[i]) : String(results[i])) %\n")
        }
        return string
    }
    
    func getCorrectAnswersCount() -> (correct: Int, all: Int) {
        (correct: session?.correctCount ?? 0, all: session?.questsCount ?? 0)
    }
    
    func changeQuestsOrder(with questOrder: QuestsOrder) {
        questsOrder = questOrder
    }
    
    func getCurrentQuestOrder() -> QuestsOrder {
        questsOrder
    }
    
    func addNewQuestion(_ question: Question) {
        userQuests.append(question)
    }
}

