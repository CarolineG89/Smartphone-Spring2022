//
//  ViewController.swift
//  Assignment4
//
//  Created by Xuemeng Gao on 2/22/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameDelegate {
    
    func setFirstAndLastName(firstName: String, lastName: String) {
            lblLastName.text = lastName
            lblFirstName.text = firstName
    }
        
    func setWelcomeText(welcomtText: String) {
            lblWelcome.text = welcomtText
    }

    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetName" {
            let getNameVC = segue.destination as! GetNameViewController
                
            guard let firstName = lblFirstName.text else {return}
            guard let lastName = lblLastName.text else {return}
                
        
            getNameVC.firstName = firstName
            getNameVC.lastName = lastName
                
            getNameVC.sendFirstAndLastNameDelegate = self
            }
        }

    @IBAction func getNameFromUser(_ sender: Any) {
        performSegue(withIdentifier: "segueGetName", sender: self)
    }
    
}

