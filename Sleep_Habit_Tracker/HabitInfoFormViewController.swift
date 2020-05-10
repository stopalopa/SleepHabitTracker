//
//  HabitInfoTableViewController.swift
//  Sleep_Habit_Tracker
//
//  Created by Natasha Stopa on 5/8/20.
//  Copyright © 2020 Stopa Inc. All rights reserved.
//

import UIKit
import Eureka

class HabitInfoFormViewController: FormViewController {
    var date : Date?
    
    //previous wake time
    typealias Emoji = String
    let 😊 = "😊", 🤩 = "🤩", 🌈 = "🌈", 🦄 = "🦄", 🙀 = "🙀", 🚀 = "🚀"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Substances")
            <<< SwitchRow("alcohol"){ row in
                row.title = "Alcohol"
            }
            <<< SliderRow() {
                $0.hidden = Condition.function(["alcohol"], { form in
                    return !((form.rowBy(tag: "alcohol") as? SwitchRow)?.value ?? false)
            })
                $0.title = "Number of Drinks"
                $0.value = 1
            }
            <<< TimeRow() {
                $0.hidden = Condition.function(["alcohol"], { form in
                return !((form.rowBy(tag: "alcohol") as? SwitchRow)?.value ?? false)
            })
                $0.title = "Start Time"
            }
            
            <<< TimeRow() {
                       $0.hidden = Condition.function(["alcohol"], { form in
                       return !((form.rowBy(tag: "alcohol") as? SwitchRow)?.value ?? false)
                   })
                       $0.title = "End Time"
                   }
            
            <<< SwitchRow("weed") { row in
                row.title = "Weed"
            }
            
            <<< TimeRow() {
                $0.hidden = Condition.function(["weed"], { form in
                return !((form.rowBy(tag: "weed") as? SwitchRow)?.value ?? false)
            })
                $0.title = "Start Time"
            }
            
            <<< SegmentedRow<Emoji>(){
                $0.hidden = Condition.function(["weed"], { form in
                    return !((form.rowBy(tag: "weed") as? SwitchRow)?.value ?? false)
                })
                $0.title = "How much?"
                $0.options = [😊, 🤩, 🚀, 🦄, 🙀]
                $0.value = 😊
            }
            
            
            
        
        +++ Section("Exercise")
        
        +++ Section("Shower")
        
        +++ Section("Screen Time")
        
        +++ Section("Meditation")
        
        +++ Section("Phil")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
}
