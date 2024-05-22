//
//  alert.swift
//  StoryboardCalculatorApp
//
//  Created by racoon on 5/22/24.
//

import Foundation
import UIKit

func showAlert(title: String = "알림", message: String) {
    let alertSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    
    let alertAction = UIAlertAction(title: "확인", style: .default)
    
    alertSheet.addAction(alertAction)
    
    present(alertSheet, animated: true)
}
