//
//  AssistirTableViewController.swift
//  NavigationAula
//
//  Created by João Victor Batista on 18/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class AssistirTableViewController: UITableViewController {

    var areas = ["Recursos Humanos","Desenvolvimento","Gestão","Financeiro","Marketing","Design","Institucional","Administrativo"]
    var areasFiltered = ["Recursos Humanos","Desenvolvimento","Gestão","Financeiro","Marketing","Design","Institucional","Administrativo"]
    
    var sections = "Categorias"
    
    let searchController = UISearchController(searchResultsController: nil)
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquisar treinamentos"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Assistir", for: indexPath) as! AssistirTableViewCell
        cell.area.text = areas[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "assistirDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "assistirDetail",
            let detailVC = segue.destination as? AssistirDetalheViewController{
            if let videoIndex = sender as? Int {
                detailVC.detailTitle = areas[videoIndex]
            }
        }
    }
}

extension AssistirTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
    
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
//        areasFiltered = areas.filter({( player : Player) -> Bool in
//            return areas.lowercase.contains(searchText.lowercased())
//        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        searching = true
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
}

extension AssistirTableViewController: UISearchResultsUpdating  {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        //let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
