//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by Anika on 6/30/21.
//  Copyright © 2021 Anika Sundararajan. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var toDoItem: UILabel!
    var todo : ToDo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = todo {
            if todo.important == true {
                if let name = todo.name {
                    toDoItem.text = "❗️" + name
                }
            } else {
                toDoItem.text = todo.name
            }
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        // Delete To Do
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let todo = todo {
                context.delete(todo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        // Pop back
        navigationController?.popViewController(animated: true)
    }
    
    
}
