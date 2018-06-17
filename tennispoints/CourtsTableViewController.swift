//
//  CourtsTableViewController.swift
//  tennispoints
//
//  Created by CRBeasley on 6/12/18.
//  Copyright © 2018 TennisIQ. All rights reserved.
//

import Foundation
import UIKit

class CourtsTableViewController: UITableViewController {
    
    @IBOutlet var courtsTableView: UITableView!

    let items = ["Fucker", "Go fuck yourself", "blah"]
    
    override func viewDidLoad() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        var window: UIWindow?
        window = UIWindow()
        window?.makeKeyAndVisible()
        let NavController = UINavigationController(rootViewController: CourtsTableViewController())
        window?.rootViewController = NavController
        navigationItem.title = "Courts"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
}

