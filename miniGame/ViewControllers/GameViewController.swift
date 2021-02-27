//
//  GameViewController.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 24.02.2021.
//

import UIKit

class GameViewController: UIViewController {

    weak var gameDelegate: GameDelegate?
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var questLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    var currentQuest: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDelegate = Game.shared
        currentQuest = gameDelegate?.getCurrentQuestion()
        changeQuest()
        
        answer1.titleLabel?.numberOfLines = 3
        answer2.titleLabel?.numberOfLines = 3
        answer3.titleLabel?.numberOfLines = 3
        answer4.titleLabel?.numberOfLines = 3
    }
    
    @IBAction func answerTaped(_ sender: UIButton) {
        gameDelegate?.returnAnswer(sender.titleLabel?.text == currentQuest?.correctAnswer)
        currentQuest = gameDelegate?.getCurrentQuestion()
        changeQuest()
    }
    
    private func changeQuest() {
        guard let quest = currentQuest else {
            let quests = gameDelegate?.getCorrectAnswersCount()
            
            let message = quests?.all == quests?.correct ? "Ты решил все вопросы!" : "Ты ответил неверно...\nрешено \(quests?.correct ?? 0) вопросов из \(quests?.all ?? 0)"
            
            let alertVC = UIAlertController(title: "",
                                            message: message,
                                            preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(
                                title: "ok",
                                style: .cancel,
                                handler: {_ in 
                                    self.dismiss(animated: true, completion: nil)
                                })
            )
            self.show(alertVC, sender: .none)
            return
        }
        
        let progress = gameDelegate?.getCorrectAnswersCount() ?? (correct: 0, all: 0)
        
        infoLabel.text = "Вопрос №\(progress.correct + 1)\nПрогресс: \(String(format: "%0.0f", Double(progress.correct) / Double(progress.all) * 100))%"
        
        questLabel.text = quest.quest
        answer1.setTitle(quest.answers?[0] ?? "", for: .normal)
        answer2.setTitle(quest.answers?[1] ?? "", for: .normal)
        answer3.setTitle(quest.answers?[2] ?? "", for: .normal)
        answer4.setTitle(quest.answers?[3] ?? "", for: .normal)
    }
}
