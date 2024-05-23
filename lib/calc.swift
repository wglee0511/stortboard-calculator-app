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


func getCalculateResult(operatorValue: Operator, firstValue: Int, secondValue: Int) -> String {
    switch operatorValue {
    case .plus:
        return "\(firstValue + secondValue)"
    case .minus:
        return "\(firstValue - secondValue)"
    case .multi:
        return "\(firstValue * secondValue)"
    case .div:
        return "\(firstValue / secondValue)"
    }
}


func convertOperator(operatorValue: String) -> Operator {
    switch operatorValue {
        case "+":
            return .plus
        case "-":
            return .minus
        case "*":
            return .multi
        case "/":
            return .div
        default:
            return .plus
    }
}

func convertReverseOperator(operatorValue: Operator) -> String {
    switch operatorValue {
    case .plus:
            return "+"
    case .minus:
            return "-"
    case .multi:
            return "*"
    case .div:
            return "/"
    }
}
