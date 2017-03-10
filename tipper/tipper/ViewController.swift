
//  ViewController.swift
//  tipper
//
//  Created by Praveen Thangavelu on 3/4/17.
//  Copyright © 2017 Praveen Thangavelu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    let currFormatter = NumberFormatter()

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalDollarLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var perPersonTipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getUserDefaults()
        billField.becomeFirstResponder()

    }

    @IBAction func changeCurrencyFormatOnEditEnd(_ sender: Any) {
        
        currFormatter.usesGroupingSeparator = true
        
        //currency style
        currFormatter.numberStyle = NumberFormatter.Style.currency
        
        // localize to your grouping and decimal separator
        currFormatter.locale = Locale.current
        
        // Displays double value in the US locale
        billField.text = currFormatter.string(from: Double(billField.text!) as NSNumber? ?? 0)
        
        self.calculateTip(nil)
    }


    private func getUserDefaults() {
        
        let bgColVal = userDefaults.integer(forKey: "bg-color")
        tipPercentControl.selectedSegmentIndex = bgColVal
        
        print(bgColVal)
        
        switch (bgColVal) {
        case 0:
            self.view.backgroundColor = UIColor.white
        case 1:
            self.view.backgroundColor = UIColor.lightGray
        case 2:
            self.view.backgroundColor = UIColor.gray
        default:
            self.view.backgroundColor = UIColor.clear
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserDefaults()
        billField.becomeFirstResponder()
        print("view will appear")
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
        
        //print("Hello");
    }
    
    @IBAction func calculateTip(_ sender: AnyObject? = nil) {
        
        let tipPercentages = [0.18, 0.20, 0.25];
        
        let bill = currFormatter.number(from: billField.text!)?.doubleValue ?? 0
        
        //let bill = Double(billField.text!) ?? 0;
        let tip = bill * tipPercentages[tipPercentControl.selectedSegmentIndex];
        let total = bill + tip;
        let size = partySizeStepper.value;
        let personValue = total / size;
        
        //format can also be done this way
        tipLabel.text = String(format: "$%.2f", tip);
        // to get 2 decimal places for %f, make it .2f
        totalDollarLabel.text = String(format: "$%.2f", total);
        partyLabel.text = String(format: "%.0f", size);
        perPersonTipLabel.text = String(format: "$ %.2f", personValue);
        
        
    }
}

