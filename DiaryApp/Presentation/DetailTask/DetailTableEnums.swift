//
//  DetailTableEnums.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 29.10.2021.
//

import Foundation

enum DetailTaskTableSection: Int, CaseIterable {
    case NameAndColor
    case StartAndFinishDate
    case Description
}

enum NameAndColor: Int, CaseIterable {
    case name
    case color
}

enum StartAndFinishDate: Int, CaseIterable {
    case startDate
    case finishDate
}

enum Description: Int, CaseIterable {
    case description
}

