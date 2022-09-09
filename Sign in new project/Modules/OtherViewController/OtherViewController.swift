//
//  OtherViewController.swift
//  Sign in new project
//
//  Created by Abai Kush on 9/9/22.
//

import UIKit

class OtherViewController: baseViewController{
    
    private lazy var signOutButton: UIButton = {
        let exit = UIButton()
        
        exit.backgroundColor = UIColor.white
        exit.setTitle("Exit", for: .normal)
        exit.setTitle("Bye bye!", for: .highlighted)
        exit.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        exit.setTitleColor(UIColor.darkGray, for: .highlighted)
        exit.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        exit.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        
        return exit
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .purple
        
        view.addSubview(signOutButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        signOutButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(computedHeight(30))
            $0.width.equalTo(computedWidth(100))
        }
    }
    
    override func setupValues() {
        super.setupValues()
    }
}

extension OtherViewController{
    
    @objc func exitButtonTapped(){
       let vc = loginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
