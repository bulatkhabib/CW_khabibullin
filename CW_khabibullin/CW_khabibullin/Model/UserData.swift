//
//  UserData.swift
//  CW_khabibullin
//
//  Created by Булат Хабибуллин on 17.12.2021.
//

import Foundation

struct UserData {
    var login: String?
    var password: String?
}

struct UserIncomingData: Decodable {
    var results: [UserNeededData]?
    
    init(results: [UserNeededData]? = nil) {
        self.results = results
    }
}

struct UserNeededData: Decodable {
    var gender: String?
    var name: Name?
}

struct Name: Codable {
    var first: String?
    var last: String?
}
