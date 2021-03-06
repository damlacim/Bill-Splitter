//
//  ResultViewController.swift
//  Bill Splitter
//
//  Created by Damla Çim on 23.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: IBOutles
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    //MARK: Global Variables
    
    var split = 0
    var tip = 0
    var result = "0.0"
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    //MARK: IBActions

    @IBAction func recalculatePressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
