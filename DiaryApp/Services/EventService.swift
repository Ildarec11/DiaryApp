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
        //for model in mainRealm.objects(EventModel.self).filter("startDate >= \(date) AND endDate <= \(date)") {
       //     models.append(model)
       // }
        
        let result =  models.map({ model in return mapFromEventModel(eventModel: model, date: date) })
        return result
    }
    
    func deleteEvent(event: Event, completion: (() -> Void)?) {
        let eventModel = mapToEventModel(event: event)
        try! mainRealm.write({
            mainRealm.delete(eventModel)
        })
        completion?()
    }
    
    func addEvent(event: Event, completion: (() -> Void)?) {
        let eventModel = mapToEventModel(event: event)
        try! mainRealm.write({
            mainRealm.add(eventModel)
        })
        completion?()
    }
    
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

extension UIColor {

    // MARK: - Initialization

    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt32 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }

    // MARK: - Computed Properties

    var toHex: String? {
        return toHex()
    }

    // MARK: - From UIColor to String

    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }

    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
}
