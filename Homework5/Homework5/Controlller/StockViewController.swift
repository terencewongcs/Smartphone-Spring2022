//
//  StockViewController.swift
//  Homework5
//
//  Created by Teri Wang on 3/2/22.
//

import UIKit
import SwiftyJSON
import Alamofire
import SwiftSpinner

class StockViewController: UIViewController {
    @IBOutlet weak var txtSymbol: UITextField!
    
    @IBOutlet weak var lblDCF: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getDCF(_ sender: Any) {
        guard let symbol = txtSymbol.text?.uppercased() else{return}
        
        let url = "\(discountedCashFlowURL)\(symbol)?apikey=\(apikey)"
        
        print(url)
        SwiftSpinner.show("Getting Stock Value for \(symbol)")
        
        AF.request(url).responseJSON{ response in
            SwiftSpinner.hide(nil)
            if response.error != nil{
                print(response.error!)
                return
            }
            let stocks = JSON(response.data!).array
            
            guard let stock = stocks!.first else {return}
            print(stock)
            
            let dcf = DiscountedCashFlow()
            dcf.symbol = stock["symbol"].stringValue
            dcf.date = stock["date"].stringValue
            dcf.dcf = stock["dcf"].floatValue
            dcf.price = stock["Stock Price"].floatValue

            self.lblDCF.text="\(dcf.symbol) DCF: \(dcf.dcf)"
            self.lblPrice.text = "\(dcf.symbol) Price: \(dcf.price)"
        }
    }
    
}
