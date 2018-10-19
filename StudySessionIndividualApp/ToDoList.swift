//
//  ToDoList.swift
//  StudySessionIndividualApp
//
//  Created by Mark Kriegsies on 10/10/18.
//  Copyright © 2018 Mark Kriegsies. All rights reserved.
//

import Foundation

class Task: Codable {
    let taskName: String!
    let taskDueDate: Date!
    
    init(taskName: String, taskDueDate: Date) {
        self.taskName = taskName
        self.taskDueDate = taskDueDate
    }
}





//list of tasks
let teamMilestone = Task(taskName: "Team Milestone 1", taskDueDate: Date().addingTimeInterval(-(86400*4)))
let individualAppDesign = Task(taskName: "Individual App Design", taskDueDate: Date().addingTimeInterval(-(86400*20)))
let extensionPlayground = Task(taskName: "Extension Playground", taskDueDate: Date().addingTimeInterval(-(86400*7)))


var taskList = [teamMilestone, individualAppDesign, extensionPlayground]


//no longer used, not deleted
//var dueDateList = [""]




