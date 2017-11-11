//
//  Weather.swift
//  Weather
//
//  Created by Semyon Belokovsky on 10/11/2017.
//  Copyright © 2017 ProfIT. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {
    var city: String?
    var temp: Double?
    var humidity: Int?
    var pressure: Int?
    var wind: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        city <- map["name"]
        temp <- map["main.temp"]
        humidity <- map["main.humidity"]
        pressure <- map["main.pressure"]
        wind <- map["wind.speed"]
    }
}
