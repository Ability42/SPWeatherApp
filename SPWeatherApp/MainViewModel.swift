//
//  MainViewModel.swift
//  SPWeatherApp
//
//  Created by Stepan Paholyk on 4/17/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

import Foundation

class MainViewModel {
    
    weak var weatherManager: WeatherManager!
    private var weatherArray: [Weather]!
    private var cellsArray = [CityCellViewModel]()

    
    required init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }
    
    
    func updateWeather(completion: @escaping() -> Void) {
        cellsArray.removeAll()
        weatherManager.getWeather { (weatherArray) in
            self.weatherArray = weatherArray
            for weatherObj in weatherArray {
                self.cellsArray.append(CityCellViewModel(from: weatherObj))
            }
            completion()
        }
    }
    
    
    func numberOfCities() -> Int {
        return cellsArray.count
    }
    
    
    // TODO: maybe subscript?
    func cellViewModel(index: Int) -> CityCellViewModel? {
        guard index < cellsArray.count else {
            return nil
        }
        return cellsArray[index]
    }
    
}
