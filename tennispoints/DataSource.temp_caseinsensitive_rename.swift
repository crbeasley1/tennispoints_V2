//
//  Datasource.swift
//  tennispoints
//
//  Created by CRBeasley on 6/12/18.
//  Copyright © 2018 TennisIQ. All rights reserved.
//

import Foundation
import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    var movies = [String]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")!
        
        cell.textLabel?.text = movies[indexPath.row]
        
        return cell
    }
    
    
    
    
    
}
