//
//  CalendarAndTaskViewController.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 28.10.2021.
//

import UIKit
import CalendarKit

class CalendarAndTaskViewController: DayViewController {
    
    //MARK: - Properties
    let model: CalendarAndTaskModel = CalendarAndTaskModel()
    
    //MARK: - IBActions
    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: self)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Public functions
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        return model.getEventsByDate(date: date)
    }

    override func dayViewDidSelectEventView(_ eventView: EventView) {
        performSegue(withIdentifier: "showDetail", sender: eventView.descriptor)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailTaskViewController else { return }
            let event = sender as? EventDescriptor
            detailVC.event = event as? Event
            detailVC.taskTable = self
        }
        if segue.identifier == "addTask" {
            guard let addTaskVC = segue.destination as? AddTaskViewController else { return }
            let eventTable = sender as? DayViewController
            addTaskVC.eventTable = eventTable
        }
    }
}




