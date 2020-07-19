//
//  ViewController.swift
//  tip
//
//  Created by Kuhu Halder on 7/19/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var billAmountTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        tipPercentageLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        totalView.alpha = 0
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func onTap(_ sender: Any) {
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        if billAmountTextField.text == "" {
            UIView.animate(withDuration: 0.4,
                animations: {
                    self.totalView.alpha = 0
                    self.billView.center.y = 243
                    self.totalView.center.y = 360
                }
            )
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.totalView.alpha = 1
                self.billView.center.y = 85
                self.totalView.center.y = 215
            })
        }
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages=[0.15, 0.18, 0.2]
        //Calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update the tip and total labels
        tipPercentageLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
    }
}

