//
//  FlowController.swift
//  CW_khabibullin
//
//  Created by Булат Хабибуллин on 17.12.2021.
//

import Foundation

protocol FlowController {
    
    associatedtype T
    var completionHandler: ((T) -> ())? { get set }
}
