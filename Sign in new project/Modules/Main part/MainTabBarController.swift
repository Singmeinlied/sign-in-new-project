//
//  MainTabBarController.swift
//  Sign in new project
//
//  Created by Abai Kush on 9/9/22.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarAppearance()
        setupViewControllers()
    }
    func setupTabBarAppearance(){
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = .black
        self.tabBar.tintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
    }
    func setupViewControllers(){
        self.setViewControllers([
            setupCurrentViewController(.main),
            setupCurrentViewController(.profile),
            setupCurrentViewController(.settings),
            setupCurrentViewController(.other)
        ], animated: true)
    }
    
    func setupCurrentViewController(_ viewControllerType: ViewControllerType) -> UIViewController{
        
        let vc = viewControllerType.viewController
        vc.tabBarItem.title = viewControllerType.title
        vc.tabBarItem.image = viewControllerType.unselectedImage
        vc.tabBarItem.selectedImage = viewControllerType.selectedImage
        
        return vc
    }
}
