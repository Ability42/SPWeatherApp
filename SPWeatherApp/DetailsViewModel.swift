//
//  DetailsViewModel.swift
//  SPWeatherApp
//
//  Created by Stepan Paholyk on 4/17/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    var cityTitle: String!
    var windString: String!
    var rainfallString: String!
    var temperatureString: String!
    
    required init(weather: Weather) {
        self.cityTitle = weather.city
        self.temperatureString = String(format: "%0.f%@", weather.temperatureCelsius, "\u{00B0}")
        
        let rainfallString: String
        switch weather.rainfall {
        case .Sunny: rainfallString = "Sunny"
        case .Cloudly: rainfallString = "Cloudly"
        case .Stormly: rainfallString = "Stormly"
        case .Rainly: rainfallString = "Rainly"
        }
        self.rainfallString = rainfallString

        
        let windStr: String
        switch weather.windDirection {
            case .North: windStr = "Noth"
            case .South: windStr = "South"
            case .West: windStr = "West"
            case .East: windStr = "East"
        }
        self.windString = String(format: "%@ wind, %0.f m/s", windStr, weather.windSpeed)
        
    }
}
