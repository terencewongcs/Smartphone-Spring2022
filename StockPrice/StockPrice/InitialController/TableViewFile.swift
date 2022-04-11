//
//  TableViewFile.swift
//  StockPrice
//
//  Created by Teri Wang on 4/10/22.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = companiesModel?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
        
        guard let companyModel = companiesModel?[indexPath.row] else {return cell}

        cell.lblCompany.text = companyModel.companyName
        cell.lblSymbol.text = companyModel.symbol
        
        cell.companyName = companyModel.companyName
        cell.symbol = companyModel.symbol
        cell.sendStockDelegate = self
        
        return cell

    }
    
    
}
