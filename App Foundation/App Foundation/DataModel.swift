//
//  DataModel.swift
//  App Foundation
//
//  Created by Fabio Fontana on 09/04/25.
//

import Foundation
import SwiftUI

struct AirtableResponse: Codable {
    let records: [Record]
}

struct Record: Codable, Identifiable {
    let id: String
    let createdTime: String
    let fields: Fields
}


struct Fields: Codable {
    var Name: String
    var Category: String
    var Instructions: String
    var ImageLink: URL?
    var Ingredients: String
    
    // Computed property to split Instructions into an array of strings
    var instructionsArray: [String] {
        return Instructions
            .split(separator: ".")  // Split by period
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) } // Trim whitespace
            .filter { !$0.isEmpty } // Remove empty strings
    }
    
    var ingredientsArray: [String] {
        return Ingredients
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) } // Trim whitespace
            .filter { !$0.isEmpty } // Remove empty strings
    }
}


//struct Fields : Codable {
//    
//    var Name : String
//    var Category : String
//    var Instructions : String
//    var ImageLink : URL?
//    var Ingredients : String?
//    //var measures : String?
//    
//}


