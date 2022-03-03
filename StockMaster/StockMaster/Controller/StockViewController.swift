//
//  StockViewController.swift
//  StockMaster
//
//  Created by Teri Wang on 2/27/22.
//

import UIKit
import RealmSwift
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(Realm.Configuration.defaultConfiguration.fileURL?.path)
        loadStockValues()
    
    }
    
    @IBAction func addTslaAction(_ sender: Any) {
        //print("add Tsla Stock to Realm")
        let stock = StockShort()
        stock.symbol = "TSLA"
        stock.price = 120.196
        stock.volume = 332607163
        do {
            let realm = try Realm()
            try realm.write({
                realm.add(stock, update: .modified)
            })
        }catch{
            print("Error in writing to db")
        }
    }


    
    
    func loadStockValues(){
        do{
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            
            print(stocks)
            
            for stock in stocks{
                print(stock.symbol)
            }
        }catch{
            print("Erroe in reading from Realm")
        }
    }
    
    func getStock(symbol : String) -> StockShort{
        do{
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            
            //print(stocks)
            
            for stock in stocks{
                if stock.symbol == symbol{
                    return stock
                }
                    
            }
        }catch{
            print("Erroe in reading from Realm")
        }
        return StockShort()
    }
    
    func deleteStockFromDB(stock : StockShort){
        do{
            let realm = try Realm()
            try realm.write({
                realm.delete(stock)
            })
        }catch{
            print("Unable to delete from Realm DB")
        }
    }
    @IBAction func deleteTSLAStock(_ sender: Any) {
        let tsla = getStock(symbol: "")
        deleteStockFromDB(stock: tsla)
    }
    
    func addStockToDB(symbol : String){
        let url = "\(urlShortQuote)\(symbol.uppercased())?apikey=\(apiKey)"
        
        print(url)
        let stock = StockShort()
        stock.symbol = symbol.uppercased()
        //SwiftSpinner.show("Getting Stock Value for \(symbol)")
        AF.request(url).responseJSON { response in
            //SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            // If I am here then I have got the data
            
            let stocks = JSON(response.data!).array
            
            guard let stockFirst = stocks!.first else { return}
            print(stockFirst)
            
            let stockSymbol : String = stockFirst["symbol"].stringValue
            let stockPrice : Float = stockFirst["price"].floatValue
            let stockVolume : Int = stockFirst["volume"].intValue
            
            
            stock.price = stockPrice!
            stock.volume = stockVolume!
            
        }
        
        
        do {
            let realm = try Realm()
            try realm.write({
                realm.add(stock, update: .modified)
            })
        }catch{
            print("Error in writing to db")
        }
    }
    
    @IBAction func addStocksAction(_ sender: Any) {
        var txtField : UITextField?
        
        let alertController = UIAlertController(title: "Add Stock", message: "", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default) { action in
            guard let symbol = txtField?.text else {
                return
            }
                    
            self.addStockToDB(symbol: symbol)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField { stockTextField in
            stockTextField.placeholder = "Type Stock Symbol"
            txtField = stockTextField
            
        }
        
        self.present(alertController, animated: true, completion: nil)

        
        
        
        
    }
    
}
