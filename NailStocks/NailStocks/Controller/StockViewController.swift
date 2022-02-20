//
//  StockViewController.swift
//  NailStocks
//
//  Created by Teri Wang on 2/20/22.
//

import UIKit
import SwiftyJSON
import Alamofire
import SwiftSpinner

class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    @IBOutlet weak var lblStockPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockPrice(_ sender: Any) {
        guard let symbol = txtStockSymbol.text?.uppercased() else{return}
        
        let url = "\(shortQuoteURL)\(symbol)?apikey=\(apikey)"
        
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
            
            let quote = QuoteShort()
            quote.symbol = stock["symbol"].stringValue
            quote.volume = stock["volume"].intValue
            quote.price = stock["price"].floatValue
            
            self.lblStockPrice.text = "\(quote.symbol) : \(quote.price) $"
        }
    }
    
}

