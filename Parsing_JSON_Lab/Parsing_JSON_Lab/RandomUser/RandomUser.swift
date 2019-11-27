//
//  RandomUser.swift
//  Parsing_JSON_Lab
//
//  Created by Amy Alsaydi on 11/27/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct RandomUserData: Codable {
    let results: [User]
}

struct User: Codable {
    let name: Name
    let email: String
    let dob: DateInfo
    let phone: String
    let location: AddressInfo
    let picture: picInfo
    
}
struct picInfo: Codable {
    let large: String
}

struct Name: Codable  {
    let first: String
    let last: String
}

struct DateInfo: Codable {
    let date: String
}

struct AddressInfo: Codable {
    let street: StreetInfo
    let city: String
    let state: String
    let country: String
    // let postcode: Int
}

struct StreetInfo: Codable {
    let number: Int
    let name: String
}


extension RandomUserData {
    static func getRandomUsers() -> [User] {
        var randomUsers = [User]()
        
        guard let fileURL = Bundle.main.url(forResource: "randomUserData", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let userData = try JSONDecoder().decode(RandomUserData.self, from: data)
            randomUsers = userData.results
        } catch {
            fatalError("failed to load from contents \(error)")
        }
        return randomUsers
    }
    
}
