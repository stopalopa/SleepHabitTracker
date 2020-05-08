//
//  ViewController.swift
//  Sleep_Habit_Tracker
//
//  Created by Natasha Stopa on 5/4/20.
//  Copyright © 2020 Stopa Inc. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.appearance.selectionColor = UIColor.systemPink
        //if traitCollection.userInterfaceStyle == .light {
        //    calendar.appearance.
        //} else {
        //    print("Dark mode")
        //}
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY at h: mm a"
        let string = formatter.string(from: date)
        print("\(string)")
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "HabitInfoController") as! HabitInfoTableViewController
          detailController.date = date
          self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return "test"
    }
    
    
    //todo - add icon for if moon cycle (also requires API)
    //dark mode
    
    
    
    
}

