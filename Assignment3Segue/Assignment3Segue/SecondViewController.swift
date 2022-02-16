//
//  SecondViewController.swift
//  Assignment3Segue
//
//  Created by Xuemeng Gao on 2/15/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    var welcomeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWelcome.text = welcomeStr
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
