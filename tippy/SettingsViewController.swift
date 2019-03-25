//
//  SettingsViewController.swift
//  tippy
//
//  Created by Ryan Luu on 3/24/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    var tipPercentages: [Double] = [0.1, 0.12, 0.15]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Tip Calc Settings"
        let defaults = UserDefaults.standard
        defaults.set(0.1, forKey: "defaultTipPercentage")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(defaultTipControl.selectedSegmentIndex)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did disappear")
    }
    
    @IBAction func onDefaultTipChanged(_ sender: Any) {
        print(defaultTipControl.selectedSegmentIndex)
        let defaults = UserDefaults.standard
        defaults.set(tipPercentages[defaultTipControl.selectedSegmentIndex], forKey: "defaultTipPercentage")
        defaults.synchronize()
    }
}
