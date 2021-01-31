//
//  Post.swift
//  DiffableCombine
//
//  Created by Tung Vu Duc on 23/01/2021.
//

import Foundation

struct User: Decodable, Hashable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let website: String
}
