//
//  TaskTableViewCell.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 28.10.2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tasksStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(tasks: [Task]) {
        for task in tasks {
            let taskView = UIView()
            let nameLabel = UILabel()
            nameLabel.text = task.name
            let timeStringValue = "\(convertDateToString(date: task.startDate)) - \(convertDateToString(date: task.endDate))"
            let timeLabel = UILabel()
            timeLabel.text = timeStringValue
            taskView.addSubview(nameLabel)
            taskView.addSubview(timeLabel)
            tasksStackView.addSubview(taskView)
        }
    }
    
    //MARK: - Private functions
    private func convertDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.string(from: date)
    }
}
