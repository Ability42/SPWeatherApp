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
    var detailsViewModel: DetailsViewModel!

    
    required init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
        print("check init")
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
    
    func detailsViewModel(index: Int) -> DetailsViewModel {
        self.detailsViewModel = DetailsViewModel(weather: weatherArray[index])
        return self.detailsViewModel
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
