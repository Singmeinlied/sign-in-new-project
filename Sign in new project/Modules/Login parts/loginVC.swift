//
//  loginVC.swift
//  Sign in new project
//
//  Created by Abai Kush on 3/9/22.
//

import UIKit
import SnapKit

class loginVC: baseViewController{
    
    private lazy var mainLabel: UILabel = {
        let ml = UILabel()
        ml.text = "Sign in"
        ml.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        ml.textAlignment = .center
        ml.font = .systemFont(ofSize: 18, weight: .semibold)
        return ml
    }()
    
    private lazy var iconImage: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        
        return iv
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        
        sv.axis = .vertical
        sv.spacing = 16
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private lazy var loginTextField: UITextField = {
        let login = UITextField()
        
        login.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        login.placeholder = "Username"
        login.setLeftPaddingPoints(16)
        login.snp.makeConstraints{
            $0.height.equalTo(56)
            
            login.delegate = self
        }
        
        return login
    }()
    
    private lazy var passTextField: UITextField = {
        let pass = UITextField()
        
        pass.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        pass.placeholder = "Password"
        pass.setLeftPaddingPoints(16)
        pass.isSecureTextEntry = true
        pass.isUserInteractionEnabled = true
        
        pass.delegate = self
        
        return pass
    }()
    
    private lazy var secureIcon: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "eyeSecure")
        iv.isUserInteractionEnabled = true
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(secureIconTapped))
        iv.addGestureRecognizer(iconTapped)
        
        return iv
    }()
    
    private lazy var forgotPassButtonLabel: UILabel = {
        let forgot = UILabel()
        
        forgot.text = "Forgot your password?"
        forgot.textAlignment = .right
        forgot.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        forgot.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        forgot.isUserInteractionEnabled = true
        
        let tappedForgot = UITapGestureRecognizer(target: self, action: #selector(forgotPassTapped))
        forgot.addGestureRecognizer(tappedForgot)
        
        return forgot
    }()
    
    private lazy var loginButton: UIButton = {
        let login = UIButton()
        
        login.backgroundColor = UIColor(red: 0.127, green: 0.766, blue: 0.687, alpha: 1)
        login.setTitle("Login", for: .normal)
        login.setTitle("Login", for: .highlighted)
        login.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        login.setTitleColor(UIColor.lightGray, for: .highlighted)
        login.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        login.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return login
    }()
    
    private lazy var stackForLastLabels: UIStackView = {
        let sv = UIStackView()
        
        sv.axis = .horizontal
        sv.spacing = 4
        sv.distribution = .fillProportionally
        return sv
    }()
    
    private lazy var firstLabelSignUp: UILabel = {
        let fl = UILabel()
        fl.text = "Don't have an account?"
        fl.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        fl.textAlignment = .right
        fl.font = .systemFont(ofSize: 18, weight: .semibold)
        
        fl.adjustsFontSizeToFitWidth = true
        fl.minimumScaleFactor = 0.5
        
        return fl
    }()
    
    private lazy var secondLabelSignUp: UILabel = {
        let sl = UILabel()
        sl.text = "Sign Up"
        sl.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        sl.textAlignment = .left
        sl.font = .systemFont(ofSize: 18, weight: .semibold)
        
        sl.adjustsFontSizeToFitWidth = true
        sl.minimumScaleFactor = 0.5
        
        sl.isUserInteractionEnabled = true
        let tappedSignUp = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        sl.addGestureRecognizer(tappedSignUp)
        
        return sl
    }()
    
    let viewModel = LoginViewModel()
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(mainLabel)
        view.addSubview(iconImage)
        view.addSubview(stackView)
        view.addSubview(secureIcon)
        view.addSubview(forgotPassButtonLabel)
        view.addSubview(loginButton)
        view.addSubview(stackForLastLabels)
        
        [firstLabelSignUp, secondLabelSignUp].forEach{stackForLastLabels.addArrangedSubview($0)}
        
        [loginTextField, passTextField].forEach{stackView.addArrangedSubview($0)}
        
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        iconImage.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalTo(iconImage.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(130)
        }
        
        secureIcon.snp.makeConstraints{
            $0.centerY.equalTo(passTextField.snp.centerY)
            $0.trailing.equalTo(passTextField.snp.trailing).offset(-20)
            $0.size.equalTo(20)
        }
        
        forgotPassButtonLabel.snp.makeConstraints{
            $0.top.equalTo(passTextField.snp.bottom).offset(14)
            $0.right.equalToSuperview().offset(-30)
        }
        
        loginButton.snp.makeConstraints{
            
            $0.top.equalTo(forgotPassButtonLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(60)
        }
        
        stackForLastLabels.snp.makeConstraints{
            
            $0.top.lessThanOrEqualTo(loginButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
        
    }
    
    override func setupValues() {
        super.setupValues()
        
        viewModel.isUserAuthorized = { (isAuthorized) in
            if isAuthorized{
                self.appDelegate.mainApp()
            }else{
                self.forgotPassButtonLabel.textColor = .red
                self.forgotPassButtonLabel.shake(count: 3, for: 0.2, withTranslation: 8)
            }
        }
        
        
    }
}
extension loginVC{
    @objc func secureIconTapped(){
        self.passTextField.isSecureTextEntry = !self.passTextField.isSecureTextEntry
    }
    
    @objc func forgotPassTapped(){
        print("Tap tap")
    }
    
    @objc func signUpTapped(){
        let vc = signUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginTapped(){
        guard let login = loginTextField.text, let password = passTextField.text else {return}
        
        if !login.isEmpty && !password.isEmpty{

            viewModel.authorizeUser(login: login, password: password)
        }
        
//        let vc = signUpViewController()
//        navigationController?.pushViewController(vc, animated: true)
//
        
    }
}
extension loginVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension UIView {
    
    func shake(count: Float = 4, for duration: TimeInterval = 0.5,
               withTranslation translation: CGFloat = 5) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration / TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: -translation, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: translation, y: self.center.y))
        layer.add(animation, forKey: "shake")
    }
}
