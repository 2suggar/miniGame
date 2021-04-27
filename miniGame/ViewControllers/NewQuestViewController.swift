//
//  NewQuestViewController.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 25.02.2021.
//

import UIKit

class NewQuestViewController: UIViewController {

    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView0: UITextView!
    @IBOutlet weak var answerTextView1: UITextView!
    @IBOutlet weak var answerTextView2: UITextView!
    @IBOutlet weak var answerTextView3: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addTaped(_ sender: Any) {
        guard
            !questionTextView.text.isEmpty,
            !answerTextView0.text.isEmpty,
            !answerTextView1.text.isEmpty,
            !answerTextView2.text.isEmpty,
            !answerTextView3.text.isEmpty
        else {
            let alertVC = UIAlertController(title: "Заполните все поля!", message: "", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            
            show(alertVC, sender: nil)
            return
        }
        
        var newQuestion = Question()
        newQuestion.quest = questionTextView.text
        newQuestion.correctAnswer = answerTextView0.text
        newQuestion.answers = [
            answerTextView0.text,
            answerTextView1.text,
            answerTextView2.text,
            answerTextView3.text
        ]
        
        let gameDelegate: GameDelegate = Game.shared
        gameDelegate.addNewQuestion(newQuestion)
        dismiss(animated: true, completion: nil)
    }
}
