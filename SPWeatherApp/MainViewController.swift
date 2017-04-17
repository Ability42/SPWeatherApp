//
//  MainViewController.swift
//  SPWeatherApp
//
//  Created by Stepan Paholyk on 4/17/17.
//  Copyright © 2017 Stepan Paholyk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    weak var viewModel: MainViewModel! {
        didSet {
            viewModel.updateWeather {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.tableView.separatorStyle = .singleLine
            }
        }
    }
    
    let cellIdentifier = "CityTableViewCell"
    let segueIdenitifer = "ShowDetails"

    
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == segueIdenitifer,
            let detailsController = segue.destination as? DetailsViewController,
            let index = sender as? Int {
            detailsController.viewModel = self.viewModel.detailsViewModel(index: index)
        }
    }
    
   

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        self.performSegue(withIdentifier: segueIdenitifer, sender: indexPath.item)
    }

}

