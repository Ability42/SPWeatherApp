//
//  CityCellViewModel.swift
//  SPWeatherApp
//
//  Created by Stepan Paholyk on 4/16/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

import Foundation

class CityCellViewModel {
    var cityTitle: String
    var temperatureCelsiusString: String
    var timeString: String
    
    required init(from weather: Weather) {
        self.cityTitle = weather.city
        self.temperatureCelsiusString = String(format: "%0.f%@", weather.temperatureCelsius, "\u{00B0}")
        
        let tmpDF = DateFormatter()
        let date = NSDate(timeIntervalSince1970: weather.time)
        tmpDF.dateFormat = "HH:mm"
        self.timeString = tmpDF.string(from: date as Date)
        
    }
}
