//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Teri Wang on 2/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblAlert: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressMe(_ sender: Any) {
        var txtField:UITextField?
        
        let alertController = UIAlertController(title: "Simple Alert Controller", message: "Simple Message", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default){action in
            print("OK Button Pressed")
            self.lblAlert.text = txtField?.text
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel){action in
            print("Cancel Button Pressed")
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField{ lblTextField in
            lblTextField.placeholder = "Type Sth."
            txtField = lblTextField
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

