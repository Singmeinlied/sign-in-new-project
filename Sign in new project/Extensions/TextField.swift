//
//  TextField.swift
//  Sign in new project
//
//  Created by Abai Kush on 3/9/22.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect (x: 0, y: 0, width: amount, height: self.frame.size.height))
        
        self.leftView = paddingView
        
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
