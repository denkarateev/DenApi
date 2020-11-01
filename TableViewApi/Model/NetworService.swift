//
//  NetworkTest.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 28.10.2020.
//

import Foundation
class NetworService {
  
      func fetch(forCountry country: String) {
        let urlString = "https://restcountries.eu/rest/v2/name/\(country)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, responce, error in
            if let data = data {
                self.parseJson(data)
            }
            
        }
        task.resume()
       
    }
    func parseJson(_ data: Data) {
        let decoder = JSONDecoder()
        do {
           let countryData = try decoder.decode(CountryData.self, from: data)
            print(countryData.name)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
}
