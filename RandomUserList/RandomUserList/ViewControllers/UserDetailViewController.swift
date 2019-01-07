//
//  UserDetailViewController.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 07/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import UIKit
import SDWebImage

class UserDetailViewController: UIViewController {
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    var viewModel: UserDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    private func loadUI(){
        if let user = viewModel?.user {
            name.text = user.name.lastName + ", " + user.name.firstName
            if let location = user.location {
                address.text = location.street ?? "" + ", " + (location.city ?? "")
            }
            if let url = user.picture?.largeUrl {
                userPic.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "userPlaceholder"))
            }
        }
    }
}

