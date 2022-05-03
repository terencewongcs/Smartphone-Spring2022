//
//  ViewController.swift
//  BMICalculator
//
//  Created by Teri Wang on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWeightLbs: UITextField!
    @IBOutlet weak var txtFeet: UITextField!
    @IBOutlet weak var txtInches: UITextField!
    @IBOutlet weak var lblBMI: UILabel!
    
    @IBOutlet weak var scWeight: UISegmentedControl!
    @IBOutlet weak var scHeight: UISegmentedControl!
    
    @IBOutlet weak var txtWeightKg: UITextField!
    @IBOutlet weak var txtHeightCm: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        scWeight.addTarget(self, action: #selector(self.scWeightValueChanged(_:)), for: .valueChanged)
//        scHeight.addTarget(self, action: #selector(self.scHeightValueChanged(_:)), for: .valueChanged)
        
        scWeight.selectedSegmentIndex = 0
        scHeight.selectedSegmentIndex = 0
        
    }
    

    @IBAction func calculateBMI(_ sender: Any) {
        var height:Double = 0.0
        var weight:Double = 0.0
        
        if(scWeight.selectedSegmentIndex==0){
            guard let lbs = txtWeightLbs.text else{return}
            guard let doubleLbs = Double(lbs) else { return }
            weight = 0.45359237*doubleLbs
        }
        else if(scWeight.selectedSegmentIndex==1){
            guard let kg = txtWeightKg.text else{return}
            guard let doubleKg = Double(kg) else { return }
            weight = doubleKg
        }
        
        if(scHeight.selectedSegmentIndex==0){
            guard let feet = txtFeet.text else{return}
            guard let inches = txtInches.text else{return}
            
            guard let doubleFeet = Double(feet) else { return }
            guard let doubleInches = Double(inches) else { return }
            
            height = (doubleFeet*12+doubleInches)*2.54/100
        }
        else if(scHeight.selectedSegmentIndex==1){
            guard let cm = txtHeightCm.text else{return}
            
            guard let doubleCm = Double(cm) else { return }
            height = doubleCm/100
        }
        //height:Double = doubleFeet*12+doubleInches
        let bmi:Double = weight/height/height
        let bmiString:String = String(format: "%.1f", bmi)
        lblBMI.text = "BMI: \(bmiString)"
        
        if(bmi<18.5){
            lblStatus.text="You are underweight"
        }
        else if(bmi>=18.5&&bmi<24.9){
            lblStatus.text="You are in healthy weight"
        }
        else if(bmi>=24.9&&bmi<29.9){
            lblStatus.text="You are overweight"
        }
        else if(bmi>=29.9){
            lblStatus.text="You are obese"
        }
    }
    
}

