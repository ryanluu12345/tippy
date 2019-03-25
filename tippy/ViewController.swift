//
//  ViewController.swift
//  tippy
//
//  Created by Ryan Luu on 3/22/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages: [Double] = [0.10, 0.18, 0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultTipPercentage(percentage: tipPercentages[0])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTipPercentage = defaults.double(forKey: "defaultTipPercentage")
        setDefaultTipPercentage(percentage: defaultTipPercentage)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get the bill
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update the tip and total
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    //Sets the default tip percentage in the array and the UI segment
    func setDefaultTipPercentage(percentage: Double) {
        tipPercentages[0] = percentage
        let tipPercentageString = String(Int(percentage * 100)) + "%"
        tipControl.setTitle(tipPercentageString, forSegmentAt: 0)
    }
}

