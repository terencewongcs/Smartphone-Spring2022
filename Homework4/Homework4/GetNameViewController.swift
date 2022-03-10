//
//  GetNameViewController.swift
//  Homework4
//
//  Created by Teri Wang on 2/17/22.
//

import UIKit

protocol SendFirstAndLastNameDelegate{
    func setFirstAndLastNameDelegate(FN : String, LN : String)
    func setWelcomeText(welcomeText : String)
}

class GetNameViewController: UIViewController {
    
    var firstName : String?
    var lastName : String?
    
    var sendFirstAndLastNameDelegate : SendFirstAndLastNameDelegate?
    

    @IBOutlet weak var txtFN: UITextField!
    
    @IBOutlet weak var txtLN: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let firstName = firstName else {
                    return
                }

                guard let lastName = lastName else {
                    return
                }

                txtFN.text = firstName
                txtLN.text = lastName
    }
    

    @IBAction func saveName(_ sender: Any) {
        guard let FN = txtFN.text else{return}
        guard let LN = txtLN.text else{return}
        
        sendFirstAndLastNameDelegate?.setFirstAndLastNameDelegate(FN: FN, LN: LN)
        sendFirstAndLastNameDelegate?.setWelcomeText(welcomeText: "Welcome \(FN) \(LN)")
        self.navigationController?.popViewController(animated: true)
    }
    

}
