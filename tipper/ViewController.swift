//
//  ViewController.swift
//  tipper
//
//  Created by drishi on 9/4/17.
//  Copyright © 2017 Droan Rishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let intValue = getDefaultTip()
        tipControl.selectedSegmentIndex = intValue
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getDefaultTip() -> Int {
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: "defaultTip")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
        let intValue = getDefaultTip()
        tipControl.selectedSegmentIndex = intValue
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
        
    }

}

