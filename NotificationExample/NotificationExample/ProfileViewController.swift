//
//  ProfileViewController.swift
//  NotificationExample
//
//  Created by Teri Wang on 3/10/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var txtFN: UITextField!
    
    @IBOutlet weak var txtLN: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        guard let FN = txtFN.text else{return}
        guard let LN = txtLN.text else{return}

        let firstAndLastName : [String: String] = ["FirstName" : FN,
                                                   "LastName" : LN]
        NotificationCenter.default.post(name: nameNotif, object: nil, userInfo: firstAndLastName)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
