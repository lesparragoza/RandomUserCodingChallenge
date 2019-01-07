//
//  UserListViewModel.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 03/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import Foundation

protocol UserListViewModelDelegate {
    func loadNewUsers()
    func filterUsersWith(_ text: String) 
    func retrieveUsers() -> [User]
    var viewController: UserListTableViewController? { get set }
}

class UserListViewModel {
    private var users = [User]()
    private var filteredUsers: [User]? = nil
    weak var viewController: UserListTableViewController?
    private let networkManager = NetworkManager()
    private var currentPage = 1
    private let pageSize = 30
    private let seed = "abc"
}

extension UserListViewModel {
    func retrieveUsers() -> [User]{
        if let result = filteredUsers {
            return result
        } else {
            return users
        }
    }
    
    func getUsers(completionHandler: @escaping (([User]?, NSError?) -> Void)) {
        let userService = UserService(page: self.currentPage, pageSize: pageSize, seed: seed)
        networkManager.request(userService, responseType: Result.self, completion: {(users, error) in
            if error == nil, let result = users as? Result {
                completionHandler(result.users, error)
                self.currentPage = self.currentPage + 1
            } else {
                completionHandler(nil, error)
            }
        })
    }
    
    func filterUsersWith(_ text: String) {
        guard !text.isEmpty else {
            cancelFilter()
            return
        }
        filteredUsers = users.filter({( user : User) -> Bool in
            user.name.lastName.lowercased().contains(text.lowercased())
        })
        viewController?.tableView.reloadData()
    }
    
    private func cancelFilter() {
        filteredUsers = nil
        viewController?.tableView.reloadData()
    }
}

extension UserListViewModel: UserListViewModelDelegate {
    func loadNewUsers(){
        getUsers { (users, error) in
            if error == nil {
                self.users.append(contentsOf: users ?? [])
                self.users = self.users.sorted(by: { $0.name.lastName < $1.name.lastName })
                self.viewController?.tableView.reloadData()
            }
        }
    }
}



