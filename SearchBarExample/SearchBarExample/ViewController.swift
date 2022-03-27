//
//  ViewController.swift
//  SearchBarExample
//
//  Created by Teri Wang on 3/26/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {

    var foodNames = ["Pad Thai", "Salad","Noodles"]
    
    let searchNames = ["Pad Thai", "Salad","Noodles"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNames.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                
        cell.textLabel?.text = foodNames[indexPath.row]

                
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let text = searchBar.text!
//        let isTextEmpty = text.isEmpty

        guard !searchBar.text!.isEmpty else{
            foodNames = searchNames
            tblView.reloadData()
            return
        }
        print(searchText)
        foodNames = searchNames.filter({ name in
            name.lowercased().contains(searchBar.text!.lowercased())
        })
        
        tblView.reloadData()
    }
    
}

