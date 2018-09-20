//
//  ViewController.swift
//  One Rep Max
//
//  Created by Student on 9/17/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var repsTF: UITextField!
    
    @IBOutlet weak var epleyLBL: UILabel!
    @IBOutlet weak var brzyckiLBL: UILabel!
    @IBOutlet weak var mcglothinLBL: UILabel!
    @IBOutlet weak var lombardiLBL: UILabel!
    @IBOutlet weak var mayhewLBL: UILabel!
    @IBOutlet weak var avgerageLBL: UILabel!
    
    @IBAction func claculateBtn(_ sender: Any) {
        if let weight = Double(weightTF.text!), let reps = Double(repsTF.text!) {
            let epley = weight * ( 1 + ( reps/30) )
            epleyLBL.text = String(format:"%.2f", epley)
            
            let brzycki = weight * (36/(37-reps))
            brzyckiLBL.text = String(format:"%.2f", brzycki)
            
            
            let mcglothin = (100 * weight)/(101.3 - 2.67123*reps)
            mcglothinLBL.text = String(format:"%.2f", mcglothin)
            
            let lombardi = weight * pow(reps, 0.10)
            lombardiLBL.text = String(format:"%.2f", lombardi)
            
            let mayhew = (100*weight)/(52.2 + 41.9 * exp(-0.055*reps))
            mayhewLBL.text = String(format:"%.2f", mayhew)
            
            let average = (epley+brzycki+mcglothin+lombardi+mayhew)/5
            avgerageLBL.text = String(format:"%.2f", average)
            
            let avg = average * 0.05 + average
            
            if epley > avg {
                epleyLBL.textColor = UIColor.red
            }
            if brzycki > avg{
                brzyckiLBL.textColor = UIColor.red
            }
            if mcglothin > avg {
                mcglothinLBL.textColor = UIColor.red
            }
            if lombardi > avg {
                lombardiLBL.textColor = UIColor.red
            }
            if mayhew > avg {
                mayhewLBL.textColor = UIColor.red
            }
            
        } else {
            let  alert  =  UIAlertController(title: "Error",message: "Enter valid input",  preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion:  nil)
        }
        
    }
    
    @IBAction func clearAllBtn(_ sender: Any) {
        weightTF.text = ""
        repsTF.text = ""
        
        epleyLBL.text = "0.00"
        brzyckiLBL.text = "0.00"
        mcglothinLBL.text = "0.00"
        lombardiLBL.text = "0.00"
        mayhewLBL.text = "0.00"
        avgerageLBL.text = "0.00"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

