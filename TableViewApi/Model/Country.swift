//
//  Country.swift
//  TableViewApi
//
//  Created by Денис Каратеев on 03.11.2020.
//

import Foundation

class Country {
    var name: String?
    init?(Country: [CountrData]) {
       
        if let name = Country.first?.name {
            self.name = name
        }
    }
}
