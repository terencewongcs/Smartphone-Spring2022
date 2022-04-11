//
//  NetworkingFunctions.swift
//  StockPrice
//
//  Created by Teri Wang on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

func getStockURL(_ symbol : String) -> String {
    let url = "\(urlQuote)\(symbol.uppercased())?apikey=\(apiKey)"
    return url
}

func getStockData(url : String) -> Promise<StockModel>{
    return Promise<StockModel> { seal -> Void in
        SwiftSpinner.show("Getting Stock Value...")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            
            // If I am here then I have got the data
            let stocks = JSON(response.data!).array
            guard let stock = stocks!.first else { return}
            //print(stock)
            
            let quote = StockModel("","")
            quote.companyName = stock["name"].stringValue
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["price"].doubleValue
            quote.dayLow = stock["dayLow"].doubleValue
            quote.dayHigh = stock["dayHigh"].doubleValue
            
            seal.fulfill(quote)
        }
    }
}
