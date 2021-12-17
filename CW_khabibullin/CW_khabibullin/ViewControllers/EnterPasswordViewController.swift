//
//  EnterPasswordViewController.swift
//  CW_khabibullin
//
//  Created by Булат Хабибуллин on 17.12.2021.
//

import Foundation
import UIKit

class EnterPasswordViewController: UIViewController, FlowController {
    
    var completionHandler: ((String?) -> ())?
    
    private var newPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter new password"
        
        return textField
    }()
    
    private var repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Repeat password"
        
        return textField
    }()
    
    private let nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        return nextButton
    }()
    
    private var userData: UserData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    func setup(userData: UserData) {
        self.userData = userData
    }
    
    private func addSubviews() {
      
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [newPasswordTextField, repeatPasswordTextField , nextButton])
        stackView.frame.size = CGSize(width:  200, height: 120)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc private func nextButtonTapped() {
        if self.newPasswordTextField.text == self.repeatPasswordTextField.text {
            completionHandler!(newPasswordTextField.text)
        } else {
            print("error")
        }
    }
}
