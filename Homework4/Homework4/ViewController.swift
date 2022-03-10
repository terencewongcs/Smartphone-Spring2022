//
//  ViewController.swift
//  Homework4
//
//  Created by Teri Wang on 2/17/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameDelegate {

    @IBOutlet weak var lblFN: UILabel!
    @IBOutlet weak var lblLN: UILabel!
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getName(_ sender: Any) {
        performSegue(withIdentifier: "segueGetName", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetName"{
            let secondVC = segue.destination as! GetNameViewController
            guard let firstName = lblFN.text else{return}
            guard let lastName = lblLN.text else{return}
                        
            secondVC.firstName = firstName
            secondVC.lastName = lastName
            
            secondVC.sendFirstAndLastNameDelegate = self
            
        }
    }
    func setFirstAndLastNameDelegate(FN: String, LN: String) {
           lblFN.text = FN
           lblLN.text = LN
       }
    func setWelcomeText(welcomeText: String) {
           lblWelcome.text=welcomeText
    }
    
    
}

