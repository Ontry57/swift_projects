

import UIKit

private let reuseIdentifier = "FriendsPhotoCollectionViewCellKey"

class FriendCollectionViewController: UICollectionViewController {
    
    var selectedModel: Friend?
    
    var userFriendsDictionary = [String: [Friend?]]()
    var userFriendsTitles = [String]()
    var userFriends = [Friend?]()
    
    @IBAction func likeDidPressed(_ sender: UIButton) {
        
        
//        sender.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        let buttonRow = sender.tag
        print(buttonRow)
        print (selectedModel!.likes[buttonRow] )

        
        
        if selectedModel!.likesMe[buttonRow] == true {
           
           selectedModel!.likesMe[buttonRow] = false
           
           
           selectedModel!.likes[buttonRow] = selectedModel!.likes[buttonRow] - 1
        } else {
            
            selectedModel!.likesMe[buttonRow] = true
            
            
            selectedModel!.likes[buttonRow] = selectedModel!.likes[buttonRow] + 1
            
        }
        selectedModel!.changed[buttonRow] = true
        self.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        
      
        
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
        
        
        if selectedModel!.likesMe[indexPath.row] == true && selectedModel!.changed[indexPath.row] == true  {
            
            
            
            print("строчка \(indexPath.row) надулась")
            
             cell.LikeButton.setImage(UIImage(named:"he.png"), for: .normal)
             cell.LikeButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            UIView.animate(withDuration: 1, animations: {
                 cell.LikeButton.setImage( UIImage(named:"hf.png"), for: .normal)
                 cell.LikeButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
               
            }, completion: nil)
              selectedModel!.changed[indexPath.row] = false
            
        }
        
        else if selectedModel!.likesMe[indexPath.row] == true && selectedModel!.changed[indexPath.row] == false {
            
            cell.LikeButton.setImage(UIImage(named:"hf.png"), for: .normal)
            cell.LikeButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            print("строчка \(indexPath.row) не поменялась, просто еще раз отрисовалась")
        }
            
            
        else if selectedModel!.likesMe[indexPath.row] == false && selectedModel!.changed[indexPath.row] == true {
            
            cell.LikeButton.setImage(UIImage(named:"hf.png"), for: .normal)
            cell.LikeButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
            UIView.animate(withDuration: 1, animations: {
                
                cell.LikeButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                cell.LikeButton.setImage(UIImage(named:"he.png"), for: .normal)
                
                
            }, completion: nil)
            print("строчка \(indexPath.row) сдулась")
            selectedModel!.changed[indexPath.row] = false
            
        }
        
        else if selectedModel!.likesMe[indexPath.row] == false && selectedModel!.changed[indexPath.row] == false {
           
            cell.LikeButton.setImage(UIImage(named:"he.png"), for: .normal)
            cell.LikeButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            print("строчка \(indexPath.row) не поменялась, просто еще раз отрисовалась")
        }
        
        
                
        
                
       
        
        //cell.FriendPicture.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        //cell.FriendPicture.image = UIImage(named: data.getUserPosts(by: selectedFriend!.id)[indexPath.row].image)
        
        
        
        
        
        
        
        return cell
        
        
        //cell.FriendPicture.contentMode = UIView.ContentMode.scaleAspectFit
        
        //cell.FriendPicture.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        // Configure the cell
        
        
        
        
        
    }
    
    
    
}
