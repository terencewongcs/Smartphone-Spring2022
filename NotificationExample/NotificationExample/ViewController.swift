//
//  ViewController.swift
//  NotificationExample
//
//  Created by Teri Wang on 3/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblFN: UILabel!
    @IBOutlet weak var lblLN: UILabel!
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToNotification()
    }

    @IBAction func goToProfile(_ sender: Any) {
        performSegue(withIdentifier: "segueProfile", sender: self)
    }
    
    @IBAction func goToFormEntry(_ sender: Any) {
        performSegue(withIdentifier: "segueFormEntry", sender: self)
    }
    @objc func getName(notif : NSNotification){
        print("I am here")
        
        if let dict = notif.userInfo as NSDictionary?{
            if let firstName = dict["FirstName"] as? String{
                lblFN.text = firstName
            }
            if let lastName = dict["LastName"] as? String{
                lblLN.text = lastName
            }
        }
        
    }
    
    func subscribeToNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getName), name: nameNotif, object: nil)
    }
}
