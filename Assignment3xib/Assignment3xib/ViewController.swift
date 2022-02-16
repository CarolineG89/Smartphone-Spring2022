//
//  ViewController.swift
//  Assignment3xib
//
//  Created by Xuemeng Gao on 2/15/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var name : String?
    
    @IBOutlet weak var tblView: UITableView!
    
    let images = ["burger", "fries", "pad thai", "pasta", "ramen", "salad", "sashimi", "steak", "sushi", "taco"]
       
    let imageNames = ["Burger", "Fries", "Pad thai", "Pasta", "Ramen", "Salad", "Sashimi", "Steak", "Sushi", "Taco"]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblImage.text = imageNames[indexPath.row]
        
        return cell
    }
}

