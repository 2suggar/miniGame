//
//  GameSession.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 24.02.2021.
//

import Foundation

private let quests: [Question] = [
    Question(quest: "В какой из этих столиц бывших союзных республик раньше появилось метро?",
             answers: ["Тбилиси", "Ереван", "Баку", "Минск"],
             correctAnswer: "Тбилиси"),
    Question(quest: "Реки с каким названием нет на территории России?",
             answers: ["Шея", "Уста", "Спина", "Палец"],
             correctAnswer: "Спина"),
    Question(quest: "В каком немецком городе родилась будущая императрица России Екатерина II?",
             answers: ["Висбаден", "Цербст", "Штеттин", "Дармштадт"],
             correctAnswer: "Штеттин"),
    Question(quest: "Что запрещал указ, который в 1726 году подписала Екатерина I?",
             answers: ["Точить лясы", "Бить баклуши", "Пускать пыль в глаза", "Переливать из пустого в порожнее"],
             correctAnswer: "Пускать пыль в глаза"),
    Question(quest: "Какое имя не принимал ни один папа римский?",
             answers: ["Валентин", "Евгений", "Георгий", "Виктор"],
             correctAnswer: "Георгий")
]

class GameSession {
    var questsCount = 5
    var correctCount = 0
    
    var currentQuestNumber = 0
    var currentQuestion: Question?
    
    init() {
        currentQuestion = quests[0]
    }
    
    func getResult() -> Double {
        Double(correctCount) / Double(questsCount) * 100
    }
    
    func analyzeAnswerToEndGame(_ isCorrect: Bool) -> Bool {
        if isCorrect {
            correctCount += 1
            currentQuestNumber += 1
            currentQuestion = currentQuestNumber < questsCount ? quests[currentQuestNumber] : nil
        } else {
            currentQuestNumber = 0
            currentQuestion = nil
        }
        
        return currentQuestion == nil
    }
}
