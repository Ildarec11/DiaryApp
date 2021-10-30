//
//  addTaskView.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 30.10.2021.
//

import UIKit

class AddTaskView: UIView {
    
    //MARK: - Properties
    var viewController: UIViewController?

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
            cell.configure(placeholder: "Name", style: .largeTitle)
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell") as? TextViewTableViewCell else { return UITableViewCell() }
            cell.configure(placeholder: "Description", style: .regular)
            return cell
        case .colorPicker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorPickerCell") as? AddTaskColorTableViewCell else { return UITableViewCell() }
            if let vc = viewController {
                cell.configure(parentVC: vc, selectedColorHandler: { color in
                    print(color)
                })
            }
            return cell
        case .startAndEndDates:
            guard let row = StartAndFinishDate(rawValue: indexPath.row) else { return UITableViewCell() }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "dateChooseCell") as? DateChooseTableViewCell else { return UITableViewCell() }
            switch row {
            case .startDate:
                cell.configure(labelText: "Starts at:")
            case .finishDate:
                cell.configure(labelText: "Ends at:")
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
}
