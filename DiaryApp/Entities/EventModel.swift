//
//  Task.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 27.10.2021.
//

import Foundation
import RealmSwift

@objcMembers
final class EventModel: Object {
    dynamic var name: String = ""
    dynamic var startDate: NSDate = NSDate()
    dynamic var endDate: NSDate = NSDate()
    dynamic var eventDescription: String = ""
    dynamic var colorHex: String = ""
}
