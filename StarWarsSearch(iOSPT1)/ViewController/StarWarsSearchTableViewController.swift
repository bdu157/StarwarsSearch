//
//  StarWarsSearchTableViewController.swift
//  StarWarsSearch(iOSPT1)
//
//  Created by Dongwoo Pae on 5/23/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class StarWarsSearchTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let personController = PersonController()
    
    //MARK: Properties and outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {     // this is through UISearchBar protocol above and we call DispatchQueue.main.async here because we are bringing JSON data when clicking this search bar so this UIKit classes and methods should be called in main queue like we did below
        guard let searchTerm = self.searchBar.text else {return}
        
        self.personController.searchForPeopleWith(searchTerm: searchTerm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.personController.people.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else {return UITableViewCell()}
        let person = self.personController.people[indexPath.row]
        cell.person = person
        return cell
    }

    

}
