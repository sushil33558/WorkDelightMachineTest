//
//  UserImagesListDataModel.swift
//  WDTestApp
//
//  Created by sushil Chaudhary on 9/29/22.
//

import Foundation

// MARK: - ImageList
struct ImageList: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let recipe: [Recipe]

    enum CodingKeys: String, CodingKey {
        case recipe
    }
}

// MARK: - Recipe
struct Recipe: Codable {
    let id, userID: Int
    let title: String
    let category: String?
    let numberOfDishes: String
    let summary: String?
    let yellowAmount, redAmount, prepareTime, settings: String
    let recipeDescription: String
    let image: String
    let deletedAt, deletedBy: String?
    let createdDatetime, updatedDatetime: String
    let updateTime: String?
    let createdAt, updatedAt: String
    let settingsInArray: [SettingsInArray]
    let pivot: Pivot

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case title, category
        case numberOfDishes = "number_of_dishes"
        case summary
        case yellowAmount = "yellow_amount"
        case redAmount = "red_amount"
        case prepareTime = "prepare_time"
        case settings
        case recipeDescription = "description"
        case image
        case deletedAt = "deleted_at"
        case deletedBy = "deleted_by"
        case createdDatetime = "created_datetime"
        case updatedDatetime = "updated_datetime"
        case updateTime = "update_time"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case settingsInArray = "settings_in_array"
        case pivot
    }
}

// MARK: - Pivot
struct Pivot: Codable {
    let categoryID, recipeID: String

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case recipeID = "recipe_id"
    }
}

// MARK: - SettingsInArray
struct SettingsInArray: Codable {
    let id: Int
    let name, hName: Name
    let icon: String
    let eName: EName

    enum CodingKeys: String, CodingKey {
        case id, name
        case hName = "h_name"
        case icon
        case eName = "e_name"
    }
}

enum EName: String, Codable {
    case fish = "Fish"
    case freeToEat = "Free To Eat"
    case glutenFree = "Gluten free"
    case holydays = "Holydays"
    case lowCarbon = "Low Carbon"
    case meats = "Meats"
    case richInProtien = "Rich In Protien"
    case sugerFree = "Suger Free"
    case vegan = "Vegan"
    case vegetarian = "Vegetarian"
}

enum Name: String, Codable {
    case בשרים = "בשרים"
    case דגים = "דגים"
    case דלפחמימה = "דל פחמימה"
    case חינמי = "חינמי"
    case טבעוני = "טבעוני"
    case לחגים = "לחגים"
    case ללאגלוטן = "ללא גלוטן"
    case ללאסוכר = "ללא סוכר"
    case עשירבחלבון = "עשיר בחלבון"
    case צמחוני = "צמחוני"
}
