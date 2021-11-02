//
//  addTaskView.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 30.10.2021.
//

import UIKit
import CalendarKit

class AddTaskView: UIView {
    
    //MARK: - Properties
    var viewController: UIViewController?
    var name: String?
    var eventDescription: String?
    var color: UIColor?
    var startDate: Date?
    var endDate: Date?
    
    //MARK: - Public functions
    func validate(validEventHandler: (Event) -> ()) -> (isValid: Bool, errorMessage: String?) {
        if name == "" || name == nil {
            return (false, "Enter name pls")
        }
        guard let startDate = startDate else {
            return (false, "Enter start date")}
        guard let endDate = endDate else {
            return (false, "Enter end date")
        }
        if startDate >= endDate {
            return (false, "Start date cannot be later than end date")
        }
        validEventHandler(getEvent())
        return (true, nil)
    }
    
    //MARK: - Private functions
    private func getEvent() -> Event {
        let event = Event()
        event.text = name ?? ""
        event.color = color ?? UIColor.clear
        event.description = eventDescription
        event.startDate = startDate ?? Date()
        event.endDate = endDate ?? Date()
        return event
    }
}

extension AddTaskView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AddTaskSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = AddTaskSection(rawValue: section) else { return 0 }
        switch section {
        case .name:
            return 1
        case .description:
            return 1
        case .colorPicker:
            return 1
        case .startAndEndDates:
            return StartAndFinishDate.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = AddTaskSection(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .name:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell") as? TextViewTableViewCell else { return UITableViewCell() }
            cell.configure(placeholder: "Name", style: .largeTitle, textEnteredHandler: { name in
                self.name = name
            })
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell") as? TextViewTableViewCell else { return UITableViewCell() }
            cell.configure(placeholder: "Description", style: .regular, textEnteredHandler: { description in
                self.eventDescription = description
            })
            return cell
        case .colorPicker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorPickerCell") as? AddTaskColorTableViewCell else { return UITableViewCell() }
            if let vc = viewController {
                cell.configure(parentVC: vc, selectedColorHandler: { color in
                    self.color = color
                })
            }
            return cell
        case .startAndEndDates:
            guard let row = StartAndFinishDate(rawValue: indexPath.row) else { return UITableViewCell() }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "dateChooseCell") as? DateChooseTableViewCell else { return UITableViewCell() }
            switch row {
            case .startDate:
                cell.configure(labelText: "Starts at:", dateInputHandler: { startDate in
                    self.startDate = startDate
                })
            case .finishDate:
                cell.configure(labelText: "Ends at:", dateInputHandler: { endDate in
                    self.endDate = endDate
                })
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
}
