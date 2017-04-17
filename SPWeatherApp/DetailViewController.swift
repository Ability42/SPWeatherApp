//
//  DetailViewController.swift
//  SPWeatherApp
//
//  Created by Stepan Paholyk on 4/17/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var rainfallLabel: UILabel!
    weak var viewModel: DetailsViewModel!
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.temperatureLabel.text = viewModel.temperatureString
        self.windLabel.text = viewModel.windString
        self.cityLabel.text = viewModel.cityTitle
        self.rainfallLabel.text = viewModel.rainfallString
    }
    
    
    // MARK: - actions
    
    @IBAction func clickedBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
