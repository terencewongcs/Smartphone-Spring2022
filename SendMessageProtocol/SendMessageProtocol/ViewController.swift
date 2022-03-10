//
//  ViewController.swift
//  SendMessageProtocol
//
//  Created by Teri Wang on 3/10/22.
//

import UIKit

class ViewController: UIViewController, SendMessageDelegate {
    
    @IBOutlet weak var lblWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getMessage(_ sender: Any) {
        performSegue(withIdentifier: "segueSendMessage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSendMessage"{
            let secondVC = segue.destination as! SendMessageViewController
            
            secondVC.sendMessageDelegate = self
        }
    }
    
    func sendMessage(message: String) {
        lblWelcome.text = message
    }
    

}

