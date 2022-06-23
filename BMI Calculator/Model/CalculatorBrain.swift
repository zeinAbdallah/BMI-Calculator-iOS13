//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Zein Abdalla on 17/11/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    //var bmiValue = "0.0"
    //var bmi: Float = 0.0
    var bmi: BMI?
    
    
    mutating  func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            print("underWeight")
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .systemBlue)
        } else if bmiValue > 18.5 && bmiValue < 24.9 {
            print("normalWeight")
            bmi = BMI(value: bmiValue, advice: "Fit as Fiddle!", color: .systemGreen)
        } else {
            print("overWeight")
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .systemRed)
        }
        
        // bmiValue = String(format: "%.2f", bmi)
        // underWeight < 18.5    normalWeight 18.5 - 24.9      overWeight > 24.9
    }

    func getBMIValue () -> String {
        /*if let safeBMI = bmi {
            let bmiTo1DecimalPlace = String(format: "%.1f", safeBMI )
            return bmiTo1DecimalPlace
        } else {
            return "0.0"
        }*/
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0 )
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
