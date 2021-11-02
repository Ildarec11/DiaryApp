//
//  CalendarAndTasksModel.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 27.10.2021.
//

import Foundation
import CalendarKit

class CalendarAndTaskModel {
    
    //MARK: - Properties
    let eventService = EventService()
    
    //MARK: - Public functions
    func getEventsByDate(date: Date) -> [Event] {
        return eventService.getEventsByDate(date: date)
    }
}
