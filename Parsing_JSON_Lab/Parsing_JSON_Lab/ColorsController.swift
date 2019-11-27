//
//  ViewController.swift
//  Parsing_JSON_Lab
//
//  Created by Amy Alsaydi on 11/26/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class ColorsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colors = [Color]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? ColorDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("failed to get indexPath and detailVC")
        }
        
        detailVC.color = colors[indexPath.row]
    }
    
    func loadData() {
        colors = ColorData.getColors()
    }
}

extension ColorsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name.value
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(color.rgb.fraction.r), green: CGFloat(color.rgb.fraction.g) , blue: CGFloat(color.rgb.fraction.b), alpha: 0.7)
        cell.detailTextLabel?.text = color.hex.value
        cell.detailTextLabel?.textColor = .white
        
        return cell
    }
    
    
}
