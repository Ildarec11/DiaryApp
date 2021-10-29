//
//  EventDescriptionWrap.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 29.10.2021.
//

import Foundation
import CalendarKit

class EventDescriptorWrap {
    var event: EventDescriptor
    var description: String
    
    init(event: EventDescriptor, description: String) {
        self.event = event
        self.description = description
    }
}
