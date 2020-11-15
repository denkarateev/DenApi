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
}

final class CountriesService: CountriesServiceProtocol {

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
		networkService.loadData(urlString: "todo") { [weak self] result in
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
