//
//  NetworkTest.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 28.10.2020.
//

import Foundation

final class NetworkService {

	enum NetworkError: Error {
		case invalidUrl
		case noData
		case error(Error)
		case parseJsonError
	}

	func fetch<Model: Decodable>(urlString: String,
								 completionHandler: @escaping (Result<Model, NetworkError> ) -> Void) -> Void {
        self.loadData(urlString: urlString) { data in
            do {
                let model = try JSONDecoder().decode(Model.self, from: data.get())
                completionHandler(.success(model))
            } catch {
                completionHandler(.failure(.error(error)))
            }
            
        }
//		guard let url = URL(string: urlString) else {
//			return completionHandler(.failure(.invalidUrl))
//		}
//
//		let session = URLSession(configuration: .default)
//		let task = session.dataTask(with: url) { data, responce, error in
//			if let error = error {
//				completionHandler(.failure(.error(error)))
//				return
//			}
//
//			guard let data = data else {
//				return completionHandler(.failure(.noData))
//			}
//
//			do {
//				let model = try JSONDecoder().decode(Model.self, from: data)
//				completionHandler(.success(model))
//			} catch {
//				completionHandler(.failure(.error(error)))
//			}
//		}
		//task.resume()
	}

	func loadData(urlString: String,
				  completionHandler: @escaping (Result<Data, NetworkError> ) -> Void) -> Void {
        guard let url = URL(string: urlString) else {
            return completionHandler(.failure(.invalidUrl))
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, responce, error in
            if let error = error {
                completionHandler(.failure(.error(error)))
                return
            }
            guard let data = data else {
                return completionHandler(.failure(.noData))
            }
               
                completionHandler(.success(data))

            // TODO: метод, который вернет Data, а не модель
        }
        task.resume()

}
}
