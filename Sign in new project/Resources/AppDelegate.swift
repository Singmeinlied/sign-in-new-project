//
//  AppDelegate.swift
//  Sign in new project
//
//  Created by Abai Kush on 1/9/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
//    var navController : UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        loginApp()
        
        window.makeKeyAndVisible()
        
        return true
    }
    
    func loginApp(){
        
        self.window?.rootViewController = navController(vc: loginVC())
    }
    
    func mainApp(){
        
        self.window?.rootViewController = navController(vc: mainVC())
    }
    
    func navController(vc: UIViewController) -> UINavigationController{
        
        let viewController = UINavigationController(rootViewController: vc)
        
        viewController.navigationBar.isHidden = true
        
        return viewController
    }
}

