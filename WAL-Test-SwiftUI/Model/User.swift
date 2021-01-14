//
//  User.swift
//  WAL-Test-SwiftUI
//
//  Created by Ahmed Mousa on 14/01/2021.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatar_url: URL?
    let html_url: String
}
