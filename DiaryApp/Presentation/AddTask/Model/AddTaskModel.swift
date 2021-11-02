//
//  AddTaskModel.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 01.11.2021.
//

import Foundation
import CalendarKit
class AddTaskModel {
    
    //MARK: - Properties
    let eventService = EventService()
    
    //MARK: - Public functions
    func addEvent(event: Event, eventTable: DayViewController) {
        eventService.addEvent(event: event, completion: {
            eventTable.reloadData()
        })
    }
}
