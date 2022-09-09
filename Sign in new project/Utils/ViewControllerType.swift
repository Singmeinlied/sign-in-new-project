//
//  ViewControllerType.swift
//  Sign in new project
//
//  Created by Abai Kush on 9/9/22.
//

import UIKit

enum ViewControllerType{
    
    case main
    case profile
    case settings
    case other
    
    var viewController: UIViewController{
        switch self {
        case .main:
            return MainViewController()
        case .profile:
            return ProfileViewController()
        case .settings:
            return SettingViewController()
        case .other:
            return OtherViewController()
        }
    }
    
    var title: String{
        switch self {
        case .main:
            return "Main"
        case .profile:
            return "Profile"
        case .settings:
            return "Setting"
        case .other:
            return "Other"
        }
    }
    
    var selectedImage: UIImage{
        switch self {
        case .main:
            return UIImage(named: "MainImageIcon")?.withTintColor(.white) ?? UIImage()
        case .profile:
            return UIImage(named: "person.fill")?.withTintColor(.white) ?? UIImage()
        case .settings:
            return UIImage(named: "settingIcon")?.withTintColor(.white) ?? UIImage()
        case .other:
            return UIImage(named: "otherIcon")?.withTintColor(.white) ?? UIImage()
        }
    }
    
    var unselectedImage: UIImage{
        switch self {
        case .main:
            return UIImage(named: "MainImageIcon")?.withTintColor(.lightGray) ?? UIImage()
        case .profile:
            return UIImage(named: "person.fill")?.withTintColor(.lightGray) ?? UIImage()
        case .settings:
            return UIImage(named: "settingIcon")?.withTintColor(.lightGray) ?? UIImage()
        case .other:
            return UIImage(named: "otherIcon")?.withTintColor(.lightGray) ?? UIImage()
        }
    }
}
