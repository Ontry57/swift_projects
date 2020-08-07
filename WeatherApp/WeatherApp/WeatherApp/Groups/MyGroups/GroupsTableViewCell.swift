//
//  GroupsTableViewCell.swift
//  WeatherApp
//
//  Created by korolev-ap on 06.08.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    
    
   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .lightGray
        //avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  func configureGroupCell(for model: Group) {
           groupLabel.text = "\(model.name)"
           groupImage.image = UIImage.init(named: model.imageName)
        
       }
    
    
}

