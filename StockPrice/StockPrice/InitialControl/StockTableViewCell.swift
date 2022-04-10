//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by Teri Wang on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    var companyName = ""
    var symbol = ""
    
    var sendStockDelegate : SendStockDelegate?
    
    @IBOutlet weak var lblCompany: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func getPrice(_ sender: Any) {
        let currentURL = getStockURL(symbol)
               
        getStockData(url: currentURL).done { currentStockModel in
            self.sendStockDelegate?.sendStockData(currentStockModel)
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
}

