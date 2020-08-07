

import UIKit

private let reuseIdentifier = "FriendsPhotoCollectionViewCellKey"

class FriendCollectionViewController: UICollectionViewController {

    var selectedModel: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.isNavigationBarHidden = false
        
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
        return 15
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendsViewCell
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .yellow
        cell.FriendPicture.image = UIImage.init(named: selectedModel!.imageName)
        //cell.FriendPicture.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        
        return cell
        
   
               //cell.FriendPicture.contentMode = UIView.ContentMode.scaleAspectFit
               
               //cell.FriendPicture.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
               
               // Configure the cell
        
              

        
        
    }
    
    
   
}
