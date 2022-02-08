//
//  ViewController.swift
//  Homework1
//
//  Created by Teri Wang on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func helloButton(_ sender: UIButton) {
        guard let fn = firstName.text else {
            helloLabel.text = "Enter First Name"
                   return
               }
               
               guard let ln = lastName.text
        else {
                   helloLabel.text = "Enter Last Name"
                   return
               }
               
        helloLabel.text = "Hello \(fn) \(ln)"
     
    }
    
    
}

