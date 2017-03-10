//
//  SettingsViewController.swift
//  tipper
//
//  Created by Praveen Thangavelu on 3/4/17.
//  Copyright © 2017 Praveen Thangavelu. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipSegmentControl: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard
    
    @IBAction func setDefaultTip(_ sender: Any) {
        
        
        switch (tipSegmentControl.selectedSegmentIndex) {
            
        case 0:
            self.view.backgroundColor = UIColor.white
        case 1:
            self.view.backgroundColor = UIColor.lightGray
        case 2:
            self.view.backgroundColor = UIColor.gray
        default:
            self.view.backgroundColor = UIColor.clear
        }
        
        let bgColor = tipSegmentControl.selectedSegmentIndex
        userDefaults.set(bgColor, forKey: "bg-color")
        userDefaults.synchronize()
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgColVal = userDefaults.integer(forKey: "bg-color")
        tipSegmentControl.selectedSegmentIndex = bgColVal
        
        
        switch (bgColVal) {
            
        case 0:
            self.view.backgroundColor = UIColor.lightGray
        case 1:
            self.view.backgroundColor = UIColor.gray
        case 2:
            self.view.backgroundColor = UIColor.darkGray
        default:
            self.view.backgroundColor = UIColor.clear
        }
        

    }
  
   // Do any additional setup after loading the view.
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
