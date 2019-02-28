//
//  MyTextField.swift
//  Doit_test_sergemi
//
//  Created by sergemi on 2/28/19.
//  Copyright © 2019 sergemi. All rights reserved.
//

import UIKit

class MyTextField: UITextField {
    var emptyHint: String = ""
    var isPassword: Bool = false
    var isClear: Bool = true
    
    func clear() {
        if isPassword {
            isSecureTextEntry = false
        }
        
        text = emptyHint
        textColor = .lightGray
        
        isClear = true
    }
    
    func shouldBeginEditing() {
        if isClear {
            text = ""
            isClear = false // ?
            
            if isPassword {
                isSecureTextEntry = true
            }
        }
    }
    
    func shouldEndEditing() {
        if text?.count == 0 {
            clear()
        }
    }
    
    func editingChanged () {
        if let txt = text {
            if isClear {
                if txt.count > emptyHint.count {
                    let i = txt.index(txt.startIndex, offsetBy:emptyHint.count)
                    text = String(txt[i..<txt.endIndex])
                }
                else {
                    text = ""
                }
            }
            
            if txt.count == 0 {
                clear()
            }
            else {
                isClear = false
                textColor = .black
                if isPassword {
                    isSecureTextEntry = true
                }
            }
        }
    }
}
