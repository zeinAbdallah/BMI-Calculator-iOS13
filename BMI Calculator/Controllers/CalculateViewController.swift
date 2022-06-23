//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
   // var bmiValue = "0.0"
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        print(String(format: "%.2f",sender.value))
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
       // print(String(format: "%.0f",sender.value))
        print(Int(sender.value))
        weightLabel.text = "\(Int(sender.value))Kg" // or String(Int(sender.value)) or String(format: "%.0f",sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
       // let BMI = weight / (height * height)
        let bmi = weight / pow(height, 2)
        
        print(heightSlider.value)
        print(weightSlider.value)
        print(bmi)
       // bmiValue = String(format: "%.1f", bmi)
        
      /*  let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%.1f", bmi)
        self.present(secondVC, animated: true, completion: nil)*/
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
           // destinationVC.bmiValue = bmiValue
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}



/*import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = " 0.0 "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .red
        view.backgroundColor = .systemBlue
        
        
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }
}*/

