//
//  QuestionsCaretaker.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 27.02.2021.
//

import Foundation

class QuestionsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questions"
    
    func saveQuestions(_ questions: [Question]) {
        do {
            let data: Memento = try encoder.encode(questions)
            UserDefaults.standard.setValue(data, forKey: key)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func loadQuestions() -> [Question] {
        guard let data: Memento = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Question].self, from: data)
        }
        catch {
            print(error.localizedDescription)
            return []
        }
    }
}
