//
//  CustomizationViewController.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 25.02.2021.
//

import UIKit

class CustomizationViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    private let gameDelegate: GameDelegate = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentOrder = gameDelegate.getCurrentQuestOrder()
        segmentControl.selectedSegmentIndex = currentOrder == .gradual ? 0 : 1
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        let questOrder: QuestsOrder = segmentControl.selectedSegmentIndex == 0 ? .gradual : .random
        gameDelegate.changeQuestsOrder(with: questOrder)
        
        dismiss(animated: true, completion: nil)
    }
}
