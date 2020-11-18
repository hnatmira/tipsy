//
//  ResultsViewController.swift
//  tipsy
//
//  Created by Miroslav Hnát on 28/10/2020.
//

import UIKit

class ResultsViewController: UIViewController {

//    var tips: String
//    var splitNumber: String
    var finalBill: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = finalBill
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
