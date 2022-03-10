//
//  ViewController.swift
//  ProtocolAndDelegate
//
//  Created by Teri Wang on 3/9/22.
//

import UIKit



class ViewController: UIViewController, SendFirstAndLastNameDelegate, SendMessageDelegate {
    
    
    
    
        
    @IBOutlet weak var lblFN: UILabel!
    @IBOutlet weak var lblLN: UILabel!
    
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getNameFromUser(_ sender: Any) {
        performSegue(withIdentifier: "segueGetName", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetName" {
            let getNameVC = segue.destination as! GetNameViewController
            guard let firstName = lblFN.text else{return}
            guard let lastName = lblLN.text else{return}
            
            getNameVC.firstName = firstName
            getNameVC.lastName = lastName
            
            getNameVC.sendMessageDelegate = self
        }
    }
    
    func setFirstAndLastNameDelegate(FN: String, LN: String) {
        lblFN.text = FN
        lblLN.text = LN
    }
    func setWelcomeText(welcomeText: String) {
        lblWelcome.text=welcomeText
    }
    func sendMessage(message: String) {
        //printContent(message)
        lblWelcome.text = message
    }
}

