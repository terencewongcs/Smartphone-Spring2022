//
//  ViewController.swift
//  Homework2
//
//  Created by Teri Wang on 2/7/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let images = ["Burger","Cheeseburger","GrilledCheese","ChickenBites","Fries","Lemonade"]
       
       let imageNames = ["Burger","Cheese Burger","Grilled Cheese","Chicken Bites","Fries","Lemonade"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()
            tblView.delegate = self
            tblView.dataSource = self
         
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return images.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
            cell.imageViewCell.image = UIImage(named: images[indexPath.row])
            cell.lblCell.text = imageNames[indexPath.row]
            
            return cell
        }
        

}

