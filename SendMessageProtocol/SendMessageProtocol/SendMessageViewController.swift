//
//  SendMessageViewController.swift
//  SendMessageProtocol
//
//  Created by Teri Wang on 3/10/22.
//

import UIKit

class SendMessageViewController: UIViewController {

    @IBOutlet weak var txtMessage: UITextField!
    var sendMessageDelegate : SendMessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func sendMessage(_ sender: Any) {
        sendMessageDelegate?.sendMessage(message: txtMessage.text!)
        self.navigationController?.popViewController(animated: true)
        
    }
}
