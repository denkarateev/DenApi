//
//  CurrentWeatherData.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 31.10.2020.
//

import Foundation
struct CurrentWeatherData: Decodable {
    var name: String
    let main: Main
    let weather: [Weather]
  
}
struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
   enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}
struct Weather: Decodable {
    let id: Int
}

