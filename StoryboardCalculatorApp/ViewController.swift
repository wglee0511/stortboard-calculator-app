//
//  ViewController.swift
//  StoryboardCalculatorApp
//
//  Created by racoon on 5/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstCalcValue: UITextField!
    @IBOutlet weak var secondCalcValue: UITextField!
    @IBOutlet weak var resultCalcValue: UITextField!
    @IBOutlet weak var operatorCalcValue: UIButton!
    
    let operatorValues: [String] = ["+", "-", "*", "/"]
    
    @IBAction func onPressOperator(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for operatorValue in operatorValues {
            setCalculateAction(title: operatorValue, actionSheet: actionSheet, buttonSheet: self.operatorCalcValue)
        }
        
        present(actionSheet, animated: true)
    }
    
    
    @IBAction func onPressCalculator(_ sender: Any) {
        let firstValue = Int(firstCalcValue.text ?? "0") ?? 0
        let secondValue = Int(secondCalcValue.text ?? "0") ?? 0
        let operatorValue = operatorCalcValue.title(for: .normal) ?? "+"
        
        let result = getCalculateResult(operatorValue: operatorValue, firstValue: firstValue, secondValue: secondValue)
        
        resultCalcValue.text = "\(result)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

