//
//  LoginVC.swift
//  Doit_test_sergemi
//
//  Created by sergemi on 2/27/19.
//  Copyright © 2019 sergemi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTF: MyTextField!
    @IBOutlet weak var passwordTF: MyTextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTF.delegate = self
        emailTF.emptyHint = "E-mail"
        emailTF.clear()
        
        passwordTF.delegate = self
        passwordTF.emptyHint = "Password"
        passwordTF.isPassword = true
        passwordTF.clear()
    }
    
    @IBAction func TextFieldEditingChanged(_ sender: MyTextField) {
        sender.editingChanged()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let tf = textField as? MyTextField {
            tf.shouldBeginEditing()
        }
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let tf = textField as? MyTextField {
            tf.shouldEndEditing()
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}
