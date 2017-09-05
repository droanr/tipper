//
//  SettingsViewController.swift
//  tipper
//
//  Created by drishi on 9/4/17.
//  Copyright © 2017 Droan Rishi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaultTip")
        defaultControl.selectedSegmentIndex = intValue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
