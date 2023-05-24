//
//  Model.swift
//  Models
//
//  Created by DA MAC M1 125 on 2023/05/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let todo = try? JSONDecoder().decode(Todo.self, from: jsonData)

import Foundation

// MARK: - Todo Model
struct Todo: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

