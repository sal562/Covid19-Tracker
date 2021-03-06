//
//  MainTableViewController.swift
//  CovidTracker
//
//  Created by Sal B Amer on 3/23/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchBarDelegate {
    
    let apiController = APIController()
//    var currentArray = APIController() // Update tableview
//    var currentArray = [Entry]()
    var filteredsArray: [APIController] = []

    
    
    // search bar
    @IBOutlet weak var searchBar: UISearchBar!
    
//    let searchController = UISearchController(searchResultsController: nil)
    
 
    
    // search bar feature - Add textDidChange & selectedScopeButtonIndexDidChange
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard !searchText.isEmpty else { currentArray = Entry; return   }
        guard let searchText = searchBar.text else { return }
        //       // filtered array for matching countries only
        let filteredsArray = apiController.entries.filter { (countries) -> Bool in
            return countries.country.contains(searchText)
        }
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {

    }
    
    // if cancel reset tableview results
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        apiController.fetchResults { (_) in
                  DispatchQueue.main.async {
                      self.tableView.reloadData()
                  }
              }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for search
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        navigationItem.searchController = searchController
//        definesPresentationContext = true
        
        
        apiController.fetchResults { (_) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return apiController.entries.count
        return apiController.entries.count // changed for filtering
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CovidCountriesCell", for: indexPath) as? CovidEntryTableViewCell else { return UITableViewCell()}

//        let result = apiController.entries[indexPath.row] // removed to implement search function
        let result = apiController.entries[indexPath.row]
        cell.results = result
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsViewSegue" {
            if let destinationVC = segue.destination as? DetailsViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let entry = apiController.entries[indexPath.row]
                destinationVC.entries = entry
                 
            }
            
        }
    }
 

}
