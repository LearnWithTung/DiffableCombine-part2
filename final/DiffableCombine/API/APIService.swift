//
//  APIService.swift
//  DiffableCombine
//
//  Created by Tung Vu Duc on 23/01/2021.
//

import Foundation
import Combine

class APIService {
    private init() {}
    static let shared = APIService()
    
    // Write your code below
    // 1
    func fetchUsers() -> AnyPublisher<[User], Error>{
        // 1
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        // 2
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            // 4
            .map(\.data)
            // 5
            .decode(type: [User].self, decoder: JSONDecoder())
            // 6
            .eraseToAnyPublisher()

        return publisher
    }
}
