//
//  ViewController.swift
//  StockPrice
//
//  Created by Teri Wang on 4/10/22.
//

import UIKit

class ViewController: UIViewController,SendStockDelegate {
    var companiesModel: [StockModel]?
    
    
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblDayLow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        companiesModel = initializeCompanies()
    }
            
    func initializeCompanies() -> [StockModel]{
        let AAPL = StockModel("Apple", "AAPL");
        let FB = StockModel("Facebook", "FB");
        let TSLA = StockModel("Tesla", "TSLA");
        let GOOG = StockModel("Google", "GOOG");
        let MSFT = StockModel("Microsoft", "MSFT");
        let NVDA = StockModel("NVIDIA", "NVDA");
        let INTC = StockModel("Intel", "INTC");
        let HPQ = StockModel("HP", "HPQ");
        let CEMEX = StockModel("CX", "CEMEX");
        let F = StockModel("Ford", "D");
        let SNAP = StockModel("Snap", "SNAP");
        
        var modelArr = [StockModel]()
    
        modelArr.append(AAPL)
        modelArr.append(FB)
        modelArr.append(TSLA)
        modelArr.append(GOOG)
        modelArr.append(MSFT)
        modelArr.append(NVDA)
        modelArr.append(INTC)
        modelArr.append(HPQ)
        modelArr.append(CEMEX)
        modelArr.append(F)
        modelArr.append(SNAP)

        return modelArr
    }
    
    func sendStockData(_ currentStockModel: StockModel) {
        lblCompanyName.text = "\(currentStockModel.companyName)"
        lblSymbol.text = "\(currentStockModel.symbol)"
        lblPrice.text = "Price: \(currentStockModel.price) $"
        lblDayLow.text = "Day Low \(currentStockModel.dayLow) $"
        lblDayHigh.text = "Day High \(currentStockModel.dayHigh) $"
    }

}

