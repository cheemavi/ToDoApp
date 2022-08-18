//
//  ToDoViewController.swift
//  ToDo
//
//  Created by Viponpreet Kaur on 2022-02-09.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet var label: UILabel!
    var task:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action:#selector(delTodo))

        // Do any additional setup after loading the view.
    }
    
    @objc func delTodo(){
       // let newCount = count -1
      //  UserDefaults().setValue(newCount, forKey: "count")
      //  UserDefaults().setValue(nil, forKey: "task_\(newCount)")

    }

}
