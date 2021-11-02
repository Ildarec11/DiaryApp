//
//  TaskService.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 31.10.2021.
//

import Foundation
import CalendarKit
import RealmSwift

class EventService {
    
    //MARK: - Properties
    let mainRealm = try! Realm()
    
    //MARK: - Public functions
    func getEventsByDate(date: Date) -> [Event] {
        var models: [EventModel] = []
        let startOfTheDay  = date.startOfDay as NSDate
        let endOfTheDay = date.endOfDay as NSDate
        for model in mainRealm.objects(EventModel.self).filter("(startDate <= %@ AND endDate BETWEEN {%@,%@}) OR (startDate BETWEEN {%@,%@} AND endDate BETWEEN {%@,%@}) OR (startDate BETWEEN {%@,%@} AND endDate >= %@) OR (startDate <= %@ AND endDate >= %@)", startOfTheDay, startOfTheDay, endOfTheDay, startOfTheDay, endOfTheDay, startOfTheDay, endOfTheDay, startOfTheDay, endOfTheDay, endOfTheDay, startOfTheDay, endOfTheDay) {
            models.append(model)
        }
        let result =  models.map({ model in return mapFromEventModel(eventModel: model, date: date) })
        return result
    }
    
    func deleteEvent(event: Event, completion: (() -> Void)?) {
        let eventModel = mapToEventModel(event: event)
        try! mainRealm.write {
            mainRealm.delete(mainRealm.objects(EventModel.self).filter("name = %@ AND startDate = %@ AND endDate = %@", eventModel.name, eventModel.startDate, eventModel.endDate))
        }
        completion?()
    }
    
    func addEvent(event: Event, completion: (() -> Void)?) {
        let eventModel = mapToEventModel(event: event)
        try! mainRealm.write({
            mainRealm.add(eventModel)
        })
        completion?()
    }
    
    //MARK: - Private functions
    private func taskDates(task: Event) -> [Date] {
        return datesRange(from: task.startDate, to: task.endDate)
    }
    
    private func datesRange(from: Date, to: Date) -> [Date] {
        if from > to { return [Date]() }
        var tempDate = from
        var array = [tempDate]
        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }
        return array
    }
    
    private func mapToEventModel(event: Event) -> EventModel {
        let eventModel = EventModel()
        eventModel.name = event.text
        eventModel.startDate = event.startDate as NSDate
        eventModel.endDate = event.endDate as NSDate
        eventModel.eventDescription = event.description ?? ""
        eventModel.colorHex = event.backgroundColor.toHex ?? ""
        return eventModel
    }
    
    private func mapFromEventModel(eventModel: EventModel, date: Date) -> Event {
        let event = Event()
        event.text = eventModel.name
        event.description = eventModel.eventDescription
        event.startDate = eventModel.startDate as Date
        event.endDate = eventModel.endDate as Date
        let color = UIColor(hex: eventModel.colorHex)
        event.color = color
        event.backgroundColor = color
        if event.startDate <= date && event.endDate >= date.endOfDay {
            event.isAllDay = true
        }
        event.textColor = UIColor.white
        return event
    }
}

