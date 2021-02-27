//
//  ResultsVuewController.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 27.02.2021.
//

import UIKit

class ResultsVuewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameDelegate: GameDelegate = Game.shared
        resultsLabel.text = gameDelegate.getResultsString()
    }

    @IBAction func okTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
