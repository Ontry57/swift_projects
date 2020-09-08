//
//  FriendsViewController.swift
//  WeatherApp
//
//  Created by korolev-ap on 06.08.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    
    var myFriends: [Friend] = []
    
    var userFriendsDictionary = [String: [Friend]]()
    var userFriendsTitles = [String]()
    var userFriends = [Friend]()
    
    
    //настройка делегата через код
    
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView()
        generateFriends()
        updateSections()
        
        super.navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.navigationController?.isNavigationBarHidden = true
        super.viewWillAppear(animated)
    }
    
    
    private func generateFriends() {
        let friend1 = Friend(name: "Andrei", age: 28, imageName: "image1", postName: ["n1","n2","n3"], likes: [10,1,4], likesMe: [false,false,false],changed: [false,false,false] )
        let friend2 = Friend(name: "Marat", age: 29, imageName: "image2", postName: ["m1","m2","m3"], likes: [0,3,1], likesMe: [false,false,false],changed: [false,false,false])
        let friend3 = Friend(name: "Nikolai", age: 27, imageName: "image3", postName: ["a1","a2","a3"], likes: [5,9,11], likesMe: [false,false,false],changed: [false,false,false])
        myFriends.append(friend1)
        myFriends.append(friend2)
        myFriends.append(friend3)
        
        tableView.reloadData()
    }
    
    
    
    
    func updateSections() {
        
        userFriendsDictionary = [String: [Friend]]()
        userFriendsTitles = [String]()
        userFriends = [Friend]()
        
        // Словарь с именами друзей
        for friend in myFriends {
            userFriends.append(friend)
        }
        
        // Заполняем словарь с индексами
        for friend in myFriends {
            let friendKey = String(friend.name.prefix(1))
            if var friendValues = userFriendsDictionary[friendKey] {
                friendValues.append(friend)
                userFriendsDictionary[friendKey] = friendValues
            } else {
                userFriendsDictionary[friendKey] = [friend]
            }
        }
        
        userFriendsTitles = [String](userFriendsDictionary.keys)
        userFriendsTitles = userFriendsTitles.sorted(by: {$0 < $1})
        
        tableView.tableFooterView = UIView()
        tableView.delegate = self
    }
    
    
    
    
    
}

extension FriendsViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return userFriendsTitles.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userFriendsTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friendKey = userFriendsTitles[section]
        if let friendValue = userFriendsDictionary[friendKey] {
            return friendValue.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstCellKey", for: indexPath) as! FriendsTableViewCell
        
        
        
        
        let friendKey = userFriendsTitles[indexPath.section]
        print(friendKey)
        
        if let friend = userFriendsDictionary[friendKey] {
            //let a = indexPath.row
            
            cell.configure(for: friend[indexPath.row])
            
        }
        
        
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
        //let selectedFriend = myFriends[indexPath.row]
        
        let friendKey = userFriendsTitles[indexPath.section]
        let friendsInSection = userFriendsDictionary[friendKey]
        let selectedFriend = friendsInSection![indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "FriendCollectionViewControllerKey") as! FriendCollectionViewController
        vc.selectedModel = selectedFriend
        self.show(vc, sender: nil)
        //print(indexPath.row)
    }
    
}


