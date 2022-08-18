//
//  EntryViewController.swift
//  ToDo
//
//  Created by Viponpreet Kaur on 2022-02-09.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var field: UITextField!
    var update: (()->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        field.delegate = self // prompt app to save what eneterd
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action:#selector(saveToDo)) // function ref in class that we want to call when button called
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //called when person hits return key on keyboard
        saveToDo()
        return true
    }
    //objc lets it be used as selector
@objc func saveToDo(){
    guard let text = field.text, !text.isEmpty else {
        return
    
    }
    //save task after pass guard
    //no means a full DB
    
    //we guard here cuz when get count , swift not aware we set up count in other view controller and might come back empty so its like a safety option
    guard let  count = UserDefaults().value(forKey: "count") as? Int else{return}
    let newCount = count + 1
    UserDefaults().setValue(newCount, forKey: "count")
    UserDefaults().setValue(text, forKey: "task_\(newCount)")
    update?() //if this fcn exist then call it
    navigationController?.popViewController(animated: true)
}

}

