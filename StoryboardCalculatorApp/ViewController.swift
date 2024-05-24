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
    
    let operatorValues: [Operator] = [.div, .minus, Operator.multi, .plus]
    
    func setTextFieldInitialStyle(
        textFieldValue: UITextField
    ) {
        textFieldValue.layer.borderColor = UIColor.systemGray3.cgColor
        textFieldValue.layer.borderWidth = 1
        textFieldValue.layer.cornerRadius = 5
    }
    
    
    func showAlert(title: String = "알림", message: String) {
        let alertSheet = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "확인", style: .default)
        
        alertSheet.addAction(alertAction)
        
        present(alertSheet, animated: true)
    }

    
    @IBAction func onPressOperator(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for operatorValue in operatorValues {
            setCalculateAction(title: convertReverseOperator(operatorValue: operatorValue), actionSheet: actionSheet, buttonSheet: self.operatorCalcValue)
        }
        
        present(actionSheet, animated: true)
    }
    
    
    @IBAction func onPressCalculator(_ sender: Any) {
        let firstValue = Int(firstCalcValue.text ?? "")
        let secondValue = Int(secondCalcValue.text ?? "")
        let operatorValue = operatorCalcValue.title(for: .normal)
        
        guard firstValue != nil else {
            firstCalcValue.resignFirstResponder()
            showAlert(title: "오류", message: "값을 입력해주세요")
            return
        }
        
        guard secondValue != nil else {
            showAlert(title: "오류", message: "값을 입력해주세요")
            return
        }
        
        guard operatorValue != "?" else {
            showAlert(title: "오류", message: "연산자를 입력해주세요")
            return
        }
        
        let result = getCalculateResult(operatorValue: convertOperator(operatorValue: operatorValue ?? "+"), firstValue: firstValue ?? 0, secondValue: secondValue ?? 0)
        
        resultCalcValue.text = "\(result)"
        
        if firstCalcValue.isFirstResponder {
            firstCalcValue.resignFirstResponder()
        }
        
        if secondCalcValue.isFirstResponder {
            secondCalcValue.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstCalcValue.delegate = self
        secondCalcValue.delegate = self
        setTextFieldInitialStyle(textFieldValue: firstCalcValue)
        setTextFieldInitialStyle(textFieldValue: secondCalcValue)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        firstCalcValue.becomeFirstResponder()
    }

}

extension ViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard !string.isEmpty else {
            return true
        }
        
        guard let _ = Int(string) else {
            return false
        }
        
        return true
    }
}
