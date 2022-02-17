//
//  SecondViewController.swift
//  SegueExample
//
//  Created by Teri Wang on 2/16/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    
    var welcomeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLbl.text=welcomeStr
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
