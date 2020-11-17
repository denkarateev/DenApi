//
//  CountriesService.swift
//  TableViewApi
//
//  Created by Константин Богданов on 15.11.2020.
//

import UIKit

protocol CountriesServiceProtocol {

	func getCountries(_ completion: @escaping ([CountrData]) -> Void)

	func getFlag(for name: String, _ completion: @escaping (UIImage?) -> Void)

	func cachedImage(for name: String) -> UIImage?
    func getWeatherForCity(cityName: String, _ completion: @escaping (CurrentWeatherData) -> Void)
}

final class CountriesService: CountriesServiceProtocol {
    
    func getWeatherForCity(cityName: String, _ completion: @escaping (CurrentWeatherData) -> Void) {
        var url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&apikey=93cb187bc2e2ef06a51c84b00f08310f&units=metric"
        networkService.fetch(urlString: url) {(result: Result<CurrentWeatherData, NetworkService.NetworkError>) in
            let models = try? result.get()
            DispatchQueue.main.async {
                completion(models!)
            }
        }
    }
    
   
   
    

	private struct Endpoints {
		static let getAllCountries = "https://restcountries.eu/rest/v2/all"
	}

	private let networkService: NetworkService
	private var cache: NSCache<NSString, UIImage>

	init(networkService: NetworkService) {
		self.networkService = networkService
		cache = .init()
	}

	func getCountries(_ completion: @escaping ([CountrData]) -> Void) {
		networkService.fetch(urlString: Endpoints.getAllCountries) { (result: Result<[CountrData], NetworkService.NetworkError>) in
			let models = try? result.get()
			DispatchQueue.main.async {
				completion(models ?? [])
			}
		}
	}

	func getFlag(for name: String, _ completion: @escaping (UIImage?) -> Void) {
		networkService.loadData(urlString: name) { [weak self] result in
			if let data = try? result.get(), let image = UIImage(data: data) {
				self?.cache.setObject(image, forKey: NSString(string: name)) // сохранять картинки по урлу
				return completion(image)
			}
			return completion(nil)
		}
	}

	func cachedImage(for name: String) -> UIImage? {
		return nil
	}
}
