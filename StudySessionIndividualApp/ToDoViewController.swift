//
//  ToDoViewController.swift
//  StudySessionIndividualApp
//
//  Created by Mark Kriegsies on 10/10/18.
//  Copyright © 2018 Mark Kriegsies. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //reloads data in table view
    func reloadToDoTableView() {
        ToDoTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "ToDoCell")
        cell.textLabel?.text = taskList[indexPath.row].taskName
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        cell.detailTextLabel?.text =  dateFormatter.string(from: taskList[indexPath.row].taskDueDate)
        
      
        return cell
        
       
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
            {
                taskList.remove(at: indexPath.row)
            //old dueDateList.remove(at: indexPath.row)
                reloadToDoTableView()
              
                //Saves Task
                
             
                    let data = try? JSONEncoder().encode(taskList)
            
                
           
                
                UserDefaults.standard.set(data, forKey: "task")
               //old UserDefaults.standard.set(dueDateList, forKey: "dueDate")
                reloadToDoTableView()
                
                
        }
        
    }
    
    
    @IBAction func refreshButton(_ sender: Any) {
        reloadToDoTableView()
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
           reloadToDoTableView()
    }
    
    //this ensures the saved arrays show up on initial load
    override func viewDidAppear(_ animated: Bool)
    {
        if let x = UserDefaults.standard.object(forKey: "task") as? Data
        {
            if let saveTasks = try?   JSONDecoder().decode([Task].self, from:  x) {
                taskList = saveTasks
            }
        
        }
        
        /* old bc we don't use dueDateList anymore and taskList saves both the name and due date of the task
        if let y = UserDefaults.standard.object(forKey: "dueDate") as? Array<Any> {
            dueDateList = y as! [String]
     } */
    reloadToDoTableView()
    }
    
    @IBOutlet var ToDoTableView: UITableView!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
        //sorting the task list
            //with help from: https://www.youtube.com/watch?v=tQVvRcF7Z7E
    @IBAction func SortAZ(_ sender: Any) {
        
       //the goal is to add functionality sort A-Z, or Z-A
        
        reloadToDoTableView()
        
        var timePressed = 2
        if timePressed == 2 {
             taskList.sort(by: {$0.taskName < $1.taskName})
            
            timePressed -= 1
        } else {
             taskList.sort(by: {$0.taskName > $1.taskName})
            timePressed += 1
        }
       
        reloadToDoTableView()
    }
    
    
    
    @IBAction func SortDueDate(_ sender: Any) {
            //the goal is to add functionality sort New-Old, or Old-New
        var dueDatePressed = 2
        if dueDatePressed == 2 {
            taskList.sort(by: {$0.taskDueDate < $1.taskDueDate})
            dueDatePressed -= 1
        } else {
            taskList.sort(by: {$0.taskDueDate > $1.taskDueDate})
            dueDatePressed += 1
        }
        taskList.sort(by: {$0.taskDueDate < $1.taskDueDate})
        reloadToDoTableView()
    }
}
