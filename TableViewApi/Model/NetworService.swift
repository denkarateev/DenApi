//
//  NetworkTest.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 28.10.2020.
//

import Foundation
class NetworService {
  
    func fetch(forCountry country: String, completionHandler: @escaping (Country) -> Void) {
        let urlString = "https://restcountries.eu/rest/v2/name/\(country)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, responce, error in
            if let data = data {
           //    let data = String(data: data, encoding: .utf8)
                print(data)
                if let modelData = self.parseJson(data) {
                completionHandler(modelData)
            }
            }
        }
        task.resume()
       
    }
    func parseJson(_ data: Data) -> Country? {
        let decoder = JSONDecoder()
       // let data = String(data: data, encoding: .utf8)
        do {
            let countryData = try decoder.decode(Country1.self, from: data)
            guard let modelData = Country(Country: countryData) else { return nil }
                    
           return modelData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
