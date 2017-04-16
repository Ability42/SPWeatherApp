//
//  WeatherManager.swift
//  SPWeatherApp
//
//  Created by Stepan Paholyk on 4/16/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

import Foundation

class WeatherManager {
    
    
    func getWeather(with completion: @escaping ([Weather]) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.75) { 
            completion(self.mockResponse())
        }
    }
    
    private func mockResponse() -> [Weather] {
        
        var array = [Weather]()
        
        array.append(Weather(city: "Kiev", temperatureFahrenheit: 89.7, windDirection: .West, rainfall: .Cloudly, windSpeed: 3.2))
        array.append(Weather(city: "Rome", temperatureFahrenheit: 119.7, windDirection: .East, rainfall: .Sunny, windSpeed: 1.1))
        array.append(Weather(city: "London", temperatureFahrenheit: 59.7, windDirection: .North, rainfall: .Stormly, windSpeed: 8.4))
        
        return array
    }
    
    
}
