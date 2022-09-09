//
//  signUpViewController.swift
//  Sign in new project
//
//  Created by Abai Kush on 3/9/22.
//

import UIKit

class signUpViewController: baseViewController, UITextFieldDelegate{
    
    private lazy var signUpLabel: UILabel = {
        let ml = UILabel()
        ml.text = "Sign up"
        ml.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        ml.textAlignment = .center
        ml.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return ml
    }()
    
    private lazy var backButtonImage: UIImageView = {
        
        let back = UIImageView()
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "backButtonImage")
        back.tintColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        
        back.isUserInteractionEnabled = true
        
        let backButton = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        back.addGestureRecognizer(backButton)
    
        return back
    }()
    
    private lazy var iconImageSignUp: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "signUpMainImage")
        
        return iv
    }()
    
    private lazy var signUpStackView: UIStackView = {
        let sv = UIStackView()
        
        sv.axis = .vertical
        sv.spacing = 16
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private lazy var enterEmail: UITextField = {
        let email = UITextField()
        
        email.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        email.placeholder = "Enter email"
        email.setLeftPaddingPoints(16)
        email.snp.makeConstraints{
            $0.height.equalTo(56)
        }
        email.delegate = self
        
        return email
    }()
    
    private lazy var enterPassword: UITextField = {
        let pass = UITextField()
        
        pass.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        pass.placeholder = "Enter password"
        pass.setLeftPaddingPoints(16)
        pass.isSecureTextEntry = true
        pass.isUserInteractionEnabled = true
        
        return pass
    }()
    
    
    
    private lazy var confirmPass: UITextField = {
        let confirmPass = UITextField()
        
        confirmPass.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        confirmPass.placeholder = "Confirm password"
        confirmPass.setLeftPaddingPoints(16)
        confirmPass.isSecureTextEntry = true
        confirmPass.isUserInteractionEnabled = true
        
        return confirmPass
    }()
    
    
    private lazy var passSecureIcon: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "eyeSecure")
        iv.isUserInteractionEnabled = true
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(passSecureIconTapped))
        iv.addGestureRecognizer(iconTapped)
        
        return iv
    }()
    
    private lazy var confirmSecureIcon: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "eyeSecure")
        iv.isUserInteractionEnabled = true
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(confirmSecureIconTapped))
        iv.addGestureRecognizer(iconTapped)
        
        return iv
    }()
    
    private lazy var SignUpButton: UIButton = {
        let signUp = UIButton()
        
        signUp.backgroundColor = UIColor(red: 0.127, green: 0.766, blue: 0.687, alpha: 1)
        signUp.setTitle("Sign up", for: .normal)
        signUp.setTitle("Sign up", for: .highlighted)
        signUp.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        signUp.setTitleColor(UIColor.lightGray, for: .highlighted)
        signUp.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        signUp.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        return signUp
    }()
    
    private lazy var stackForAlreadyHaveAnAccount: UIStackView = {
        let sv = UIStackView()
        
        sv.axis = .horizontal
        sv.spacing = 4
        sv.distribution = .fillProportionally
        return sv
    }()
    
    private lazy var signInFirst: UILabel = {
        let fl = UILabel()
        fl.text = "Already have an account?"
        fl.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        fl.textAlignment = .right
        fl.font = .systemFont(ofSize: 18, weight: .semibold)
        
        fl.adjustsFontSizeToFitWidth = true
        fl.minimumScaleFactor = 0.5
        
        return fl
    }()
    
    private lazy var signInSecond: UILabel = {
        let sl = UILabel()
        sl.text = "Sign In"
        sl.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        sl.textAlignment = .left
        sl.font = .systemFont(ofSize: 18, weight: .semibold)
        
        sl.adjustsFontSizeToFitWidth = true
        sl.minimumScaleFactor = 0.5
        
        sl.isUserInteractionEnabled = true
        let tappedSignUp = UITapGestureRecognizer(target: self, action: #selector(signInTapped))
        sl.addGestureRecognizer(tappedSignUp)
        
        return sl
    }()
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(signUpLabel)
        view.addSubview(backButtonImage)
        view.addSubview(iconImageSignUp)
        view.addSubview(signUpStackView)
        view.addSubview(passSecureIcon)
        view.addSubview(confirmSecureIcon)
        view.addSubview(SignUpButton)
        view.addSubview(stackForAlreadyHaveAnAccount)
        
        [enterEmail,
         enterPassword,
         confirmPass
        ].forEach{signUpStackView.addArrangedSubview($0)}
        
        [signInFirst,
         signInSecond
        ].forEach{stackForAlreadyHaveAnAccount.addArrangedSubview($0)}
    
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        signUpLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(30))
        }
        
        backButtonImage.snp.makeConstraints{
            
            $0.leading.equalToSuperview().offset(30)
            $0.height.equalTo(16)
            $0.centerY.equalTo(signUpLabel.snp.centerY)
            
        }
        
        iconImageSignUp.snp.makeConstraints{
            $0.top.equalTo(signUpLabel.snp.bottom).offset(computedHeight(60))
            $0.centerX.equalToSuperview()
            $0.width.equalTo(computedWidth(140))
        }
        
        signUpStackView.snp.makeConstraints{
            $0.top.equalTo(iconImageSignUp.snp.bottom).offset(computedHeight(48))
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(computedHeight(200))
            
        }
        
        passSecureIcon.snp.makeConstraints{
            $0.centerY.equalTo(enterPassword.snp.centerY)
            $0.trailing.equalTo(enterPassword.snp.trailing).offset(-20)
            $0.size.equalTo(20)
        }
        
        confirmSecureIcon.snp.makeConstraints{
            $0.centerY.equalTo(confirmPass.snp.centerY)
            $0.trailing.equalTo(confirmPass.snp.trailing).offset(-20)
            $0.size.equalTo(20)
        }
        
        SignUpButton.snp.makeConstraints{
            
            $0.top.equalTo(confirmPass.snp.bottom).offset(computedHeight(30))
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(computedHeight(60))
        }
        
        stackForAlreadyHaveAnAccount.snp.makeConstraints{
            
            $0.top.equalTo(SignUpButton.snp.bottom).offset(computedHeight(162))
            $0.centerX.equalToSuperview()
            $0.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom).offset(computedHeight(-20))
        }
    }
    
    override func setupValues() {
        super.setupValues()
    }
}

extension signUpViewController{
    
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func signUpButtonTapped(){
        print("Sign up button tapped")
    }
    
    @objc func passSecureIconTapped(){
        self.enterPassword.isSecureTextEntry = !self.enterPassword.isSecureTextEntry
    }
    
    @objc func confirmSecureIconTapped(){
        self.confirmPass.isSecureTextEntry = !self.confirmPass.isSecureTextEntry
    }
    
    @objc func signInTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    
}
