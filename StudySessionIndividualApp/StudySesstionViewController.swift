//
//  FirstViewController.swift
//  StudySessionIndividualApp
//
//  Created by Mark Kriegsies on 9/13/18.
//  Copyright © 2018 Mark Kriegsies. All rights reserved.
//

import UIKit

class StudySessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //inc
    func updateTimerView() {
        let timeformatter = DateFormatter()
        timeformatter.dateStyle = .medium
        
        timerLabel.text = timeformatter.string(from: TimerPicker.date)
    }
    
    //help from: https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f
    
    @IBOutlet var timerLabel: UILabel!
    
    var timer = Timer()
    
    @IBAction func StartTimer(_ sender: Any) {
    
        //incomplete
        /*
      timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: <#T##Selector#>, userInfo: nil, repeats: false) */
        
        
    }
    //incomplete
   /* func updateTimer() {
        TimerPicker.date -= 1
        timerLabel.text =
    } */
   
    @IBOutlet var TimerPicker: UIDatePicker!
    
    

}

