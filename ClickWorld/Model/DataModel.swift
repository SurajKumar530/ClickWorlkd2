//
//  DataModel.swift
//  ClickWorld
//
//  Created by Paramveer Singh on 09/11/23.
//
import Foundation
import UIKit


//struct DataSavedModel: Codable {
//    var image: Data
//    let name: String
//    let description: String
//    let address: String
//    let date: String
//    func getImage(from data: Data) -> UIImage? {
//        return UIImage(data: data)
//    }
//}
//
//private enum CodingKeys: String, CodingKey {
//    case image = "image"
//    case name = "name"
//    case description = "description"
//    case address = "address"
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dataModel = try? JSONDecoder().decode(DataModel.self, from: jsonData)

import Foundation

// MARK: - DataModel
struct Recipe: Codable {
    var image: Data
    let name: String
    let description: String
    let rating: String
    let date: String
    func getImage(from data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}

private enum CodingKeys: String, CodingKey {
    case image = "image"
    case name = "name"
    case description = "description"
    case rating = "rating"
}
