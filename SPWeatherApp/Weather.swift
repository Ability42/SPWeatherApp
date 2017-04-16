//
//  Weather.swift
//  SPWeatherApp
//
//  Created by Stepan Paholyk on 4/16/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

struct Weather {
    
    var city: String
    var temperatureFahrenheit: Float
    
    var temperatureCelsius: Float {
        return (temperatureFahrenheit - 32) / 1.8
    }
    
    var windDirection: WindDirection
    var rainfall: Rainfall
    var windSpeed: Float

}
