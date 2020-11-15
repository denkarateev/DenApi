//
//  NetworkTest.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 28.10.2020.
//

import Foundation
class NetworService {

        enum NetworkError: Error {
        case invalidUrl
        case noData
        case error(Error)
        case parseJsonError
    }
    
    func fetch(number: Int, completionHandler: @escaping (Result<[CountrData], NetworkError> ) -> Void) -> Void {
        let urlString = "https://restcountries.eu/rest/v2/all"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, responce, error in
            if let data = data {
                
                if let modelData = self.parseJson(number: number, data) {
                
                    
                    completionHandler(.success(modelData))
                     
                    
                } else {
                    completionHandler(.failure(.parseJsonError))
                }
                
            } else {
                completionHandler(.failure(.noData))
            }
            if let error = error {
                completionHandler(.failure(.error(error)))
                return
            }
            
        }
        task.resume()
       
    }
    
    
    func parseJson(number: Int, _ data: Data) -> [CountrData]? {
        let decoder = JSONDecoder()
        do {
           
            let countryData = try decoder.decode([CountrData].self, from: data)
            return countryData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
  
}
