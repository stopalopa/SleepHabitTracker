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
    
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Mg of caffeine for 8oz", message:
            "Drip or Brewed: 145 \n" +
            "French Press: 105 \n" +
            "Expresso: 70\n" +
            "Black tea: 45\n" +
            "Green tea: 25\n" +
            "Soda: 30\n" +
            "Decaf: 2", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Substances
        form +++ Section("Substances")
            <<< SwitchRow("caffeine"){ row in
                row.title = "Caffeine"
            }
            
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "Caffeine Info"
                row.hidden = Condition.function(["caffeine"], { form in
                    return !((form.rowBy(tag: "caffeine") as? SwitchRow)?.value ?? false)
                })
            }
            .onCellSelection { [weak self] (cell, row) in
                self?.showAlert()
            }
            
            <<< SliderRow("mgsCaffeine") {
                $0.hidden = Condition.function(["caffeine"], { form in
                    return !((form.rowBy(tag: "caffeine") as? SwitchRow)?.value ?? false)
                })
                $0.title = "mgs"
                $0.value = 1
                $0.cell.slider.minimumValue = 0
                $0.cell.slider.maximumValue = 250
            }
            
            <<< TimeInlineRow() {
                $0.hidden = Condition.function(["caffeine"], { form in
                    return !((form.rowBy(tag: "caffeine") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Time Consumed"
                $0.value = Date()
            }
            
            <<< SwitchRow("alcohol"){ row in
                row.title = "Alcohol"
            }
            <<< SliderRow() {
                $0.hidden = Condition.function(["alcohol"], { form in
                    return !((form.rowBy(tag: "alcohol") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Number of Drinks"
                $0.value = 1
                $0.cell.slider.minimumValue = 0
                $0.cell.slider.maximumValue = 5
            }
            <<< TimeInlineRow() {
                $0.hidden = Condition.function(["alcohol"], { form in
                    return !((form.rowBy(tag: "alcohol") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Start Time"
                $0.value = Date()
            }
            
            <<< TimeInlineRow() {
                $0.hidden = Condition.function(["alcohol"], { form in
                    return !((form.rowBy(tag: "alcohol") as? SwitchRow)?.value ?? false)
                })
                $0.title = "End Time"
                $0.value = Date()
            }
            
            <<< SwitchRow("melatonin"){ row in
                row.title = "Melatonin"
            }
            <<< SliderRow() {
                $0.hidden = Condition.function(["melatonin"], { form in
                    return !((form.rowBy(tag: "melatonin") as? SwitchRow)?.value ?? false)
                })
                $0.title = "mg"
                $0.value = 1
                $0.cell.slider.minimumValue = 0
                $0.cell.slider.maximumValue = 3
            }
            <<< TimeInlineRow() {
                $0.hidden = Condition.function(["melatonin"], { form in
                    return !((form.rowBy(tag: "melatonin") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Start Time"
                $0.value = Date()
            }
            
            <<< SwitchRow("trazodone"){ row in
                row.title = "Trazodone"
            }
            <<< SliderRow() {
                $0.hidden = Condition.function(["trazodone"], { form in
                    return !((form.rowBy(tag: "trazodone") as? SwitchRow)?.value ?? false)
                })
                $0.title = "mg"
                $0.value = 5
                $0.cell.slider.minimumValue = 0
                $0.cell.slider.maximumValue = 30
            }
            <<< TimeInlineRow() {
                $0.hidden = Condition.function(["trazadone"], { form in
                    return !((form.rowBy(tag: "trazadone") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Start Time"
                $0.value = Date()
            }
            
            <<< SwitchRow("other") { row in
                row.title = "Other"
            }
            
            <<< TimeInlineRow() {
                $0.hidden = Condition.function(["other"], { form in
                    return !((form.rowBy(tag: "other") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Start Time"
                $0.value = Date()
            }
            
            <<< SegmentedRow<Emoji>(){
                $0.hidden = Condition.function(["other"], { form in
                    return !((form.rowBy(tag: "other") as? SwitchRow)?.value ?? false)
                })
                $0.title = "How much?"
                $0.options = [😊, 🤩, 🚀, 🦄, 🙀]
                $0.value = 😊
            }
            
            // MARK: Exercise
            +++ Section("Exercise")
            <<< CountDownInlineRow(){
                $0.title = "Minutes Standing"
                var dateComp = DateComponents()
                dateComp.hour = 0
                dateComp.minute = 0
                dateComp.timeZone = TimeZone.current
                $0.value = Calendar.current.date(from: dateComp)
            }
            <<< CountDownInlineRow(){
                $0.title = "Minutes Walking"
                var dateComp = DateComponents()
                dateComp.hour = 0
                dateComp.minute = 0
                dateComp.timeZone = TimeZone.current
                $0.value = Calendar.current.date(from: dateComp)
            }
            <<< CountDownInlineRow(){
                $0.title = "Minutes Running"
                var dateComp = DateComponents()
                dateComp.hour = 0
                dateComp.minute = 0
                dateComp.timeZone = TimeZone.current
                $0.value = Calendar.current.date(from: dateComp)
            }
            
            <<< CountDownInlineRow(){
                $0.title = "Minutes Other Cardio"
                var dateComp = DateComponents()
                dateComp.hour = 0
                dateComp.minute = 0
                dateComp.timeZone = TimeZone.current
                $0.value = Calendar.current.date(from: dateComp)
            }
            
            +++ Section("Shower")
            <<< SegmentedRow<String>("segments"){
                $0.options = ["None", "Warm", "Cold", "Both"]
                $0.value = "None"
            }
            
            +++ Section("warm"){
                $0.hidden = "$segments != 'Warm'"
            }
            
            <<< CountDownInlineRow("warmMin"){
                $0.title = "Minutes"
                var dateComp = DateComponents()
                dateComp.hour = 0
                dateComp.minute = 0
                dateComp.timeZone = TimeZone.current
                $0.value = Calendar.current.date(from: dateComp)
            }
            
            +++ Section("cold"){
                $0.hidden = "$segments != 'Cold'"
            }
            
            <<< CountDownInlineRow("coldMin"){
                $0.title = "Minutes"
                var dateComp = DateComponents()
                dateComp.hour = 0
                dateComp.minute = 0
                dateComp.timeZone = TimeZone.current
                $0.value = Calendar.current.date(from: dateComp)
            }
            
            +++ Section("both"){
                $0.hidden = "$segments != 'Both'"
            }
            
            <<< CountDownInlineRow("bothWarmMin"){
                $0.title = "Warm Minutes"
                var dateComp = DateComponents()
                dateComp.hour = 0
                dateComp.minute = 0
                dateComp.timeZone = TimeZone.current
                $0.value = Calendar.current.date(from: dateComp)
            }
            
            <<< CountDownInlineRow("bothCoolMin"){
                $0.title = "Cool Minutes"
                var dateComp = DateComponents()
                dateComp.hour = 0
                dateComp.minute = 0
                dateComp.timeZone = TimeZone.current
                $0.value = Calendar.current.date(from: dateComp)
            }
            
            // MARK: Screen Time
            +++ Section("Screen Time")
            
            
            // MARK: Meditation
            +++ Section("Meditation")
            
            // MARK: Environment
            +++ Section("Environment")
            <<< SwitchRow("cat"){ row in
                row.title = "😺"
            }
            <<< SwitchRow("curtains"){ row in
                row.title = "Black Out Curtains"
            }
            
            <<< SwitchRow("whiteNoise"){ row in
                row.title = "White Noise"
            }
            
            <<< SwitchRow("fan"){ row in
                row.title = "Fan"
            }
            
            <<< SwitchRow("weightedBlanket"){ row in
                row.title = "Weighted Blanket"
            }
            
            <<< SwitchRow("cookingHeat"){ row in
                row.title = "Apt Hot From Cooking"
            }
            
            // MARK: Phil
            +++ Section("Phil")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
}
