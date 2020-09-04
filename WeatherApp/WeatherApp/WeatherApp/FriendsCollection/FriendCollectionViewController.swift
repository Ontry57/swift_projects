

import UIKit

private let reuseIdentifier = "FriendsPhotoCollectionViewCellKey"

class FriendCollectionViewController: UICollectionViewController {
    
    var selectedModel: Friend?
    
    var userFriendsDictionary = [String: [Friend?]]()
    var userFriendsTitles = [String]()
    var userFriends = [Friend?]()
    
    @IBAction func likeDidPressed(_ sender: UIButton) {
        
        
        let buttonRow = sender.tag
        print(buttonRow)
        print (selectedModel!.likes[buttonRow] )
        
        print (selectedModel!.likes[buttonRow] )
        
        
        if selectedModel!.likesMe[buttonRow] == true {
           selectedModel!.likes[buttonRow] = selectedModel!.likes[buttonRow] - 1
           selectedModel!.likesMe[buttonRow] = false
        } else {
            selectedModel!.likesMe[buttonRow] = true
            selectedModel!.likes[buttonRow] = selectedModel!.likes[buttonRow] + 1
        }
        
        
        self.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.isNavigationBarHidden = false
        
        
      
        
        // Заполняем словарь с индексами
       
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        
        // Show the navigation bar on other view controllers
        
    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        //return 15
        return selectedModel!.postName.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendsViewCell
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .yellow
        cell.FriendPicture.image = UIImage.init(named: selectedModel!.postName[indexPath.row])
        cell.friendImageLikeCount.text = String(selectedModel!.likes[indexPath.row])
        cell.LikeButton.tag = indexPath.row
        
        
        if selectedModel!.likesMe[indexPath.row] == true {
            cell.LikeButton.setImage( UIImage(named:"hf.png"), for: .normal)
            //selectedModel!.likesMe[indexPath.row] = false
        } else {
            cell.LikeButton.setImage(UIImage(named:"he.png"), for: .normal)
            //selectedModel!.likesMe[indexPath.row] = true
        }
        
        //cell.FriendPicture.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        //cell.FriendPicture.image = UIImage(named: data.getUserPosts(by: selectedFriend!.id)[indexPath.row].image)
        
        
        
        
        
        
        
        return cell
        
        
        //cell.FriendPicture.contentMode = UIView.ContentMode.scaleAspectFit
        
        //cell.FriendPicture.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        // Configure the cell
        
        
        
        
        
    }
    
    
    
}
