//
//  MainViewController.swift
//  CW_khabibullin
//
//  Created by Булат Хабибуллин on 17.12.2021.
//

import Foundation
import UIKit
import Combine

class MainViewController: UIViewController {
    
    var completionHandler: (() -> ())?
    
    // MARK: Private properties
    
    @Published private var userData = UserIncomingData()
    private var serviceSubscriber: AnyCancellable?
    
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
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        loadData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshButtonTapped))
    }
    
    // MARK: Private
    
    private func loadData() {
        serviceSubscriber = NetworkService().publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { data in
                self.genderLabel.text = data.results?.first?.gender
                self.firstNameLabel.text = data.results?.first?.name?.first
                self.lastNameLabel.text = data.results?.first?.name?.last
            })
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
    
    // MARK: Objective methods
    
    @objc private func logoutButtonTapped() {
        completionHandler!()
    }
    
    @objc private func refreshButtonTapped() {
        loadData()
    }
}
