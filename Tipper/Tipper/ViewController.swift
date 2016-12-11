//
//  ViewController.swift
//  Tipper
//
//  Created by Peter Le on 12/10/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var changed = 0;
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePersonLabel: UILabel!
    @IBOutlet weak var fourPersonLabel: UILabel!
    
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var percentageSEGMENT: UISegmentedControl!
    @IBOutlet weak var container: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        
        container.alpha = 0.0;
        percentageSEGMENT.alpha = 0.0;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func updateTip(sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        var tipPercent = 0.00
        if percentageSEGMENT.selectedSegmentIndex == 0
        {
            tipPercent = 0.10
        }
        else if percentageSEGMENT.selectedSegmentIndex == 1
        {
            tipPercent = 0.15
        }
        else
        {
            tipPercent = 0.20
        }
        tipLabel.text = String(format: "$%.2f", tipPercent*bill)
        totalLabel.text = String(format: "$%.2f", bill*(tipPercent+1))
        twoPersonLabel.text = String(format: "$%.2f", (bill*(tipPercent+1))/2)
        threePersonLabel.text = String(format: "$%.2f", (bill*(tipPercent+1))/3)
        fourPersonLabel.text = String(format: "$%.2f", (bill*(tipPercent+1))/4)
    }

    @IBAction func tap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        if billField.text != "" && changed == 0
        {
            changed = 1
            
            UIView.animateWithDuration(0.2,
                animations: {
                    self.view.frame.origin.y -= 150
                    self.percentageSEGMENT.alpha = 1.0;
                    self.container.alpha = 1.0;
            })
        }
        else if billField.text == ""        {
            changed = 0
            UIView.animateWithDuration(0.2,
                animations: {
                    self.view.frame.origin.y += 150
                    self.percentageSEGMENT.alpha = 0.0;
                    self.container.alpha = 0.0;
            })
        }
        
        let bill = Double(billField.text!) ?? 0
        var tipPercent = 0.00
        if percentageSEGMENT.selectedSegmentIndex == 0
        {
            tipPercent = 0.10
        }
        else if percentageSEGMENT.selectedSegmentIndex == 1
        {
            tipPercent = 0.15
        }
        else
        {
            tipPercent = 0.20
        }
        tipLabel.text = String(format: "$%.2f", tipPercent*bill)
        totalLabel.text = String(format: "$%.2f", bill*(tipPercent+1))
        twoPersonLabel.text = String(format: "$%.2f", (bill*(tipPercent+1))/2)
        threePersonLabel.text = String(format: "$%.2f", (bill*(tipPercent+1))/3)
        fourPersonLabel.text = String(format: "$%.2f", (bill*(tipPercent+1))/4)
    }

}

