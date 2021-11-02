//
//  DetailTaskModel.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 02.11.2021.
//

import Foundation
import CalendarKit

class DetailTaskModel {
    
    //MARK: - Properties
    var rootVC: UIViewController? = nil
    var taskTable: DayViewController? = nil
    let eventService: EventService = EventService()
    
    //MARK: - Public functions
    func deleteEvent(event: Event) {
        eventService.deleteEvent(event: event, completion: {
            self.taskTable?.reloadData()
            self.rootVC?.navigationController?.popViewController(animated: true)
        })
    }
}
