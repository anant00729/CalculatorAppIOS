//
//  ViewController.swift
//  CalculatorApp
//
//  Created by anant awasthy on 10/25/17.
//  Copyright © 2017 anant awasthy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberToBeRead : Double = 0
    var previoseNumber : Double = 0
    var isPerformingMath: Bool = false
    var operation = 0
    
    @IBOutlet weak var in_view_numbers: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if isPerformingMath == true {
            in_view_numbers.text = String(sender.tag-1)
            numberToBeRead = Double(in_view_numbers.text!)!
            isPerformingMath = false
        }else {
            in_view_numbers.text = in_view_numbers.text! + String(sender.tag-1)
            numberToBeRead = Double(in_view_numbers.text!)!
        }
        
        
    }
    
    @IBAction func onPerfiormOperation(_ sender: UIButton) {
        
        if in_view_numbers.text != "" &&  sender.tag != 16 && sender.tag != 11 {
            previoseNumber = Double(in_view_numbers.text!)!
            
            if sender.tag == 12 {
                in_view_numbers.text = "/"
            }else if sender.tag == 13 {
                in_view_numbers.text = "*"
            }else if sender.tag == 14 {
                in_view_numbers.text = "-"
            }else if sender.tag == 15 {
                in_view_numbers.text = "+"
            }
            operation = sender.tag
            isPerformingMath = true
        }else if sender.tag == 16{ // on pressing the equals button
            if operation == 12 {
                in_view_numbers.text = String(numberToBeRead / previoseNumber)
            } else if operation == 13 {
                in_view_numbers.text = String(numberToBeRead * previoseNumber)
            }else if operation == 14 {
                in_view_numbers.text = String(numberToBeRead - previoseNumber)
            }else if operation == 15 {
                in_view_numbers.text = String(numberToBeRead + previoseNumber)
            }
            
        }else if sender.tag == 11 {
            in_view_numbers.text = ""
            numberToBeRead = 0
            previoseNumber = 0
            operation = 0
        }
    }
    
}

