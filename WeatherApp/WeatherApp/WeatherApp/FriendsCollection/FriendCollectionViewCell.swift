//
//  CollectionViewCell.swift
//  WeatherApp
//
//  Created by korolev-ap on 06.08.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//
import UIKit

class FriendsViewCell: UICollectionViewCell {
    
    @IBOutlet weak var FriendPicture: UIImageView!
    @IBOutlet weak var friendImageLikeCount: UILabel!
    @IBOutlet weak var LikeButton: UIButton!
    
    //LikeButton.tag = indexPath.row
}
