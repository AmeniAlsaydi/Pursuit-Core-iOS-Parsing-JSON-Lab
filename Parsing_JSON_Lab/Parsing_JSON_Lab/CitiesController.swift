//
//  CitiesController.swift
//  Parsing_JSON_Lab
//
//  Created by Amy Alsaydi on 11/26/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class CitiesController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cities = [City]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
       cities = WeatherData.getCities()
    }


}

extension CitiesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let city = cities[indexPath.row]
        
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = "\(city.main.temp) C˚"
        
        return cell
    }
    
    
}
