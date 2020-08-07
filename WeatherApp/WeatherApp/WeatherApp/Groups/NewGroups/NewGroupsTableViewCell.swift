//
//  NewGroupsTableViewCell.swift
//  WeatherApp
//
//  Created by korolev-ap on 07.08.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class NewGroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var newGroupImage: UIImageView!
    @IBOutlet weak var newGroupLabel: UILabel!
    
    
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
              newGroupLabel.text = "\(model.name)"
              newGroupImage.image = UIImage.init(named: model.imageName)
           
          }

}
