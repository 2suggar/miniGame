//
//  ViewController.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 24.02.2021.
//

import UIKit

enum Const {
    enum Segue {
        static let toPlay: String = "play"
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Const.Segue.toPlay else {
            return
        }
        
        let gameDelegate: GameDelegate = Game.shared
        gameDelegate.startNewSession()
        
    }
}

