//
//  ViewController.swift
//  ToDo
//
//  Created by Viponpreet Kaur on 2022-02-09.
//

import UIKit

class ViewController: UIViewController {
    //LETS CONTROL TABLE VIEW ON SB
    @IBOutlet var tableView: UITableView!
    
    @IBAction func didTapAdd(){
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            //reload table view every time call update
            //prioritize  updating the actual tasks
            DispatchQueue.main.async {
                self.updateToDo()

            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    func updateToDo(){
        tasks.removeAll()
        guard let  count = UserDefaults().value(forKey: "count") as? Int else{return}
        for x in 0..<count {
            //get each of tasks and add to tasks array
            if let todo =     UserDefaults().value( forKey: "task_\(x+1)")as? String{tasks.append(todo)}

        }
        tableView.reloadData()
    }
    var tasks = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "To Do"
        tableView.delegate = self
        tableView.dataSource = self
        //setup saving mechanism
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().setValue(true, forKey: "setup")
            UserDefaults().setValue(0, forKey: "count")

            
        }
        //get all current saved tasks
        updateToDo()
    }


}

extension ViewController: UITableViewDelegate{
    //taps on cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //select row , u want to deselect it 
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(identifier: "todo") as! ToDoViewController
        vc.title = "New Task"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeue a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
   
        cell.textLabel?.text = tasks[indexPath.row] // indexpath.row is position of cell in table view
        return cell
    }
}
