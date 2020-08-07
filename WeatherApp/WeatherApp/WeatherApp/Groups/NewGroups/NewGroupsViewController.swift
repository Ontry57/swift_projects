//
//  NewGroupsViewController.swift
//  WeatherApp
//
//  Created by korolev-ap on 07.08.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class NewGroupsViewController: UIViewController {
    
    @IBOutlet weak var newGroupsTableView: UITableView!{
        didSet {
            newGroupsTableView.dataSource = self
            newGroupsTableView.delegate = self
        }
    }
    
    var newGroups: [Group] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        newGroupsTableView.tableFooterView = UIView()
        
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension NewGroupsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupCellKey", for: indexPath) as! NewGroupsTableViewCell
        
        let group = newGroups[indexPath.row]
        
        cell.configureGroupCell(for: group)
        return cell
    }
    
}



extension NewGroupsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
