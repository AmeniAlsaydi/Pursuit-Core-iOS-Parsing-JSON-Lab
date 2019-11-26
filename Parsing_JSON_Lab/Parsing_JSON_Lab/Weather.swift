//
//  Weather.swift
//  Parsing_JSON_Lab
//
//  Created by Amy Alsaydi on 11/26/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [City]
}

struct City: Codable {
    let name: String
    let main: TempInfo
    let weather: [WeatherInfo]
}

struct TempInfo: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct WeatherInfo: Codable {
    let description: String
}

extension WeatherData {
    static func getCities() -> [City] {
        var cities = [City]()
        
        guard let fileURL = Bundle.main.url(forResource: "weatherData", withExtension: "json") else {
            fatalError("could not locate json file")
        }

           do {
               let data = try Data(contentsOf: fileURL)
               // Parse data to our swift [City]
               
               let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
               cities = weatherData.list
           } catch {
               fatalError("failed to load from contents \(error)")
           }
        
        return cities
    }
}
