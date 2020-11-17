//
//  WeatherService.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 16.11.2020.
//

import Foundation
protocol WeatherServiceProtocol
{
    func getWeatherForCity(_ completion: @escaping (CurrentWeatherData) -> Void)
}
class WeatherService: WeatherServiceProtocol {
    func getWeatherForCity(_ completion: @escaping (CurrentWeatherData) -> Void) {
        
    }
    
    private let networkService: NetworkService
    init(networkService: NetworkService) {
        self.networkService = networkService
        
    }

}
