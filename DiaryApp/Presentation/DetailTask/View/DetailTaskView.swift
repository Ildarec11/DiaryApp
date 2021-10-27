//
//  DetailTaskView.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 27.10.2021.
//

import UIKit

class DetailTaskView: UIView {

    //MARK: - IBOutlets
    @IBOutlet weak var taskNameTextView: UITextView!
    @IBOutlet weak var startsDateLabel: UILabel!
    @IBOutlet weak var endsDateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
     
    //MARK: - Public functions
    func configure(task: Task) {
        taskNameTextView.text = task.name
        startsDateLabel.text = convertStringFromDate(date: task.startDate)
        endsDateLabel.text = convertStringFromDate(date: task.endDate)
        descriptionTextView.text = task.description
        taskNameTextView.tag = 1
        descriptionTextView.tag = 2
    }
    
    //MARK: - Private funtions
    private func convertStringFromDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
}
