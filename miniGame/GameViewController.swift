//
//  GameViewController.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 24.02.2021.
//

import UIKit

class GameViewController: UIViewController {

    weak var gameDelegate: GameDelegate?
    
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
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        questLabel.text = quest.quest
        answer1.setTitle(quest.answers?[0] ?? "", for: .normal)
        answer2.setTitle(quest.answers?[1] ?? "", for: .normal)
        answer3.setTitle(quest.answers?[2] ?? "", for: .normal)
        answer4.setTitle(quest.answers?[3] ?? "", for: .normal)
    }
}
