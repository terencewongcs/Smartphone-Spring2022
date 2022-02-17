//
//  ViewController.swift
//  TableViewXibFile
//
//  Created by Teri Wang on 2/14/22.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    let images=["Burger","Cheeseburger","GrilledCheese","ChickenBites","Fries","Lemonade"]
    
    let imageLable=["Burger","Cheese Burger","Grilled Cheese","Chicken Bites","Fries","Lemonade"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblImage.text = imageLable[indexPath.row]
        return cell;
    }
    
}

