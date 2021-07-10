//
//  CreateToDoViewController.swift
//  ToDo List
//
//  Created by Anika on 6/30/21.
//  Copyright © 2021 Anika Sundararajan. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {
    
    
    @IBOutlet weak var ToDoItem: UITextField!
    @IBOutlet weak var ImportantSwitch: UISwitch!
    var toDoTableVC : ToDoListTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDo(context: context)
            newToDo.important = ImportantSwitch.isOn
            if let name = ToDoItem.text {
                newToDo.name = name
            }
    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
    
}
