//
//  AddStockViewController.swift
//  StockPrice
//
//  Created by Teri Wang on 4/10/22.
//

import UIKit

protocol SendDataBackDelegate {
    func addStockToArr(str : String)
}

class AddStockViewController: UIViewController {

    @IBOutlet weak var txtSymbol: UITextField!
    
    var sendDatabackDelegate : SendDataBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func addStockAction(_ sender: Any) {
        guard let symbol = txtSymbol.text else {return }
        
        sendDatabackDelegate?.addStockToArr(str: symbol)
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
