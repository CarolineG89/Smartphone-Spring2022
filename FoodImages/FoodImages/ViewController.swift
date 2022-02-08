//
//  ViewController.swift
//  FoodImages
//
//  Created by Xuemeng Gao on 2/7/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let images = ["burger", "fries", "pad thai", "pasta", "ramen", "salad", "sashimi", "steak", "sushi", "taco"]
    
    let imageNames = ["Burger", "Fries", "Pad thai", "Pasta", "Ramen", "Salad", "Sashimi", "Steak", "Sushi", "Taco"]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = imageNames[indexPath.row]
        return cell
    }
    
}

