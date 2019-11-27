//
//  UserDetailController.swift
//  Parsing_JSON_Lab
//
//  Created by Amy Alsaydi on 11/27/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class UserDetailController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        
        guard let theUser = user else {
            fatalError("theUser is nil, verify prepare for segue")
        }
        
        
        nameLabel.text = "\(theUser.name.first) \(theUser.name.last)"
        addressLabel.text = "Address: \(theUser.location.street.number) \(theUser.location.street.name) \(theUser.location.city), \(theUser.location.state) \(theUser.location.country) "
        phoneLabel.text = "Phone Number: \(theUser.phone)"
        
        // format date:
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime,
                                          .withDashSeparatorInDate,
                                          .withFullDate,
                                          .withFractionalSeconds,
                                          .withColonSeparatorInTimeZone]
        isoDateFormatter.timeZone = TimeZone.current
    
        
        let timestampString = theUser.dob.date
        if let date = isoDateFormatter.date(from: timestampString) {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "MMMM, dd, yyyy h:mm a"
          let dateFormattedString = dateFormatter.string(from: date)
          dobLabel.text = "DOB: \(dateFormattedString)"
        } else {
          print("not a valid date")
        }
       
        
    }

}
