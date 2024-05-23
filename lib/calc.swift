//
//  calc.swift
//  StoryboardCalculatorApp
//
//  Created by racoon on 5/22/24.
//

import Foundation
import UIKit

func setCalculateAction(title: String, actionSheet: UIAlertController, buttonSheet: UIButton) {
    let action = UIAlertAction(title: title, style: .default) { _ in
        buttonSheet.setTitle(title, for: .normal)
    }
    actionSheet.addAction(action)
}


func getCalculateResult(operatorValue: String, firstValue: Int, secondValue: Int) -> String {
    switch operatorValue {
    case "+":
        return "\(firstValue + secondValue)"
    case "-":
        return "\(firstValue - secondValue)"
    case "*":
        return "\(firstValue * secondValue)"
    case "/":
        return "\(firstValue / secondValue)"
    default:
        return "0"
    }
}
