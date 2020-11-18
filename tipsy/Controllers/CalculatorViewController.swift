//
//  CalculatorViewController.swift
//  tipsy
//
//  Created by Miroslav Hnát on 22/10/2020.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var finalBill = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleWithoutPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleWithoutPercentSign)!
        tip = buttonTitleAsNumber / 100
    }
    
    @IBAction func stepperValuesChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        let bill: Double = Double(billTextField.text!) ?? 0.0
        let splitValue = Double(splitNumberLabel.text!)!
        
        finalBill = (((bill) + (bill * tip))/splitValue)
        
        print(String(format: "%.2f", finalBill))
        
        performSegue(withIdentifier: "goToAmount", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAmount" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalBill = String(finalBill)
            print("debugPrint: \(finalBill)")
        }
    }
    
}

