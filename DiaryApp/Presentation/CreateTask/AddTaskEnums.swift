//
//  AddTaskEnums.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 30.10.2021.
//

import Foundation

enum AddTaskSection: Int, CaseIterable {
    case nameAndDescription
    case colorPicker
    case startAndEndDates
}

enum NameAndDescription: Int, CaseIterable {
    case name
    case description
}

enum StartAndEndDates: Int, CaseIterable {
    case startDate
    case endDate
}
