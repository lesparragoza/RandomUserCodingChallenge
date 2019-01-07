//
//  UserListTableViewController.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 01/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import UIKit

class UserListTableViewController: UITableViewController {
    
    private var viewModel: UserListViewModelDelegate = UserListViewModel()
    lazy var searchBar:UISearchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "UserListTableViewCell")
        viewModel.viewController = self
        viewModel.loadNewUsers()
        tableView.addInfiniteScroll { (tableView) -> Void in
            self.viewModel.loadNewUsers()
            tableView.finishInfiniteScroll()
        }
        configureSearchBar()
    }
    
    private func configureSearchBar(){
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.retrieveUsers().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        let currentUser = viewModel.retrieveUsers()[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.configureCell(name: currentUser.name.firstName, lastName: currentUser.name.lastName, phone: currentUser.phone!, imageUrl: (currentUser.picture?.thumbnailUrl))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openProfile(for: viewModel.retrieveUsers()[indexPath.row])
    }
}

extension UIViewController {
    func openProfile(for user: User) {
        if let userDetail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController {
            userDetail.viewModel = UserDetailViewModel()
            userDetail.viewModel?.user = user
            splitViewController?.showDetailViewController(userDetail, sender: nil)

            
        }
    }
}

extension UserListTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String){
        viewModel.filterUsersWith(textSearched)
    }
}


