//
//  AlamofireApiService.swift
//  Weather
//
//  Created by Semyon Belokovsky on 10/11/2017.
//  Copyright © 2017 ProfIT. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireApiService {
    func loadWeather(query: String, handler: @escaping (Weather?) -> Swift.Void) {
        let urlString = "http://api.openweathermap.org/data/2.5/weather"
        let appId = "ed26ee17716deb4a461d27a9f4c7049b"
        
        let params = ["q" : query,
                      "appid" : appId]
        
        let request = Alamofire.request(urlString, method: .get, parameters: params)
        request.responseJSON { (response) in
            var weather: Weather?
            if let value = response.result.value as? [String : Any] {
                weather = Weather(JSON: value)
            }
            handler(weather)
        }
    }
}
