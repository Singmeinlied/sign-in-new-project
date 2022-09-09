//
//  NSObject.swift
//  Sign in new project
//
//  Created by Abai Kush on 9/9/22.
//

import UIKit

extension NSObject{
    
    var screenHeight: CGFloat{
        return UIScreen.main.bounds.height
    }
    
    var screenWidth: CGFloat{
        return UIScreen.main.bounds.width
    }
    
    func computedHeight(_ height: CGFloat) -> CGFloat{
        return screenHeight * height / 812
    }
    
    func computedWidth(_ width: CGFloat) -> CGFloat{
        return screenWidth * width / 375
    }
}
