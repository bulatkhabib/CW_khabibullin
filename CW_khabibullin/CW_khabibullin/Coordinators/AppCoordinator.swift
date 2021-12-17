//
//  AppCoordinator.swift
//  CW_khabibullin
//
//  Created by Булат Хабибуллин on 17.12.2021.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        var isAuth = false
        
        if isAuth {
            showMainFlow()
        } else {
            showAuthFlow()
            isAuth = true
        }
    }
    
    private func showAuthFlow() {
        let authCoordinator = CoordinatorFactory().createAuthCoordinator(navigationController: navigationController)
        
        childCoordinators.append(authCoordinator)
        
        authCoordinator.flowCompletionHandler = { [ weak self ] in
            self?.showMainFlow()
        }
        
        authCoordinator.start()
    }
    
    private func showMainFlow() {
        navigationController.pushViewController(MainViewController(), animated: true)
    }
}
