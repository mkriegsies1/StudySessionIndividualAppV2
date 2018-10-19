//
//  AddTaskViewController.swift
//  StudySessionIndividualApp
//
//  Created by Mark Kriegsies on 10/10/18.
//  Copyright © 2018 Mark Kriegsies. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var UserInputTask: UITextField!
 
    
    
    
    func updateDateView() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        DueDateLabel.text =  dateFormatter.string(from: DueDatePicker.date)
        }

    
    @IBAction func AddTaskButtonPress(_ sender: Any) {
      
        if let taskName = UserInputTask.text  {
            let dueDate = DueDatePicker.date
            taskList.append(Task(taskName: taskName, taskDueDate:  dueDate))
          
        }
      
       
        }
    
    @IBOutlet var DueDatePicker: UIDatePicker!
    @IBOutlet var DueDateLabel: UILabel!
    
    
    
    
        //Saves Task
       // UserDefaults.standard.set(taskList, forKey: "task")
       // UserDefaults.standard.set(dueDateList, forKey: "dueDate")
        

    
    
    //function for data to not reload until everything has loaded?
    override func viewDidAppear(_ animated: Bool)
    {
        if let x = UserDefaults.standard.object(forKey: "task") as? Array<Any>
        {
            taskList = x as! [Task]
        }
        
        //old
        /* if let y = UserDefaults.standard.object(forKey: "dueDate") as? Array<Any> {
             = y as! [String]
        } */
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
