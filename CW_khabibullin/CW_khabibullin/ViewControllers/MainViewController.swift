//
//  MainViewController.swift
//  CW_khabibullin
//
//  Created by Булат Хабибуллин on 17.12.2021.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    private var userData: UserData!
    
    private var genderLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var firstNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var lastNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("logout", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    func setup(userData: UserData) {
        self.userData = userData
    }
    
    private func loadData(completion: @escaping (_ data: Any?, _ error: Error?) -> Void) {
        if let url = URL(string: "https://randomuser.me/api") {
            URLSession.shared.dataTask(with: url) { [self] data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(UserData.self, from: data)
                        genderLabel.text = "gender: \(res.gender)"
                        firstNameLabel.text = "firstName: \(res.first)"
                        lastNameLabel.text = "lastName: \(res.last)"
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    private func addSubviews() {
        
        title = "Random user"
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [genderLabel, firstNameLabel, lastNameLabel, logoutButton])
        stackView.frame.size = CGSize(width:  132, height: 220)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc private func logoutButtonTapped() {
        
    }
}
