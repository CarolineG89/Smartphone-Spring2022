//
//  ViewController.swift
//  BMICalculator
//
//  Created by Xuemeng Gao on 5/3/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var chooseUnits: UIPickerView!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeightFeet: UITextField!
    @IBOutlet weak var txtHeightInches: UITextField!
    @IBOutlet weak var lblBMI: UILabel!
    
    
    @IBOutlet weak var lblHealthFact: UILabel!
    
    let units = ["Imperial System", "Metric System"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseUnits.delegate = self
        chooseUnits.dataSource = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return units.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return units[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (units[row] == "Imperial System"){
            txtWeight.placeholder = "lbs"
            txtHeightFeet.placeholder = "feet"
            txtHeightInches.isHidden = false
        } else {
            txtWeight.placeholder = "kg"
            txtHeightFeet.placeholder = "cm"
            txtHeightInches.isHidden = true
        }
        txtWeight.text = ""
        txtHeightFeet.text = ""
        txtHeightInches.text = ""
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        
        if (txtHeightInches.isHidden == false){
            let weight = (txtWeight.text! as NSString).doubleValue
            let heightFeet = (txtHeightFeet.text! as NSString).doubleValue
            let heightInches = (txtHeightInches.text! as NSString).doubleValue
            
  
            let bmi = 703 * weight / pow((heightFeet * 12 + heightInches), 2)
            
            
            lblBMI.text = String(format: "%.2f", bmi)
            
            if bmi < 18.5 {
                lblHealthFact.text = "Underweight"
            } else if bmi < 24.9 {
                lblHealthFact.text = "Healthy weight"
            } else if bmi < 29.9 {
                lblHealthFact.text = "Overweight"
            } else
            {
                lblHealthFact.text = "Obese"
            }
            
    
        } else {
            let weight = (txtWeight.text! as NSString).doubleValue
            let height = (txtHeightFeet.text! as NSString).doubleValue
    
            
            let bmi = weight / pow (height/100, 2)
            
            lblBMI.text = String(format: "%.2f", bmi)
            
            if bmi < 18.5 {
                lblHealthFact.text = "Underweight"
            } else if bmi < 24.9 {
                lblHealthFact.text = "Healthy weight"
            } else if bmi < 29.9 {
                lblHealthFact.text = "Overweight"
            } else
            {
                lblHealthFact.text = "Obese"
            }
        }
        
    }
}

