//
//  UserCollectionViewCell.swift
//  UserSearch
//
//  Created by Test User on 10/08/19.
//  Copyright © 2019 Task. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    class var className: String {
        return String(describing: self)
    }
}

class UserCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    func configure(_ user: User, searchText: String?) {        
        nameLabel.text =  (user.firstName ?? "") + (user.lastName ?? "")
        roleLabel.text = user.role ?? ""
    }
}
