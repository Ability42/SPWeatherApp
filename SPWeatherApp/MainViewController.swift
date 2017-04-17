//
//  MainViewController.swift
//  SPWeatherApp
//
//  Created by Stepan Paholyk on 4/17/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    weak var viewModel: MainViewModel! {
        didSet {
            viewModel.updateWeather {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    let cellIdentifier = "CityTableViewCell"
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    private func setupTableView() {
        self.tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.contentInset.top = 20
        self.tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CityTableViewCell
        if cell == nil {
            cell = UINib(nibName: cellIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as? CityTableViewCell
        }
        cell!.viewModel = self.viewModel.cellViewModel(index: indexPath.row)
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}

