//
//  UserListTableViewCell.swift
//  RandomUserList
//
//  Created by Luis Alejandro Esparragoza Sanchez on 01/01/2019.
//  Copyright © 2019 LuisEsparragoza. All rights reserved.
//

import UIKit
import SDWebImage

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(name: String, lastName: String, phone: String, imageUrl: String?){
        fullName.text = lastName + ", " + name
        phoneNumber.text = phone
        if let url = imageUrl {
            userPic.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "userPlaceholder"))
        }
    }
}
