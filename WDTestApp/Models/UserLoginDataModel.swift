//
//  UserLoginDataModel.swift
//  WDTestApp
//
//  Created by sushil Chaudhary on 9/29/22.
//
import Foundation
// MARK: - UserList
struct UserLogin: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let token: String

    enum CodingKeys: String, CodingKey {
        case token
    }
}
