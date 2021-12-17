//
//  ModuleFactory.swift
//  CW_khabibullin
//
//  Created by Булат Хабибуллин on 17.12.2021.
//

import Foundation
class ModuleFactory {
    
    func createAuthModule() -> AuthViewController {
        AuthViewController()
    }
    
    func createEnterLoginModule() -> EnterLoginViewController {
        EnterLoginViewController()
    }
    
    func createEnterPasswordModule() -> EnterPasswordViewController {
        EnterPasswordViewController()
    }
    
    func createMainModule() -> MainViewController {
        MainViewController()
    }
}
