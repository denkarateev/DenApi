// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let city = try? newJSONDecoder().decode(City.self, from: jsonData)

import Foundation

// MARK: - CityElement
struct CityElement: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region, subregion: String
    let population: Int
    let latlng: [Int]
    let demonym: String
    let area: Int
    let gini: Double
    let timezones, borders: [String]
    let nativeName, numericCode: String
    let currencies: [Currency]
    let languages: [Language]
    let translations: Translations
    let flag: String
    let regionalBlocs: [RegionalBloc]
    let cioc: String
}

// MARK: - Currency
struct Currency: Codable {
    let code, name, symbol: String
}

// MARK: - Language
struct Language: Codable {
    let iso6391, iso6392, name, nativeName: String

    enum CodingKeys: String, CodingKey {
        case iso6391
        case iso6392
        case name, nativeName
    }
}

// MARK: - RegionalBloc
struct RegionalBloc: Codable {
    let acronym, name: String
    let otherAcronyms, otherNames: [String]
}

// MARK: - Translations
struct Translations: Codable {
    let de, es, fr, ja: String
    let it, br, pt: String
}

typealias City = [CityElement]
