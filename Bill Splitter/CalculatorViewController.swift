//
//  ViewController.swift
//  Bill Splitter
//
//  Created by Damla Çim on 28.02.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: IBOutles

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    
    //MARK: Global Variables
    
    var tip = 0.10
    var billTotal = 0.0
    var numberOfPeople = 0
    var finalResult = "0.0"
   
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitNumberLabel.text = "0"

    }
    
    //MARK: IBActions
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitlePercSign = String(buttonTitle.dropLast())
        let buttonTitleNumber = Double(buttonTitlePercSign)!
        tip = buttonTitleNumber / 100
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.maximumValue = 12
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
        
        //alert oluştur
        let alertController = UIAlertController(title: "Warning!", message: "You have reached the limit.", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(actionCancel)
        if splitNumberLabel.text == "12" {
            self.present(alertController, animated: true, completion: nil)
        }
    }

    @IBAction func calculatePressed(_ sender: Any) {
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let tipAmount = billTotal * tip
            let result = (billTotal + tipAmount) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        performSegue(withIdentifier: "goToResultViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultViewController" {
            let resultViewController = segue.destination as? ResultViewController
            resultViewController?.result = finalResult
            resultViewController?.tip = Int(tip * 100)
            resultViewController?.split = numberOfPeople
        }
    }
    
}

