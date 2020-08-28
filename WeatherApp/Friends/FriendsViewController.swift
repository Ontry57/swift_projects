//
//  FriendsViewController.swift
//  WeatherApp
//
//  Created by korolev-ap on 06.08.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    
    
    //настройка делегата через код
    
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var myFriends: [Friend] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView()
        generateFriends()
        
    }
    
    
    
    private func generateFriends() {
        let friend1 = Friend(name: "Andrei", age: 28, imageName: "image1", postName: ["n1","n2","n3"], likes: [10,1,4], likesMe: [false,false,false] )
        let friend2 = Friend(name: "Marat", age: 29, imageName: "image2", postName: ["m1","m2","m3"], likes: [0,3,1], likesMe: [false,false,false])
        let friend3 = Friend(name: "Nikolai", age: 27, imageName: "image3", postName: ["a1","a2","a3"], likes: [5,9,11], likesMe: [false,false,false])
        myFriends.append(friend1)
        myFriends.append(friend2)
        myFriends.append(friend3)
        
        tableView.reloadData()
    }
    
    
    

    
    
    
    
    
}

extension FriendsViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstCellKey", for: indexPath) as! FriendsTableViewCell
        let friend = myFriends[indexPath.row]
        
        cell.configure(for: friend)
        
        
        
        return cell
    }
    
}


//extension FriendsViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
//    }
//}


extension FriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFriend = myFriends[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "FriendCollectionViewControllerKey") as! FriendCollectionViewController
        vc.selectedModel = selectedFriend
        self.show(vc, sender: nil)
        print(indexPath.row)
    }
    
}


