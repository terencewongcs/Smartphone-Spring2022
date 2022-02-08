//
//  ViewController.swift
//  Hello Worlf
//
//  Created by Teri Wang on 2/4/22.
//

import UIKit

class HelloWorlfViewController: UIViewController {

    @IBOutlet weak var lblHelloWorlf: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View did load function for the View controller is called")
    }

    @IBAction func clickMeFunction(_ sender: UIButton) {
        print("Button clicked")
        lblHelloWorlf.text = "Clicked"
    }
    
}

