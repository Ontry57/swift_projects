//
//  FriendsTableViewCell.swift
//  WeatherApp
//
//  Created by korolev-ap on 06.08.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

 
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
         //backgroundColor = .lightGray
         avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
        
        
     }

     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         // Configure the view for the selected state
     }
    
    func configure(for model: Friend) {
        nameLabel.text = model.name
        ageLabel.text = "\(model.age)"
        avatarImageView.image = UIImage.init(named: model.imageName)
       // avatarImageView.contentMode = UIView.ContentMode.scaleAspectFit
        //avatarImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
    }
    
}
