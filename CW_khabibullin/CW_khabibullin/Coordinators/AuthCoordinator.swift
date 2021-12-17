//
//  AuthCoordinator.swift
//  CW_khabibullin
//
//  Created by Булат Хабибуллин on 17.12.2021.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {
   
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private var userData = UserData(login: nil, password: nil)
    private let moduleFactory = ModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showAuthModule()
    }
    
    private func showAuthModule() {
        let controller = moduleFactory.createAuthModule()
        
        controller.completionHandlerMain = {
            self.showMainModule()
        }
        
        controller.completionHandlerChangePassword = {
            self.showEnterLoginModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showMainModule() {
        let controller = moduleFactory.createMainModule()
        navigationController.pushViewController(controller, animated: true)
        
        controller.completionHandler = {
            self.navigationController.popToRootViewController(animated: true)
        }
    }
    
    private func showEnterLoginModule() {
        let controller = moduleFactory.createEnterLoginModule()

        controller.completionHandler = { [ weak self ] value in
            self?.userData.login = value
            self?.showEnterPasswordModule()
        }

        navigationController.pushViewController(controller, animated: true)
    }

    private func showEnterPasswordModule() {
        let controller = moduleFactory.createEnterPasswordModule()

        controller.completionHandler = { [ weak self ] value in
            self?.userData.password = value
            self?.flowCompletionHandler?()
        }

        navigationController.pushViewController(controller, animated: true)
    }
}
