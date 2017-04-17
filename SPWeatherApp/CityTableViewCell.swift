//
//  CityTableViewCell.swift
//  SPWeatherApp
//
//  Created by Stepan Paholyk on 4/17/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    weak var viewModel: CityCellViewModel! {
        didSet {
            self.cityLabel.text = viewModel.cityTitle
            self.temperatureLabel.text = viewModel.temperatureCelsiusString
            self.timeLabel.text = viewModel.timeString
        }
    }
}
