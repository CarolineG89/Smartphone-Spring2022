//
//  GetNameViewController.swift
//  Assignment4
//
//  Created by Xuemeng Gao on 2/22/22.
//

import UIKit


protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName: String)
    func setWelcomeText(welcomtText: String)
}



class GetNameViewController: UIViewController {
    var firstName : String?
    var lastName : String?
    var sendFirstAndLastNameDelegate : SendFirstAndLastNameDelegate?

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard firstName != nil else{return}
        guard lastName != nil else{return}

        
        // Do any additional setup after loading the view.
    }
    


    @IBAction func saveName(_ sender: Any) {
        guard let firstName = txtFirstName.text else{return}
        guard let lastName = txtLastName.text else{return}
               
        sendFirstAndLastNameDelegate?.setFirstAndLastName(firstName: firstName, lastName: lastName)
        sendFirstAndLastNameDelegate?.setWelcomeText(welcomtText: "Welcome, \(firstName), \(lastName)!")
               
        self.navigationController?.popViewController(animated: true)
    }
    
}
