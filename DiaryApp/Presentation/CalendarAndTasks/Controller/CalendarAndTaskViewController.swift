//
//  CalendarAndTaskViewController.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 28.10.2021.
//

import UIKit
import CalendarKit

class CalendarAndTaskViewController: DayViewController {

    //MARK: - IBActions
    
    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        let event = Event()
        let event2 = Event()
        event2.startDate = Date().addingTimeInterval(2*60*60)
        event2.endDate = Date().addingTimeInterval(4*60*60)
        event2.text = "вечерняя прогулка"
        event2.description = "тест тест етарворпвоа"
        event2.backgroundColor = UIColor.brown
        event.text = "пивко с друзьями"
        event.description = " fsdskfls;kf;s "
        var events: [Event] = []
        event.startDate = Date()
        event.endDate = Date().addingTimeInterval(20*50*60*60)
        event.backgroundColor = UIColor.blue
        
        let allDayEvent = Event()
        allDayEvent.text = "кайфовать весь день"
        allDayEvent.startDate = date.addingTimeInterval(2*60*60)
        allDayEvent.endDate = date.addingTimeInterval(4*60*60)
        allDayEvent.isAllDay = true
        
        events.append(event)
        events.append(event2)
        events.append(allDayEvent)
        return events
    }

    override func dayViewDidSelectEventView(_ eventView: EventView) {
        performSegue(withIdentifier: "showDetail", sender: eventView.descriptor)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailTaskViewController else { return }
            let event = sender as? EventDescriptor
            detailVC.event = event
        }
    }
}




