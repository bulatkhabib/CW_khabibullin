//
//  NetworkService.swift
//  CW_khabibullin
//
//  Created by Булат Хабибуллин on 17.12.2021.
//

import Foundation
import Combine

class NetworkService {

    private let url = "https://randomuser.me/api"

    var publisher: AnyPublisher<UserIncomingData, Error> {
        let url = URL(string: url)!

        return URLSession.shared.dataTaskPublisher(for: url)
            .compactMap { $0.data }
            .decode(type: UserIncomingData.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

}
