//
//  ResultCaretaker.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 24.02.2021.
//

import Foundation

typealias Memento = Data
typealias Results = [Double]

class ResultCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "results"
    
    func saveResults(_ results: Results) {
        do {
            let data: Memento = try encoder.encode(results)
            UserDefaults.standard.setValue(data, forKey: key)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func loadResults() -> Results {
        guard let data: Memento = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode(Results.self, from: data)
        }
        catch {
            print(error.localizedDescription)
            return []
        }
    }
}
