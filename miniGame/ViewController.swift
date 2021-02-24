//
//  ViewController.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 24.02.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "play" else {
            return
        }
        
        Game.shared.session = GameSession()
        
    }

    @IBAction func showResults(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "Результаты игр:",
                                        message: Game.shared.getResultsString(),
                                        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(
                            title: "ok",
                            style: .cancel,
                            handler: nil)
        )
        self.show(alertVC, sender: .none)
    }
}

