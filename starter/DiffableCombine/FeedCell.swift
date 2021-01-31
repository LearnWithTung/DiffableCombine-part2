//
//  FeedCell.swift
//  DiffableCombine
//
//  Created by Tung Vu Duc on 23/01/2021.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    
    func configure(with user: User){
        nameLabel.text = user.name
        usernameLabel.text = user.username
        emailLabel.text = user.email
        websiteLabel.text = user.website
    }
    
}
