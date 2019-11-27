//
//  UserController.swift
//  Parsing_JSON_Lab
//
//  Created by Amy Alsaydi on 11/27/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class UserController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData() 

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? UserDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("failed to get indexPath and detailVC")
        }
        
        detailVC.user = users[indexPath.row]
    }
    
    func loadData() {
        users = RandomUserData.getRandomUsers()
    }


}
extension UserController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name.first
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
    
    
}
