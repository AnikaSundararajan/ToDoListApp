//
//  ToDoListTableViewController.swift
//  ToDo List
//
//  Created by Anika on 6/30/21.
//  Copyright © 2021 Anika Sundararajan. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var toDos = [ToDo]()

    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCoreData = try? context.fetch(ToDo.fetchRequest()) {
                if let tempToDos = toDosFromCoreData as? [ToDo] {
                    toDos = tempToDos
                    tableView.reloadData()
                }
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let currentToDo = toDos[indexPath.row]
        
        if currentToDo.important == true {
            if let name = currentToDo.name {
                cell.textLabel?.text = "❗️" + name
            }
        } else {
            cell.textLabel?.text = currentToDo.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateToDoViewController {
            createVC.toDoTableVC = self
        }
        if let completeVC = segue.destination as? CompleteViewController {
            if let selectedToDo = sender as? ToDo {
                completeVC.todo = selectedToDo
            }
        }
        
    }
    
}
