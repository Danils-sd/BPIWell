//
//  Model.swift
//  BPIWell
//
//  Created by Danila on 06.07.2023.
//

import Foundation

struct BPIWell: Codable{
    let time: TimeUP
    let bpi: BPI
}

struct TimeUP: Codable{
    let updated: String
}

struct BPI: Codable{
    let USD: USD
    let GBP: GBP
    let EUR: EUR
}

struct USD: Codable{
    let code: String
    let rate: String
}

struct GBP: Codable{
    let code: String
    let rate: String
}

struct EUR: Codable{
    let code: String
    let rate: String
}
