//
//  DetailViewController.swift
//  Parsing_JSON_Lab
//
//  Created by Amy Alsaydi on 11/26/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var desctiptionLabel: UILabel!
    
    var city: City? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() 

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        guard let theCity = city else {
            fatalError("theCity is nil, verify prepare for segue")
        }
        
        navigationItem.title = theCity.name
        tempLabel.text? = "\(theCity.main.temp)C ˚"
        desctiptionLabel.text? = theCity.weather.first?.description.capitalized ?? "xyc"
    }

}
