//
//  GroupsViewController.swift
//  WeatherApp
//
//  Created by korolev-ap on 06.08.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {
    
    @IBOutlet var groupTableView: UITableView!{
        didSet {
            groupTableView.dataSource = self
            groupTableView.delegate = self
        }
    }
    
    var myGroups: [Group] = []
    var newGroups: [Group] = []
    
    
    
    @IBOutlet weak var addDidPressed: UIButton!
    
    @IBAction func addActionDidPressed(_ sender: Any) {
        
        //let selectedGroup = newGroups[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "newGroupsViewControllerKey") as! NewGroupsViewController
        
        
        for item in newGroups{
            vc.newGroups.append(item)
        }
        self.show(vc, sender: nil)
       
        
        
    }
    
    @IBAction func myUnwindAction(segue: UIStoryboardSegue)
    {
    
        
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
        if segue.identifier == "addGroup" {
        // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let NewGroupsViewController = segue.source as? NewGroupsViewController else { return }
        // Получаем индекс выделенной ячейки
            if let indexPath = NewGroupsViewController.newGroupsTableView.indexPathForSelectedRow {
        // Получаем город по индексу
                let group = NewGroupsViewController.newGroups[indexPath.row]
        // Проверяем, что такого города нет в списке
                if true//!myGroups.contains(group)
                {
        // Добавляем город в список выбранных
                    myGroups.append(group)
                    
                    newGroups.remove(at: indexPath.row)
                    
        // Обновляем таблицу
                    groupTableView.reloadData()
                }
            }
        }

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateGroups()
        // Do any additional setup after loading the view.
        groupTableView.tableFooterView = UIView()
        super.navigationController?.isNavigationBarHidden = true
        super.navigationController?.setToolbarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.navigationController?.isNavigationBarHidden = true
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    
        super.navigationController?.isNavigationBarHidden = true
        super.viewWillAppear(animated)
    }
    
    
    private func generateGroups() {
        let group1 = Group(name: "I like Swift", imageName: "group1")
        let group2 = Group(name: "Delegate... wtf? ", imageName: "group2")
        let group3 = Group(name: "Я обязательно полюблю Swift. Оптимисты.", imageName: "group3")
        myGroups.append(group1)
        myGroups.append(group2)
        myGroups.append(group3)
        
        let group4 = Group(name: "Хочу на море", imageName: "group4")
        let group5 = Group(name: "Даешь работу по 1 млн в месяц", imageName: "group5")
        
        newGroups.append(group4)
        newGroups.append(group5)
        
        groupTableView.reloadData()
    }
}
extension GroupsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCellKey", for: indexPath) as! GroupsTableViewCell
        
        let group = myGroups[indexPath.row]
        
        cell.configureGroupCell(for: group)
        return cell
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            
            
            newGroups.append(myGroups[indexPath.row])
            // Удаляем город из массива
            myGroups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
            
            
            
            
            
        }
    }
    
}

extension GroupsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}



